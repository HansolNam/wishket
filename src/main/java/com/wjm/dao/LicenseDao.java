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

import com.wjm.idao.LicenseIDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.EducationInfo;
import com.wjm.models.LicenseInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : LicenseDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 6:45:11
 * 4. 작성자 : Hansol
 * 5. 설명 : 자격증 license 테이블 DAO
 * </pre>
 */
@Repository
public class LicenseDao implements LicenseIDao {

	private static final Logger logger = LoggerFactory.getLogger(LicenseDao.class);
	
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
	 * 2. 작성일 : 2015. 12. 11. 오후 6:45:24
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 자격증 생성 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param name 이름
	 * @param publishing_office 발행기관
	 * @param serial_num 고유번호
	 * @param publication_date 발행일자
 	 */
	public void create(int account_pk, String name, String publishing_office, String serial_num, String publication_date)
	{
		jdbcTemplate.update("insert into license (account_pk, name, publishing_office, serial_num, publication_date) values (?, ?, ?, ?, ?)", new Object[] {account_pk, name, publishing_office, serial_num, publication_date });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:45:52
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 자격증 리스트 반환
	 * </pre>
	 * @return 자격증 리스트
	 */
	public List<LicenseInfo> selectAll()
	{
		return jdbcTemplate.query("select * from license",new RowMapper<LicenseInfo>() {
	    	public LicenseInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new LicenseInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("publishing_office")
	    				, resultSet.getString("serial_num")
	    				, resultSet.getString("publication_date"));
	    	}
	    });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 6:46:25
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 자격증 리스트
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @return 자격증 리스트
	 */
	public List<LicenseInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from license where account_pk = ? order by publication_date desc",
		    	new Object[] { account_pk }, new RowMapper<LicenseInfo>() {
	    	public LicenseInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new LicenseInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("publishing_office")
	    				, resultSet.getString("serial_num")
	    				, resultSet.getString("publication_date"));
	    	}
	    });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : select_license
	 * 2. 작성일 : 2015. 12. 11. 오후 6:46:42
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 자격증 반환
	 * </pre>
	 * @param pk 자격증 고유 값
	 * @return 자격증 정보
	 */
	public LicenseInfo select_license(int pk)
	{
		List<LicenseInfo> license = jdbcTemplate.query("select * from license where pk = ?",
		    	new Object[] { pk }, new RowMapper<LicenseInfo>() {
	    	public LicenseInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new LicenseInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("name")
	    				, resultSet.getString("publishing_office")
	    				, resultSet.getString("serial_num")
	    				, resultSet.getString("publication_date"));
	    	}
	    });
		
		if(license == null)
		{
			return null;
		}
		else if(license.size()>1 || license.size() == 0)
		{
			logger.info("해당 pk의 교육이 2개이상이거나 0개! 에러");
			return null;
		}
		else
		{
			return license.get(0);
		}
		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : createLicense
	 * 2. 작성일 : 2015. 12. 11. 오후 6:46:57
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 자격증 생성 함수
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param title 이름
	 * @param institution 기관
	 * @param certification_number 자격번호
	 * @param date_issued_year 발행 년
	 * @param date_issued_month 발행 월
	 * @param date_issued_day 발행 일
	 * @return 결과값
	 * @throws ParseException
	 */
	public String createLicense(int account_pk, String title, String institution, String certification_number, 
			String date_issued_year, String date_issued_month, String date_issued_day) throws ParseException
	{

		if(!Validator.hasValue(title))
		{
			return "자격증명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(title, 1, 20))
		{
			return "자격증명을 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("자격증명 : "+title);
		}
		

		if(!Validator.hasValue(institution))
		{
			return "발행기관을 입력해주세요.";
		}
		else if(!Validator.isValidLength(institution, 1, 20))
		{
			return "발행기관은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("발행기관 : "+institution);
		}
		

		if(!Validator.hasValue(certification_number))
		{
			return "일련번호를 선택해주세요.";
		}
		else if(!Validator.isValidLength(certification_number, 1, 20))
		{
			return "일련번호를 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("일련번호 : "+certification_number);
		}
		
		if(!Validator.isDigit(date_issued_year)||!Validator.isDigit(date_issued_month)||!Validator.isDigit(date_issued_day))
		{
			return "발행일을 정상적으로 선택해주세요.";
		}
		else if(date_issued_year.length() != 4 ||!Validator.isValidLength(date_issued_month, 1, 2)||!Validator.isValidLength(date_issued_day, 1, 2) )
		{
			return "발행일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(date_issued_year+"년 "+date_issued_month+"월 "+date_issued_day+"일");
		}
		

		if(date_issued_month.length() == 1)
		{
			date_issued_month = "0"+date_issued_month;
		}
		if(date_issued_day.length() == 1)
		{
			date_issued_day = "0"+date_issued_day;
		}
		
		Timestamp date_issued;
		date_issued = Time.dateToTimestamp3(date_issued_year+"년 "+date_issued_month+"월 "+date_issued_day+"일");
		
		create(account_pk, title, institution, certification_number, Time.toString3(date_issued));
		
		return "성공";
		
	}


	/**
	 * <pre>
	 * 1. 메소드명 : updateLicense
	 * 2. 작성일 : 2015. 12. 11. 오후 6:47:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 자격증 정보 갱신
	 * </pre>
	 * @param pk 고유값
	 * @param title 이름
	 * @param institution 기관
	 * @param certification_number 인증번호
	 * @param date_issued_year 발행 년
	 * @param date_issued_month 발행 월
	 * @param date_issued_day 발행 일
	 * @return 결과값
	 * @throws ParseException
	 */
	public String updateLicense(int pk, String title, String institution, String certification_number, 
			String date_issued_year, String date_issued_month, String date_issued_day) throws ParseException
	{

		if(!Validator.hasValue(title))
		{
			return "자격증명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(title, 1, 20))
		{
			return "자격증명을 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("자격증명 : "+title);
		}
		

		if(!Validator.hasValue(institution))
		{
			return "발행기관을 입력해주세요.";
		}
		else if(!Validator.isValidLength(institution, 1, 20))
		{
			return "발행기관은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("발행기관 : "+institution);
		}
		

		if(!Validator.hasValue(certification_number))
		{
			return "일련번호를 선택해주세요.";
		}
		else if(!Validator.isValidLength(certification_number, 1, 20))
		{
			return "일련번호를 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("일련번호 : "+certification_number);
		}
		
		if(!Validator.isDigit(date_issued_year)||!Validator.isDigit(date_issued_month)||!Validator.isDigit(date_issued_day))
		{
			return "발행일을 정상적으로 선택해주세요.";
		}
		else if(date_issued_year.length() != 4 ||!Validator.isValidLength(date_issued_month, 1, 2)||!Validator.isValidLength(date_issued_day, 1, 2) )
		{
			return "발행일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(date_issued_year+"년 "+date_issued_month+"월 "+date_issued_day+"일");
		}
		

		if(date_issued_month.length() == 1)
		{
			date_issued_month = "0"+date_issued_month;
		}
		if(date_issued_day.length() == 1)
		{
			date_issued_day = "0"+date_issued_day;
		}
		
		Timestamp date_issued;
		date_issued = Time.dateToTimestamp3(date_issued_year+"년 "+date_issued_month+"월 "+date_issued_day+"일");

		jdbcTemplate.update("update license set name=?, publishing_office=?, serial_num=?, publication_date=? where pk=?"
				, new Object[] {title, institution, certification_number, Time.toString3(date_issued),pk });
				
		return "성공";
		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 6:48:27
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 자격 정보 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from license");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 6:48:34
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 자격 정보 삭제
	 * </pre>
	 * @param pk 자격 고유값
	 * @return 결과값
	 */
	public String delete(int pk)
	{
		jdbcTemplate.update("delete from license where pk = ?", new Object[] { pk });
		return "성공";
	}
}
