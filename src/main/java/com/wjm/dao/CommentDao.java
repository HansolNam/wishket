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

	public void create(int account_pk, int project_pk,String content)
	{
		jdbcTemplate.update("insert into comment (account_pk, project_pk, content) values (?, ?, ?)", new Object[] { account_pk,project_pk,content });
	}
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
	//select a.id, a.name, b.car from tbl1 a inner join tbl2 b on a.id = b.id

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
	public void deleteAll()
	{
		jdbcTemplate.update("delete from comment");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from comment where pk = ?", new Object[] { pk });
	}

}
