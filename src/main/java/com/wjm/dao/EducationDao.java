package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.EducationIDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.EducationInfo;

@Repository
public class EducationDao implements EducationIDao {

	private static final Logger logger = LoggerFactory.getLogger(EducationDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk,String school_name,String major,String level,String state,String start_date,String end_date)
	{		
		jdbcTemplate.update("insert into education (account_pk,school_name,major,level,state,start_date,end_date ) values (?, ?, ?, ?, ?, ?, ?)", new Object[] { account_pk,school_name,major,level,state,start_date,end_date });
	}
	public List<EducationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from education",new RowMapper<EducationInfo>() {
	    	public EducationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new EducationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("school_name")
	    				, resultSet.getString("major")
	    				, resultSet.getString("level")
	    				, resultSet.getString("state")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date"));
	    	}
	    });
		
	}
	public List<EducationInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from education where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<EducationInfo>() {
	    	public EducationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new EducationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("school_name")
	    				, resultSet.getString("major")
	    				, resultSet.getString("level")
	    				, resultSet.getString("state")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date"));
	    	}
	    });
		
		
	}
	public EducationInfo select_edu(int pk)
	{
		List<EducationInfo> edu = jdbcTemplate.query("select * from education where pk = ?",
		    	new Object[] { pk }, new RowMapper<EducationInfo>() {
	    	public EducationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new EducationInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("school_name")
	    				, resultSet.getString("major")
	    				, resultSet.getString("level")
	    				, resultSet.getString("state")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date"));
	    	}
	    });
		
		if(edu == null)
		{
			return null;
		}
		else if(edu.size()>1 || edu.size() == 0)
		{
			logger.info("해당 pk의 교육이 2개이상이거나 0개! 에러");
			return null;
		}
		else
		{
			return edu.get(0);
		}
		
	}
	
	public String createEdu(int account_pk, String school_name, String major, String edu_type, String edu_status, String date_entrance_year
			, String date_entrance_month, String date_graduate_year, String date_graduate_month) throws ParseException
	{

		if(!Validator.hasValue(school_name))
		{
			return "학교명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(school_name, 1, 20))
		{
			return "학교명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("학교명 : "+school_name);
		}
		

		if(!Validator.hasValue(major))
		{
			return "전공을 입력해주세요.";
		}
		else if(!Validator.isValidLength(major, 1, 20))
		{
			return "전공은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("전공 : "+major);
		}
		

		if(!Validator.hasValue(edu_type))
		{
			return "분류를 선택해주세요.";
		}
		else if(edu_type.equals("고등학교")||edu_type.equals("대학교")||edu_type.equals("대학원")||
				edu_type.equals("전문대")||edu_type.equals("박사과정"))
		{
			logger.info("분류 : "+edu_type);
		}
		else
		{
			return "분류를 올바르게 선택해주세요.";
		}
		
		if(!Validator.hasValue(edu_status))
		{
			return "상태를 선택해주세요.";
		}
		else if(edu_status.equals("재학")||edu_status.equals("휴학")||edu_status.equals("졸업")||
				edu_status.equals("자퇴"))
		{
			logger.info("상태 : "+edu_status);
		}
		else
		{
			return "상태를 올바르게 선택해주세요.";
		}
		

		if(!Validator.isDigit(date_entrance_year)||!Validator.isDigit(date_entrance_month))
		{
			return "입학일을 정상적으로 선택해주세요.";
		}
		else if(date_entrance_year.length() != 4 ||!Validator.isValidLength(date_entrance_month, 1, 2) )
		{
			return "입학일을 정상적으로 선택해주세요.";
		}
		else if(date_entrance_month.length() == 1)
		{
			date_entrance_month = "0"+date_entrance_month;
		}
		else
		{
			logger.info(date_entrance_year+"년 "+date_entrance_month+"월");
		}
		
		if(!Validator.isDigit(date_graduate_year)||!Validator.isDigit(date_graduate_month))
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_graduate_year.length() != 4 ||!Validator.isValidLength(date_graduate_month, 1, 2) )
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_graduate_month.length() == 1)
		{
			date_graduate_month = "0"+date_graduate_month;
		}
		else
		{
			logger.info(date_graduate_year+"년 "+date_graduate_month+"월");
		}
		

		Timestamp date_entrance, date_graduate;
		date_entrance = Time.dateToTimestamp5(date_entrance_year+"년 "+date_entrance_month+"월");
		date_graduate = Time.dateToTimestamp5(date_graduate_year+"년 "+date_graduate_month+"월");
		
		if(Time.isCompare(date_entrance,date_graduate) == false)
		{			
			return "입학일과 졸업일을 정상적으로 입력해주세요.";
		}
		
		create(account_pk,school_name,major,edu_type,edu_status,Time.toString5(date_entrance),Time.toString5(date_graduate));
		
		return "성공";
		
	}

	public String updateEdu(int pk, String school_name, String major, String edu_type, String edu_status, String date_entrance_year
			, String date_entrance_month, String date_graduate_year, String date_graduate_month) throws ParseException
	{

		if(!Validator.hasValue(school_name))
		{
			return "학교명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(school_name, 1, 20))
		{
			return "학교명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("학교명 : "+school_name);
		}
		

		if(!Validator.hasValue(major))
		{
			return "전공을 입력해주세요.";
		}
		else if(!Validator.isValidLength(major, 1, 20))
		{
			return "전공은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("전공 : "+major);
		}
		

		if(!Validator.hasValue(edu_type))
		{
			return "분류를 선택해주세요.";
		}
		else if(edu_type.equals("고등학교")||edu_type.equals("대학교")||edu_type.equals("대학원")||
				edu_type.equals("전문대")||edu_type.equals("박사과정"))
		{
			logger.info("분류 : "+edu_type);
		}
		else
		{
			return "분류를 올바르게 선택해주세요.";
		}
		
		if(!Validator.hasValue(edu_status))
		{
			return "상태를 선택해주세요.";
		}
		else if(edu_status.equals("재학")||edu_status.equals("휴학")||edu_status.equals("졸업")||
				edu_status.equals("자퇴"))
		{
			logger.info("상태 : "+edu_status);
		}
		else
		{
			return "상태를 올바르게 선택해주세요.";
		}
		

		if(!Validator.isDigit(date_entrance_year)||!Validator.isDigit(date_entrance_month))
		{
			return "입학일을 정상적으로 선택해주세요.";
		}
		else if(date_entrance_year.length() != 4 ||!Validator.isValidLength(date_entrance_month, 1, 2) )
		{
			return "입학일을 정상적으로 선택해주세요.";
		}
		else if(date_entrance_month.length() == 1)
		{
			date_entrance_month = "0"+date_entrance_month;
		}
		else
		{
			logger.info(date_entrance_year+"년 "+date_entrance_month+"월");
		}
		
		if(!Validator.isDigit(date_graduate_year)||!Validator.isDigit(date_graduate_month))
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_graduate_year.length() != 4 ||!Validator.isValidLength(date_graduate_month, 1, 2) )
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_graduate_month.length() == 1)
		{
			date_graduate_month = "0"+date_graduate_month;
		}
		else
		{
			logger.info(date_graduate_year+"년 "+date_graduate_month+"월");
		}
		

		Timestamp date_entrance, date_graduate;
		date_entrance = Time.dateToTimestamp5(date_entrance_year+"년 "+date_entrance_month+"월");
		date_graduate = Time.dateToTimestamp5(date_graduate_year+"년 "+date_graduate_month+"월");
		
		if(Time.isCompare(date_entrance,date_graduate) == false)
		{			
			return "입학일과 졸업일을 정상적으로 입력해주세요.";
		}
		
		jdbcTemplate.update("update education set school_name=?, major=?, level=?, state=?, start_date=?, end_date=? where pk=?"
				, new Object[] {school_name, major, edu_type, edu_status,Time.toString5(date_entrance),Time.toString5(date_graduate),pk });
				
		return "성공";
		
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from education");
	}
	public String delete(int pk)
	{
		jdbcTemplate.update("delete from education where pk = ?", new Object[] { pk });
		return "성공";
	}
}
