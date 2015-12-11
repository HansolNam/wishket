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

import com.wjm.idao.Partners_infoIDao;
import com.wjm.main.function.Validator;
import com.wjm.models.Partners_infoInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : Partners_infoDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 6:52:34
 * 4. 작성자 : Hansol
 * 5. 설명 : 파트너스 정보 partners_info 테이블 DAO
 * </pre>
 */
@Repository
public class Partners_infoDao implements Partners_infoIDao {

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
	 * 2. 작성일 : 2015. 12. 11. 오후 6:52:47
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 파트너스 정보 생성
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 */
	public void create(int account_pk)
	{
		jdbcTemplate.update("insert into partners_info (account_pk) values (?)", new Object[] { account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 6:53:02
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 파트너스 정보 반환
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return 파트너스 정보
	 */
	public Partners_infoInfo select(int account_pk)
	{
		List<Partners_infoInfo> list = jdbcTemplate.query("select * from partners_info where account_pk = ?", new Object[] { account_pk }
				,new RowMapper<Partners_infoInfo>() {
		    	public Partners_infoInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new Partners_infoInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("job")
		    				, resultSet.getString("job_subcategory_develop")
		    				, resultSet.getString("job_subcategory_design")
		    				, resultSet.getString("availability")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list.size()>1)
		{
			logger.info("해당 파트너스 정보가 2개 존재 , 에러");
			return null;
		}
		else if(list.size() == 1)
		{
			return list.get(0);
		}
		else
		{
			logger.info("파트너스 정보 없으므로 생성후 반환");
			create(account_pk);
			return select(account_pk);
		}
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasPartnersInfo
	 * 2. 작성일 : 2015. 12. 11. 오후 6:53:28
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 해당 계정이 파트너스 정보 소유하고 잇는지 여부 반환
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @return true, false
	 */
	public boolean hasPartnersInfo(int account_pk)
	{
		Partners_infoInfo partnersinfo = select(account_pk);
		if(partnersinfo == null)
			return false;
		else
		{
			if(!Validator.hasValue(partnersinfo.getJob())||!Validator.hasValue(partnersinfo.getAvailability()))
				return false;
			else
				return true;
		}
	}

	/**
	 * <pre>
	 * 1. 메소드명 : update
	 * 2. 작성일 : 2015. 12. 11. 오후 6:53:52
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 파트너스 정보 갱신
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param job 직종
	 * @param job_subcategory_develop 개발 세부카테고리
	 * @param job_subcategory_design 디자인 세부카테고리
	 * @param availability 활동가능성
	 * @return 결과값
	 */
	public String update(int account_pk, String job, String[] job_subcategory_develop, String[] job_subcategory_design,
			String availability)
	{

		if(!Validator.hasValue(job))
		{
			return "직군을 선택해주세요.";
		}
		else if(!job.equals("개발자")&&!job.equals("디자이너"))
		{
			
			return "직군을 올바르게 선택해주세요.";
		}
		else
		{
			logger.info("직군 : "+job);
		}
		
		String job_develop = "";
		
		if(job_subcategory_develop != null)
		{
			if(job_subcategory_develop.length >0)
			{
				for(int i=0;i<job_subcategory_develop.length;i++)
				{
					if(!Validator.isProjectCategory("개발", job_subcategory_develop[i]))
					{
						return "관심분야(깨발)를 올바르게 선택해주세요";
					}
					else
					{
						job_develop += job_subcategory_develop[i] + ",";
					}
				}

				if(job_develop.length()>0)
					job_develop =  job_develop.substring(0,job_develop.length()-1);
				logger.info("관심분야(개발) : "+job_develop);

			}
		}

		String job_design = "";
		
		if(job_subcategory_design != null)
		{
			if(job_subcategory_design.length >0)
			{
				for(int i=0;i<job_subcategory_design.length;i++)
				{
					if(!Validator.isProjectCategory("디자인", job_subcategory_design[i]))
					{
						return "관심분야(디자인)를 올바르게 선택해주세요";
					}
					else
					{
						job_design += job_subcategory_design[i] + ",";
					}
				}
				if(job_design.length()>0)
					job_design =  job_design.substring(0,job_design.length()-1);
				logger.info("관심분야(디자인) : "+job_design);

			}
		}

		if(!Validator.hasValue(availability))
		{
			return "활동가능성을 선택해주세요.";
		}
		else if(availability.equals("활동가능")||availability.equals("협의필요")||availability.equals("활동불가"))
		{
			logger.info("활동가능성 : "+availability);
		}
		else
		{
			return "활동가능성을 올바르게 선택해주세요.";
		}
		
		jdbcTemplate.update("update partners_info set job=?, job_subcategory_develop=?, job_subcategory_design=?, availability=? where account_pk=?"
				, new Object[] {job, job_develop, job_design, availability,account_pk });
				
		return "성공";
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:54:21
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 파트너스 정보 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from partners_info");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 6:54:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 파트너스 정보 삭제
	 * </pre>
	 * @param account_pk 계정 고유값
	 */
	public void delete(int account_pk)
	{
		jdbcTemplate.update("delete from partners_info where account_pk = ?", new Object[] { account_pk });
	}
	
}
