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

import com.wjm.idao.AccountInformationIDao;
import com.wjm.models.AccountInformationInfo;

@Repository
public class AccountInformationDao implements AccountInformationIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk)
	{
		jdbcTemplate.update("insert into account_information (account_pk) values (?)", new Object[] { account_pk });
	}
	public List<AccountInformationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from account_information",new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
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
	public List<AccountInformationInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from account_information where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
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
	public List<AccountInformationInfo> select(String id)
	{
		return jdbcTemplate.query("select * from account_information where id = ?",
		    	new Object[] { id }, new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
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
		jdbcTemplate.update("delete from account_information");
	}
	public void delete(String id)
	{
		jdbcTemplate.update("delete from account_information where id = ?", new Object[] { id });
	}
	public boolean hasBasicInfo(int account_pk)
	{
		List<AccountInformationInfo> accountinfo = select(account_pk);
		
		//정보가 아예 없는 경우
		if(accountinfo.isEmpty())
		{
			create(account_pk);
			return false;
		}
		//정보가 있어도 내용이 없는 경우
		else
		{
			String name = accountinfo.get(0).getName();
			
			if(name == null)
				return false;
		}
		
		//기본정보를 가지고 있음
		return true;
	}
	
	public void updateBasicInfo(int account_pk, String name, String cellphone_num, String form, String company_name, String company_representative, String introduction)
	{
		jdbcTemplate.update("update account_information set name=?, cellphone_num=?, form=?, company_name=?, company_representative=?, introduction=? where account_pk=?", new Object[] { name, cellphone_num, form,company_name,company_representative, introduction, account_pk });
	}
}
