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
	
	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 4:45:15
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지역 생성 함수
	 * </pre>
	 * @param name 지역명
	 */
	public void create(String name)
	{
		jdbcTemplate.update("insert into area (name) values (?)"
				, new Object[] { name });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:45:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 지역 반환
	 * </pre>
	 * @return 지역 리스트
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:46:05
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 고유값의 지역 반환
	 * </pre>
	 * @param pk 고유값
	 * @return 지역명
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:46:21
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 이름의 고유값 리턴
	 * </pre>
	 * @param name 이름
	 * @return pk
	 */
	public String select(String name)
	{
		List<Integer> arealist = jdbcTemplate.query("select area.pk from area where area.name = ?",
		    	new Object[] { name },new RowMapper<Integer>() {
	    	public Integer mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new Integer(resultSet.getInt("pk"));
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
			return arealist.get(0).toString();
		}
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : isExist
	 * 2. 작성일 : 2015. 12. 11. 오후 4:47:02
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 고유값 존재 여부 반환
	 * </pre>
	 * @param pk 고유값
	 * @return ture, false
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : isExist
	 * 2. 작성일 : 2015. 12. 11. 오후 4:47:41
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 이름 존재 여부
	 * </pre>
	 * @param name 지역명
	 * @return true, false
	 */
	public boolean isExist(String name)
	{
		List<Integer> arealist = jdbcTemplate.query("select pk from area where name = ?",
		    	new Object[] { name },new RowMapper<Integer>() {
	    	public Integer mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new Integer(resultSet.getString("pk"));
	    	}
	    });
		
		if(arealist.size() > 0)
			return true;
		else
			return false;
	}
}
