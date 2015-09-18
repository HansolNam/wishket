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

import com.wjm.idao.AreaIDao;
import com.wjm.models.AreaInfo;

@Repository
public class AreaDao implements AreaIDao {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}
	
	public void create(String name)
	{
		jdbcTemplate.update("insert into area (name) values (?)"
				, new Object[] { name });
	}
	public List<AreaInfo> selectAll()
	{
		return jdbcTemplate.query("select * from area",new RowMapper<AreaInfo>() {
	    	public AreaInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AreaInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name"));
	    	}
	    });
	}
	public String select(int pk)
	{
		List<String> arealist = jdbcTemplate.query("select area.name from area where area.pk = ?",
		    	new Object[] { pk },new RowMapper<String>() {
	    	public String mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new String(resultSet.getString("name"));
	    	}
	    });
		
		if(arealist.size() > 1)
		{
			logger.info("지역 호출 에러");
			return "";
		}
		else if(arealist.size() == 0)
		{
			logger.info("지역 호출 에러");
			return "";
		}
		else
		{
			return arealist.get(0);
		}
	}

	
	public boolean isExist(int pk)
	{
		List<String> arealist = jdbcTemplate.query("select name from area where pk = ?",
		    	new Object[] { pk },new RowMapper<String>() {
	    	public String mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new String(resultSet.getString("name"));
	    	}
	    });
		
		if(arealist.size() > 0)
			return true;
		else
			return false;
	}
}
