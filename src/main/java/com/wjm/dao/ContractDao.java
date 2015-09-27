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

import com.wjm.idao.ContractIDao;
import com.wjm.models.ContractInfo;

@Repository
public class ContractDao implements ContractIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int project_pk, int client_pk, int partners_pk, String name, String partners_id,
			String client_id, int budget, int term, String status)
	{
		jdbcTemplate.update("insert into contract "
				+ "(project_pk, client_pk, partners_pk, name, partners_id, client_id, "
				+ "budget, term, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { project_pk, client_pk, partners_pk, name, partners_id,
						client_id, budget, term, status});
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
	public void deleteAll()
	{
		jdbcTemplate.update("delete from contract");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from contract where pk = ?", new Object[] { pk });
	}
	
}
