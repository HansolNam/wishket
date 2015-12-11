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

import com.wjm.idao.ApplicantIDao;
import com.wjm.main.function.Validator;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.ProjectInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : ApplicantDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 4:33:14
 * 4. 작성자 : Hansol
 * 5. 설명 : 지원자 applicant 테이블에 접근하는 DAO
 * </pre>
 */
@Repository
public class ApplicantDao implements ApplicantIDao {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PortfolioDao portfolioDao;

	@Autowired
	private AccountDao accountDao;
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
	 * 2. 작성일 : 2015. 12. 11. 오후 4:33:33
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지원자 applicant 생성
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @param account_pk 지원자 고유값
	 * @param application_cost 지원 금액
	 * @param application_period 지원 기간
	 * @param application_content 지원 내용
	 * @param has_portfolio 포트폴리오 소유 여부
	 * @param portfolio_pk1 포트폴리오 1 고유값
	 * @param portfolio_pk2 포트폴리오 2 고유값
	 * @param portfolio_pk3 포트폴리오 3 고유값
	 * @param portfolio_description 포트폴리오 설명
	 * @param status 상태
	 * @param name 이름
	 */
	public void create(int project_pk, int account_pk,int application_cost,
			int application_period,String application_content,
			int has_portfolio, int portfolio_pk1, int portfolio_pk2,
			int portfolio_pk3, String portfolio_description,
			String status,String name)
	{
		jdbcTemplate.update("insert into applicant (project_pk, account_pk, application_cost, "
				+ "application_period, application_content, has_portfolio, portfolio_pk1, portfolio_pk2, portfolio_pk3, "
				+ "portfolio_description, status, name) values (?, ?, ?,?,?,?,?,?,?,?,?,?)"
				, new Object[] { project_pk, account_pk, application_cost, application_period,
						application_content, has_portfolio, portfolio_pk1, portfolio_pk2, portfolio_pk3, 
						portfolio_description, status,name });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : update
	 * 2. 작성일 : 2015. 12. 11. 오후 4:34:35
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지원자 applicant 갱신
	 * </pre>
	 * @param pk 고유값
	 * @param application_cost 지원금액
	 * @param application_period 지원기간
	 * @param application_content 지원내용
	 * @param has_portfolio 포트폴리오 소유 여부
	 * @param portfolio_pk1 포트폴리오 1 고유값
	 * @param portfolio_pk2 포트폴리오 2 고유값
	 * @param portfolio_pk3 포트폴리오 3 고유값
	 * @param portfolio_description 포트폴리오 설명
	 * @param status 상태
	 * @param name 이름
	 */
	public void update(int pk,int application_cost,
			int application_period,String application_content,
			int has_portfolio, int portfolio_pk1, int portfolio_pk2,
			int portfolio_pk3, String portfolio_description,
			String status, String name)
	{
		jdbcTemplate.update("update applicant set application_cost=?, application_period=?, application_content=?, "
				+ "has_portfolio=?, portfolio_pk1=?, portfolio_pk2=? , portfolio_pk3=? "
				+ ", portfolio_description=?, status=?, name=? where pk=?"
				, new Object[] { application_cost, application_period, application_content, has_portfolio,
						portfolio_pk1, portfolio_pk2, portfolio_pk3, portfolio_description, status, name,
						pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:35:26
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 지원자 리스트 반환
	 * </pre>
	 * @return 지원자 리스트
	 */
	public List<ApplicantInfo> selectAll()
	{
		return jdbcTemplate.query("select * from applicant",new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name"));
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:36:06
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지원자 고유값의 지원자 반환
	 * </pre>
	 * @param pk 지원자 고유값
	 * @return 1개의 지원자
	 */
	public ApplicantInfo select(int pk)
	{
		List<ApplicantInfo> list =  jdbcTemplate.query("select * from applicant where pk = ?",
		    	new Object[] { pk },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name")
	    				);
	    	}
	    });
		
		if(list == null)
			return null;
		else
		{
			if(list.isEmpty())
				return null;
			else
				return list.get(0);
		}
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_project
	 * 2. 작성일 : 2015. 12. 11. 오후 4:36:35
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 프로젝트 고유값에 따른 지원자 리스트 반환
	 * </pre>
	 * @param project_pk 프로젝트 고유값
	 * @return 지원자 리스트
	 */
	public List<ApplicantInfo> select_project(int project_pk)
	{
		List<ApplicantInfo> list =  jdbcTemplate.query("select * from applicant where project_pk = ?",
		    	new Object[] { project_pk },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ApplicantInfo applicant =  new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name")
	    				);
	    		

	    		if(applicant!=null)
	    		{
		    		applicant.setAccount(accountDao.select(applicant.getAccount_pk()));
		    		
		    		logger.info("applicant : "+applicant.getAccount().getId());
	    			if(applicant.getHas_portfolio() == 1)
	    			{
	    				if( applicant.getPortfolio_pk1() != 0 )
	    					applicant.setPortfolio1(portfolioDao.select_portfolio(applicant.getPortfolio_pk1()));
	    				else
	    					applicant.setPortfolio1(null);

	    				if( applicant.getPortfolio_pk2() != 0 )
	    					applicant.setPortfolio2(portfolioDao.select_portfolio(applicant.getPortfolio_pk2()));
	    				else
	    					applicant.setPortfolio2(null);
	    				
	    				if( applicant.getPortfolio_pk3() != 0 )
	    					applicant.setPortfolio3(portfolioDao.select_portfolio(applicant.getPortfolio_pk3()));
	    				else
	    					applicant.setPortfolio3(null);
	    			}
	    			
	    			ContractInfo contract = contractDao.select_project_partners(applicant.getProject_pk(),applicant.getAccount_pk());
	    			applicant.setContract(contract);
	    			
	    		}
	    		return applicant;
	    	}
	    });
		
		if(list!=null && list.size() == 0)
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_applicant
	 * 2. 작성일 : 2015. 12. 11. 오후 4:37:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 account 고유값
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return 지원자 리스트
	 */
	public List<ApplicantInfo> select_applicant(int account_pk)
	{
		return jdbcTemplate.query("select * from applicant where account_pk = ? order by reg_date desc",
		    	new Object[] { account_pk },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name"));
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_applicant_num
	 * 2. 작성일 : 2015. 12. 11. 오후 4:38:10
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 지원자 수
	 * </pre>
	 * @param account_pk 특정 계정의 고유값
	 * @return 지원자 수
	 */
	public int select_applicant_num(int account_pk)
	{
		return jdbcTemplate.queryForInt("select count(*) from applicant where account_pk = ?",
		    	new Object[] { account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 4:38:38
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정과 특정 프로젝트의 지원자
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param project_pk 프로젝트 고유값
	 * @return 1개의 지원자
	 */
	public ApplicantInfo select(int account_pk, int project_pk)
	{
		List<ApplicantInfo> list = jdbcTemplate.query("select * from applicant where account_pk = ? and project_pk = ?",
		    	new Object[] { account_pk, project_pk },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name"));
	    	}
	    });
		
		if(list != null)
		{
			if(list.size() == 0)
				return null;
			else if(list.size() > 1)
				return null;
			else
				return list.get(0);
		}
		else
			return null;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : createApplicant
	 * 2. 작성일 : 2015. 12. 11. 오후 4:39:31
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지원자 생성 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param project_pk 프로젝트 고유값
	 * @param name 이름
	 * @param estimated_budget 예상 예산
	 * @param estimated_term 예상 기간
	 * @param body 지원내용
	 * @param has_related_portfolio 포트폴리오 소유 여부
	 * @param related_portfolio 포트폴리오 리스트
	 * @param related_description 포트폴리오 설명
	 * @return 결과값
	 */
	public String createApplicant(int account_pk,int project_pk,String name,String estimated_budget,
			String estimated_term,String body,String has_related_portfolio,String[] related_portfolio,String related_description)
	{
		if(!Validator.hasValue(name))
		{
			return "URL에 프로젝트명이 존재하지 않습니다.";
		}
		else
		{
			logger.info("프로젝트명 : "+name);
		}
		
		int budget = 0;
		if(!Validator.hasValue(estimated_budget))
		{
			return "지원금액을 입력해주세요.";
		}
		else
		{
			estimated_budget = estimated_budget.replace(",", "");
			if(!Validator.isValidLength(estimated_budget, 1, 10))
				return "지원금액이 너무 큽니다.";
			else if(!Validator.isDigit(estimated_budget)){
				return "지원금액은 숫자만 입력가능합니다.";
			}
			else
			{
				logger.info("estimated_budget : "+estimated_budget);
				budget = Integer.parseInt(estimated_budget);
			}
		}
		
		int term = 0;
		
		if(!Validator.hasValue(estimated_term))
		{
			return "지원기간을 입력해주세요.";
		}
		else if(!Validator.isValidLength(estimated_term, 1, 3))
		{
			return "지원 기간은 최대 3자리까지 가능합니다.";
		}
		else if(!Validator.isDigit(estimated_term))
		{
			return "지원 기간은 숫자만 입력 가능합니다.";
		}
		else
		{
			logger.info("지원기간 : "+estimated_term);
			term = Integer.parseInt(estimated_term);
		}
		
		if(!Validator.hasValue(body))
		{
			return "지원내용을 입력해주세요.";
		}
		else if(!Validator.isValidLength(body, 1, 5000))
		{
			return "지원내용은 최대 5000자리까지 가능합니다.";
		}
		else
		{
			logger.info("지원내용 : "+body);
		}
		
		int hasPortfolio = 0;
		
		if(has_related_portfolio.equals("True"))
			hasPortfolio = 1;
		
		int[] portfolio = new int[related_portfolio.length];
		
		if(hasPortfolio == 0)
		{
			for(int i=0;i<related_portfolio.length;i++)
			{
				portfolio[i] = 0;
			}
		}
		else
		{
			for(int i =0;i<related_portfolio.length;i++)
			{
				if(Validator.hasValue(related_portfolio[i]) && Validator.isDigit(related_portfolio[i]))
				{
					portfolio[i] = Integer.parseInt(related_portfolio[i]);
				}
				else
					portfolio[i] = 0;
				
				logger.info(i+" : "+portfolio[i]);
			}
			if(!Validator.hasValue(related_description))
			{
				return "포트폴리오 설명을 입력해주세요.";
			}
			else if(!Validator.isValidLength(related_description, 1, 5000))
			{
				return "포트폴리오 설명은 최대 5000자리까지 가능합니다.";
			}
			else
			{
				logger.info("포트폴리오 설명 : "+related_description);
			}
		}

		ApplicantInfo applicant = select(account_pk,project_pk);
		
		if(applicant == null)
		{
			create(project_pk, account_pk,budget,term,body,
					hasPortfolio, portfolio[0], portfolio[1],
					portfolio[2], related_description,"지원중",name);
			
			logger.info("지원자수 1 증가");
			//지원자수 증가
			jdbcTemplate.update("update project set applicantnum=(applicantnum+1) where pk=?"
					, new Object[] { project_pk });
		}
		else
		{/*
			1. 관심프로젝트
			2. 지원중
			3. 지원종료
			4. 계약진행중
			5. 진행중
			6. 평가대기중
			7. 완료한프로젝트
			*/
			if(applicant.getStatus().equals("지원중"))
			{
				return "이미 지원하셨습니다.";
			}
			else if(applicant.getStatus().equals("지원종료"))
			{
				return "프로젝트가 종료되었습니다.";
			}
			else if(applicant.getStatus().equals("관심프로젝트"))
			{
				logger.info("지원자수 1 증가");
				//지원자수 증가
				jdbcTemplate.update("update project set applicantnum=(applicantnum+1) where pk=?"
						, new Object[] { project_pk });
			}
			update(applicant.getPk(),budget,term,body,
					hasPortfolio, portfolio[0], portfolio[1],
					portfolio[2], related_description,"지원중",name);
			
			
		}
		
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : getInterestProject
	 * 2. 작성일 : 2015. 12. 11. 오후 4:42:00
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 관심 프로젝트 리스트
	 * </pre>
	 * @param account_pk 특정 계정
	 * @return 프로젝트 리스트
	 */
	public List<ProjectInfo> getInterestProject(int account_pk)
	{
		List<ProjectInfo> list = jdbcTemplate.query("select * from project where pk = (select project_pk from applicant where account_pk = ? and status = ?) order by reg_date desc",
		    	new Object[] { account_pk,"관심프로젝트" }, new RowMapper<ProjectInfo>() {
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
		
		if(list!=null && list.isEmpty())
			return null;
		else
			return list;
		
	}
	
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_applicant
	 * 2. 작성일 : 2015. 12. 11. 오후 4:42:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 상태값에 따른 지원자 리스트
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param status 상태
	 * @return 지원자 리스트
	 */
	public List<ApplicantInfo> select_applicant(int account_pk, String status)
	{
		return jdbcTemplate.query("select * from applicant where account_pk = ? and status = ? order by reg_date desc",
		    	new Object[] { account_pk, status },new RowMapper<ApplicantInfo>() {
	    	public ApplicantInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		ApplicantInfo applicant = new ApplicantInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("project_pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("application_cost")
	    				, resultSet.getInt("application_period")
	    				, resultSet.getString("application_content")
	    				, resultSet.getInt("has_portfolio")
	    				, resultSet.getInt("portfolio_pk1")
	    				, resultSet.getInt("portfolio_pk2")
	    				, resultSet.getInt("portfolio_pk3")
	    				, resultSet.getString("portfolio_description")
	    				, resultSet.getString("status")
	    				, resultSet.getTimestamp("reg_date")
	    				, resultSet.getString("name"));
	    		
	    		if(applicant!=null)
	    		{
	    			if(applicant.getHas_portfolio() == 1)
	    			{
	    				if( applicant.getPortfolio_pk1() != 0 )
	    					applicant.setPortfolio1(portfolioDao.select_portfolio(applicant.getPortfolio_pk1()));
	    				else
	    					applicant.setPortfolio1(null);

	    				if( applicant.getPortfolio_pk2() != 0 )
	    					applicant.setPortfolio2(portfolioDao.select_portfolio(applicant.getPortfolio_pk2()));
	    				else
	    					applicant.setPortfolio2(null);
	    				
	    				if( applicant.getPortfolio_pk3() != 0 )
	    					applicant.setPortfolio3(portfolioDao.select_portfolio(applicant.getPortfolio_pk3()));
	    				else
	    					applicant.setPortfolio3(null);
	    			}
	    		}
	    		
	    		return applicant;
	    	}
	    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : toggleInterest
	 * 2. 작성일 : 2015. 12. 11. 오후 4:43:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 관심 프로젝트 등록
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param project_pk 특정 프로젝트 고유값
	 * @return 결과값
	 */
	public String toggleInterest(int account_pk,int project_pk)
	{
		ApplicantInfo applicant = select(account_pk, project_pk);
		
		if(applicant == null)
		{
			jdbcTemplate.update("insert into applicant (project_pk, account_pk, status) values (?, ?, ?)"
					, new Object[] { project_pk, account_pk, "관심프로젝트" });
			return "true";
		}
		else
		{
			jdbcTemplate.update("delete from applicant where account_pk = ? and project_pk = ?", new Object[] { account_pk, project_pk });
			return "false";
		}
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : updateStatus
	 * 2. 작성일 : 2015. 12. 11. 오후 4:43:37
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 지원자 상태 갱신
	 * </pre>
	 * @param project_pk 특정 프로젝트 고유값
	 * @param account_pk 특정 계정 고유값
	 * @param status 상태
	 */
	public void updateStatus(int project_pk, int account_pk, String status)
	{
		jdbcTemplate.update("update applicant set status=? where project_pk = ? and account_pk=?"
				, new Object[] { status, project_pk, account_pk });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : updateRemianApplicantFail
	 * 2. 작성일 : 2015. 12. 11. 오후 4:43:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 프로젝트의 나머지 지원자 지원 종료시키는 함수
	 * </pre>
	 * @param project_pk 특정 프로젝트 고유값
	 */
	public void updateRemianApplicantFail(int project_pk)
	{
		jdbcTemplate.update("update applicant set status='지원종료' where project_pk=? and (status = '지원중' or status = '관심프로젝트')"
				, new Object[] { project_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 4:44:37
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 지원자 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from applicant");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 4:44:52
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 지원자 삭제
	 * </pre>
	 * @param pk 고유값
	 */
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from applicant where pk = ?", new Object[] { pk });
	}
}
