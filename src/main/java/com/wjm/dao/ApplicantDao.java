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

import com.wjm.idao.ApplicantIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.ApplicantInfo;

@Repository
public class ApplicantDao implements ApplicantIDao {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}
	
	public void create(int project_pk, int account_pk,int application_cost,int application_period,String application_content,int portfolio_pk,String portfolio_description)
	{
		jdbcTemplate.update("insert into applicant (project_pk, account_pk, application_cost, application_period, application_content, portfolio_pk, portfolio_description) values (?, ?, ?,?,?,?,?)"
				, new Object[] { project_pk, account_pk, application_cost, application_period, application_content, portfolio_pk, portfolio_description });
	}
	public List<ApplicantInfo> selectAll()
	{
		return jdbcTemplate.query("select * from applicant",new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("portfolio_pk")
	    				, resultSet.getString("portfolio_description"));
	    	}
	    });
	}
	public List<ApplicantInfo> select(int project_pk, int account_pk)
	{
		return jdbcTemplate.query("select * from applicant where project_pk = ? and account_pk = ?",
		    	new Object[] { project_pk, account_pk },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("portfolio_pk")
	    				, resultSet.getString("portfolio_description"));
	    	}
	    });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from applicant");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from applicant where pk = ?", new Object[] { pk });
	}
}
