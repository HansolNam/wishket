package com.wjm.dao;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.wjm.idao.AuthenticationIDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.Validator;
import com.wjm.models.AuthenticationInfo;

@Repository
public class AuthenticationDao implements AuthenticationIDao {

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
		jdbcTemplate.update("insert into authentication (account_pk) values (?)", new Object[] { account_pk });
	}
	public List<AuthenticationInfo> selectAll()
	{
		return jdbcTemplate.query("select * from authentication",new RowMapper<AuthenticationInfo>() {
		    	public AuthenticationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AuthenticationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("user_type")
		    				, resultSet.getString("identity_doc")
		    				, resultSet.getString("representer_name")
		    				, resultSet.getString("address_detail")
		    				, resultSet.getString("email_for_tax")
		    				, resultSet.getString("identify_number")
		    				, resultSet.getString("company_name")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}
	
	public AuthenticationInfo select(int account_pk)
	{
		List<AuthenticationInfo> authenticationlist = jdbcTemplate.query("select * from authentication where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<AuthenticationInfo>() {
		    	public AuthenticationInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new AuthenticationInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("user_type")
		    				, resultSet.getString("identity_doc")
		    				, resultSet.getString("representer_name")
		    				, resultSet.getString("address_detail")
		    				, resultSet.getString("email_for_tax")
		    				, resultSet.getString("identify_number")
		    				, resultSet.getString("company_name")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
		
		if(authenticationlist == null)
		{ 
			create(account_pk);
			logger.info("authenticationlsit = null");
			
			return select(account_pk);
		}
		else if(authenticationlist.size() == 0)
		{ 
			create(account_pk);
			logger.info("authenticationlsit가 0이거나 1초과");
			return select(account_pk);
		}
		else
		{
			logger.info("authenticationlsit가 1개");
			return authenticationlist.get(0);
		}
	}	

	public void deleteAll()
	{
		jdbcTemplate.update("delete from authentication");
	}
	public void delete(int account_pk)
	{
		jdbcTemplate.update("delete from authentication where account_pk = ?", new Object[] { account_pk });
	}

	public String updateIdentity_authentication(String form,String user_type,MultipartFile image,String real_path,
			String id,String representer_name,String address_detail,String email_for_tax,String identify_number,String company_name,int account_pk) throws IOException, FileUploadException
	{		
		//email_for_tax
		if(email_for_tax == null) 
		{
			logger.info("이메일 미입력");
			return "이메일을 정상적으로 입력해주세요.";
		}
		else if(email_for_tax.isEmpty())
		{
			logger.info("이름 미입력");
			return "이메일을 정상적으로 입력해주세요.";
		}
		else if(!Validator.isValidLength(email_for_tax, 1, 50))
		{
			logger.info("이메일 길이");
			return "이메일의 길이는 최대 50자 입니다.";
		}
		else if(!Validator.isEmail(email_for_tax))
		{
			logger.info("올바르지 않은 이메일 형태");
			return "올바르지 않은 이메일 형식 입니다.";
		}
		else
			logger.info("email_for_tax = "+email_for_tax);
		
		
		if(form.equals("individual")||form.equals("team"))
		{
			//이름
			if(representer_name == null) 
			{
				logger.info("이름 미입력");
				return "팀명 혹은 성명을 정상적으로 입력해주세요.";
			}
			else if(representer_name.isEmpty())
			{
				logger.info("이름 미입력");
				return "팀명 혹은 성명을 정상적으로 입력해주세요.";
			}
			else if(!Validator.isValidLength(address_detail, 1, 20))
			{
				logger.info("팀명 혹은 성명 길이");
				return "팀명 혹은 성명의 길이는 최대 20자 입니다.";
			}
			else
				logger.info("representer_name = "+representer_name);
			
			//address_detail
			if(address_detail == null) 
			{
				logger.info("주소 미입력");
				return "주소를 정상적으로 입력해주세요.";
			}
			else if(address_detail.isEmpty())
			{
				logger.info("주소 미입력");
				return "주소를 정상적으로 입력해주세요.";
			}
			else if(!Validator.isValidLength(address_detail, 1, 100))
			{
				logger.info("주소 길이");
				return "주소의 길이는 최대 100자 입니다.";
			}
			else
				logger.info("address_detail = "+address_detail);
			
			boolean imagecheck = false;
			String image_path = "";
			//image
			if(image == null) 
			{
				logger.info("이미지 미입력");
				return "이미지를 선택해주세요.";
			}
			else if(image.isEmpty())
			{
				logger.info("이미지 미입력");
				return "이미지를 선택해주세요.";
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
					
			logger.info("representer_name = "+representer_name);
			logger.info("address_detail = "+address_detail);
			logger.info("email_for_tax = "+email_for_tax);
			logger.info("account_pk = "+account_pk);
			
			image_path = Fileupload.upload_doc(real_path, image,id);
			
			logger.info("img_path = "+image_path);
			jdbcTemplate.update("update authentication set identity_doc=?, representer_name=?, address_detail=?, email_for_tax=? where account_pk=?"
					, new Object[] { image_path, representer_name, address_detail,email_for_tax, account_pk });

			return "성공";
					
		}
		else if(form.equals("individual_business")||form.equals("corporate_business"))
		{
			//개인 사업자 형태
			if(user_type == null) 
			{
				logger.info("사업자 형태 미입력");
				return "사업자 형태를 선택해주세요.";
			}
			else if(user_type.isEmpty())
			{
				logger.info("사업자 형태 미입력");
				return "사업자 형태를 선택해주세요.";
			}
			else if(!Validator.isDigit(user_type))
			{
				if(user_type.equals("1"))
					user_type = "일반 과세자";
				else if(user_type.equals("3"))
					user_type = "간이 과세자";
				else if(user_type.equals("4"))
					user_type = "부가가치세 면세 과세자";
				else
				{
				logger.info("사업자 형태 올바르게 선택X");
				return "사업자 형태를 올바르게 선택해주세요.";
				}
			}
			else
				logger.info("user_type = "+user_type);
			
			//사업자 등록 번호
			if(identify_number == null) 
			{
				logger.info("사업자 등록번호 미입력");
				return "사업자 등록번호를 선택해주세요.";
			}
			else if(identify_number.isEmpty())
			{
				logger.info("사업자 등록번호 미입력");
				return "사업자 등록번호를 선택해주세요.";
			}
			else if(!Validator.isDigit(identify_number))
			{
				if(identify_number.length() == 10)
				{
					logger.info("identify_number = "+identify_number);
				}
				else
				{
					logger.info("사업자 등록번호는 10자리입니다.");
					return "사업자 등록번호는 10자리입니다.";
				}
			}
			else
			{
				logger.info("사업자 등록번호는 '-'를 제외한 10자리입니다.");
				return "사업자 등록번호는 '-'를 제외한 10자리입니다.";
			}
			//company_name
			if(company_name == null) 
			{
				logger.info("회사명 및 단체명 미입력");
				return "회사명 및 단체명을 정상적으로 입력해주세요.";
			}
			else if(company_name.isEmpty())
			{
				logger.info("회사명 및 단체명 미입력");
				return "회사명 및 단체명을 정상적으로 입력해주세요.";
			}
			else if(!Validator.isValidLength(company_name, 1, 20))
			{
				logger.info("회사명 및 단체명 길이");
				return "회사명 및 단체명의 길이는 최대 20자 입니다.";
			}
			else
				logger.info("company_name = "+company_name);
			
			//대표자명
			if(representer_name == null) 
			{
				logger.info("대표자명 미입력");
				return "대표자명을 정상적으로 입력해주세요.";
			}
			else if(representer_name.isEmpty())
			{
				logger.info("대표자명 미입력");
				return "대표자명을 정상적으로 입력해주세요.";
			}
			else if(!Validator.isValidLength(address_detail, 1, 20))
			{
				logger.info("대표자명 길이");
				return "대표자명는 최대 20자 입니다.";
			}
			else
				logger.info("representer_name = "+representer_name);
			
			//address_detail
			if(address_detail == null) 
			{
				logger.info("사업장 소재지 미입력");
				return "사업장 소재지를 정상적으로 입력해주세요.";
			}
			else if(address_detail.isEmpty())
			{
				logger.info("사업장 소재지 미입력");
				return "사업장 소재지를 정상적으로 입력해주세요.";
			}
			else if(!Validator.isValidLength(address_detail, 1, 100))
			{
				logger.info("사업장 소재지 길이");
				return "사업장 소재지의 길이는 최대 100자 입니다.";
			}
			else
				logger.info("address_detail = "+address_detail);
			
			boolean imagecheck = false;
			String image_path = "";
			//image
			if(image == null) 
			{
				logger.info("이미지 미입력");
				return "이미지를 선택해주세요.";
			}
			else if(image.isEmpty())
			{
				logger.info("이미지 미입력");
				return "이미지를 선택해주세요.";
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

			image_path = Fileupload.upload_doc(real_path, image,id);
			
			logger.info("img_path = "+image_path);
			
			jdbcTemplate.update("update authentication set user_type=?, identity_doc=?, identify_number=?,company_name=?,representer_name=?, address_detail=?, email_for_tax=? where account_pk=?"
					, new Object[] { user_type, image_path, identify_number, company_name, representer_name, address_detail,email_for_tax, account_pk });

			return "성공";
		}
		else
		{
			return "에러가 발생했습니다.";
		}
	}
}
