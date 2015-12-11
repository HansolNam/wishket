package com.wjm.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.wjm.idao.AccountInformationIDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : AccountInformationDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 3:20:42
 * 4. 작성자 : Hansol
 * 5. 설명 : account_information 테이블에 접근하는 Dao
 * </pre>
 */
@Repository
public class AccountInformationDao implements AccountInformationIDao {

	private static final Logger logger = LoggerFactory.getLogger(AccountDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private AreaDao areaDao;

	@Autowired
	private AreaDetailDao areaDetailDao;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	/**
	 * <pre>
	 * 1. 메소드명 : create
	 * 2. 작성일 : 2015. 12. 11. 오후 3:21:20
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 사용자 계정의 계정 정보 생성
	 * </pre>
	 * @param account_pk account 고유값
	 */
	public void create(int account_pk)
	{
		jdbcTemplate.update("insert into account_information (account_pk) values (?)", new Object[] { account_pk });
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 3:21:46
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 사용자 정보 반환하는 함수
	 * </pre>
	 * @return accountinformation 리스트
	 */
	public List<AccountInformationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from account_information",new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getString("birth_date")
		    				, resultSet.getString("regionl")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getInt("sms_subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
		    	}
		    });
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 3:22:20
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 account의 accountinformation 리턴
	 * </pre>
	 * @param account_pk account 고유값
	 * @return accountinformation 리턴
	 */
	public AccountInformationInfo select(int account_pk)
	{
		List<AccountInformationInfo> accountinfolist = jdbcTemplate.query("select * from account_information where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getString("birth_date")
		    				, resultSet.getString("regionl")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getInt("sms_subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
		    	}
		    });
		
		if(accountinfolist.size()>1)
		{
			logger.info("기본정보가 2개, 에러");
			return null;
		}
		else if(accountinfolist.size() == 0)
		{
			create(account_pk);
			return select(account_pk);
		}
		else
			return accountinfolist.get(0);
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : getProfileImg
	 * 2. 작성일 : 2015. 12. 11. 오후 3:24:01
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 account의 프로필 이미지명 리턴. 없을 경우, default_avatart.png 리턴
	 * </pre>
	 * @param account_pk 특정 account 고유값
	 * @return 이미지 경로
	 */
	public String getProfileImg(int account_pk)
	{
		List<AccountInformationInfo> accountinfolist = jdbcTemplate.query("select * from account_information where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getString("birth_date")
		    				, resultSet.getString("regionl")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getInt("sms_subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
		    	}
		    });
		
		if(accountinfolist.size()>1)
		{
			logger.info("프로필 : default_avatar.png");
			return "default_avatar.png";
		}
		else if(accountinfolist.size() == 0)
		{
			create(account_pk);
			AccountInformationInfo accountinfo =  select(account_pk);
			if(Validator.hasValue(accountinfo.getProfile_img()))
			{
				logger.info("프로필 : "+accountinfo.getProfile_img());
				return accountinfo.getProfile_img();
			}
			else
			{
				logger.info("프로필 : default_avatar.png");
				return "default_avatar.png";

			}
		}
		else
		{
			AccountInformationInfo accountinfo =accountinfolist.get(0);
			if(Validator.hasValue(accountinfo.getProfile_img()))
			{
				logger.info("프로필 : "+accountinfo.getProfile_img());
				return accountinfo.getProfile_img();
			}
			else
			{
				logger.info("프로필 : default_avatar.png");
				return "default_avatar.png";

			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 3:25:05
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 아이디의 Accountinformation 리스트 리턴
	 * </pre>
	 * @param id id
	 * @return accountinformation 리스트 리턴
	 */
	public List<AccountInformationInfo> select(String id)
	{
		return jdbcTemplate.query("select * from account_information where id = ?",
		    	new Object[] { id }, new RowMapper<AccountInformationInfo>() {
		    	public AccountInformationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInformationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("profile_img")
		    				, resultSet.getString("form")
		    				, resultSet.getString("company_name")
		    				, resultSet.getString("company_representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("sex")
		    				, resultSet.getString("birth_date")
		    				, resultSet.getString("regionl")
		    				, resultSet.getString("regionM")
		    				, resultSet.getString("regionR")
		    				, resultSet.getString("cellphone_num")
		    				, resultSet.getString("telephone_num")
		    				, resultSet.getString("fax_num")
		    				, resultSet.getInt("subscription")
		    				, resultSet.getInt("sms_subscription")
		    				, resultSet.getString("identity_authentication")
		    				, resultSet.getString("bank_name")
		    				, resultSet.getString("account_holder")
		    				, resultSet.getString("account_number")
		    				, resultSet.getString("introduction"));
		    	}
		    });
	}	
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 3:25:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 사용자 정보 삭제하는 함수
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from account_information");
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 3:26:06
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 id의 사용자 정보를 삭제하는 함수
	 * </pre>
	 * @param id 사용자 아이디
	 */
	public void delete(String id)
	{
		jdbcTemplate.update("delete from account_information where id = ?", new Object[] { id });
	}

	/**
	 * <pre>
	 * 1. 메소드명 : hasPhoneNum
	 * 2. 작성일 : 2015. 12. 11. 오후 3:26:26
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 연락처 정보가 존재하는지 여부를 반환하는 함수
	 * </pre>
	 * @param account_pk 사용자 고유값
	 * @return true, false
	 */
	public boolean hasPhoneNum(int account_pk)
	{
		AccountInformationInfo accountinfo = select(account_pk);

		//정보가 아예 없는 경우
		if(accountinfo==null)
		{
			create(account_pk);
			accountinfo = select(account_pk);
		}
		//정보가 있어도 내용이 없는 경우
		String phone_num = accountinfo.getCellphone_num();
		
		//하나라도 없으면 연락처 정보 없음
		if(!Validator.hasValue(phone_num))
			return false;
	
		//기본정보를 가지고 있음
		return true;
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasBasicInfo
	 * 2. 작성일 : 2015. 12. 11. 오후 3:27:10
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 account가 기본정보를 가지고 있는지 여부를 반환하는 함수
	 * </pre>
	 * @param account_pk 사용자 계정
	 * @return true, false
	 */
	public boolean hasBasicInfo(int account_pk)
	{
		AccountInformationInfo accountinfo = select(account_pk);

		//정보가 아예 없는 경우
		if(accountinfo==null)
		{
			create(account_pk);
			accountinfo = select(account_pk);
		}
		//정보가 있어도 내용이 없는 경우
		
		String profile = accountinfo.getProfile_img();
		String form = accountinfo.getForm();
		String name = accountinfo.getName();
		String sex = accountinfo.getSex();
		String company_name = accountinfo.getCompany_name();
		String representative = accountinfo.getCompany_representative();
		String birth = accountinfo.getBirth_date();
		String regionl = accountinfo.getRegionl();
		String regionM = accountinfo.getRegionm();
		String regionR = accountinfo.getRegionr();
		
		if(form == null)
		{
			return false;
		}
		else if(form.equals("individual"))
		{
			//하나라도 없으면 기본정보 없음
			if(profile == null || form == null || name == null || sex==null ||birth == null
					|| regionl == null || regionM == null || regionR == null)
				return false;
			else
			{
				if(profile.isEmpty() || form.isEmpty() || name.isEmpty() || sex.isEmpty()
						|| regionl.isEmpty() || regionM.isEmpty() || regionR.isEmpty())
					return false;
				else
					return true;
			}
		}
		else
		{
			//하나라도 없으면 기본정보 없음
			if(profile == null || form == null || name == null || company_name == null || representative == null ||birth == null
					|| regionl == null || regionM == null || regionR == null)
				return false;
			else
			{
				if(profile.isEmpty() || form.isEmpty() || name.isEmpty() ||company_name.isEmpty()|| representative.isEmpty() ||
						 regionl.isEmpty() || regionM.isEmpty() || regionR.isEmpty())
					return false;
				else
					return true;
			}
		}
			
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasContactInfo
	 * 2. 작성일 : 2015. 12. 11. 오후 3:28:10
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 클라이언트가 프로젝트를 등록하기전에 기본정보가 있는지 반환하는 함수
	 * </pre>
	 * @param account_pk 사용자 계정
	 * @return true, false
	 */
	public boolean hasContactInfo(int account_pk)
	{
		AccountInformationInfo accountinfo = select(account_pk);
		
		//정보가 아예 없는 경우
		if(accountinfo==null)
		{
			create(account_pk);
			accountinfo = select(account_pk);
		}
		
		//정보가 있어도 내용이 없는 경우
		String name = accountinfo.getName();
		String phone_num = accountinfo.getCellphone_num();
		String form = accountinfo.getForm();
		String company_name = accountinfo.getCompany_name();
		String representative = accountinfo.getCompany_representative();
		String introduction = accountinfo.getIntroduction();
		
		if(form == null)
			return false;
		else if(form.equals("team") || form.equals("individual"))
		{
			if(!Validator.hasValue(name) || !Validator.hasValue(phone_num) ||!Validator.hasValue(introduction))
				return false;
			else 
				return true;
		}
		else if(form.equals("individual_business") || form.equals("corporate_business"))
		{
			if(!Validator.hasValue(name) || !Validator.hasValue(phone_num) ||!Validator.hasValue(introduction)
					 ||!Validator.hasValue(company_name) ||!Validator.hasValue(representative))
				return false;
			else 
				return true;
		}
		else
			return false;

	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasAccount
	 * 2. 작성일 : 2015. 12. 11. 오후 3:29:50
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계좌정보를 가지고 있는지 체크하는 함수
	 * </pre>
	 * @param account_pk account 고유값
	 * @return true, false
	 */
	public boolean hasAccount(int account_pk)
	{
		AccountInformationInfo accountinfo = select(account_pk);
		
		//정보가 아예 없는 경우
		if(accountinfo==null)
		{
			create(account_pk);
			return false;
		}
		//정보가 있어도 내용이 없는 경우
		else
		{
			String bank_name = accountinfo.getBank_name();
			String account_holder = accountinfo.getAccount_holder();
			String account_number = accountinfo.getAccount_number();
			
			if(bank_name == null || account_holder == null || account_number == null)
				return false;
			else
			{
				if(bank_name.isEmpty() || account_holder.isEmpty() || account_number.isEmpty())
					return false;
			}
		}
		
		//계좌정보 가지고 있음
		return true;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateBasicInfo
	 * 2. 작성일 : 2015. 12. 11. 오후 3:30:51
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기본 정보 갱신 함수(회사)
	 * </pre>
	 * @param account_pk account 고유값
	 * @param name 이름
	 * @param cellphone_num 핸드폰 번호
	 * @param form 사업자 형태
	 * @param company_name 회사이름
	 * @param company_representative 회사 대표
	 * @param introduction 자기소개
	 */
	public void updateBasicInfo(int account_pk, String name, String cellphone_num, String form, String company_name, String company_representative, String introduction)
	{
		jdbcTemplate.update("update account_information set name=?, cellphone_num=?, form=?, company_name=?, company_representative=?, introduction=? where account_pk=?", new Object[] { name, cellphone_num, form,company_name,company_representative, introduction, account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateBasicInfo_individual
	 * 2. 작성일 : 2015. 12. 11. 오후 3:40:07
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기본 정보 갱신 함수(개인, 팀)
	 * </pre>
	 * @param account_pk 사용자 고유값
	 * @param name 이름
	 * @param cellphone_num 핸드폰번호
	 * @param form 사업자 형태
	 * @param introduction 자기소개
	 */
	public void updateBasicInfo_individual(int account_pk, String name, String cellphone_num, String form, String introduction)
	{
		jdbcTemplate.update("update account_information set name=?, cellphone_num=?, form=?, introduction=? where account_pk=?", new Object[] { name, cellphone_num, form, introduction, account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateIdentity_authentication
	 * 2. 작성일 : 2015. 12. 11. 오후 3:41:56
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 신원 인증 여부 갱신
	 * </pre>
	 * @param account_pk account 고유값
	 * @param identity_authentication 신원 인증 상태
	 */
	public void updateIdentity_authentication(int account_pk, String identity_authentication)
	{
		jdbcTemplate.update("update account_information set identity_authentication=? where account_pk=?"
				, new Object[] { identity_authentication, account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selecIdentity_authenticationtLimit
	 * 2. 작성일 : 2015. 12. 11. 오후 3:43:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 인증 상태에 따른 신원 인증 리스트(limit)
	 * </pre>
	 * @param status 신원 인증 상태
	 * @param num 반환할 개수
	 * @return account 리스트
	 */
	public List<AccountInfo> selecIdentity_authenticationtLimit(String status, int num)
	{
		List<AccountInfo> list = jdbcTemplate.query("select account.* from account_information,account where identity_authentication = ? and account_information.account_pk = account.pk order by reg_date desc limit ?",
		    	new Object[] { status, num }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list != null && list.size() == 0)
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selecIdentity_authenticationt
	 * 2. 작성일 : 2015. 12. 11. 오후 3:45:03
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 인증 상태에 따른 신원 인증 리스트
	 * </pre>
	 * @param status 신원 인증 상태
	 * @return account 리스트
	 */
	public List<AccountInfo> selecIdentity_authenticationt(String status)
	{
		List<AccountInfo> list = jdbcTemplate.query("select account.* from account_information,account where identity_authentication = ? and account_information.account_pk = account.pk order by reg_date desc;",
		    	new Object[] { status }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(list != null && list.size() == 0)
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : selecIdentity_authenticationt
	 * 2. 작성일 : 2015. 12. 11. 오후 3:45:41
	 * 3. 작성자 : Hansol
	 * 4. 설명 : account 고유값과 상태에 따른 계정 반환
	 * </pre>
	 * @param account_pk account 고유값
	 * @param status 신원 인증 상태
	 * @return 1개의 계정
	 */
	public AccountInfo selecIdentity_authenticationt(int account_pk,String status)
	{
		List<AccountInfo> list = jdbcTemplate.query("select account.* from account_information,account where identity_authentication = ? and account_information.account_pk =? and account_information.account_pk = account.pk",
		    	new Object[] { status, account_pk }, new RowMapper<AccountInfo>() {
		    	public AccountInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AccountInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getString("email")
		    				, resultSet.getString("id")
		    				, resultSet.getString("password")
		    				, resultSet.getString("account_type")
		    				, resultSet.getInt("authorized")
		    				, resultSet.getString("authorization_key")
		    				, resultSet.getTimestamp("reg_date"));

		    	}
		    });
		
		if(list != null && list.size() == 0)
			return null;
		else
			return list.get(0);
	}	
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateBase
	 * 2. 작성일 : 2015. 12. 11. 오후 3:46:41
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기본 정보 갱신 함수
	 * </pre>
	 * @param image 이미지명
	 * @param pre_img_path 이전 이미지 경로
	 * @param form_of_business 사업자형태
	 * @param full_name 이름
	 * @param company_name 회사명
	 * @param representative 대표명
	 * @param gender 성별
	 * @param date_of_birth_year 생년
	 * @param date_of_birth_month 생월
	 * @param date_of_birth_day 생일
	 * @param address_sido 시,도
	 * @param sigungu 시,군,구
	 * @param address_detail 상세주소
	 * @param pk account_information 고유값
	 * @param real_path 실제 경로
	 * @param id id
	 * @return 결과값
	 * @throws IOException
	 * @throws FileUploadException
	 * @throws ParseException
	 */
	public String updateBase(MultipartFile image,String pre_img_path, String form_of_business,String full_name
			,String company_name,String representative, String gender,
			String date_of_birth_year,String date_of_birth_month,String date_of_birth_day,
			String address_sido,String sigungu,String address_detail, int pk,
			String real_path, String id)  throws IOException, FileUploadException, ParseException
	{
		
		//회사 형태
		if(form_of_business == null) 
		{
			logger.info("회사 형태 미입력");
			return "계정 형태를 정상적으로 입력해주세요.";
		}
		else if(!Validator.isCompanyForm(form_of_business))
		{
			logger.info("비정상적 회사 형태");
			return "계정 형태를 정상적으로 입력해주세요.";
		}
		else
			logger.info("form_of_business = "+form_of_business);
		
		//이름
		if(full_name == null) 
		{
			logger.info("비정상적 이름");
			return "이름의 길이는 최대 20자입니다";
		}
		else if(!Validator.isValidLength(full_name, 1, 20))
		{
			logger.info("비정상적 이름");
			return "이름의 길이는 최대 20자입니다";
		}
		else
			logger.info("full_name = "+full_name);
		
		String birth_date;
		if(date_of_birth_year == null ||date_of_birth_month == null ||date_of_birth_day == null) 
		{
			logger.info("비정상적 생년월일");
			return "생년월일을 정상적으로 입력해주세요.";
		}
		else if(Validator.isDigit(date_of_birth_year)&&Validator.isDigit(date_of_birth_month)&&Validator.isDigit(date_of_birth_day))
			birth_date = date_of_birth_year+"-"+date_of_birth_month+"-"+date_of_birth_day;
		else
		{
			logger.info("비정상적 생년월일");
			return "생년월일을 정상적으로 입력해주세요.";
		}
	

		logger.info("birth_date = "+birth_date);
		
		try{
			if(address_sido == null) 
			{
				logger.info("비정상적 시,도");
				return "지역을 정상적으로 선택해주세요.";
			}
			else if(!areaDao.isExist(address_sido))
			{
				logger.info("비정상적 시,도");
				return "지역을 정상적으로 선택해주세요.";
			}
		}
		catch(Exception e)
		{
			logger.info("비정상적 시,도 파싱");
			return "지역을 정상적으로 선택해주세요.";
		}


		try{
			if(sigungu == null) 
			{
				logger.info("비정상적 시, 군, 구");
				return "세부지역을 정상적으로 선택해주세요.";
			}
			else if(!areaDetailDao.isExist(address_sido, sigungu))
			{
				logger.info("비정상적 시, 군, 구");
				return "세부지역을 정상적으로 선택해주세요.";
			}
			else
			{
				logger.info("address_sido = "+address_sido);
			}
		}
		catch(Exception e)
		{
			logger.info("비정상적 시, 군, 구");
			return "세부지역을 정상적으로 선택해주세요.";
		}
		logger.info("sigungu = "+sigungu);
			
		//나머지 지역
		if(address_detail == null) 
		{
			logger.info("비정상적 나머지 주소");
			return "나머지 주소를 입력해주세요";
		}
		else if(!Validator.isValidLength(address_detail, 1, 50))
		{
			logger.info("비정상적 나머지 주소");
			return "나머지 주소는 최대 50 글자 입니다";
		}

		logger.info("address_detail = "+address_detail);
		logger.info("pk = "+pk);

		boolean imagecheck = false, imageEmpty = false;
		if(image.isEmpty())
			{
				if(!Validator.hasValue(pre_img_path))
					return "이미지를 등록해주세요.";
				else
					imageEmpty=true;
			}
		else
		{
			if(!Fileupload.isImage(image))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image, 5))
				return "이미지는 최대 5MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				imagecheck = true;
			}
		}
		
		if(form_of_business.equals("individual"))
		{
			//성별
			if(gender == null) 
			{
				logger.info("비정상적 성별");
				return "성별을 선택해주세요";
			}
			else if(gender.equals("m"))
				gender = "남성";
			else if(gender.equals("f"))
				gender = "여성";
			else
			{
				logger.info("비정상적 성별");
				return "성별을 선택해주세요";
			}
			
			logger.info("gender = "+gender);
			
			logger.info("birth_date : "+birth_date);
			
			String image_name;
			//프로필 이미 등록 했고, 다시 추가 안한경우
			if(imageEmpty == true)
			{
				logger.info("프로필이 이미 존재하는 경우");
				jdbcTemplate.update("update account_information set form=?,name=?,sex=?,birth_date=?,regionl=?,regionM=?,regionR=? where pk=?", 
						new Object[] { form_of_business, full_name,gender, birth_date,address_sido,sigungu,address_detail,pk  });			
				
			}
			else
			{
			
				//이미지가 변했고 이전 값이 존재하는 경우 > 수정
				if(!image.getOriginalFilename().equals(pre_img_path)&&Validator.hasValue(pre_img_path))
				{
					String result = Fileupload.delete_profile(real_path, pre_img_path);
					logger.info("이미지 삭제 : "+result);
				}
				image_name = Fileupload.upload_profile(real_path, image, id);
				
				jdbcTemplate.update("update account_information set profile_img=?,form=?,name=?,sex=?,birth_date=?,regionl=?,regionM=?,regionR=? where pk=?", 
						new Object[] { image_name, form_of_business, full_name,gender, birth_date,address_sido,sigungu,address_detail,pk  });			
				
			}
			
			return "성공";
		}
		else
		{
	
			//회사명
			if(company_name == null) 
			{
				logger.info("비정상적 회사명");
				return "팀 혹은 회사명을 입력해주세요";
			}
			else if(!Validator.isValidLength(company_name, 1, 20))
			{
				logger.info("비정상적 회사명");
				return "팀 혹은 회사명을은 최대 20 글자 입니다";
			}
			else
			{
				logger.info("회사명 : "+company_name);
			}
			
			//회사대표명
			if(representative == null) 
			{
				logger.info("비정상적 대표명");
				return "대표명을 입력해주세요";
			}
			else if(!Validator.isValidLength(address_detail, 1, 20))
			{
				logger.info("비정상적 대표명");
				return "대표명은 최대 20 글자 입니다";
			}
			else
			{
				logger.info("대표명 : "+representative);
			}

			String image_name;
			//프로필 이미 등록 했고, 다시 추가 안한경우
			if(imageEmpty == true)
			{
				logger.info("프로필이 이미 존재하는 경우");
				jdbcTemplate.update("update account_information set form=?,name=?,company_name=?,company_representative=?,birth_date=?,regionl=?,regionM=?,regionR=? where pk=?", 
						new Object[] { form_of_business, full_name, company_name, representative,
								birth_date,address_sido,sigungu,address_detail,pk  });

			}
			else
			{
			

				//이미지가 변했고 이전 값이 존재하는 경우 > 수정
				if(!image.getOriginalFilename().equals(pre_img_path)&&Validator.hasValue(pre_img_path))
				{
					String result = Fileupload.delete_profile(real_path, pre_img_path);
					logger.info("이미지 삭제 : "+result);
				}
				image_name = Fileupload.upload_profile(real_path, image, id);

			
			jdbcTemplate.update("update account_information set profile_img=?,form=?,name=?,company_name=?,company_representative=?,birth_date=?,regionl=?,regionM=?,regionR=? where pk=?", 
					new Object[] { image_name, form_of_business, full_name, company_name, representative,
							birth_date,address_sido,sigungu,address_detail,pk  });
			}
			return "성공";
		}
		


	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateBank
	 * 2. 작성일 : 2015. 12. 11. 오후 3:50:11
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 계좌정보 갱신
	 * </pre>
	 * @param bank_name 은행명
	 * @param account_holder 예금주
	 * @param account_number 계좌번호
	 * @param account_pk 계정 고유값
	 */
	public void updateBank(String bank_name, String account_holder, String account_number,int account_pk)
	{
		jdbcTemplate.update("update account_information set bank_name=?, account_holder=?, account_number=? where account_pk=?", 
				new Object[] { bank_name,account_holder,account_number,account_pk });
	}

	
	/**
	 * <pre>
	 * 1. 메소드명 : updateEmail
	 * 2. 작성일 : 2015. 12. 11. 오후 3:50:40
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 이메일 수신 여부 갱신
	 * </pre>
	 * @param email_subscription 이메일 수신 여부
	 * @param pk account_infromation 고유값
	 * @return 결과값
	 */
	public String updateEmail(String email_subscription, int pk)
	{
		int subscription = 1;
		
		if(email_subscription.equals("true"))
		{
			logger.info("구독");
			subscription = 1;
		}
		else
		{
			logger.info("미구독");
			subscription = 0;
		}
		
		jdbcTemplate.update("update account_information set subscription=? where pk=?", 
				new Object[] { subscription,pk });
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateConnect
	 * 2. 작성일 : 2015. 12. 11. 오후 3:52:29
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 연락처 정보 갱신 함수
	 * </pre>
	 * @param cell_phone_number_code 첫 휴대폰 번호
	 * @param cell_phone_number_middle 중간 휴대폰 번호
	 * @param cell_phone_number_end 마지막 휴대폰 번호
	 * @param phone_number_code 첫 연락처 번호
	 * @param phone_number_entered 나머지 연락처 번호
	 * @param fax_number 팩스번호
	 * @param pk account_information 고유값
	 * @param sms_subscription 문자 수신 여부
	 * @return 결과값
	 */
	public String updateConnect(String cell_phone_number_code, String cell_phone_number_middle, 
			String cell_phone_number_end,String phone_number_code, 
			String phone_number_entered, String fax_number, int pk, String sms_subscription)
	{
		if(cell_phone_number_code == null)
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if(cell_phone_number_code.isEmpty())
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if( !Validator.isPhoneCode(cell_phone_number_code))
		{
			logger.info("올바른 휴대폰 번호 앞자리가 아닙니다.");
			return "올바른 휴대폰 번호 앞자리가 아닙니다.";
		}
		
		if(cell_phone_number_middle == null)
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if(cell_phone_number_middle.isEmpty())
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if( !Validator.isDigit(cell_phone_number_middle))
		{
			logger.info("올바른 휴대폰 번호가 아닙니다.");
			return "올바른 휴대폰 번호가 아닙니다.";
		}
		
		if(cell_phone_number_end == null)
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if(cell_phone_number_end.isEmpty())
		{
			logger.info("휴대폰 번호는 필수입니다.");
			return "휴대폰 번호는 필수입니다.";
		}
		else if( !Validator.isDigit(cell_phone_number_end))
		{
			logger.info("올바른 휴대폰 번호가 아닙니다.");
			return "올바른 휴대폰 번호가 아닙니다.";
		}
		
		if(phone_number_code == null)
		{
			phone_number_code = "";
		}
		else if(phone_number_code.isEmpty())
		{
			phone_number_code = "";
		}
		else if( !Validator.isDigit(phone_number_code))
		{
			logger.info("올바른 전화 번호가 아닙니다.");
			return "올바른 전화 번호가 아닙니다.";
		}
		
		if(phone_number_entered == null)
		{
			phone_number_entered = "";
		}
		else if(phone_number_entered.isEmpty())
		{
			phone_number_entered = "";
		}
		else if( !Validator.isDigit(phone_number_entered))
		{
			logger.info("올바른 전화 번호가 아닙니다.");
			return "올바른 전화 번호가 아닙니다.";
		}
		
		String telephone_num = "";
		if(!phone_number_code.isEmpty() && phone_number_entered.isEmpty())
		{
			logger.info("올바른 전화 번호가 아닙니다.");
			return "올바른 전화 번호가 아닙니다.";
		}
		else if(phone_number_code.isEmpty() && !phone_number_entered.isEmpty())
		{
			logger.info("올바른 전화 번호가 아닙니다.");
			return "올바른 전화 번호가 아닙니다.";
		}
		else if(phone_number_code.isEmpty() && phone_number_entered.isEmpty())
		{
			telephone_num = "";
		}
		else
			telephone_num = phone_number_code+"-"+phone_number_entered;
		
		if(fax_number == null)
		{
			fax_number = "";
		}
		else if(fax_number.isEmpty())
		{
			fax_number = "";
		}
		else if( !Validator.isDigit(fax_number))
		{
			logger.info("올바른 팩스 번호가 아닙니다.");
			return "올바른 팩스 번호가 아닙니다.";
		}
		
		int subscription = 1;
		
		if(sms_subscription.equals("true"))
		{
			logger.info("구독");
			subscription = 1;
		}
		else
		{
			logger.info("미구독");
			subscription = 0;
		}
		
		
		jdbcTemplate.update("update account_information set cellphone_num=?, "
				+"telephone_num=?, fax_num=?, sms_subscription=? where pk=?", 
				new Object[] { cell_phone_number_code+"-"+cell_phone_number_middle+"-"+cell_phone_number_end
						, telephone_num, fax_number, subscription, pk });
		
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateIntroduction
	 * 2. 작성일 : 2015. 12. 11. 오후 3:53:53
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 자기소개 업데이트
	 * </pre>
	 * @param account_pk 해당 계정 고유값
	 * @param introduction 자기소개
	 */
	public void updateIntroduction(int account_pk, String introduction)
	{
		jdbcTemplate.update("update account_information set introduction=? where account_pk=?", new Object[] { introduction, account_pk });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasIntroduction
	 * 2. 작성일 : 2015. 12. 11. 오후 3:54:11
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 자기소개 소유 여부
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return true, false
	 */
	public boolean hasIntroduction(int account_pk)
	{
		AccountInformationInfo accountinfo = select(account_pk);
		if(accountinfo == null)
			return false;
		else
		{
			if(!Validator.hasValue(accountinfo.getIntroduction()))
			{
				return false;
			}
			else
				return true;
		}
	}
}
