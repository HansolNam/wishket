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

import com.wjm.idao.BankIDao;
import com.wjm.models.BankInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : BankDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 5:08:30
 * 4. 작성자 : Hansol
 * 5. 설명 : 은행 Bank 테이블 DAO
 * </pre>
 */
@Repository
public class BankDao implements BankIDao {

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
	 * 2. 작성일 : 2015. 12. 11. 오후 5:08:44
	 * 3. 작성자 : Hansol
	 * 4. 설명 : bank 정보 생성
	 * </pre>
	 * @param pk 고유값
	 * @param name 이름
	 */
	public void create(int pk,String name)
	{
		jdbcTemplate.update("insert into bank (pk, name) values (?, ?)", new Object[] { pk,name });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:09:17
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 은행 리스트 반환
	 * </pre>
	 * @return 은행 리스트
	 */
	public List<BankInfo> selectAll()
	{
		return jdbcTemplate.query("select * from bank",new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_pk
	 * 2. 작성일 : 2015. 12. 11. 오후 5:09:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 고유값의 은행명 반환
	 * </pre>
	 * @param pk 고유값
	 * @return 은행명
	 */
	public String select_pk(int pk)
	{
		List<BankInfo> banklist = jdbcTemplate.query("select * from bank where pk = ?",
		    	new Object[] { pk }, new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
		
		if(banklist == null)
			return null;
		else if(banklist.size() == 0 || banklist.size()>1)
			return null;
		else
			return banklist.get(0).getName();
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : select_name
	 * 2. 작성일 : 2015. 12. 11. 오후 5:09:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 이름의 고유값 반환
	 * </pre>
	 * @param name 은행명
	 * @return pk
	 */
	public int select_name(String name)
	{
		List<BankInfo> banklist = jdbcTemplate.query("select * from bank where name = ?",
		    	new Object[] { name }, new RowMapper<BankInfo>() {
		    	public BankInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new BankInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("name"));
		    	}
		    });
		
		if(banklist == null)
			return 0;
		else if(banklist.size() == 0 || banklist.size()>1)
			return 0;
		else
			return banklist.get(0).getPk();
	}	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:10:25
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 은행 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from bank");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:10:33
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 은행 삭제
	 * </pre>
	 * @param pk 은행 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from bank where pk = ?", new Object[] { pk });
	}
}
