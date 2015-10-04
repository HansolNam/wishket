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

import com.wjm.idao.NoticeIDao;
import com.wjm.models.AssessmentInfo;
import com.wjm.models.NoticeInfo;

@Repository
public class NoticeDao implements NoticeIDao {

	private static final Logger logger = LoggerFactory.getLogger(AssessmentDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(String name, String content)
	{
		jdbcTemplate.update("insert into notice (name, content) values (?,?)"
				, new Object[] { name, content });
	}
	
	public List<NoticeInfo> selectAll()
	{
		return jdbcTemplate.query("select * from notice",new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	public List<NoticeInfo> select_limit(int max)
	{
		return jdbcTemplate.query("select * from notice Limit ?",
		    	new Object[] { max }, new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		
	}
	
	public NoticeInfo select(int pk)
	{
		List<NoticeInfo> list = jdbcTemplate.query("select * from notice where pk = ?",
		    	new Object[] { pk }, new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		if(list != null)
		{
			if(list.size()>1)
			{
				logger.info("사이즈가 두개 존재 에러!");
				return null;
			}
			else if(list.size() == 0)
			{
				logger.info("사이즈가 0개 에러!);");
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
		jdbcTemplate.update("delete from notice");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from notice where pk = ?", new Object[] { pk });
	}
}
