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

import com.wjm.idao.CancellistIDao;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.CancellistInfo;

@Repository
public class CancellistDao implements CancellistIDao {

	private static final Logger logger = LoggerFactory.getLogger(CancellistDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private ApplicantDao applicantDao;
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int project_pk, int applicant_pk, int contract_pk)
	{
		jdbcTemplate.update("insert into cancellist (project_pk, applicant_pk, contract_pk) values (?, ?, ?)"
				, new Object[] { project_pk,applicant_pk,contract_pk });
	}
	public List<CancellistInfo> selectAll()
	{
		return jdbcTemplate.query("select * from cancellist order by reg_date desc",new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		CancellistInfo cancel = new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		cancel.setProject(projectDao.select_project(cancel.getProject_pk()));
		    		cancel.setClient(accountDao.select(cancel.getProject().getAccount_pk()));
		    		ApplicantInfo applicant = applicantDao.select(cancel.getApplicant_pk());
		    		cancel.setPartners(accountDao.select(applicant.getAccount_pk()));
		    		
		    		return cancel;
		    	}
		    });
	}
	public List<CancellistInfo> select_project(int project_pk)
	{
		List<CancellistInfo> list = jdbcTemplate.query("select * from cancellist where project_pk = ?",
		    	new Object[] { project_pk }, new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size() == 0)
			{
				logger.info("계약 존재 X");
				return null;
			}
			else
				return list;
		}
		else
			return null;
	}
	
	public CancellistInfo select(int project_pk, int applicant_pk, int contract_pk)
	{
		List<CancellistInfo> list = jdbcTemplate.query("select * from cancellist where project_pk = ? and applicant_pk = ? and contract_pk = ?",
		    	new Object[] { project_pk,applicant_pk,contract_pk }, new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size() == 0)
			{
				logger.info("계약 존재 X");
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
		jdbcTemplate.update("delete from cancellist");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from cancellist where pk = ?", new Object[] { pk });
	}

}
