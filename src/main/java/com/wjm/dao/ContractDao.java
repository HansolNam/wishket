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

import com.wjm.idao.ContractIDao;
import com.wjm.models.ContractInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : ContractDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 5:20:02
 * 4. 작성자 : Hansol
 * 5. 설명 : 계약 contract 테이블 DAO
 * </pre>
 */
@Repository
public class ContractDao implements ContractIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AssessmentDao assessmentDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 5:20:12
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계약 생성 함수
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @param name 프로젝트 명
	 * @param client_id 클라이언트 아이디
	 * @param partners_id 파트너스 아이디
	 * @param budget 예산
	 * @param term 기간
	 * @param status 상태
	 */
	public void create(int project_pk, int client_pk, int partners_pk, String name, String client_id, String partners_id,
			 int budget, int term, String status)
	{
		jdbcTemplate.update("insert into contract "
				+ "(project_pk, client_pk, partners_pk, name,client_id, partners_id,  "
				+ "budget, term, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { project_pk, client_pk, partners_pk, name,client_id, partners_id,
						 budget, term, status});
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : createMeeting
	 * 2. 작성일 : 2015. 12. 11. 오후 5:20:45
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 미팅 상태의 계약 생성
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @param name 프로젝트명
	 * @param client_id 클라이언트 아이디
	 * @param partners_id 파트너스 아이디
	 * @param status 계약 상태
	 */
	public void createMeeting(int project_pk, int client_pk, int partners_pk, String name,String client_id, String partners_id,
			 String status)
	{
		jdbcTemplate.update("insert into contract "
				+ "(project_pk, client_pk, partners_pk, name,  client_id,partners_id, "
				+ "status) values (?, ?, ?, ?, ?, ?, ?)"
				, new Object[] { project_pk, client_pk, partners_pk, name,client_id, partners_id,
						 status});
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:21:32
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 계약 리스트 반환
	 * </pre>
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectAll()
	{
		return jdbcTemplate.query("select * from contract",new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 5:21:44
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계약 반환
	 * </pre>
	 * @param pk 계약 고유값
	 * @return 계약 정보
	 */
	public ContractInfo select(int pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where pk = ?",
		    	new Object[] { pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
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
	 * 1. 메소드명 : selectStatusAdminLimit
	 * 2. 작성일 : 2015. 12. 11. 오후 5:21:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 관리자용 특정 상태의 계약 리스트 반환(제약 개수 존재)
	 * </pre>
	 * @param status 계약 상태
	 * @param num 개수
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectStatusAdminLimit(String status, int num)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where status = ? order by reg_date desc limit ?",
		    	new Object[] { status, num }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectStatusAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 5:25:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 관리자용 특정 상태의 계약리스트 반환 
	 * </pre>
	 * @param status 계약 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectStatusAdmin(String status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where status = ? order by reg_date desc",
		    	new Object[] { status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : selectReadyClient
	 * 2. 작성일 : 2015. 12. 11. 오후 5:26:05
	 * 3. 작성자 : Hansol
	 * 4. 설명 : "결제대기중"인 특정 클라이언트의 계약 리스트
	 * </pre>
	 * @param client_pk 클라이언트 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectReadyClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}

	/**
	 * <pre>
	 * 1. 메소드명 : selectProgressClient
	 * 2. 작성일 : 2015. 12. 11. 오후 5:27:08
	 * 3. 작성자 : Hansol
	 * 4. 설명 : "진행중"인 특정 클라이언트의 계약 리스트
	 * </pre>
	 * @param client_pk 클라이언트 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectProgressClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : selectReviewClient
	 * 2. 작성일 : 2015. 12. 11. 오후 5:27:48
	 * 3. 작성자 : Hansol
	 * 4. 설명 : "완료한프로젝트"이면서 평가가 아직 안된 특정 클라이언트의 계약 리스트 반환
	 * </pre>
	 * @param client_pk 클라이언트 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectReviewClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() != null)
				{
					logger.info("project "+contract.getName()+" 의 평가를 했음");
					it.remove();
				}
			}

			return list;
		}
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : selectCompletedClient
	 * 2. 작성일 : 2015. 12. 11. 오후 5:28:28
	 * 3. 작성자 : Hansol
	 * 4. 설명 : "완료한프로젝트"이면서 평가까지 완료된 특정 클라이언트 계약 리스트
	 * </pre>
	 * @param client_pk 클라이언트 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectCompletedClient(int client_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.client_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { client_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setPartners(accountDao.select(contract.getPartners_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getClient_pk()));
		    		contract.setAssessed(assessmentDao.select_assessed(contract.getProject_pk(), contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() == null)
					it.remove();
			}

			return list;
		}
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectProgressPartners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:29:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 진행중인 프로젝트의 특정 파트너스의 계약 리스트
	 * </pre>
	 * @param partners_pk 파트너스 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectProgressPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : selectReviewPartners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:30:35
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 평가가 아직 안된 "완료한프로젝트"상태의 특정 파트너스의 계약 리스트
	 * </pre>
	 * @param partners_pk 특정 파트너스 고유값
	 * @param project_status 프로젝트 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectReviewPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() != null)
				{
					logger.info("project "+contract.getName()+" 의 평가를 했음");
					it.remove();
				}
			}

			return list;
		}
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : selectCompletedPartners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:33:00
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 평가도 완료된 "완료한프로젝트" 상태의 프로젝트와 특정 파트너스의 계약 리스트
	 * </pre>
	 * @param partners_pk 파트너스 고유값
	 * @param project_status 프로젝트 상태값
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectCompletedPartners(int partners_pk, String project_status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.partners_pk = ? and contract.project_pk = project.pk and project.status=? order by reg_date desc",
		    	new Object[] { partners_pk, project_status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract = new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		contract.setClient(accountDao.select(contract.getClient_pk()));
		    		contract.setAssessing(assessmentDao.select_assessing(contract.getProject_pk(), contract.getPartners_pk()));
		    		contract.setAssessed(assessmentDao.select_assessed(contract.getProject_pk(), contract.getPartners_pk()));
		    		
		    		return contract;
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
		{
			for(Iterator<ContractInfo> it = list.iterator(); it.hasNext();)
			{
				ContractInfo contract = it.next();
				
				if(contract.getAssessing() == null)
					it.remove();
			}

			return list;
		}
	}	
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_project_partners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:33:33
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트와 파트너의 특정 계약 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @return 1개의 계약 정보 반환
	 */
	public ContractInfo select_project_partners(int project_pk, int partners_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and partners_pk = ?",
		    	new Object[] { project_pk, partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list.get(0);
	}	

	/**
	 * <pre>
	 * 1. 메소드명 : select_project_client
	 * 2. 작성일 : 2015. 12. 11. 오후 5:38:46
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트와 클라이언트의 계약 리스트 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @return 계약 리스트 반환
	 */
	public List<ContractInfo> select_project_client(int project_pk, int client_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and client_pk = ?",
		    	new Object[] { project_pk, client_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}	
	

	/**
	 * <pre>
	 * 1. 메소드명 : select_project
	 * 2. 작성일 : 2015. 12. 11. 오후 5:39:13
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 포로젝트 고유값의 계약 리스트
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @return 계약 리스트
	 */
	public List<ContractInfo> select_project(int project_pk)
	{
		return jdbcTemplate.query("select * from contract where project_pk = ?",
		    	new Object[] { project_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_client
	 * 2. 작성일 : 2015. 12. 11. 오후 5:40:30
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 클라이언트 고유값의 계약 리스트
	 * </pre>
	 * @param client_pk 특정 클라이언트 고유값
	 * @return 계약 리스트
	 */
	public List<ContractInfo> select_client(int client_pk)
	{
		return jdbcTemplate.query("select * from contract where client_pk = ?",
		    	new Object[] { client_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_partners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:41:04
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 파트너스의 계약 리스트 반환
	 * </pre>
	 * @param partners_pk 파트너스 고유값
	 * @return 계약 리스트
	 */
	public List<ContractInfo> select_partners(int partners_pk)
	{
		return jdbcTemplate.query("select * from contract where partners_pk = ?",
		    	new Object[] { partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_project_client_partners
	 * 2. 작성일 : 2015. 12. 11. 오후 5:41:40
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계약 반환 함수
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @return 1개의 계약 반환
	 */
	public ContractInfo select_project_client_partners(int project_pk,int client_pk, int partners_pk)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where project_pk = ? and client_pk = ? and partners_pk = ?",
		    	new Object[] { project_pk, client_pk, partners_pk }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list!=null)
		{
			if(list.size()>2)
			{
				logger.info("해당 프로젝트, 클라이언트, 파트너스의 계약이 2개 존재, 에러!");
				return null;
			}
			else if(list.size() == 0)
			{
				logger.info("계약 존재 X, 에러");
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
	 * 1. 메소드명 : selectReadyProjectAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 5:42:21
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 결제대기중인 프로젝트의 모든 계약 리스트
	 * </pre>
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectReadyProjectAdmin()
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='결제대기중'  order by reg_date desc", new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}

	/**
	 * <pre>
	 * 1. 메소드명 : selectReadyProjectAdminLimit
	 * 2. 작성일 : 2015. 12. 11. 오후 5:42:48
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 결제대기중인 프로젝트의 특정 개수의 계약 리스트
	 * </pre>
	 * @param num 특정 개수
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectReadyProjectAdminLimit(int num)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='결제대기중'  order by reg_date desc limit ?"
				, new Object[] { num }
				, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectProgressProjectAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 5:43:18
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 진행중인 프로젝트의 모든 계약 리스트
	 * </pre>
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectProgressProjectAdmin()
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='진행중'  order by reg_date desc", new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectProgressProjectAdminLimit
	 * 2. 작성일 : 2015. 12. 11. 오후 5:43:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 진행중인 프로젝트의 몇개의 계약 리스트
	 * </pre>
	 * @param num 특정 개수
	 * @return 계약 리스트
	 */
	public List<ContractInfo> selectProgressProjectAdminLimit(int num)
	{
		List<ContractInfo> list = jdbcTemplate.query("select contract.* from contract,project where contract.project_pk = project.pk and project.status='진행중'  order by reg_date desc limit ?"
				, new Object[] { num }
				, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });

		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
	}

	/**
	 * <pre>
	 * 1. 메소드명 : getPartnersContractCount
	 * 2. 작성일 : 2015. 12. 11. 오후 5:43:57
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 파트너스의 계약 개수
	 * </pre>
	 * @param partners_pk 파트너스 고유값
	 * @param status 상태
	 * @return 계약 개수
	 */
	public int getPartnersContractCount(int partners_pk, String status)
	{
		int num = jdbcTemplate.queryForInt("select count(*) from contract where partners_pk = ? and status=?",
		    	new Object[] { partners_pk, status });
		
		return num;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : getPartnersContract
	 * 2. 작성일 : 2015. 12. 11. 오후 5:44:19
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 파트너스의 특정 상태의 계약 리스트
	 * </pre>
	 * @param partners_pk 파트너스 고유값
	 * @param status 상태
	 * @return 계약 리스트
	 */
	public List<ContractInfo> getPartnersContract(int partners_pk, String status)
	{
		List<ContractInfo> list = jdbcTemplate.query("select * from contract where partners_pk = ? and status = ? order by reg_date desc",
		    	new Object[] { partners_pk, status }, new RowMapper<ContractInfo>() {
		    	public ContractInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		ContractInfo contract =  new ContractInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("project_pk")
		    				, resultSet.getInt("client_pk")
		    				, resultSet.getInt("partners_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("partners_id")
		    				, resultSet.getString("client_id")
		    				, resultSet.getInt("budget")
		    				, resultSet.getInt("term")
		    				, resultSet.getString("status")
		    				, resultSet.getTimestamp("reg_date"));
		    		
		    		contract.setProject(projectDao.select_project(contract.getProject_pk()));
		    		
		    		return contract;
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
	 * 1. 메소드명 : updateStatus
	 * 2. 작성일 : 2015. 12. 11. 오후 5:44:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 상태 갱신
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @param status 상태
	 */
	public void updateStatus(int project_pk,int client_pk, int partners_pk, String status)
	{
		jdbcTemplate.update("update contract set status=? where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { status, project_pk,client_pk,partners_pk });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : updateStatusSuccess
	 * 2. 작성일 : 2015. 12. 11. 오후 5:45:16
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계약 성공시 갱신 함수
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @param budget 예산
	 * @param term 기간
	 * @param status 상태
	 */
	public void updateStatusSuccess(int project_pk,int client_pk, int partners_pk, int budget, int term, String status)
	{
		jdbcTemplate.update("update contract set budget=?, term=?, status=?, reg_date=CURRENT_TIMESTAMP where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { budget, term, status, project_pk,client_pk,partners_pk });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : updateStatusFail
	 * 2. 작성일 : 2015. 12. 11. 오후 5:45:47
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계약 실패시 갱신 함수
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param client_pk 클라이언트 고유값
	 * @param partners_pk 파트너스 고유값
	 * @param status 상태
	 */
	public void updateStatusFail(int project_pk,int client_pk, int partners_pk, String status)
	{
		jdbcTemplate.update("update contract set status=?, reg_date=CURRENT_TIMESTAMP where project_pk=? and client_pk=? and partners_pk = ?"
				, new Object[] { status, project_pk,client_pk,partners_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateRemianContractFail
	 * 2. 작성일 : 2015. 12. 11. 오후 5:46:04
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 남은 계약 실패로 갱신
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 */
	public void updateRemianContractFail(int project_pk)
	{
		jdbcTemplate.update("update contract set status='취소' where project_pk=? and status = '계약진행중'"
				, new Object[] { project_pk });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:46:19
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 계약 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from contract");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:46:27
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계약 삭제
	 * </pre>
	 * @param pk 계약 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from contract where pk = ?", new Object[] { pk });
	}
	
}
