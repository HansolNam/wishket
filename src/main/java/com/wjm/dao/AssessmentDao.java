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

import com.wjm.idao.AssessmentIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.AssessmentInfo;

@Repository
public class AssessmentDao implements AssessmentIDao {

	private static final Logger logger = LoggerFactory.getLogger(AssessmentDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int project_pk,int assessing_pk,int assessed_pk,int professionalism,int satisfaction,int schedule_observance, int activeness, int communication, String recommendation)
	{
		jdbcTemplate.update("insert into assessment (project_pk, assessing_pk, assessed_pk,professionalism, satisfaction, schedule_observance, activeness, communication, recommendation) values (?,?, ?, ?,?,?, ?, ?,?)"
				, new Object[] { project_pk, assessing_pk, assessed_pk, professionalism, satisfaction, schedule_observance, activeness, communication, recommendation });
	}
	
	public List<AssessmentInfo> selectAll()
	{
		return jdbcTemplate.query("select * from assessment",new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    	}
	    });
	}
	public AssessmentInfo select_assessing(int project_pk, int assessing_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where project_pk = ? and assessing_pk = ?",
		    	new Object[] { project_pk, assessing_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
				return null;
			}
			else if(list.size() > 1)
			{
				logger.info("평가 2개이상 존재");
				return null;
			}
			else
				return list.get(0);
		}
		else
			return null;
	}
	

	public AssessmentInfo select_assessed(int project_pk, int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where project_pk = ? and assessed_pk = ?",
		    	new Object[] { project_pk, assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
				return null;
			}
			else if(list.size() > 1)
			{
				logger.info("평가 2개이상 존재");
				return null;
			}
			else
				return list.get(0);
		}
		else
			return null;
	}
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from assessment");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from assessment where pk = ?", new Object[] { pk });
	}
}
