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

import com.wjm.idao.AreaDetailIDao;
import com.wjm.models.AreaDetailInfo;

@Repository
public class AreaDetailDao implements AreaDetailIDao {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}
	
	public void create(int area_pk, String name)
	{
		jdbcTemplate.update("insert into area_detail (area_pk, name) values (?, ?)"
				, new Object[] { area_pk, name });
	}
	public List<AreaDetailInfo> selectAll()
	{
		return jdbcTemplate.query("select * from area_detail",new RowMapper<AreaDetailInfo>() {
	    	public AreaDetailInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AreaDetailInfo(
	    				resultSet.getInt("pk")
	    				,resultSet.getInt("area_pk")
	    				, resultSet.getString("name"));
	    	}
	    });
	}
	public List<String> select(String area)
	{
		return jdbcTemplate.query("select area_detail.name from area,area_detail where area.name = ? and area_detail.area_pk = area.pk",
		    	new Object[] { area },new RowMapper<String>() {
	    	public String mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new String(resultSet.getString("name"));
	    	}
	    });
	}

	public List<String> select(int area_pk)
	{
		return jdbcTemplate.query("select name from area_detail where area_pk = ?",
		    	new Object[] { area_pk },new RowMapper<String>() {
	    	public String mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new String(resultSet.getString("name"));
	    	}
	    });
	}

	public boolean isExist(int areapk, String areadetailname)
	{
		List<String> areadetailnamelist = select(areapk);
		
		logger.info("areadetailnamelist = "+areadetailnamelist.toString());
		
		if(areadetailnamelist.size() == 0)
			return false;
		
		for(int i =0;i<areadetailnamelist.size();i++)
		{
			if(areadetailnamelist.get(i).equals(areadetailname))
				return true;
		}
			return false;
	}
}
