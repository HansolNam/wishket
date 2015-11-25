package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.ContractIDao;
import com.wjm.models.ContractInfo;

@Repository
public class ContractDao implements ContractIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AssessmentDao assessmentDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int project_pk, int client_pk, int partners_pk, String name, String client_id, String partners_id,
			 int budget, int term, String status)
	{
		jdbcTemplate.update("insert into contract "
				+ "(project_pk, client_pk, partners_pk, name,client_id, partners_id,  "
				+ "budget, term, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { project_pk, client_pk, partners_pk, name,client_id, partners_id,
						 budget, term, status});
	}
	public void createMeeting(int project_pk, int client_pk, int partners_pk, String name,String client_id, String partners_id,
			 String status)
	{
		jdbcTemplate.update("insert into contract "
				+ "(project_pk, client_pk, partners_pk, name,  client_id,partners_id, "
				+ "status) values (?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { project_pk, client_pk, partners_pk, name,client_id, partners_id,
						 status});
	}
	
	public List<ContractInfo> selectAll()
	{
		return jdbcTemplate.query("select * from contract",new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}

	public List<ContractInfo> selectStatusAdminLimit(String status, int num)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where status = ? order by reg_date desc limit ?",
		    	new Object[] { status, num }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	
	public List<ContractInfo> selectStatusAdmin(String status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where status = ? order by reg_date desc",
		    	new Object[] { status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	
	

	public List<ContractInfo> selectProgressClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}
	

	public List<ContractInfo> selectReviewClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() != null)
				{
					logger.info("project "+contract.getName()+" 의 평가를 했음");
					it.remove();
				}
			}

			return list;
		}
	}	

	public List<ContractInfo> selectCompletedClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getClient_pk()));
		    		contract.setAssessed(assessmentDao.select_assessed(contract.getProject_pk(), contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() == null)
					it.remove();
			}

			return list;
		}
	}	
	public List<ContractInfo> selectProgressPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	

	public List<ContractInfo> selectReviewPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() != null)
				{
					logger.info("project "+contract.getName()+" 의 평가를 했음");
					it.remove();
				}
			}

			return list;
		}
	}	

	public List<ContractInfo> selectCompletedPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getPartners_pk()));
		    		contract.setAssessed(assessmentDao.select_assessed(contract.getProject_pk(), contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() == null)
					it.remove();
			}

			return list;
		}
	}	
	
	/*
	 * 특정 프로젝트와 파트너의 계약 
	 */
	public ContractInfo select_project_partners(int project_pk, int partners_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and partners_pk = ?",
		    	new Object[] { project_pk, partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list.get(0);
	}	

	/*
	 * 특정 프로젝트와 클라이언트의 계약 
	 */
	public List<ContractInfo> select_project_client(int project_pk, int client_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and client_pk = ?",
		    	new Object[] { project_pk, client_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	
	

	/*
	 * 특정 프로젝트의 계약 리스트
	 */
	public List<ContractInfo> select_project(int project_pk)
	{
		return jdbcTemplate.query("select * from contract where project_pk = ?",
		    	new Object[] { project_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
	}	
	

	/*
	 * 특정 클라이언트의 계약 리스트
	 */
	public List<ContractInfo> select_client(int client_pk)
	{
		return jdbcTemplate.query("select * from contract where client_pk = ?",
		    	new Object[] { client_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}	
	
	/*
	 * 특정 파트너스의 계약 리스트
	 */
	public List<ContractInfo> select_partners(int partners_pk)
	{
		return jdbcTemplate.query("select * from contract where partners_pk = ?",
		    	new Object[] { partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}
	
	/*
	 * 특정 클라이언트와 파트너스의 계약
	 */
	public ContractInfo select_project_client_partners(int project_pk,int client_pk, int partners_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and client_pk = ? and partners_pk = ?",
		    	new Object[] { project_pk, client_pk, partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size()>2)
			{
				logger.info("해당 프로젝트, 클라이언트, 파트너스의 계약이 2개 존재, 에러!");
				return null;
			}
			else if(list.size() == 0)
			{
				logger.info("계약 존재 X, 에러");
				return null;
			}
			else
				return list.get(0);
		}
		else
			return null;
	}

	/*
	 * 진행중인 프로젝트의 모든 계약 리스트
	 */
	public List<ContractInfo> selectProgressProjectAdmin()
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='진행중'  order by reg_date desc", new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}
	public List<ContractInfo> selectProgressProjectAdminLimit(int num)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='진행중'  order by reg_date desc limit ?"
				, new Object[] { num }
				, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}

	/*
	 * 특정 파트너스의 계약 개수
	 */
	public int getPartnersContractCount(int partners_pk, String status)
	{
		int num = jdbcTemplate.queryForInt("select count(*) from contract where partners_pk = ? and status=?",
		    	new Object[] { partners_pk, status });
		
		return num;
	}
	
	/*
	 * 특정 파트너스의 계약 리스트
	 */
	public List<ContractInfo> getPartnersContract(int partners_pk, String status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where partners_pk = ? and status = ? order by reg_date desc",
		    	new Object[] { partners_pk, status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract =  new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
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
	
	public void updateStatus(int project_pk,int client_pk, int partners_pk, String status)
	{
		jdbcTemplate.update("update contract set status=? where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { status, project_pk,client_pk,partners_pk });
	}

	public void updateStatusSuccess(int project_pk,int client_pk, int partners_pk, int budget, int term, String status)
	{
		jdbcTemplate.update("update contract set budget=?, term=?, status=?, reg_date=CURRENT_TIMESTAMP where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { budget, term, status, project_pk,client_pk,partners_pk });
	}

	public void updateStatusFail(int project_pk,int client_pk, int partners_pk, String status)
	{
		jdbcTemplate.update("update contract set status=?, reg_date=CURRENT_TIMESTAMP where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { status, project_pk,client_pk,partners_pk });
	}
	
	public void updateRemianContractFail(int project_pk)
	{
		jdbcTemplate.update("update contract set status='취소' where project_pk=? and status = '계약진행중'"
				, new Object[] { project_pk });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from contract");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from contract where pk = ?", new Object[] { pk });
	}
	
}
