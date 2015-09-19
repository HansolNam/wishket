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

import com.wjm.idao.BankIDao;
import com.wjm.models.BankInfo;

@Repository
public class BankDao implements BankIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int pk,String name)
	{
		jdbcTemplate.update("insert into bank (pk, name) values (?, ?)", new Object[] { pk,name });
	}
	public List<BankInfo> selectAll()
	{
		return jdbcTemplate.query("select * from bank",new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
	}
	
	public String select_pk(int pk)
	{
		List<BankInfo> banklist = jdbcTemplate.query("select * from bank where pk = ?",
		    	new Object[] { pk }, new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
		
		if(banklist == null)
			return null;
		else if(banklist.size() == 0 || banklist.size()>1)
			return null;
		else
			return banklist.get(0).getName();
	}	

	public int select_name(String name)
	{
		List<BankInfo> banklist = jdbcTemplate.query("select * from bank where name = ?",
		    	new Object[] { name }, new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
		
		if(banklist == null)
			return 0;
		else if(banklist.size() == 0 || banklist.size()>1)
			return 0;
		else
			return banklist.get(0).getPk();
	}	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from bank");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from bank where pk = ?", new Object[] { pk });
	}
}
