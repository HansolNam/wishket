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

import com.wjm.idao.TechniqueIDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.TechniqueInfo;

@Repository
public class TechniqueDao implements TechniqueIDao {

	private static final Logger logger = LoggerFactory.getLogger(TechniqueDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String name, String experience, String skill)
	{
		jdbcTemplate.update("insert into technique (account_pk, name, experience, skill) values (?, ?, ?,?)", new Object[] { account_pk, name, experience, skill });
	}
	public List<TechniqueInfo> selectAll()
	{
		return jdbcTemplate.query("select * from technique",new RowMapper<TechniqueInfo>() {
		    	public TechniqueInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new TechniqueInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("experience")
		    				, resultSet.getString("skill"));
		    	}
		    });
	}
	
	public List<TechniqueInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from technique where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<TechniqueInfo>() {
		    	public TechniqueInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new TechniqueInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("experience")
		    				, resultSet.getString("skill"));
		    	}
		    });
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from technique");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from technique where pk = ?", new Object[] { pk });
	}
}
