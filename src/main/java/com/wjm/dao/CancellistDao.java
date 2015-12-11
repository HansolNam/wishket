package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.CancellistIDao;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.CancellistInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : CancellistDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 5:10:55
 * 4. 작성자 : Hansol
 * 5. 설명 : 계약 취소 리스트 cancellist 테이블 dao
 * </pre>
 */
@Repository
public class CancellistDao implements CancellistIDao {

	private static final Logger logger = LoggerFactory.getLogger(CancellistDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private ApplicantDao applicantDao;
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 5:11:11
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 취소 리스트 생성
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param applicant_pk 지원자 고유값
	 * @param contract_pk 계약 고유값
	 */
	public void create(int project_pk, int applicant_pk, int contract_pk)
	{
		jdbcTemplate.update("insert into cancellist (project_pk, applicant_pk, contract_pk) values (?, ?, ?)"
				, new Object[] { project_pk,applicant_pk,contract_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:11:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 취소 리스트 반환
	 * </pre>
	 * @return 취소 리스트
	 */
	public List<CancellistInfo> selectAll()
	{
		return jdbcTemplate.query("select * from cancellist order by reg_date desc",new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		CancellistInfo cancel = new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		cancel.setProject(projectDao.select_project(cancel.getProject_pk()));
		    		cancel.setClient(accountDao.select(cancel.getProject().getAccount_pk()));
		    		ApplicantInfo applicant = applicantDao.select(cancel.getApplicant_pk());
		    		cancel.setPartners(accountDao.select(applicant.getAccount_pk()));
		    		
		    		return cancel;
		    	}
		    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_project
	 * 2. 작성일 : 2015. 12. 11. 오후 5:11:40
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트의 취소 리스트 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @return 취소 리스트
	 */
	public List<CancellistInfo> select_project(int project_pk)
	{
		List<CancellistInfo> list = jdbcTemplate.query("select * from cancellist where project_pk = ?",
		    	new Object[] { project_pk }, new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size() == 0)
			{
				logger.info("계약 존재 X");
				return null;
			}
			else
				return list;
		}
		else
			return null;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 5:12:00
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 취소 리스트 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param applicant_pk 지원자 고유값
	 * @param contract_pk 계약 고유값
	 * @return 1개의 취소 정보 반환
	 */
	public CancellistInfo select(int project_pk, int applicant_pk, int contract_pk)
	{
		List<CancellistInfo> list = jdbcTemplate.query("select * from cancellist where project_pk = ? and applicant_pk = ? and contract_pk = ?",
		    	new Object[] { project_pk,applicant_pk,contract_pk }, new RowMapper<CancellistInfo>() {
		    	public CancellistInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CancellistInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("applicant_pk")
		    				, resultSet.getInt("contract_pk")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size() == 0)
			{
				logger.info("계약 존재 X");
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
	 * 2. 작성일 : 2015. 12. 11. 오후 5:12:45
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 취소 리스트 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from cancellist");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:12:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 취소 정보 삭제
	 * </pre>
	 * @param pk 특정 취소 정보 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from cancellist where pk = ?", new Object[] { pk });
	}

}
