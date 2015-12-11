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

import com.wjm.idao.CommentIDao;
import com.wjm.main.function.Validator;
import com.wjm.models.CommentInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : CommentDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 5:17:44
 * 4. 작성자 : Hansol
 * 5. 설명 : 댓글 comment 테이블 DAO
 * </pre>
 */
@Repository
public class CommentDao implements CommentIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
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
	 * 2. 작성일 : 2015. 12. 11. 오후 5:17:56
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 댓글 생성 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param project_pk 프로젝트 고유값
	 * @param content 댓글 내용
	 */
	public void create(int account_pk, int project_pk,String content)
	{
		jdbcTemplate.update("insert into comment (account_pk, project_pk, content) values (?, ?, ?)", new Object[] { account_pk,project_pk,content });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:18:17
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 댓글 리스트 반환
	 * </pre>
	 * @return 댓글 리스트
	 */
	public List<CommentInfo> selectAll()
	{
		return jdbcTemplate.query("select * from comment",new RowMapper<CommentInfo>() {
		    	public CommentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CommentInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getString("content")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 5:19:12
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트 고유값의 댓글 리스트
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @return 댓글 리스트
	 */
	public List<CommentInfo> select(int project_pk)
	{
		List<CommentInfo> list = jdbcTemplate.query("select comment.*, account.id, account_information.profile_img "
				+ "from comment, account, account_information where comment.project_pk = ? and "
				+ "comment.account_pk = account.pk and account.pk = account_information.account_pk",
		    	new Object[] { project_pk }, new RowMapper<CommentInfo>() {
		    	public CommentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		
		    		CommentInfo comment =  new CommentInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getString("content")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("id")
		    				, resultSet.getString("profile_img"));
		    		
		    		if(!Validator.hasValue(comment.getImg()))
		    			comment.setImg("default_avatar.png");
		    		return comment;
		    	}
		    });
		if(list == null)
			return null;
		else if(list.size() == 0)
			return null;
		else
			return list;
	}	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:19:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 댓글 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from comment");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:19:34
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 고유값의 댓글 삭제
	 * </pre>
	 * @param pk 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from comment where pk = ?", new Object[] { pk });
	}

}
