package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.AdditionIDao;
import com.wjm.models.AdditionInfo;
import com.wjm.models.ContractInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : AdditionDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 3:57:43
 * 4. 작성자 : Hansol
 * 5. 설명 : 추가요청인 addition 테이블에 접근하는 DAO
 * </pre>
 */
@Repository
public class AdditionDao implements AdditionIDao {

	private static final Logger logger = LoggerFactory.getLogger(AdditionDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private ContractDao contractDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 3:58:50
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 추가요청 생성 함수
	 * </pre>
	 * @param contract_pk 계약 고유값
	 * @param title 추가요청 명
	 * @param budget 예산
	 * @param term 기간
	 * @param status 상태
	 * @param description 내용
	 * @param filename 파일명
	 */
	public void create(int contract_pk, String title, int budget, int term, String status, String description, String filename)
	{
		jdbcTemplate.update("insert into addition "
				+ "(contract_pk, title, budget, term, status, description, filename) values (?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { contract_pk, title, budget, term, status, description, filename});
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:29:25
	 * 3. 작성자 : Hansol
	 * 4. 설명 :  모든 추가요청 리스트
	 * </pre>
	 * @return 추가요청 리스트
	 */
	public List<AdditionInfo> selectAll()
	{
		return jdbcTemplate.query("select * from addition",new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("description")
		    				, resultSet.getString("filename"));
		    	}
		    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:29:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 추가요청 고유값에 해당하는 추가요청
	 * </pre>
	 * @param pk 고유값
	 * @return 1개의 추가요청
	 */
	public AdditionInfo select(int pk)
	{
		List<AdditionInfo> list = jdbcTemplate.query("select * from addition where pk = ?",
		    	new Object[] { pk }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("description")
		    				, resultSet.getString("filename"));
		    	}
		    });
		if(list == null)
			return null;
		else if(list.isEmpty())
			return null;
		else
			return list.get(0);
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_contract
	 * 2. 작성일 : 2015. 12. 11. 오후 4:29:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계약의 추가 요청 리스트
	 * </pre>
	 * @param contract_pk 계약 고유값
	 * @return 추가요청 리스트
	 */
	public List<AdditionInfo> select_contract(int contract_pk)
	{
		return jdbcTemplate.query("select * from addition where contract_pk = ? order by reg_date desc",
		    	new Object[] { contract_pk }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("description")
		    				, resultSet.getString("filename"));
		    	}
		    });
		
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : selectStatusClient
	 * 2. 작성일 : 2015. 12. 11. 오후 4:30:20
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상태와 특정 클라이언트의 추가 요청 리스트
	 * </pre>
	 * @param client_pk 클라이언트 고유값
	 * @param status 추가요청 상태
	 * @return 추가요청 리스트
	 */
	public List<AdditionInfo> selectStatusClient(int client_pk, String status)
	{
		return jdbcTemplate.query("select addition.* from addition join contract on contract.client_pk = ? and addition.contract_pk = contract.pk and addition.status = ? order by reg_date desc",
		    	new Object[] { client_pk, status }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		AdditionInfo addition = new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("description")
		    				, resultSet.getString("filename"));
		    		
		    		ContractInfo contract = contractDao.select(addition.getContract_pk());
		    		addition.setContract(contract);
		    		
		    		return addition;
		    	}
		    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : selectStatusAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 4:31:39
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상태의 추가 요청 리스트
	 * </pre>
	 * @param status 추가요청 상태
	 * @return 추가요청 리스트
	 */
	public List<AdditionInfo> selectStatusAdmin(String status)
	{
		return jdbcTemplate.query("select * from addition where status = ? order by reg_date desc",
		    	new Object[] { status }, new RowMapper<AdditionInfo>() {
		    	public AdditionInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		AdditionInfo addition = new AdditionInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getString("title")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date")
		    				, resultSet.getString("description")
		    				, resultSet.getString("filename"));
		    		
		    		ContractInfo contract = contractDao.select(addition.getContract_pk());
		    		addition.setContract(contract);
		    		
		    		return addition;
		    	}
		    });
		
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateStatusAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 4:32:07
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 추가요청 상태 갱신
	 * </pre>
	 * @param pk 고유값
	 * @param status 상태
	 */
	public void updateStatusAdmin(int pk, String status)
	{
		jdbcTemplate.update("update addition set status = ?, reg_date=CURRENT_TIMESTAMP where pk = ?",
		    	new Object[] { status, pk });
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:32:46
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 추가요청 리스트 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from addition");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 4:32:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 추가요청 삭제
	 * </pre>
	 * @param pk 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from addition where pk = ?", new Object[] { pk });
	}
	
}
