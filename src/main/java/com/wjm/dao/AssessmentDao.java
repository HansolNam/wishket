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

import com.wjm.idao.AssessmentIDao;
import com.wjm.models.AssessmentInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : AssessmentDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 4:52:05
 * 4. 작성자 : Hansol
 * 5. 설명 : 평가 assessment 테이블 DAO
 * </pre>
 */
@Repository
public class AssessmentDao implements AssessmentIDao {

	private static final Logger logger = LoggerFactory.getLogger(AssessmentDao.class);

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private ContractDao contractDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
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
	 * 2. 작성일 : 2015. 12. 11. 오후 4:51:43
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 평가 생성
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param assessing_pk 평가하는 계정 고유값
	 * @param assessed_pk 평가받는 계정 고유값
	 * @param professionalism 전문성
	 * @param satisfaction 만족도
	 * @param schedule_observance 기한엄수
	 * @param activeness 적극성
	 * @param communication 의사소통능력
	 * @param recommendation 추천한마디
	 */
	public void create(int project_pk,int assessing_pk,int assessed_pk,int professionalism,int satisfaction,int schedule_observance, int activeness, int communication, String recommendation)
	{
		jdbcTemplate.update("insert into assessment (project_pk, assessing_pk, assessed_pk,professionalism, satisfaction, schedule_observance, activeness, communication, recommendation) values (?,?, ?, ?,?,?, ?, ?,?)"
				, new Object[] { project_pk, assessing_pk, assessed_pk, professionalism, satisfaction, schedule_observance, activeness, communication, recommendation });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:53:32
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 평가 리스트 반환
	 * </pre>
	 * @return 평가 리스트
	 */
	public List<AssessmentInfo> selectAll()
	{
		return jdbcTemplate.query("select * from assessment",new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_assessing
	 * 2. 작성일 : 2015. 12. 11. 오후 4:57:22
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트와 특정 평가자의 평가 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param assessing_pk 평가자 고유값
	 * @return 1개의 평가
	 */
	public AssessmentInfo select_assessing(int project_pk, int assessing_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where project_pk = ? and assessing_pk = ?",
		    	new Object[] { project_pk, assessing_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment =  new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    		
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
				return null;
			}
			else if(list.size() > 1)
			{
				logger.info("평가 2개이상 존재");
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
	 * 1. 메소드명 : select_assessed
	 * 2. 작성일 : 2015. 12. 11. 오후 4:59:26
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트와 특정 평가받는 사람의 평가
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param assessed_pk 평가받는 계정 고유값
	 * @return 1개의 평가
	 */
	public AssessmentInfo select_assessed(int project_pk, int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where project_pk = ? and assessed_pk = ? order by reg_date desc",
		    	new Object[] { project_pk, assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment =  new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    		
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
				return null;
			}
			else if(list.size() > 1)
			{
				logger.info("평가 2개이상 존재");
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
	 * 1. 메소드명 : select_assessed
	 * 2. 작성일 : 2015. 12. 11. 오후 5:00:49
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 평가 받는 계정의 평가 리스트
	 * </pre>
	 * @param assessed_pk 평가 받는 계정 고유값
	 * @return 평가 리스트
	 */
	public List<AssessmentInfo> select_assessed(int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where assessed_pk = ? order by reg_date desc",
		    	new Object[] { assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment = new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    		
	    		assessment.setClient(accountDao.select(assessment.getAssessing_pk()));
	    		assessment.setProject(projectDao.select_project(assessment.getProject_pk()));
	    		assessment.setContract(contractDao.select_project_client_partners(assessment.getProject_pk(), assessment.getAssessing_pk(), assessment.getAssessed_pk()));
	    		assessment.setProfile(accountInformationDao.getProfileImg(assessment.getAssessing_pk()));
	    		
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				logger.info("평가 없음");
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
	 * 1. 메소드명 : get_assessed_num
	 * 2. 작성일 : 2015. 12. 11. 오후 5:02:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 평가받는 계정의 평가 개수
	 * </pre>
	 * @param assessed_pk 평가받는 계정 고유값
	 * @return 평가 개수
	 */
	public int get_assessed_num(int assessed_pk)
	{
		int num = jdbcTemplate.queryForInt("select count(*) from assessment where assessed_pk = ?",
		    	new Object[] { assessed_pk });
		
		return num;
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : get_avg_assessed
	 * 2. 작성일 : 2015. 12. 11. 오후 5:02:54
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 평가받는 계정의 평균 점수 반환하는 함수
	 * </pre>
	 * @param assessed_pk 평가받는 계정의 고유값
	 * @return 평균 점수
	 */
	public double get_avg_assessed(int assessed_pk)
	{
		List<AssessmentInfo> list = jdbcTemplate.query("select * from assessment where assessed_pk = ?",
		    	new Object[] { assessed_pk }, new RowMapper<AssessmentInfo>() {
	    	public AssessmentInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		AssessmentInfo assessment = new AssessmentInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("assessing_pk")
	    				, resultSet.getInt("assessed_pk")
	    				, resultSet.getInt("professionalism")
	    				, resultSet.getInt("satisfaction")
	    				, resultSet.getInt("schedule_observance")
	    				, resultSet.getInt("activeness")
	    				, resultSet.getInt("communication")
	    				, resultSet.getString("recommendation"));
	    		
	    		return assessment;
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
			{
				return 0;
			}
			else
			{
				double total = 0.0;
				
				for(int i=0;i<list.size();i++)
				{

		    		total += (list.get(i).getProfessionalism() + list.get(i).getSatisfaction() + list.get(i).getSchedule_observance()
		    		+list.get(i).getActiveness() + list.get(i).getCommunication())/5.0;
		    		
				}
				
				return total/(double)list.size();
			}
		}
		else
			return 0;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:03:43
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 평가 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from assessment");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:03:49
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 평가 삭제
	 * </pre>
	 * @param pk 평가 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from assessment where pk = ?", new Object[] { pk });
	}
}
