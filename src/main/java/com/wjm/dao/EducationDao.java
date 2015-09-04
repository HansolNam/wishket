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

import com.wjm.idao.EducationIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.EducationInfo;

@Repository
public class EducationDao implements EducationIDao {

	private static final Logger logger = LoggerFactory.getLogger(EducationDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk,String school_name,String major,String level,String state,Timestamp start_date,Timestamp end_date)
	{		
		jdbcTemplate.update("insert into education (account_pk,school_name,major,level,state,start_date,end_date ) values (?, ?, ?, ?, ?, ?, ?)", new Object[] { account_pk,school_name,major,level,state,start_date,end_date });
	}
	public List<EducationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from education",new RowMapper<EducationInfo>() {
	    	public EducationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new EducationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("school_name")
	    				, resultSet.getString("major")
	    				, resultSet.getString("level")
	    				, resultSet.getString("state")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getTimestamp("end_date"));
	    	}
	    });
		
	}
	public List<EducationInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from education where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<EducationInfo>() {
	    	public EducationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new EducationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("school_name")
	    				, resultSet.getString("major")
	    				, resultSet.getString("level")
	    				, resultSet.getString("state")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getTimestamp("end_date"));
	    	}
	    });
		
		
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from education");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from education where pk = ?", new Object[] { pk });
	}
}
