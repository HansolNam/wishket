package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.AssessmentIDao;
import com.wjm.models.AssessmentInfo;

@Repository
public class AssessmentDao implements AssessmentIDao {

	private static final Logger logger = LoggerFactory.getLogger(AssessmentDao.class);

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private ContractDao contractDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
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
	    		AssessmentInfo assessment =  new AssessmentInfo(
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
	    		
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		return assessment;
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
	    		AssessmentInfo assessment =  new AssessmentInfo(
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
	    		
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		return assessment;
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
	
	public List<AssessmentInfo> select_assessed(int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where assessed_pk = ?",
		    	new Object[] { assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment = new AssessmentInfo(
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
	    		
	    		assessment.setClient(accountDao.select(assessment.getAssessing_pk()));
	    		assessment.setProject(projectDao.select_project(assessment.getProject_pk()));
	    		assessment.setContract(contractDao.select_project_client_partners(assessment.getProject_pk(), assessment.getAssessing_pk(), assessment.getAssessed_pk()));
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
				return null;
			}
			else
				return list;
		}
		else
			return null;
	}
	

	public int get_assessed_num(int assessed_pk)
	{
		int num = jdbcTemplate.queryForInt("select count(*) from assessment where assessed_pk = ?",
		    	new Object[] { assessed_pk });
		
		return num;
	}
	

	public double get_avg_assessed(int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where assessed_pk = ?",
		    	new Object[] { assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment = new AssessmentInfo(
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
	    		
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				return 0;
			}
			else
			{
				double total = 0.0;
				
				for(int i=0;i<list.size();i++)
				{

		    		total += (list.get(i).getProfessionalism() + list.get(i).getSatisfaction() + list.get(i).getSchedule_observance()
		    		+list.get(i).getActiveness() + list.get(i).getCommunication())/5.0;
		    		
				}
				
				return total/(double)list.size();
			}
		}
		else
			return 0;
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
