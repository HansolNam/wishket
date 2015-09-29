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
import com.wjm.models.ProjectInfo;

@Repository
public class ApplicantDao implements ApplicantIDao {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PortfolioDao portfolioDao;

	@Autowired
	private AccountDao accountDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}
	
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
	    		}
	    		
	    		return applicant;
	    	}
	    });
		
		if(list!=null && list.size() == 0)
			return null;
		else
			return list;
	}
	public List<ApplicantInfo> select_applicant(int account_pk)
	{
		return jdbcTemplate.query("select * from applicant where account_pk = ?",
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
	
	public List<ProjectInfo> getInterestProject(int account_pk)
	{
		 return jdbcTemplate.query("select * from project where pk = (select project_pk from applicant where account_pk = ? and status = ?)",
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
		
	}
	public List<ApplicantInfo> select_applicant(int account_pk, String status)
	{
		return jdbcTemplate.query("select * from applicant where account_pk = ? and status = ?",
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
	public void deleteAll()
	{
		jdbcTemplate.update("delete from applicant");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from applicant where pk = ?", new Object[] { pk });
	}
}
