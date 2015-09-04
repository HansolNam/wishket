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

import com.wjm.idao.CareerIDao;
import com.wjm.models.CareerInfo;

@Repository
public class CareerDao implements CareerIDao {

	private static final Logger logger = LoggerFactory.getLogger(CareerDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String company_name, String department, String position, Timestamp start_date, Timestamp end_date)
	{
		jdbcTemplate.update("insert into career (account_pk, company_name, department, position, start_date, end_date) values (?, ?, ?, ?, ?, ?)", new Object[] { account_pk, company_name, department, position, start_date, end_date });
	}
	public List<CareerInfo> selectAll()
	{
		return jdbcTemplate.query("select * from career",new RowMapper<CareerInfo>() {
		    	public CareerInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CareerInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("department")
		    				, resultSet.getString("position")
		    				, resultSet.getTimestamp("start_date")
		    				, resultSet.getTimestamp("end_date"));
		    	}
		    });
	}
	public List<CareerInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from career where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<CareerInfo>() {
	    	public CareerInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new CareerInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("company_name")
	    				, resultSet.getString("department")
	    				, resultSet.getString("position")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getTimestamp("end_date"));
	    	}
	    });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from career");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from account where pk = ?", new Object[] { pk });
	}
}
