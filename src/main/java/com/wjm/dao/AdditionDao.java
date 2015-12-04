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

import com.wjm.idao.AdditionIDao;
import com.wjm.models.AdditionInfo;
import com.wjm.models.ContractInfo;

@Repository
public class AdditionDao implements AdditionIDao {

	private static final Logger logger = LoggerFactory.getLogger(AdditionDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private ContractDao contractDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int contract_pk, String title, int budget, int term, String status)
	{
		jdbcTemplate.update("insert into addition "
				+ "(contract_pk, title, budget, term, status) values (?, ?, ?, ?, ?)"
				, new Object[] { contract_pk, title, budget, term, status});
	}
	
	public List<AdditionInfo> selectAll()
	{
		return jdbcTemplate.query("select * from addition",new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}

	public AdditionInfo select(int pk)
	{
		List<AdditionInfo> list = jdbcTemplate.query("select * from addition where pk = ?",
		    	new Object[] { pk }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		if(list == null)
			return null;
		else if(list.isEmpty())
			return null;
		else
			return list.get(0);
	}	
	

	/*
	 * 특정 계약의 추가 리스트
	 */
	public List<AdditionInfo> select_contract(int contract_pk)
	{
		return jdbcTemplate.query("select * from addition where contract_pk = ? order by reg_date desc",
		    	new Object[] { contract_pk }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
	}	

	/*
	 * 특정 상태의 추가 리스트
	 */
	public List<AdditionInfo> selectStatusClient(int client_pk, String status)
	{
		return jdbcTemplate.query("select addition.* from addition join contract on contract.client_pk = ? and addition.contract_pk = contract.pk and addition.status = ? order by reg_date desc",
		    	new Object[] { client_pk, status }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		AdditionInfo addition = new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		ContractInfo contract = contractDao.select(addition.getContract_pk());
		    		addition.setContract(contract);
		    		
		    		return addition;
		    	}
		    });
	}

	/*
	 * 특정 상태의 추가 리스트
	 */
	public List<AdditionInfo> selectStatusAdmin(String status)
	{
		return jdbcTemplate.query("select * from addition where status = ? order by reg_date desc",
		    	new Object[] { status }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		AdditionInfo addition = new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		ContractInfo contract = contractDao.select(addition.getContract_pk());
		    		addition.setContract(contract);
		    		
		    		return addition;
		    	}
		    });
		
	}	
	

	/*
	 * 추가요청 상태 업데이트
	 */
	public void updateStatusAdmin(int pk, String status)
	{
		jdbcTemplate.update("update addition set status = ?, reg_date=CURRENT_TIMESTAMP where pk = ?",
		    	new Object[] { status, pk });
	}	
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from addition");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from addition where pk = ?", new Object[] { pk });
	}
	
}
