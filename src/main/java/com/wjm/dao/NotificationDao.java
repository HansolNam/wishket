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

import com.wjm.idao.NotificationIDao;
import com.wjm.models.NoticeInfo;
import com.wjm.models.NotificationInfo;

@Repository
public class NotificationDao implements NotificationIDao {

	private static final Logger logger = LoggerFactory.getLogger(NotificationDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String content)
	{
		jdbcTemplate.update("insert into notification (account_pk, content) values (?,?)"
				, new Object[] { account_pk, content });
		
		
		
	}
	public List<NotificationInfo> select(int account_pk)
	{
		List<NotificationInfo> notificationlist = jdbcTemplate.query("select * from notification where account_pk = ?",
		    	new Object[] { account_pk },new RowMapper<NotificationInfo>() {
	    	public NotificationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NotificationInfo(resultSet.getInt("pk"),
	    				resultSet.getInt("account_pk"),
	    				resultSet.getString("content"),
	    				resultSet.getTimestamp("reg_date")
	    				);
	    	}
	    });
		
		if(notificationlist == null)
			return null;
		else if(notificationlist.size() == 0)
		{
			return null;
		}
		else
		{
			return notificationlist;
		}
	}
	public List<NotificationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from notification",new RowMapper<NotificationInfo>() {
	    	public NotificationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NotificationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("content")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from notification");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from notification where pk = ?", new Object[] { pk });
	}
}
