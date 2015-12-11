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

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : AreaDetailDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 4:48:04
 * 4. 작성자 : Hansol
 * 5. 설명 : 세부지역 area_detail 테이블 DAO
 * </pre>
 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 4:48:26
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상위 지역의 세부 지역 생성
	 * </pre>
	 * @param area_pk 특정 지역 고유값
	 * @param name 세부지역 이름
	 */
	public void create(int area_pk, String name)
	{
		jdbcTemplate.update("insert into area_detail (area_pk, name) values (?, ?)"
				, new Object[] { area_pk, name });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:48:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 특정 지역 반환
	 * </pre>
	 * @return 특정 지역 리스트
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:49:13
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 지역명의 하위 지역 리스트
	 * </pre>
	 * @param area 지역명
	 * @return 하위지역 리스트
	 */
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

	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:49:32
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 지역 고유값의 하위지역 리스트
	 * </pre>
	 * @param area_pk 특정 지역 고유값
	 * @return 하위지역리스트
	 */
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

	/**
	 * <pre>
	 * 1. 메소드명 : isExist
	 * 2. 작성일 : 2015. 12. 11. 오후 4:50:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 지역의 고유값과 하위지역 이름이 존재하는지 여부 반환
	 * </pre>
	 * @param areapk 특정 지역 고유값
	 * @param areadetailname 세부지역 이름
	 * @return true, false
	 */
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
	
	/**
	 * <pre>
	 * 1. 메소드명 : isExist
	 * 2. 작성일 : 2015. 12. 11. 오후 4:50:41
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 지역 이름과 특정 하위 지역이름이 존재 여부 반환 
	 * </pre>
	 * @param areaname 특정 지역 이름
	 * @param areadetailname 특정 하위 지역 이름
	 * @return true, false
	 */
	public boolean isExist(String areaname, String areadetailname)
	{
		List<String> areadetailnamelist = select(areaname);
		
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
