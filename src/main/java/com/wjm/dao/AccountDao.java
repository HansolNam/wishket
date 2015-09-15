package com.wjm.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.AccountIDao;
import com.wjm.models.AccountInfo;

@Repository
public class AccountDao implements AccountIDao {

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
	public List<AccountInfo> select(String id)
	{
		return jdbcTemplate.query("select * from account where id = ?",
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
	}	
	public List<AccountInfo> select_email(String email)
	{
		return jdbcTemplate.query("select * from account where email = ?",
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
	 * 로그인 체크
	 */
	public AccountInfo login(String id, String password)
	{
		//해당 아이디 검색
		List<AccountInfo> accountlist = select(id);
		
		//존재하지 않는 아이디인 경우
		if(accountlist.size() == 0)
			return null;
		
		//패스워드 해시 후, 비교
		if(!accountlist.get(0).getPassword().equals(SHA256(password)))
			return null;
		
		return accountlist.get(0);
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
