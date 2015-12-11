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

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : NotificationDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 6:50:54
 * 4. 작성자 : Hansol
 * 5. 설명 : 알림 notification 테이블 DAO
 * </pre>
 */
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

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 6:51:25
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 알림 생성
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param content 알림 내용
	 */
	public void create(int account_pk, String content)
	{
		jdbcTemplate.update("insert into notification (account_pk, content) values (?,?)"
				, new Object[] { account_pk, content });
				
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 6:51:43
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정 고유값의 알림 리스트
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return 알림 리스트
	 */
	public List<NotificationInfo> select(int account_pk)
	{
		List<NotificationInfo> notificationlist = jdbcTemplate.query("select * from notification where account_pk = ? order by reg_date desc",
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:51:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 알림 리스트
	 * </pre>
	 * @return 알림리스트
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:52:08
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 알림 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from notification");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 6:52:15
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 알림 삭제
	 * </pre>
	 * @param pk 알림 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from notification where pk = ?", new Object[] { pk });
	}
}
