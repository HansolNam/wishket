package com.wjm.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.Partners_infoIDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.Partners_infoInfo;

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

	public void create(int account_pk)
	{
		jdbcTemplate.update("insert into partners_info (account_pk) values (?)", new Object[] { account_pk });
	}
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
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from partners_info");
	}
	public void delete(int account_pk)
	{
		jdbcTemplate.update("delete from partners_info where account_pk = ?", new Object[] { account_pk });
	}
	
}
