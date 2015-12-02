package com.wjm.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.AccountIDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;

@Repository
public class AccountDao implements AccountIDao {

	@Autowired
	private AccountInformationDao accountInformationDao;

	@Autowired
	private Partners_infoDao partners_infoDao;

	@Autowired
	private TechniqueDao techniqueDao;

	@Autowired
	private AssessmentDao assessmentDao;
	
	@Autowired
	private ContractDao contractDao;

	@Autowired
	private PortfolioDao portfolioDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(String email, String id, String password, String account_type)
	{
		jdbcTemplate.update("insert into account (email, id, password, account_type) values (?, ?, ?,?)", new Object[] { email, id, password, account_type });
	}
	public List<AccountInfo> selectAll()
	{
		return jdbcTemplate.query("select * from account",new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}

	public int getPartnersCount(String q, String job)
	{
		String sql = "";
		String job_sql = "";
		String q_sql = "";
		
		int num;
		
		//직종 & 검색어
		if(Validator.hasValue(job) && Validator.hasValue(q))
		{
			sql = "select count(*) from account, partners_info, technique where account.account_type = 'partners'";
			if(job.equals("개발자"))
				{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '개발자')";
				sql += " and " + job_sql;
				}
			else if(job.equals("디자이너"))
			{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '디자이너')";
				sql += " and " + job_sql;
			}
			
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql);
			
			num = jdbcTemplate.queryForInt(sql + " and " + q_sql
					, new Object[] { "%"+q+"%", "%"+q+"%" });
		}
		else if(Validator.hasValue(q))
		{
			sql = "select count(*) from account, technique where account.account_type = 'partners'";
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql);
			
			num = jdbcTemplate.queryForInt(sql + " and " + q_sql
					, new Object[] { "%"+q+"%", "%"+q+"%" });
		}
		else if(Validator.hasValue(job))
		{
			sql = "select count(*) from account, partners_info where account.account_type = 'partners'";
			if(job.equals("개발자"))
				{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '개발자')";
				sql += " and " + job_sql;
				}
			else if(job.equals("디자이너"))
			{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '디자이너')";
				sql += " and " + job_sql;
			}
			logger.info("명령어 : "+sql);

			num = jdbcTemplate.queryForInt(sql);
		}
		else
		{
			sql = "select count(*) from account where account.account_type = 'partners'";
			
			logger.info("명령어 : "+sql);

			num = jdbcTemplate.queryForInt(sql);
		}
		
		return num;
	}
	
	public List<AccountInfo> selectPartners(String page, String q, String job)
	{
		String sql = "";
		String job_sql = "";
		String q_sql = "";
		String page_sql = "";
		
		//page
		if(!Validator.isDigit(page))
		{
			return null;
		}
		else
		{
			int page_num = Integer.parseInt(page);
			
			if(page_num <= 0)
				return null;
			page_sql = " limit "+(page_num*10 - 10)+",10";
		}
		
		List<AccountInfo> accountlist;

		//직종 & 검색어
		if(Validator.hasValue(job) && Validator.hasValue(q))
		{
			sql = "select account.* from account, partners_info, technique where account.account_type = 'partners'";
			if(job.equals("개발자"))
				{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '개발자')";
				sql += " and " + job_sql;
				}
			else if(job.equals("디자이너"))
			{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '디자이너')";
				sql += " and " + job_sql;
			}
			
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql);
			
			accountlist = jdbcTemplate.query(sql + " and " + q_sql + page_sql
					, new Object[] { "%"+q+"%", "%"+q+"%" }
					,new RowMapper<AccountInfo>() {
			    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
			    	{
			    		AccountInfo account = new AccountInfo(
			    				resultSet.getInt("pk")
			    				, resultSet.getString("email")
			    				, resultSet.getString("id")
			    				, resultSet.getString("password")
			    				, resultSet.getString("account_type")
			    				, resultSet.getInt("authorized")
			    				, resultSet.getString("authorization_key")
			    				, resultSet.getTimestamp("reg_date"));
			    		
			    		account.setAccountinfo(accountInformationDao.select(account.getPk()));
			    		account.setPartnersinfo(partners_infoDao.select(account.getPk()));
			    		account.setTechniqueinfo(techniqueDao.select(account.getPk()));
			    		account.setPortfolionum(portfolioDao.getPortfolioNum(account.getPk()));
			    		account.setAvg_assessment(assessmentDao.get_avg_assessed(account.getPk()));
			    		account.setAssessmentnum(assessmentDao.get_assessed_num(account.getPk()));
			    		account.setContractnum(contractDao.getPartnersContractCount(account.getPk(),"완료"));
			    		
			    		return account;
			    	}
			    });
		}
		else if(Validator.hasValue(q))
		{
			sql = "select account.* from account, technique where account.account_type = 'partners'";
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql);
			
			accountlist = jdbcTemplate.query(sql + " and " + q_sql + page_sql
					, new Object[] { "%"+q+"%", "%"+q+"%" }
					,new RowMapper<AccountInfo>() {
			    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
			    	{
			    		AccountInfo account = new AccountInfo(
			    				resultSet.getInt("pk")
			    				, resultSet.getString("email")
			    				, resultSet.getString("id")
			    				, resultSet.getString("password")
			    				, resultSet.getString("account_type")
			    				, resultSet.getInt("authorized")
			    				, resultSet.getString("authorization_key")
			    				, resultSet.getTimestamp("reg_date"));
			    		
			    		account.setAccountinfo(accountInformationDao.select(account.getPk()));
			    		account.setPartnersinfo(partners_infoDao.select(account.getPk()));
			    		account.setTechniqueinfo(techniqueDao.select(account.getPk()));
			    		account.setPortfolionum(portfolioDao.getPortfolioNum(account.getPk()));
			    		account.setAvg_assessment(assessmentDao.get_avg_assessed(account.getPk()));
			    		account.setAssessmentnum(assessmentDao.get_assessed_num(account.getPk()));
			    		account.setContractnum(contractDao.getPartnersContractCount(account.getPk(),"완료"));
			    		
			    		return account;
			    	}
			    });
		}
		else if(Validator.hasValue(job))
		{
			sql = "select account.* from account, partners_info where account.account_type = 'partners'";
			if(job.equals("개발자"))
				{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '개발자')";
				sql += " and " + job_sql;
				}
			else if(job.equals("디자이너"))
			{
				job_sql = "(account.pk = partners_info.account_pk and partners_info.job = '디자이너')";
				sql += " and " + job_sql;
			}
			logger.info("명령어 : "+sql);

			accountlist = jdbcTemplate.query(sql + page_sql
					,new RowMapper<AccountInfo>() {
			    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
			    	{
			    		AccountInfo account = new AccountInfo(
			    				resultSet.getInt("pk")
			    				, resultSet.getString("email")
			    				, resultSet.getString("id")
			    				, resultSet.getString("password")
			    				, resultSet.getString("account_type")
			    				, resultSet.getInt("authorized")
			    				, resultSet.getString("authorization_key")
			    				, resultSet.getTimestamp("reg_date"));
			    		
			    		account.setAccountinfo(accountInformationDao.select(account.getPk()));
			    		account.setPartnersinfo(partners_infoDao.select(account.getPk()));
			    		account.setTechniqueinfo(techniqueDao.select(account.getPk()));
			    		account.setPortfolionum(portfolioDao.getPortfolioNum(account.getPk()));
			    		account.setAvg_assessment(assessmentDao.get_avg_assessed(account.getPk()));
			    		account.setAssessmentnum(assessmentDao.get_assessed_num(account.getPk()));
			    		account.setContractnum(contractDao.getPartnersContractCount(account.getPk(),"완료"));
			    		
			    		return account;
			    	}
			    });
		}
		else
		{
			sql = "select account.* from account where account.account_type = 'partners'";
			
			logger.info("명령어 : "+sql);

			accountlist = jdbcTemplate.query(sql + page_sql
					,new RowMapper<AccountInfo>() {
			    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
			    	{
			    		AccountInfo account = new AccountInfo(
			    				resultSet.getInt("pk")
			    				, resultSet.getString("email")
			    				, resultSet.getString("id")
			    				, resultSet.getString("password")
			    				, resultSet.getString("account_type")
			    				, resultSet.getInt("authorized")
			    				, resultSet.getString("authorization_key")
			    				, resultSet.getTimestamp("reg_date"));
			    		
			    		account.setAccountinfo(accountInformationDao.select(account.getPk()));
			    		account.setPartnersinfo(partners_infoDao.select(account.getPk()));
			    		account.setTechniqueinfo(techniqueDao.select(account.getPk()));
			    		account.setPortfolionum(portfolioDao.getPortfolioNum(account.getPk()));
			    		account.setAvg_assessment(assessmentDao.get_avg_assessed(account.getPk()));
			    		account.setAssessmentnum(assessmentDao.get_assessed_num(account.getPk()));
			    		account.setContractnum(contractDao.getPartnersContractCount(account.getPk(),"완료"));
			    		
			    		return account;
			    	}
			    });
		}
		
		if(accountlist != null)
		{
			if(accountlist.isEmpty())
			{
				logger.info("파트너스 목록 0개");
				return null;
			}
			else
			{
				logger.info("파트너스 목록 "+accountlist.size()+"개");
				return accountlist;
			}
		}
		else
		{
			logger.info("파트너스 목록 0개");
			return null;
		}
	}
	
	public int select_account(String account_type)
	{
		List<AccountInfo> accountlist = jdbcTemplate.query("select * from account where account_type = ?",
		    	new Object[] { account_type }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(accountlist == null)
			return 0;
		else
			return accountlist.size();
	}
	public AccountInfo select(int pk)
	{
		List<AccountInfo> accountlist = jdbcTemplate.query("select * from account where pk = ?",
		    	new Object[] { pk }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(accountlist == null)
			return null;
		else if(accountlist.size() == 0 || accountlist.size()>1)
			return null;
		else
			return accountlist.get(0);
	}	
	public AccountInfo select(String id)
	{
		List<AccountInfo> accountlist = jdbcTemplate.query("select * from account where id = ?",
		    	new Object[] { id }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		if(accountlist == null)
			return null;
		else if(accountlist.size() == 0 || accountlist.size()>1)
			return null;
		else
			return accountlist.get(0);
	}	
	public AccountInfo select_email(String email)
	{
		List<AccountInfo> accountlist = jdbcTemplate.query("select * from account where email = ?",
		    	new Object[] { email }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		if(accountlist == null)
			return null;
		else if(accountlist.size() == 0 || accountlist.size()>1)
			return null;
		else
			return accountlist.get(0);
	}
	public void updateAuthorized(int pk, int authorized)
	{
		jdbcTemplate.update("update account set authorized=? where pk=?", new Object[] {authorized, pk });
	}
	public String updateAuthenticationKey(int pk, String authorization_key)
	{
		String key = SHA256(authorization_key);
		logger.info("key = "+key);
		jdbcTemplate.update("update account set authorization_key=? where pk=?", new Object[] {key, pk });
		return key;
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from account");
	}
	public void delete(String id)
	{
		jdbcTemplate.update("delete from account where id = ?", new Object[] { id });
	}
	public void signup(String id, String email, String password, String account_type)
	{
		create(email, id, SHA256(password), account_type);
	}
	
	/*
	 * 비밀번호 변경 체크
	 */
	public boolean change_password(int pk, String password)
	{
		//해당 계정 검색
		AccountInfo account = select(pk);
		
		//존재하지 않는 아이디인 경우
		if(account == null) return false;
		else
		{
			jdbcTemplate.update("update account set password=? where pk = ?", new Object[] { SHA256(password),pk });
			return true;
		}
	}
	
	/*
	 * 비밀번호 리셋 체크
	 */
	public String reset_password(String email)
	{
		//해당 계정 검색
		AccountInfo account = select_email(email);
		
		//존재하지 않는 아이디인 경우
		if(account == null) return null;
		else
		{
			StringBuffer buffer = new StringBuffer();
			  Random random = new Random();
			 
			  String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,1,2,3,4,5,6,7,8,9,0".split(",");
			 
			  for (int i=0 ; i<10 ; i++)
			  {
			    buffer.append(chars[random.nextInt(chars.length)]);
			  }
	        String new_password = buffer.toString();
	        
	        jdbcTemplate.update("update account set password=? where pk = ?", new Object[] { SHA256(new_password),account.getPk() });
			return new_password;
		}
	}
	
	/*
	 * 로그인 체크
	 */
	public AccountInfo login(String id, String password)
	{
		//해당 아이디 검색
		AccountInfo account = select(id);
		
		//존재하지 않는 아이디인 경우
		if(account == null)
			return null;
		
		//패스워드 해시 후, 비교
		if(!account.getPassword().equals(SHA256(password)))
			return null;
		
		return account;
	}

	/*
	 * 로그인(이메일) 체크
	 */
	public AccountInfo login_email(String email, String password)
	{
		//해당 아이디 검색
		AccountInfo account = select_email(email);
		
		//존재하지 않는 아이디인 경우
		if(account == null)
			return null;
		
		//패스워드 해시 후, 비교
		if(!account.getPassword().equals(SHA256(password)))
			return null;
		
		return account;
	}
	/*
	 * SHA-256 �ؽ� �Լ�
	 */
	public String SHA256(String str)
	{
		String SHA = "";
		
		try{
			MessageDigest sha = MessageDigest.getInstance("SHA-256"); 
			sha.update(str.getBytes()); 
			byte byteData[] = sha.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
			
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		logger.info("SHA = "+SHA);
		logger.info("SHA leng = "+SHA.length());

		return SHA;
	}

}
