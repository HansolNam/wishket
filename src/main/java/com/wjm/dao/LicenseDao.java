package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.LicenseIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.LicenseInfo;

@Repository
public class LicenseDao implements LicenseIDao {

	private static final Logger logger = LoggerFactory.getLogger(LicenseDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String name, String publishing_office, String serial_num, Timestamp publication_date)
	{
		jdbcTemplate.update("insert into license (account_pk, name, publishing_office, serial_num, publication_date) values (?, ?, ?, ?, ?)", new Object[] {account_pk, name, publishing_office, serial_num, publication_date });
	}
	public List<LicenseInfo> selectAll()
	{
		return jdbcTemplate.query("select * from license",new RowMapper<LicenseInfo>() {
	    	public LicenseInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new LicenseInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("publishing_office")
	    				, resultSet.getString("serial_num")
	    				, resultSet.getTimestamp("publication_date"));
	    	}
	    });
	}
	public List<LicenseInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from license where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<LicenseInfo>() {
	    	public LicenseInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new LicenseInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("publishing_office")
	    				, resultSet.getString("serial_num")
	    				, resultSet.getTimestamp("publication_date"));
	    	}
	    });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from license");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from license where pk = ?", new Object[] { pk });
	}
}
