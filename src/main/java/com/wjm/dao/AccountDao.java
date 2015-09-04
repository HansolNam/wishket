package com.wjm.dao;

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
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getTimestamp("birth_date")
		    				, resultSet.getString("regionL")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("identity_doc")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
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
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getTimestamp("birth_date")
		    				, resultSet.getString("regionL")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("identity_doc")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
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
}
