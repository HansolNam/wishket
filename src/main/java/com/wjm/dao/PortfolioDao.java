package com.wjm.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.wjm.idao.PortfolioIDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.PortfolioInfo;
import com.wjm.models.TechniqueInfo;

@Repository
public class PortfolioDao implements PortfolioIDao {

	private static final Logger logger = LoggerFactory.getLogger(PortfolioDao.class);
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk,int representative,String name,String categoryL,String categoryM,String description,String start_date, String end_date, int participation_rate,String img0,String explanation0,String img1,String explanation1,String img2,String explanation2,String tag)
	{
		jdbcTemplate.update("insert into portfolio (account_pk,representative,name,categoryL,categoryM,description,start_date,end_date,participation_rate, img0,explanation0,img1,explanation1,img2,explanation2,tag) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)"
				, new Object[] { account_pk,representative,name,categoryL,categoryM,description,start_date,end_date,participation_rate, img0,explanation0,img1,explanation1,img2,explanation2,tag});
	}
	public List<PortfolioInfo> selectAll()
	{
		return jdbcTemplate.query("select * from portfolio",new RowMapper<PortfolioInfo>() {
		    	public PortfolioInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new PortfolioInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getInt("representative")
		    				, resultSet.getString("name")
		    				, resultSet.getString("categoryL")
		    				, resultSet.getString("categoryM")
		    				, resultSet.getString("description")
		    				, resultSet.getString("start_date")
		    				, resultSet.getString("end_date")
		    				, resultSet.getInt("participation_rate")
		    				, resultSet.getString("img0")
		    				, resultSet.getString("explanation0")
		    				, resultSet.getString("img1")
		    				, resultSet.getString("explanation1")
		    				, resultSet.getString("img2")
		    				, resultSet.getString("explanation2")
		    				, resultSet.getString("tag")
		    				, resultSet.getTimestamp("reg_date"));
		    	}
		    });
	}
	public List<PortfolioInfo> select(int account_pk)
	{
		List<PortfolioInfo> list = jdbcTemplate.query("select * from portfolio where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<PortfolioInfo>() {
	    	public PortfolioInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new PortfolioInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("representative")
	    				, resultSet.getString("name")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getString("description")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date")
	    				, resultSet.getInt("participation_rate")
	    				, resultSet.getString("img0")
	    				, resultSet.getString("explanation0")
	    				, resultSet.getString("img1")
	    				, resultSet.getString("explanation1")
	    				, resultSet.getString("img2")
	    				, resultSet.getString("explanation2")
	    				, resultSet.getString("tag")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		if(list!=null)
		{
			if(list.size() == 0)
				return null;
			else
				return list;
		}
		else
			return list;
	}

	public PortfolioInfo select_portfolio(int pk)
	{
		List<PortfolioInfo> list = jdbcTemplate.query("select * from portfolio where pk = ?",
		    	new Object[] { pk }, new RowMapper<PortfolioInfo>() {
	    	public PortfolioInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new PortfolioInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getInt("representative")
	    				, resultSet.getString("name")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getString("description")
	    				, resultSet.getString("start_date")
	    				, resultSet.getString("end_date")
	    				, resultSet.getInt("participation_rate")
	    				, resultSet.getString("img0")
	    				, resultSet.getString("explanation0")
	    				, resultSet.getString("img1")
	    				, resultSet.getString("explanation1")
	    				, resultSet.getString("img2")
	    				, resultSet.getString("explanation2")
	    				, resultSet.getString("tag")
	    				, resultSet.getTimestamp("reg_date"));
	    	}
	    });
		
		if(list.size() >2 || list.size() ==0)
		{
			return null;
		}
		else
		{
			return list.get(0);
		}
	}
	
	public String createPortfolio(int account_pk, String id, String title, String categoryId, String subcategoryId,
			String description, String participationBeginYear, String participationBeginMonth, String participationEndYear,
			String participationEndMonth, String participationRate, MultipartFile image1, String caption1,
			MultipartFile image2, String caption2, MultipartFile image3, String caption3, String tagList, String real_path) throws IOException, FileUploadException, ParseException
	{

		if(!Validator.hasValue(title))
		{
			return "제목을 입력해주세요.";
		}
		else if(!Validator.isValidLength(title, 1, 20))
		{
			return "제목을 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("제목 : "+title);
		}
		
		if(!Validator.hasValue(categoryId)||!Validator.hasValue(subcategoryId))
		{
			return "카테고리를 선택해주세요.";
		}
		else if(!Validator.isProjectCategory(categoryId, subcategoryId))
		{
			return "카테고리를 올바르게 선택해주세요.";
		}
		else
		{
			logger.info("카테고리명 : "+categoryId);
			logger.info("세부카테고리명 : "+subcategoryId);
		}
		
		if(!Validator.hasValue(description))
		{
			return "설명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(description, 1, 5000))
		{
			return "설명은 최대 5000자까지 가능합니다.";
		}
		else
		{
			logger.info("설명 : "+description);
		}
		

		if(!Validator.isDigit(participationBeginYear)||!Validator.isDigit(participationBeginMonth))
		{
			return "참여시작일을 정상적으로 선택해주세요.";
		}
		else if(participationBeginYear.length() != 4 ||!Validator.isValidLength(participationBeginMonth, 1, 2))
		{
			return "참여시작일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(participationBeginYear+"년 "+participationBeginMonth+"월");
		}
		

		if(!Validator.isDigit(participationEndYear)||!Validator.isDigit(participationEndMonth))
		{
			return "참여종료일을 정상적으로 선택해주세요.";
		}
		else if(participationEndYear.length() != 4 ||!Validator.isValidLength(participationEndMonth, 1, 2) )
		{
			return "참여종료일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(participationEndYear+"년 "+participationEndMonth+"월");
		}
		

		Timestamp start, end;
		start = Time.dateToTimestamp5(participationBeginYear+"년 "+participationBeginMonth+"월");
		end = Time.dateToTimestamp5(participationEndYear+"년 "+participationEndMonth+"월");
		if(Time.isCompare(start,end) == false)
		{			
			return "참여시작일과 참여종료일을 정상적으로 입력해주세요.";
		}
		
		if(!Validator.hasValue(participationRate))
		{
			return "참여율을 입력해주세요.";
		}
		else if(!Validator.isDigit(participationRate))
		{
			return "참여율은 숫자만 가능합니다.";
		}
		else if(Integer.parseInt(participationRate)<1 || Integer.parseInt(participationRate)>100)
		{
			return "참여율은 1에서 100까지 가능합니다.";
		}
		else
		{
			logger.info("참여율 : "+participationRate);
		}
		
		boolean check1 = false,check2=false,check3=false;
		
		if(!image1.isEmpty())
		{
			if(!Fileupload.isImage(image1))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image1, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image1.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check1 = true;
				if(!Validator.isValidLength(caption1, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(!image2.isEmpty())
		{
			if(!Fileupload.isImage(image2))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image2, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image2.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check2 = true;
				if(!Validator.isValidLength(caption2, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(!image3.isEmpty())
		{
			if(!Fileupload.isImage(image3))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image3, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image3.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check3 = true;
				if(!Validator.isValidLength(caption3, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(Validator.hasValue(tagList))
		{
			if(!Validator.isValidLength(tagList, 1, 100))
				return "태그는 최대 100자까지 가능합니다.";
			
			String list[] = tagList.split(",");
			
			if(list.length > 5)
				return "기술은 최대 5개입니다.";
		}
		
		String img0="",img1="",img2="";
		if(check1)
		{
			img0 = Fileupload.upload_portfolio(real_path, image1, id);
			if(img0.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		if(check2)
		{
			img1 = Fileupload.upload_portfolio(real_path, image2, id);
			if(img1.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		if(check3)
		{
			img2 = Fileupload.upload_portfolio(real_path, image3, id);
			if(img1.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		
		create(account_pk,0,title,categoryId,subcategoryId,
				description,Time.toString5(start),Time.toString5(end), Integer.parseInt(participationRate),
				img0,caption1,img1,
				caption2,img2,caption3,tagList);
		
		return "성공";
	}

	public String updatePortfolio(int pk, String id, String title, String categoryId, String subcategoryId,
			String description, String participationBeginYear, String participationBeginMonth, String participationEndYear,
			String participationEndMonth, String participationRate, MultipartFile image1, String caption1,
			MultipartFile image2, String caption2, MultipartFile image3, String caption3, String tagList, String real_path
			,String isImage1Changed,String isImage2Changed,String isImage3Changed) throws IOException, FileUploadException, ParseException
	{

		if(!Validator.hasValue(title))
		{
			return "제목을 입력해주세요.";
		}
		else if(!Validator.isValidLength(title, 1, 20))
		{
			return "제목을 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("제목 : "+title);
		}
		
		if(!Validator.hasValue(categoryId)||!Validator.hasValue(subcategoryId))
		{
			return "카테고리를 선택해주세요.";
		}
		else if(!Validator.isProjectCategory(categoryId, subcategoryId))
		{
			return "카테고리를 올바르게 선택해주세요.";
		}
		else
		{
			logger.info("카테고리명 : "+categoryId);
			logger.info("세부카테고리명 : "+subcategoryId);
		}
		
		if(!Validator.hasValue(description))
		{
			return "설명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(description, 1, 5000))
		{
			return "설명은 최대 5000자까지 가능합니다.";
		}
		else
		{
			logger.info("설명 : "+description);
		}
		

		if(!Validator.isDigit(participationBeginYear)||!Validator.isDigit(participationBeginMonth))
		{
			return "참여시작일을 정상적으로 선택해주세요.";
		}
		else if(participationBeginYear.length() != 4 ||!Validator.isValidLength(participationBeginMonth, 1, 2))
		{
			return "참여시작일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(participationBeginYear+"년 "+participationBeginMonth+"월");
		}
		

		if(!Validator.isDigit(participationEndYear)||!Validator.isDigit(participationEndMonth))
		{
			return "참여종료일을 정상적으로 선택해주세요.";
		}
		else if(participationEndYear.length() != 4 ||!Validator.isValidLength(participationEndMonth, 1, 2) )
		{
			return "참여종료일을 정상적으로 선택해주세요.";
		}
		else
		{
			logger.info(participationEndYear+"년 "+participationEndMonth+"월");
		}
		

		Timestamp start, end;
		start = Time.dateToTimestamp5(participationBeginYear+"년 "+participationBeginMonth+"월");
		end = Time.dateToTimestamp5(participationEndYear+"년 "+participationEndMonth+"월");
		if(Time.isCompare(start,end) == false)
		{			
			return "참여시작일과 참여종료일을 정상적으로 입력해주세요.";
		}
		
		if(!Validator.hasValue(participationRate))
		{
			return "참여율을 입력해주세요.";
		}
		else if(!Validator.isDigit(participationRate))
		{
			return "참여율은 숫자만 가능합니다.";
		}
		else if(Integer.parseInt(participationRate)<1 || Integer.parseInt(participationRate)>100)
		{
			return "참여율은 1에서 100까지 가능합니다.";
		}
		else
		{
			logger.info("참여율 : "+participationRate);
		}
		
		boolean check1 = false,check2=false,check3=false;
		
		if(!image1.isEmpty())
		{
			if(!Fileupload.isImage(image1))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image1, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image1.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check1 = true;
				if(!Validator.isValidLength(caption1, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(!image2.isEmpty())
		{
			if(!Fileupload.isImage(image2))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image2, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image2.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check2 = true;
				if(!Validator.isValidLength(caption2, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(!image3.isEmpty())
		{
			if(!Fileupload.isImage(image3))
				return "이미지는 jpg, jpeg, png, gif 등 이미지 파일만 업로드 가능합니다.";
			else if(!Fileupload.isValidFileSize(image3, 8))
				return "이미지는 최대 8MB까지 업로드 가능합니다.";
			else if(!Validator.isValidLength(image3.getOriginalFilename(), 1, 30) )
				return "이미지명은 최대 30자까지 가능합니다. ";
			else
			{
				check3 = true;
				if(!Validator.isValidLength(caption3, 0, 120))
					return "해당 이미지의 캡션명은 최대 120자입니다.";
			}
		}
		
		if(Validator.hasValue(tagList))
		{
			if(!Validator.isValidLength(tagList, 1, 100))
				return "태그는 최대 100자까지 가능합니다.";
			
			String list[] = tagList.split(",");
			
			if(list.length > 5)
				return "기술은 최대 5개입니다.";
		}
		
		String img0="",img1="",img2="";
		PortfolioInfo pre_portfolio = select_portfolio(pk);
		
		//이미지가 변했고, 이전 값이 존재하는 경우 > 수정 및 삭제
		if(isImage1Changed.equals("1") && Validator.hasValue(pre_portfolio.getImg0()))
		{
			logger.info("이전 이미지1 삭제");
			Fileupload.delete_portfolio(real_path, pre_portfolio.getImg0());
			//현재 값 존재(수정)
			if(check1)
			{
				logger.info("이미지1 수정");
				img0 = Fileupload.upload_portfolio(real_path, image1, id);
				if(img0.equals("error"))
					return "이미지 업로드중 에러가 발생했습니다.";
			}
			//현재 값 존재 X(삭제)
			else
			{
				img0 = "";
				caption1 = "";
			}
		}
		//이미지가 변했고, 이전 값이 존재하지 않는 경우 > 추가
		else if(isImage1Changed.equals("1") && !Validator.hasValue(pre_portfolio.getImg0()))
		{
			logger.info("이미지1 추가");
			img0 = Fileupload.upload_portfolio(real_path, image1, id);
			if(img0.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		//이미지가 변하지 않은 경우
		else
		{
			img0 = pre_portfolio.getImg0();
		}

		//이미지가 변했고, 이전 값이 존재하는 경우 > 수정 및 삭제
		if(isImage2Changed.equals("1") && Validator.hasValue(pre_portfolio.getImg1()))
		{
			logger.info("이전 이미지2 삭제");
			Fileupload.delete_portfolio(real_path, pre_portfolio.getImg1());
			//현재 값 존재(수정)
			if(check2)
			{
				logger.info("이미지2 수정");
				img1 = Fileupload.upload_portfolio(real_path, image2, id);
				if(img1.equals("error"))
					return "이미지 업로드중 에러가 발생했습니다.";
			}
			//현재 값 존재 X(삭제)
			else
			{
				img1 = "";
				caption2 = "";
			}
		}
		//이미지가 변했고, 이전 값이 존재하지 않는 경우 > 추가
		else if(isImage2Changed.equals("1") && !Validator.hasValue(pre_portfolio.getImg1()))
		{
			logger.info("이미지2 추가");
			img1 = Fileupload.upload_portfolio(real_path, image2, id);
			if(img1.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		//이미지가 변하지 않은 경우
		else
		{
			img1 = pre_portfolio.getImg1();
		}

		//이미지가 변했고, 이전 값이 존재하는 경우 > 수정 및 삭제
		if(isImage3Changed.equals("1") && Validator.hasValue(pre_portfolio.getImg2()))
		{
			logger.info("이전 이미지3 삭제");
			Fileupload.delete_portfolio(real_path, pre_portfolio.getImg2());
			//현재 값 존재(수정)
			if(check3)
			{
				logger.info("이미지3 수정");
				img2 = Fileupload.upload_portfolio(real_path, image3, id);
				if(img2.equals("error"))
					return "이미지 업로드중 에러가 발생했습니다.";
			}
			//현재 값 존재 X(삭제)
			else
			{
				img2 = "";
				caption3 = "";
			}
		}
		//이미지가 변했고, 이전 값이 존재하지 않는 경우 > 추가
		else if(isImage3Changed.equals("1") && !Validator.hasValue(pre_portfolio.getImg2()))
		{
			logger.info("이미지3 추가");
			img2 = Fileupload.upload_portfolio(real_path, image3, id);
			if(img2.equals("error"))
				return "이미지 업로드중 에러가 발생했습니다.";
		}
		//이미지가 변하지 않은 경우
		else
		{
			img2 = pre_portfolio.getImg2();
		}
		
		jdbcTemplate.update("update portfolio set name=?, categoryL=?, categoryM=?, "
				+ "description=?, start_date=?, end_date=? , participation_rate=? "
				+ ", img0=?, explanation0=?, img1=?, explanation1=?, img2=?, explanation2=?"
				+ ", tag=? where pk=?"
				, new Object[] {title,categoryId,subcategoryId,description,Time.toString5(start)
						,Time.toString5(end),Integer.parseInt(participationRate),img0,
						caption1,img1,caption2,img2,caption3,tagList,pk});
		return "성공";
	}
	public String updateRepresentative(int account_pk, String[] pk_list)
	{
		//해당 계정의 보유기술 리스트
		List<PortfolioInfo> portfolio = select(account_pk);
		
		if(portfolio == null)
			return "포트폴리오가 존재하지 않으면 대표 포트폴리오를 선택할 수 없습니다.";
		else
		{
			//대표 기술은 5개
			if(pk_list.length >3)
				return "대표 포트폴리오는 최대 3개까지 등록 가능합니다.";
			
			//pk가 숫자가 아닌 경우
			for(int i=0;i<pk_list.length;i++)
			{
				if(!Validator.isDigit(pk_list[i]))
				{
					return "잘못된 접근입니다.";
				}
			}
			
			//대표값인지
			boolean isRepresentative;
			for(int i=0;i<portfolio.size();i++)
			{
				isRepresentative = false;
				for(int j=0;j<pk_list.length;j++)
				{
					if(Integer.parseInt(pk_list[j]) == portfolio.get(i).getPk())
					{
						isRepresentative = true;
					}
				}
				
				if(isRepresentative)
					jdbcTemplate.update("update portfolio set representative=1 where account_pk=? and pk=?", new Object[] {account_pk,portfolio.get(i).getPk() });
				else
					jdbcTemplate.update("update portfolio set representative=0 where account_pk=? and pk=?", new Object[] {account_pk,portfolio.get(i).getPk() });

			}
			
			return "성공";
			
		}
		
	}
	public void deleteAll()
	{
		jdbcTemplate.update("delete from portfolio");
	}
	public String delete(int pk)
	{
		jdbcTemplate.update("delete from portfolio where pk = ?", new Object[] { pk });
		return "성공";

	}
	
	public boolean hasPortfolio(int account_pk)
	{
		List<PortfolioInfo> portfoliolist =  select(account_pk);
		if(portfoliolist == null)
			return false;
		else 
			return true;
	}
}
