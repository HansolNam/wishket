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

import com.wjm.idao.CareerIDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.CareerInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : CareerDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 5:14:27
 * 4. 작성자 : Hansol
 * 5. 설명 : 경력 career table DAO
 * </pre>
 */
@Repository
public class CareerDao implements CareerIDao {

	private static final Logger logger = LoggerFactory.getLogger(CareerDao.class);
	
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
	 * 2. 작성일 : 2015. 12. 11. 오후 5:13:59
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 경력 생성 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param company_name 회사명
	 * @param department 부서
	 * @param position 직위
	 * @param start_date 시작일
	 * @param end_date 종료일
	 */
	public void create(int account_pk, String company_name, String department, String position, String start_date, String end_date)
	{
		jdbcTemplate.update("insert into career (account_pk, company_name, department, position, start_date, end_date) values (?, ?, ?, ?, ?, ?)", new Object[] { account_pk, company_name, department, position, start_date, end_date });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:15:01
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 경력 리스트 반환
	 * </pre>
	 * @return 경력 리스트
	 */
	public List<CareerInfo> selectAll()
	{
		return jdbcTemplate.query("select * from career",new RowMapper<CareerInfo>() {
		    	public CareerInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new CareerInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("department")
		    				, resultSet.getString("position")
		    				, resultSet.getString("start_date")
		    				, resultSet.getString("end_date"));
		    	}
		    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 5:15:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정 고유값의 경력 리스트 반환
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return 경력 리스트
	 */
	public List<CareerInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from career where account_pk = ? order by start_date desc",
		    	new Object[] { account_pk }, new RowMapper<CareerInfo>() {
	    	public CareerInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new CareerInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("company_name")
	    				, resultSet.getString("department")
	    				, resultSet.getString("position")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date"));
	    	}
	    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select_career
	 * 2. 작성일 : 2015. 12. 11. 오후 5:15:32
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 경력 고유값의 경력 정보 리턴
	 * </pre>
	 * @param pk 경력 고유값
	 * @return 경력 정보 반환
	 */
	public CareerInfo select_career(int pk)
	{
		List<CareerInfo> careerlist = jdbcTemplate.query("select * from career where pk = ?",
		    	new Object[] { pk }, new RowMapper<CareerInfo>() {
	    	public CareerInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new CareerInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("company_name")
	    				, resultSet.getString("department")
	    				, resultSet.getString("position")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date"));
	    	}
	    });
		
		if(careerlist.size()>1 ||careerlist.size()==0)
		{
			logger.info("carrer가 2개 이상!or 0개 에러");
			return null;
		}
		else
			return careerlist.get(0);
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 5:15:55
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 경력 정보 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from career");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 5:16:02
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 경력 정보 삭제
	 * </pre>
	 * @param pk 경력 고유값
	 * @return 결과값 리턴
	 */
	public String delete(int pk)
	{
		jdbcTemplate.update("delete from career where pk = ?", new Object[] { pk });
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : createCareer
	 * 2. 작성일 : 2015. 12. 11. 오후 5:16:16
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 경력 정보 생성
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param company_name 회사명
	 * @param division 부서
	 * @param position 직위
	 * @param date_hired_year 시작 년도
	 * @param date_hired_month 시작 월
	 * @param date_retired_year 종료 년도
	 * @param date_retired_month 종료 월
	 * @return 결과값
	 * @throws ParseException
	 */
	public String createCareer(int account_pk,String company_name,String division,String position,
			String date_hired_year,String date_hired_month,String date_retired_year,String date_retired_month)
					 throws ParseException
	{

		if(!Validator.hasValue(company_name))
		{
			return "회사명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(company_name, 1, 20))
		{
			return "회사명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("회사명 : "+company_name);
		}
		
		if(!Validator.hasValue(division))
		{
			return "부서을 입력해주세요.";
		}
		else if(!Validator.isValidLength(division, 1, 20))
		{
			return "부서은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("부서 : "+division);
		}
		
		if(!Validator.hasValue(position))
		{
			return "직위을 입력해주세요.";
		}
		else if(!Validator.isValidLength(position, 1, 20))
		{
			return "직위은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("직위 : "+position);
		}
		
		if(!Validator.isDigit(date_hired_year)||!Validator.isDigit(date_hired_month))
		{
			return "입사일을 정상적으로 선택해주세요.";
		}
		else if(date_hired_year.length() != 4 ||!Validator.isValidLength(date_hired_month, 1, 2) )
		{
			return "입사일을 정상적으로 선택해주세요.";
		}
		else if(date_hired_month.length() == 1)
		{
			date_hired_month = "0"+date_hired_month;
		}
		else
		{
			logger.info(date_hired_year+"년 "+date_hired_month+"월");
		}
		
		if(!Validator.isDigit(date_retired_year)||!Validator.isDigit(date_retired_month))
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_retired_year.length() != 4 ||!Validator.isValidLength(date_retired_month, 1, 2) )
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_retired_month.length() == 1)
		{
			date_retired_month = "0"+date_retired_month;
		}
		else
		{
			logger.info(date_retired_year+"년 "+date_retired_month+"월");
		}
		
		Timestamp date_hired, date_retired;
			date_hired = Time.dateToTimestamp5(date_hired_year+"년 "+date_hired_month+"월");
			date_retired = Time.dateToTimestamp5(date_retired_year+"년 "+date_retired_month+"월");
		
		if(Time.isCompare(date_hired,date_retired) == false)
		{			
			return "입사일과 퇴사일을 정상적으로 입력해주세요.";
		}
		
		create(account_pk, company_name, division, position, Time.toString5(date_hired), Time.toString5(date_retired));		
		
		return "성공";
	}
	

	/**
	 * <pre>
	 * 1. 메소드명 : updateCareer
	 * 2. 작성일 : 2015. 12. 11. 오후 5:17:07
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 경력 정보 갱신
	 * </pre>
	 * @param pk 경력 고유값
	 * @param company_name 회사명
	 * @param division 부서
	 * @param position 직위
	 * @param date_hired_year 시작년도
	 * @param date_hired_month 시작 월
	 * @param date_retired_year 종료 년도
	 * @param date_retired_month 종료 월
	 * @return 결과값
	 * @throws ParseException
	 */
	public String updateCareer(int pk,String company_name,String division,String position,
			String date_hired_year,String date_hired_month,String date_retired_year,String date_retired_month)
					 throws ParseException
	{

		if(!Validator.hasValue(company_name))
		{
			return "회사명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(company_name, 1, 20))
		{
			return "회사명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("회사명 : "+company_name);
		}
		
		if(!Validator.hasValue(division))
		{
			return "부서을 입력해주세요.";
		}
		else if(!Validator.isValidLength(division, 1, 20))
		{
			return "부서은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("부서 : "+division);
		}
		
		if(!Validator.hasValue(position))
		{
			return "직위을 입력해주세요.";
		}
		else if(!Validator.isValidLength(position, 1, 20))
		{
			return "직위은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("직위 : "+position);
		}
		
		if(!Validator.isDigit(date_hired_year)||!Validator.isDigit(date_hired_month))
		{
			return "입사일을 정상적으로 선택해주세요.";
		}
		else if(date_hired_year.length() != 4 ||!Validator.isValidLength(date_hired_month, 1, 2) )
		{
			return "입사일을 정상적으로 선택해주세요.";
		}
		else if(date_hired_month.length() == 1)
		{
			date_hired_month = "0"+date_hired_month;
		}
		else
		{
			logger.info(date_hired_year+"년 "+date_hired_month+"월");
		}
		
		if(!Validator.isDigit(date_retired_year)||!Validator.isDigit(date_retired_month))
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_retired_year.length() != 4 ||!Validator.isValidLength(date_retired_month, 1, 2) )
		{
			return "퇴사일을 정상적으로 선택해주세요.";
		}
		else if(date_retired_month.length() == 1)
		{
			date_retired_month = "0"+date_retired_month;
		}
		else
		{
			logger.info(date_retired_year+"년 "+date_retired_month+"월");
		}
		
		Timestamp date_hired, date_retired;
			date_hired = Time.dateToTimestamp5(date_hired_year+"년 "+date_hired_month+"월");
			date_retired = Time.dateToTimestamp5(date_retired_year+"년 "+date_retired_month+"월");
		
		if(Time.isCompare(date_hired,date_retired) == false)
		{			
			return "입사일과 퇴사일을 정상적으로 입력해주세요.";
		}
		
		jdbcTemplate.update("update career set company_name=?, department=?, position=?, start_date=?, end_date=? where pk=?"
				, new Object[] {company_name,division,position,Time.toString5(date_hired),Time.toString5(date_retired),pk });
		
		return "성공";
	}
}
