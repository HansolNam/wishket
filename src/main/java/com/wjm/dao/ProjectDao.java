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

import com.wjm.idao.ProjectIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.ProjectInfo;

@Repository
public class ProjectDao implements ProjectIDao {

	private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String categoryL, String categoryM, String name, int period, int budget,
			String plan_status, String description, String technique, Timestamp deadline, String meeting_type,
			String meeting_area, String meeting_area_detail, Timestamp start_date, int managing, String partner_type,
			String purpose, String status)
	{		
		jdbcTemplate.update("insert into project (account_pk, categoryL, categoryM, name, period, budget, plan_status, description, technique, deadline, meeting_type,meeting_area, meeting_area_detail, start_date, managing, partner_type,purpose, status) values (?, ?, ?,?,?, ?, ?,?,?, ?, ?,?,?, ?, ?)", new Object[] { account_pk, categoryL, categoryM, name, period, budget,
				plan_status, description, technique, deadline, meeting_type,
				meeting_area, meeting_area_detail, start_date, managing, partner_type,
				purpose, status });
	}
	public List<ProjectInfo> selectAll()
	{
		return jdbcTemplate.query("select * from project",new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	public List<ProjectInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from project where = ?",
		    	new Object[] { account_pk }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from project");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from project where pk = ?", new Object[] { pk });
	}
}
