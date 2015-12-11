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
import com.wjm.main.function.Time;
import com.wjm.models.AssessmentInfo;
import com.wjm.models.NoticeInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : NoticeDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 6:48:53
 * 4. 작성자 : Hansol
 * 5. 설명 : 공지사항 notice 테이블 DAO
 * </pre>
 */
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

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 6:49:04
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 공지사항 생성 함수
	 * </pre>
	 * @param name 제목
	 * @param content 내용
	 * @param flag 공개여부
	 */
	public void create(String name, String content, int flag)
	{
		jdbcTemplate.update("insert into notice (name, content, flag) values (?,?,?)"
				, new Object[] { name, content, flag });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : update
	 * 2. 작성일 : 2015. 12. 11. 오후 6:49:23
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 공지사항 수정
	 * </pre>
	 * @param pk 공지사항 고유값
	 * @param name 제목
	 * @param content 내용
	 * @param flag 공개여부
	 */
	public void update(int pk, String name, String content, int flag)
	{
		jdbcTemplate.update("update notice set name=?, content=?, flag=? where pk=?"
				, new Object[] {name, content, flag, pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:49:36
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 공지사항 반환
	 * </pre>
	 * @return 공지사항 리스트
	 */
	public List<NoticeInfo> selectAll()
	{
		return jdbcTemplate.query("select * from notice order by reg_date desc",new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getInt("flag")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : select_limit_admin
	 * 2. 작성일 : 2015. 12. 11. 오후 6:49:45
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 수의 공지사항 리스트
	 * </pre>
	 * @param max 특정 개수
	 * @return 공지사항 리스트
	 */
	public List<NoticeInfo> select_limit_admin(int max)
	{
		return jdbcTemplate.query("select * from notice order by reg_date desc Limit ?",
		    	new Object[] { max }, new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getInt("flag")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_limit
	 * 2. 작성일 : 2015. 12. 11. 오후 6:50:01
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 공개된 공지사항만 특정 리스트 반환
	 * </pre>
	 * @param max 공지사항 개수
	 * @return 공지사항 리스트
	 */
	public List<NoticeInfo> select_limit(int max)
	{
		return jdbcTemplate.query("select * from notice where flag = 0 order by reg_date desc Limit ?",
		    	new Object[] { max }, new RowMapper<NoticeInfo>() {
	    	public NoticeInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new NoticeInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("content")
	    				, resultSet.getInt("flag")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 6:50:22
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 공지사항 반환
	 * </pre>
	 * @param pk 고유값
	 * @return 공지사항 정보
	 */
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
	    				, resultSet.getInt("flag")
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
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:50:36
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 공지사항 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from notice");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 6:50:42
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 공지사항 삭제
	 * </pre>
	 * @param pk 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from notice where pk = ?", new Object[] { pk });
	}
}
