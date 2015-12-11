package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.ProjectIDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.ProjectInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : ProjectDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 7:08:59
 * 4. 작성자 : Hansol
 * 5. 설명 : project 테이블 DAO
 * </pre>
 */
@Repository
public class ProjectDao implements ProjectIDao {

	private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);
	
	@Autowired
	private AreaDao areaDao;

	@Autowired
	private ApplicantDao applicantDao;

	@Autowired
	private ContractDao contractDao;
	
	@Autowired
	private AccountDao accountDao;
	
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
	 * 2. 작성일 : 2015. 12. 11. 오후 7:09:27
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 프로젝트 생성
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param categoryL 카테고리
	 * @param categoryM 세부 카테고리
	 * @param another 다른 것도 필요한지 여부
	 * @param name 이름
	 * @param period 기간
	 * @param budget 예산
	 * @param plan_status 계획 상태
	 * @param description 설명
	 * @param technique 기술
	 * @param deadline 마감기한
	 * @param meeting_type 미팅 타입
	 * @param meeting_area 지역
	 * @param meeting_area_detail 세부 지역
	 * @param start_date 시작일
	 * @param managing 매니징 여부
	 * @param partner_type 원하는 파트너 타입
	 * @param purpose 목적
	 * @param status 상태
	 */
	public void create(int account_pk, String categoryL, String categoryM, int another , String name, int period, int budget,
			String plan_status, String description, String technique, Timestamp deadline, String meeting_type,
			String meeting_area, String meeting_area_detail, Timestamp start_date, int managing, String partner_type,
			String purpose, String status)
	{		
		jdbcTemplate.update("insert into project (account_pk, categoryL, categoryM, "
				+"another, name, period, budget, plan_status, description, technique, deadline, "
				+"meeting_type, meeting_area, meeting_area_detail, start_date, managing, partner_type, purpose, status) "
				+"values (?, ?, ?, ?,?,?, ?, ?,?,?, ?, ?,?,?, ?, ?,?,?,?)", 
				new Object[] { account_pk, categoryL, categoryM, another, name, period, budget,
				plan_status, description, technique, deadline, meeting_type,
				meeting_area, meeting_area_detail, start_date, managing, partner_type,
				purpose, status });
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : countAll
	 * 2. 작성일 : 2015. 12. 11. 오후 7:11:19
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 프로젝트 개수
	 * </pre>
	 * @return 프로젝트 개수
	 */
	public int countAll()
	{
		int num = jdbcTemplate.queryForInt("select count(*) from project where status = '결제대기중' or status = '진행중' or status = '평가대기중' or status = '완료한프로젝트' or status = '지원자모집중'");
		
		return num;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : getAllBudget
	 * 2. 작성일 : 2015. 12. 11. 오후 7:11:36
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 예산
	 * </pre>
	 * @return 예산 반환
	 */
	public int getAllBudget()
	{
		int num = jdbcTemplate.queryForInt("select sum(budget) from project where status = '결제대기중' or status = '진행중' or status = '평가대기중' or status = '완료한프로젝트' or status = '지원자모집중'");
		
		return num;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectRecentProject
	 * 2. 작성일 : 2015. 12. 11. 오후 7:11:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 최근 특정 개수의 프로젝트 리스트
	 * </pre>
	 * @param num 특정 개수
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectRecentProject(int num)
	{
		List<ProjectInfo> list =  jdbcTemplate.query("select * from project where status = '결제대기중' or status = '진행중' or status = '평가대기중' or status = '완료한프로젝트' or status = '지원자모집중' order by reg_date desc limit ?",
				new Object[] { num }, 
				new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		

		if(list != null)
		{
			if(list.size() == 0)
				return null;
			else
				return list;
		}
		else 
			return null;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 7:12:31
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 프로젝트 리스트
	 * </pre>
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectAll()
	{
		return jdbcTemplate.query("select * from project",new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 7:12:44
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 프로젝트 리스트
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from project where account_pk = ? order by reg_date desc",
		    	new Object[] { account_pk }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : select_project
	 * 2. 작성일 : 2015. 12. 11. 오후 7:13:31
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트
	 * </pre>
	 * @param pk 프로젝트 고유값
	 * @return 1개의 프로젝트 
	 */
	public ProjectInfo select_project(int pk)
	{
		List<ProjectInfo> list =  jdbcTemplate.query("select * from project where pk = ?",
		    	new Object[] { pk }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		if(list != null)
		{
			if(list.size()>1)
				return null;
			else if(list.size() == 0)
				return null;
			else
				return list.get(0);
		}
		else 
			return null;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectStatusAdminLimit
	 * 2. 작성일 : 2015. 12. 11. 오후 7:13:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상태의 프로젝트를 특정 개수만 반환
	 * </pre>
	 * @param status 상태
	 * @param num 특정 개수
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectStatusAdminLimit(String status, int num)
	{
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project where status = ? order by reg_date desc limit ?",
		    	new Object[] { status, num }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ProjectInfo project =  new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    		
	    		project.setAccount(accountDao.select(project.getAccount_pk()) );
	    		
	    		return project;
	    	}
	    });
		
		if(projectlist == null)
			return null;
		if(projectlist != null && projectlist.size() == 0)
			return null;
		else
			return projectlist;
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectStatusAdmin
	 * 2. 작성일 : 2015. 12. 11. 오후 7:14:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상태의 프로젝트 리스트
	 * </pre>
	 * @param status 상태
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectStatusAdmin(String status)
	{
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project where status = ? order by reg_date desc",
		    	new Object[] { status }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ProjectInfo project =  new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    		
	    		project.setAccount(accountDao.select(project.getAccount_pk()) );
	    		
	    		return project;
	    	}
	    });
		
		if(projectlist == null)
			return null;
		if(projectlist != null && projectlist.size() == 0)
			return null;
		else
			return projectlist;
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectStatus
	 * 2. 작성일 : 2015. 12. 11. 오후 7:15:03
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 특정 상태 프로젝트 리스트
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param status 상태
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectStatus(int account_pk,String status)
	{
		return jdbcTemplate.query("select * from project where account_pk = ? and status = ? order by reg_date desc",
		    	new Object[] { account_pk,status }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : updateStatus
	 * 2. 작성일 : 2015. 12. 11. 오후 7:15:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트를 특정 상태로 갱신
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param status 상태
	 */
	public void updateStatus(int project_pk, String status)
	{

		jdbcTemplate.update("update project set status=? where pk=?"
				, new Object[] {status, project_pk });
		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 7:16:02
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트 고유값과 이름의 프로젝트 반환
	 * </pre>
	 * @param pk 특정 프로젝트 고유값
	 * @param name 특정 프로젝트 이름
	 * @return 1개의 프로젝트 정보
	 */
	public ProjectInfo select(int pk,String name)
	{
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project where pk=?",
		    	new Object[] { pk }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		if(projectlist != null)
		{
			for(int i=0;i<projectlist.size();i++)
				logger.info(i + " : name "+projectlist.get(i).getName()+" , pk = "+projectlist.get(i).getPk());
			if(projectlist.size() > 1 || projectlist.size() ==0)
			{
				logger.info("프로젝트 pk와 이름에 해당하는 프로젝트가 0개,혹은 그이상 에러");
				return null;
			}
			else
				return projectlist.get(0);
		}
		return null;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectCondition
	 * 2. 작성일 : 2015. 12. 11. 오후 7:16:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 상태의 프로젝트 리스트
	 * </pre>
	 * @param page 페이지
	 * @param q 검색어
	 * @param dev 개발 카테고리
	 * @param design 디자인 카테고리
	 * @param addr 지역
	 * @param sort 정렬
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> selectCondition(String page, String q, String dev, String design, String addr,String sort)
	{
		///////////////////////////////////////////////////////
		///page filtering
		////////////////////////////////////////////////////////
		
		String page_sql = "";
		
		if(!Validator.isDigit(page))
		{
			return null;
		}
		else
		{
			int page_num = Integer.parseInt(page);
			
			if(page_num <= 0)
				return null;
			page_sql = " limit "+(page_num*10 - 10)+",10";
		}
		///////////////////////////////////////////////////////
		///dev filtering
		////////////////////////////////////////////////////////
		String dev_sql = "";
		
		//아무것도 선택 안한 경우
		if(dev.equals("1111111111"))
		{
			dev_sql = "";
		}
		//개발 전체 선택
		else if(dev.equals("2222222222"))
		{
			dev_sql = "(categoryL = '개발')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<dev.length();i++)
			{
				if(dev.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					dev_sql+="categoryM = ";
					if(i == 1)
						dev_sql+="'웹'";
					else if(i == 2)
						dev_sql+="'애플리케이션'";
					else if(i == 3)
						dev_sql+="'워드프레스'";
					else if(i == 4)
						dev_sql+="'퍼블리싱'";
					else if(i == 5)
						dev_sql+="'일반소프트웨어'";
					else if(i == 6)
						dev_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						dev_sql+="'게임'";
					else if(i == 8)
						dev_sql+="'임베디드'";
					else if(i == 9)
						dev_sql+="'기타'";
					
					dev_sql += " or ";
				}
			}
			
			if(dev_sql.length()>4 && dev_sql.substring(dev_sql.length()-4,dev_sql.length()).equals(" or "))
				{
				dev_sql = dev_sql.substring(0,dev_sql.length()-4);
				dev_sql = "(categoryL = '개발' and ("+dev_sql+"))";
				}
		}

		logger.info("dev_sql > "+dev_sql);

		///////////////////////////////////////////////////////
		///design filtering
		////////////////////////////////////////////////////////
		String design_sql = "";
		//design
		
		//아무것도 선택 안한 경우
		if(design.equals("11111111111"))
		{
			design_sql = "";
		}
		//디자인 전체 선택
		else if(design.equals("22222222222"))
		{
			design_sql = "(categoryL = '디자인')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<design.length();i++)
			{
				if(design.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					design_sql+="categoryM = ";
					if(i == 1)
						design_sql+="'웹'";
					else if(i == 2)
						design_sql+="'애플리케이션'";
					else if(i == 3)
						design_sql+="'제품'";
					else if(i == 4)
						design_sql+="'프레젠테이션'";
					else if(i == 5)
						design_sql+="'인쇄물'";
					else if(i == 6)
						design_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						design_sql+="'로고'";
					else if(i == 8)
						design_sql+="'그래픽'";
					else if(i == 9)
						design_sql+="'게임'";
					else if(i == 10)
						design_sql+="'기타'";
					
					design_sql += " or ";
				}
			}
			
			if(design_sql.length()>4 && design_sql.substring(design_sql.length()-4,design_sql.length()).equals(" or "))
				{
				design_sql = design_sql.substring(0,design_sql.length()-4);
				design_sql = "(categoryL = '디자인' and ("+design_sql+"))";
				}
		}

		logger.info("design_sql > "+design_sql);
		
		////////////////////////////////////////////////////////////
		//addr
		/////////////////////////////////////////////////////////////
		String addr_sql = "";
		
		//아무것도 선택 안한 경우
		if(addr.equals("111111111111111111"))
		{
			addr_sql = "";
		}
		//addr 전체 선택
		else if(addr.equals("122222222222222222"))
		{
			addr_sql = "";
		}
		//개별 선택
		else
		{
			for(int i=0;i<addr.length();i++)
			{
				if(addr.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					addr_sql+="meeting_area = ";
					addr_sql+="'"+areaDao.select(i)+"'";
					
					addr_sql += " or ";
				}
			}
			
			if(addr_sql.length()>4 && addr_sql.substring(addr_sql.length()-4,addr_sql.length()).equals(" or "))
				{
				addr_sql = addr_sql.substring(0,addr_sql.length()-4);
				addr_sql = "("+addr_sql+")";
				}
		}

		logger.info("addr_sql > "+addr_sql);
		
		String sort_sql = "";
		if(sort.isEmpty() || sort.equals("0"))
		{
			sort_sql += " order by reg_date desc";
		}
		else if(sort.equals("1"))
		{
			sort_sql += " order by budget desc";
		}
		else if(sort.equals("2"))
		{
			sort_sql += " order by budget";
		}
		else if(sort.equals("3"))
		{
			sort_sql += " order by reg_date desc";
		}
		else if(sort.equals("4"))
		{
			sort_sql += " order by (deadline-CURRENT_TIMESTAMP)";
		}
		//status : 
		
		logger.info("sort_sql > "+sort_sql);
		
		String q_sql = "";
		if(!q.equals("None"))
			q_sql = " (name LIKE '%"+q+"%' or description LIKE '%"+q+"%' or technique LIKE '%"+q+"%')";

		String status_sql = "(status = '지원자모집중' and deadline > CURRENT_TIMESTAMP)";
		String sql1 = getSQL(dev_sql, design_sql, addr_sql, status_sql, sort_sql, q_sql);

		status_sql = "((status = '결제대기중' or status = '진행중' or status = '평가대기중' or status = '완료한프로젝트') or (status = '지원자모집중' and deadline <= CURRENT_TIMESTAMP))";
		String sql2 = getSQL(dev_sql, design_sql, addr_sql, status_sql, sort_sql, q_sql);
		
		logger.info("sql1 > "+sql1);
		logger.info("sql2 > "+sql2);
		
		logger.info("sql1 + sql2 > "+ "select * from ("+sql1 + ") As a union all select * from (" + sql2 + ") As b "+page_sql );
		//진행중인 프로젝트
		List<ProjectInfo> projectlist1 = jdbcTemplate.query("select * from ("+sql1 + ") As a union all select * from (" + sql2 + ") As b "+page_sql,new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ProjectInfo project =  new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    		logger.info(rowNum+" : project name "+ project.getName());
	    		return project;
	    	}
	    });
		return projectlist1;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectConditionCount
	 * 2. 작성일 : 2015. 12. 11. 오후 7:18:30
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 프로젝트 찾기 프로젝트 개수
	 * </pre>
	 * @param q 검색어
	 * @param dev 개발 카테고리
	 * @param design 디자인 카테고리
	 * @param addr 지역
	 * @return 프로젝트 개수
	 */
	public int selectConditionCount(String q, String dev, String design, String addr)
	{
		///////////////////////////////////////////////////////
		///dev filtering
		////////////////////////////////////////////////////////
		String dev_sql = "";
		
		//아무것도 선택 안한 경우
		if(dev.equals("1111111111"))
		{
			dev_sql = "";
		}
		//개발 전체 선택
		else if(dev.equals("2222222222"))
		{
			dev_sql = "(categoryL = '개발')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<dev.length();i++)
			{
				if(dev.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					dev_sql+="categoryM = ";
					if(i == 1)
						dev_sql+="'웹'";
					else if(i == 2)
						dev_sql+="'애플리케이션'";
					else if(i == 3)
						dev_sql+="'워드프레스'";
					else if(i == 4)
						dev_sql+="'퍼블리싱'";
					else if(i == 5)
						dev_sql+="'일반소프트웨어'";
					else if(i == 6)
						dev_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						dev_sql+="'게임'";
					else if(i == 8)
						dev_sql+="'임베디드'";
					else if(i == 9)
						dev_sql+="'기타'";
					
					dev_sql += " or ";
				}
			}
			
			if(dev_sql.length()>4 && dev_sql.substring(dev_sql.length()-4,dev_sql.length()).equals(" or "))
				{
				dev_sql = dev_sql.substring(0,dev_sql.length()-4);
				dev_sql = "(categoryL = '개발' and ("+dev_sql+"))";
				}
		}

		logger.info("dev_sql > "+dev_sql);

		///////////////////////////////////////////////////////
		///design filtering
		////////////////////////////////////////////////////////
		String design_sql = "";
		//design
		
		//아무것도 선택 안한 경우
		if(design.equals("11111111111"))
		{
			design_sql = "";
		}
		//디자인 전체 선택
		else if(design.equals("22222222222"))
		{
			design_sql = "(categoryL = '디자인')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<design.length();i++)
			{
				if(design.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					design_sql+="categoryM = ";
					if(i == 1)
						design_sql+="'웹'";
					else if(i == 2)
						design_sql+="'애플리케이션'";
					else if(i == 3)
						design_sql+="'제품'";
					else if(i == 4)
						design_sql+="'프레젠테이션'";
					else if(i == 5)
						design_sql+="'인쇄물'";
					else if(i == 6)
						design_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						design_sql+="'로고'";
					else if(i == 8)
						design_sql+="'그래픽'";
					else if(i == 9)
						design_sql+="'게임'";
					else if(i == 10)
						design_sql+="'기타'";
					
					design_sql += " or ";
				}
			}
			
			if(design_sql.length()>4 && design_sql.substring(design_sql.length()-4,design_sql.length()).equals(" or "))
				{
				design_sql = design_sql.substring(0,design_sql.length()-4);
				design_sql = "(categoryL = '디자인' and ("+design_sql+"))";
				}
		}

		logger.info("design_sql > "+design_sql);
		
		////////////////////////////////////////////////////////////
		//addr
		/////////////////////////////////////////////////////////////
		String addr_sql = "";
		
		//아무것도 선택 안한 경우
		if(addr.equals("111111111111111111"))
		{
			addr_sql = "";
		}
		//addr 전체 선택
		else if(addr.equals("122222222222222222"))
		{
			addr_sql = "";
		}
		//개별 선택
		else
		{
			for(int i=0;i<addr.length();i++)
			{
				if(addr.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					addr_sql+="meeting_area = ";
					addr_sql+="'"+areaDao.select(i)+"'";
					
					addr_sql += " or ";
				}
			}
			
			if(addr_sql.length()>4 && addr_sql.substring(addr_sql.length()-4,addr_sql.length()).equals(" or "))
				{
				addr_sql = addr_sql.substring(0,addr_sql.length()-4);
				addr_sql = "("+addr_sql+")";
				}
		}

		logger.info("addr_sql > "+addr_sql);
		
		String q_sql = "";
		if(!q.equals("None"))
			q_sql = " (name LIKE '%"+q+"%' or description LIKE '%"+q+"%' or technique LIKE '%"+q+"%')";

		String status_sql = "(status = '지원자모집중' and deadline > CURRENT_TIMESTAMP)";
		String sql1 = getCountSQL(dev_sql, design_sql, addr_sql, status_sql, "", q_sql);

		status_sql = "((status = '결제대기중' or status = '진행중' or status = '평가대기중' or status = '완료한프로젝트') or (status = '지원자모집중' and deadline <= CURRENT_TIMESTAMP))";
		String sql2 = getCountSQL(dev_sql, design_sql, addr_sql, status_sql, "", q_sql);
		
		logger.info("sql1 > "+sql1);
		logger.info("sql2 > "+sql2);
				
		//프로젝트 찾기 개수
		int result = jdbcTemplate.queryForInt(sql1);
		result += jdbcTemplate.queryForInt(sql2);
	    
		return result;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : Save
	 * 2. 작성일 : 2015. 12. 11. 오후 7:19:12
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 프로젝트 등록 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param categoryL 카테고리
	 * @param categoryM 세부 카테고리
	 * @param is_turnkey 다른 분야 필요 여부
	 * @param name 이름
	 * @param period 기간
	 * @param budget 예산
	 * @param plan_status 계획 상태
	 * @param description 설명
	 * @param technique 기술
	 * @param deadline 마감기한
	 * @param meeting_type 미팅 타입
	 * @param meeting_area 미팅 지역
	 * @param meeting_area_detail 미팅 세부 지역
	 * @param start_date 시작일
	 * @param managing 매니징 여부
	 * @param partner_type 파트너스 타입
	 * @param purpose 목적
	 * @param status 상태
	 */
	public void Save(int account_pk, String categoryL,String categoryM,String is_turnkey, String name,
			int period, int budget, String plan_status, String description, String technique,
			Timestamp deadline, String meeting_type, String meeting_area, String meeting_area_detail,
			Timestamp start_date, String managing,String partner_type, String purpose, String status)
	{
		int managing_int = 0;
		if(managing.equals("true"))
			managing_int = 1;
		else
			managing_int = 0;
		
		int another = 0;
		if(is_turnkey.equals("true"))
			another = 1;
		else
			another = 0;

		create(account_pk, categoryL, categoryM, another, name, period, budget,
				plan_status, description, technique, deadline, meeting_type,
				meeting_area, meeting_area_detail, start_date, managing_int, partner_type,
				purpose, status);

	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : Update
	 * 2. 작성일 : 2015. 12. 11. 오후 7:22:27
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 프로젝트 갱신 함수
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param account_pk 계정 고유값
	 * @param categoryL 카테고리
	 * @param categoryM 세부 카테고리
	 * @param is_turnkey 다른 분야 필요 여부
	 * @param name 이름
	 * @param period 기간
	 * @param budget 예산
	 * @param plan_status 계획 상태
	 * @param description 설명
	 * @param technique 기술
	 * @param deadline 마감기한
	 * @param meeting_type 미팅 타입
	 * @param meeting_area 미팅 지역
	 * @param meeting_area_detail 미팅 세부 지역
	 * @param start_date 시작일
	 * @param managing 매니징 여부
	 * @param partner_type 파트너스 타입
	 * @param purpose 목적
	 * @param status 상태
	 */
	public void Update(int project_pk, int account_pk, String categoryL,String categoryM,String is_turnkey, String name,
			int period, int budget, String plan_status, String description, String technique,
			Timestamp deadline, String meeting_type, String meeting_area, String meeting_area_detail,
			Timestamp start_date, String managing,String partner_type, String purpose, String status)
	{
		int managing_int = 0;
		if(managing.equals("true"))
			managing_int = 1;
		else
			managing_int = 0;
		
		int another = 0;
		if(is_turnkey.equals("true"))
			another = 1;
		else
			another = 0;

		jdbcTemplate.update("update project set account_pk=?, categoryL=?, categoryM=?,"
				+ " another=?, name=?, period=?, budget=?, plan_status=?, description=?,"
				+ " technique=?, deadline=?, meeting_type=?, meeting_area=?, meeting_area_detail=?,"
				+ " start_date=?, managing=?, partner_type=?, purpose=?, status=? where pk=?"
				, new Object[] {account_pk, categoryL, categoryM, another, name, period, budget,
						plan_status, description, technique, deadline, meeting_type,
						meeting_area, meeting_area_detail, start_date, managing_int, partner_type,
						purpose, status, project_pk });
		
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : getSQL
	 * 2. 작성일 : 2015. 12. 11. 오후 7:23:24
	 * 3. 작성자 : Hansol
	 * 4. 설명 : sql 문 리턴
	 * </pre>
	 * @param dev_sql 개발 sql
	 * @param design_sql 디자인 sql
	 * @param addr_sql 지역 sql
	 * @param status_sql 상태 sql
	 * @param sort_sql 정렬 sql
	 * @param q_sql 검색어 sql
	 * @return sql 문 리턴
	 */
	public String getSQL(String dev_sql, String design_sql, String addr_sql, String status_sql, String sort_sql, String q_sql)
	{
		String sql = "select * from project";
		
		if(!dev_sql.isEmpty() || !design_sql.isEmpty() || !addr_sql.isEmpty() || !status_sql.isEmpty())
		{
			sql += " where ";
			if(!dev_sql.isEmpty() && !design_sql.isEmpty())
			{
				sql += "(" + dev_sql +" or "+design_sql+")";
			}
			else if(!dev_sql.isEmpty())
				sql += dev_sql;
			else if(!design_sql.isEmpty())
				sql += design_sql;
			
			
			if(!addr_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += addr_sql;
				else
					sql += " and "+addr_sql;
			}
			if(!status_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += status_sql;
				else
					sql += " and "+status_sql;
			}

			if(!q_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += q_sql;
				else
					sql += " and "+q_sql;
			}
			sql += sort_sql;
		}
		
		return sql;
	}
	

	
	/**
	 * <pre>
	 * 1. 메소드명 : getCountSQL
	 * 2. 작성일 : 2015. 12. 11. 오후 7:24:53
	 * 3. 작성자 : Hansol
	 * 4. 설명 : count 리턴하는 sql 문 반환
	 * </pre>
	 * @param dev_sql 개발 sql
	 * @param design_sql 디자인 sql
	 * @param addr_sql 지역 sql
	 * @param status_sql 상태 sql
	 * @param sort_sql 정렬 sql
	 * @param q_sql 검색 sql
	 * @return sql 문
	 */
	public String getCountSQL(String dev_sql, String design_sql, String addr_sql, String status_sql, String sort_sql, String q_sql)
	{
		String sql = "select count(*) from project";
		
		if(!dev_sql.isEmpty() || !design_sql.isEmpty() || !addr_sql.isEmpty() || !status_sql.isEmpty())
		{
			sql += " where ";
			if(!dev_sql.isEmpty() && !design_sql.isEmpty())
			{
				sql += "(" + dev_sql +" or "+design_sql+")";
			}
			else if(!dev_sql.isEmpty())
				sql += dev_sql;
			else if(!design_sql.isEmpty())
				sql += design_sql;
			
			
			if(!addr_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += addr_sql;
				else
					sql += " and "+addr_sql;
			}
			if(!status_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += status_sql;
				else
					sql += " and "+status_sql;
			}

			if(!q_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += q_sql;
				else
					sql += " and "+q_sql;
			}
			sql += sort_sql;
		}
		
		return sql;
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : getApplicantNum
	 * 2. 작성일 : 2015. 12. 11. 오후 7:25:46
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트의 지원자 수 리턴
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @return 지원자 수
	 */
	public int getApplicantNum(int project_pk)
	{
		List<ApplicantInfo> applicantlist =  applicantDao.select_project(project_pk);
		
		return applicantlist.size();
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 7:26:11
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모두 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from project");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete_project
	 * 2. 작성일 : 2015. 12. 11. 오후 7:26:24
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트 삭제
	 * </pre>
	 * @param pk 프로젝트 고유값
	 * @return 결과값
	 */
	public String delete_project(int pk)
	{
		ProjectInfo project = select_project(pk);
		
		if(project.getStatus().equals("임시저장"))
		{
			logger.info("임시저장이므로 완전 삭제");
			delete(pk);
		}
		else if(project.getStatus().equals("검수중"))
		{
			logger.info("검수중이므로 취소 프로젝트로 변경");
			jdbcTemplate.update("update project set status='취소한프로젝트', reg_date=? where pk=?"
					, new Object[] {Time.getCurrentTimestamp(),pk });
		}
		else if(project.getStatus().equals("지원자모집중"))
		{
			logger.info("지원자모집중이므로 취소 프로젝트로 변경");
			jdbcTemplate.update("update project set status='취소한프로젝트' where pk=?"
					, new Object[] {pk });
		}
		
		return "성공";
		
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : updateStatusByScheduler
	 * 2. 작성일 : 2015. 12. 11. 오후 7:26:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 스케쥴러에 의해 프로젝트 상태 변경
	 * </pre>
	 */
	public void updateStatusByScheduler()
	{

		//지원자 모집중인데 지원자가 0명이고 모집기간이 지난경우
		jdbcTemplate.update("update project set status='취소한프로젝트' where status='지원자모집중' and applicantnum=0 and deadline <= CURRENT_TIMESTAMP");
		
		//지원자 모집중인데 모집기간이 지나고 계약이 0개인 프로젝트
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project where status='지원자모집중' and deadline <= CURRENT_TIMESTAMP",new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ProjectInfo project =  new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getInt("applicantnum")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getInt("budget")
	    				, resultSet.getString("plan_status")
	    				, resultSet.getString("description")
	    				, resultSet.getString("technique")
	    				, resultSet.getTimestamp("deadline")
	    				, resultSet.getString("meeting_type")
	    				, resultSet.getString("meeting_area")
	    				, resultSet.getString("meeting_area_detail")
	    				, resultSet.getTimestamp("start_date")
	    				, resultSet.getInt("managing")
	    				, resultSet.getString("partner_type")
	    				, resultSet.getString("purpose")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date"));
	    		
	    		List<ContractInfo> contractlist = contractDao.select_project(project.getPk());
	    		
	    		if(contractlist == null)
    			{
	    			//지원자 모집중인데 모집기간이 7일 지난경우, contract가 없는 경우 or contract 2번다 성사 안된경우
	    			jdbcTemplate.update("update project set status='취소한프로젝트' where pk = ?", new Object[] { project.getPk() });
    			}
	    		else if(contractlist.isEmpty())
	    		{
	    			//지원자 모집중인데 모집기간이 7일 지난경우, contract가 없는 경우 or contract 2번다 성사 안된경우
	    			jdbcTemplate.update("update project set status='취소한프로젝트' where pk = ?", new Object[] { project.getPk() });
	    		}
	    		
	    		return project;
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 7:27:05
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트 삭제
	 * </pre>
	 * @param pk 프로젝트 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from project where pk = ?", new Object[] { pk });
	}
}
