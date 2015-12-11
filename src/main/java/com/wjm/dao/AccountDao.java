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

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : AccountDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 2:42:02
 * 4. 작성자 : Hansol
 * 5. 설명 : account 테이블에 접근하는 Dao
 * </pre>
 */
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

	
	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 2:42:52
	 * 3. 작성자 : Hansol
	 * 4. 설명 : account 생성 함수
	 * </pre>
	 * @param email 이메일
	 * @param id id
	 * @param password 패스워드(8자 이상 32 이하, 해시값)
	 * @param account_type 계정 종류(client, partners, admin)
	 */
	public void create(String email, String id, String password, String account_type)
	{
		jdbcTemplate.update("insert into account (email, id, password, account_type) values (?, ?, ?,?)", new Object[] { email, id, password, account_type });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 2:49:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 계정을 반환하는 메소드
	 * </pre>
	 * @return account 리스트
	 */
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

	/**
	 * <pre>
	 * 1. 메소드명 : getPartnersCount
	 * 2. 작성일 : 2015. 12. 11. 오후 2:48:54
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 파트너스의 수를 구하는 메소드
	 * </pre>
	 * @param q 검색 키워드
	 * @param job 직종
	 * @return 파트너스 수
	 */
	public int getPartnersCount(String q, String job)
	{
		String sql = "";
		String job_sql = "";
		String q_sql = "";
		
		int num;
		
		//직종 & 검색어
		if(Validator.hasValue(job) && Validator.hasValue(q))
		{
			sql = "select count(*) from account, partners_info, technique where account.account_type = 'partners' and account.authorized = 1";
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
			sql = "select count(*) from account, technique where account.account_type = 'partners' and account.authorized = 1";
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql);
			
			num = jdbcTemplate.queryForInt(sql + " and " + q_sql
					, new Object[] { "%"+q+"%", "%"+q+"%" });
		}
		else if(Validator.hasValue(job))
		{
			sql = "select count(*) from account, partners_info where account.account_type = 'partners' and account.authorized = 1";
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
			sql = "select count(*) from account where account.account_type = 'partners' and account.authorized = 1";
			
			logger.info("명령어 : "+sql);

			num = jdbcTemplate.queryForInt(sql);
		}
		
		return num;
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : selectPartners
	 * 2. 작성일 : 2015. 12. 11. 오후 2:51:06
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 파트너스의 리스트를 구하는 메소드
	 * </pre>
	 * @param page 파트너스 목록의 페이지수
	 * @param q 검색어
	 * @param job 직종
	 * @return 파트너스 리스트
	 */
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
			sql = "select account.* from account, partners_info, technique where account.account_type = 'partners' and account.authorized = 1";
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
			
			logger.info("명령어 : "+sql+" and "+q_sql + " order by reg_date desc " + page_sql);
			
			accountlist = jdbcTemplate.query(sql + " and " + q_sql + " order by reg_date desc " + page_sql
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
			sql = "select account.* from account, technique where account.account_type = 'partners' and account.authorized = 1";
			q_sql = "((account.pk = technique.account_pk and technique.name LIKE ?) or account.id LIKE ?)";
			
			logger.info("명령어 : "+sql+" and "+q_sql + " order by reg_date desc " + page_sql);
			
			accountlist = jdbcTemplate.query(sql + " and " + q_sql + " order by reg_date desc " + page_sql
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
			sql = "select account.* from account, partners_info where account.account_type = 'partners' and account.authorized = 1";
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
			logger.info("명령어 : "+sql + " order by reg_date desc " + page_sql);

			accountlist = jdbcTemplate.query(sql + " order by reg_date desc " + page_sql
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
			sql = "select account.* from account where account.account_type = 'partners' and account.authorized = 1";
			
			logger.info("명령어 : "+sql + " order by reg_date desc " + page_sql);

			accountlist = jdbcTemplate.query(sql + " order by reg_date desc " + page_sql
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_account
	 * 2. 작성일 : 2015. 12. 11. 오후 3:10:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계정 종류에 따른 파트너스 수
	 * </pre>
	 * @param account_type 계정 종류
	 * @return 파트너스 수
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 3:11:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 고유값의 계정 반환
	 * </pre>
	 * @param pk account 고유값
	 * @return 1개의 account 
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 3:12:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : id에 따른 account 반환하는 메소드
	 * </pre>
	 * @param id 사용자 고유 아이디
	 * @return 1개의 account
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_email
	 * 2. 작성일 : 2015. 12. 11. 오후 3:13:10
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 해당 이메일의 계정 반환
	 * </pre>
	 * @param email 사용자 이메일
	 * @return 1개의 사용자 계정
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateAuthorized
	 * 2. 작성일 : 2015. 12. 11. 오후 3:14:18
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 고유값의 계정의 이메일 인증여부 갱신
	 * </pre>
	 * @param pk 계정의 고유값
	 * @param authorized 인증 여부
	 */
	public void updateAuthorized(int pk, int authorized)
	{
		jdbcTemplate.update("update account set authorized=? where pk=?", new Object[] {authorized, pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateAuthenticationKey
	 * 2. 작성일 : 2015. 12. 11. 오후 3:14:52
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 고유값에 해당하는 account의 인증키 갱신
	 * </pre>
	 * @param pk 고유값
	 * @param authorization_key 인증키
	 * @return 저장한 인증키 반환
	 */
	public String updateAuthenticationKey(int pk, String authorization_key)
	{
		String key = SHA256(authorization_key);
		logger.info("key = "+key);
		jdbcTemplate.update("update account set authorization_key=? where pk=?", new Object[] {key, pk });
		return key;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 3:15:40
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 account 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from account");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 3:15:53
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 해당 id의 계정 삭제
	 * </pre>
	 * @param id 사용자 id
	 */
	public void delete(String id)
	{
		jdbcTemplate.update("delete from account where id = ?", new Object[] { id });
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : signup
	 * 2. 작성일 : 2015. 12. 11. 오후 3:16:26
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 회원가입 함수
	 * </pre>
	 * @param id id
	 * @param email email
	 * @param password password
	 * @param account_type 사용자 계정 종류
	 */
	public void signup(String id, String email, String password, String account_type)
	{
		create(email, id, SHA256(password), account_type);
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : change_password
	 * 2. 작성일 : 2015. 12. 11. 오후 3:16:50
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 비밀번호 변경
	 * </pre>
	 * @param pk 계정 고유값
	 * @param password 비밀번호
	 * @return 결과 boolean 반환
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : reset_password
	 * 2. 작성일 : 2015. 12. 11. 오후 3:18:02
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 비밀번호 리셋
	 * </pre>
	 * @param email email
	 * @return 새로운 패스워드
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : login
	 * 2. 작성일 : 2015. 12. 11. 오후 3:18:41
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 로그인 함수
	 * </pre>
	 * @param id id
	 * @param password password
	 * @return 로그인 계정 반환
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

	/**
	 * <pre>
	 * 1. 메소드명 : login_email
	 * 2. 작성일 : 2015. 12. 11. 오후 3:19:30
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 로그인(이메일) 함수
	 * </pre>
	 * @param email 이메일
	 * @param password 패스워드
	 * @return 로그인 계정
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
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : SHA256
	 * 2. 작성일 : 2015. 12. 11. 오후 3:19:56
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 해당 문자열 SHA256 해시 함수
	 * </pre>
	 * @param str 문자열
	 * @return 해시적용한 문자열
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
