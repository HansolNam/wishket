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

import com.wjm.idao.PortfolioIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.PortfolioInfo;

@Repository
public class PortfolioDao implements PortfolioIDao {

	private static final Logger logger = LoggerFactory.getLogger(PortfolioDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk,int representative,String name,String categoryL,String categoryM,String description,Timestamp start_date, Timestamp end_date, int participation_rate,String img0,String explanation0,String img1,String explanation1,String img2,String explanation2,String tag)
	{
		jdbcTemplate.update("insert into portfolio (account_pk,representative,name,categoryL,categoryM,description,start_date,end_date,participation_rate, img0,explanation0,img1,explanation1,img2,explanation2,tag) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)"
				, new Object[] { account_pk,representative,name,categoryL,categoryM,description,start_date,end_date,participation_rate, img0,explanation0,img1,explanation1,img2,explanation2,tag});
	}
	public List<PortfolioInfo> selectAll()
	{
		return jdbcTemplate.query("select * from portfolio",new RowMapper<PortfolioInfo>() {
		    	public PortfolioInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new PortfolioInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getInt("representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("categoryL")
		    				, resultSet.getString("categoryM")
		    				, resultSet.getString("description")
		    				, resultSet.getTimestamp("start_date")
		    				, resultSet.getTimestamp("end_date")
		    				, resultSet.getInt("participation_rate")
		    				, resultSet.getString("img0")
		    				, resultSet.getString("explanation0")
		    				, resultSet.getString("img1")
		    				, resultSet.getString("explanation1")
		    				, resultSet.getString("img2")
		    				, resultSet.getString("explanation2")
		    				, resultSet.getString("tag"));
		    	}
		    });
	}
	public List<PortfolioInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from portfolio where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<PortfolioInfo>() {
	    	public PortfolioInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new PortfolioInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("representative")
	    				, resultSet.getString("name")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getString("description")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getTimestamp("end_date")
	    				, resultSet.getInt("participation_rate")
	    				, resultSet.getString("img0")
	    				, resultSet.getString("explanation0")
	    				, resultSet.getString("img1")
	    				, resultSet.getString("explanation1")
	    				, resultSet.getString("img2")
	    				, resultSet.getString("explanation2")
	    				, resultSet.getString("tag"));
	    	}
	    });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from portfolio");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from portfolio where pk = ?", new Object[] { pk });
	}
}
