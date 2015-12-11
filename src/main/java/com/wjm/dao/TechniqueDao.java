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

import com.wjm.idao.TechniqueIDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.TechniqueInfo;

/**
 * <pre>
 * 1. 패키지명 : com.wjm.dao
 * 2. 타입명 : TechniqueDao.java
 * 3. 작성일 : 2015. 12. 11. 오후 7:02:56
 * 4. 작성자 : Hansol
 * 5. 설명 : 기술 technique 테이블 dao
 * </pre>
 */
@Repository
public class TechniqueDao implements TechniqueIDao {

	private static final Logger logger = LoggerFactory.getLogger(TechniqueDao.class);
	
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
	 * 2. 작성일 : 2015. 12. 11. 오후 7:03:14
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기술 생성
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @param name 기술이름
	 * @param experience 경험
	 * @param skill 숙련도
	 */
	public void create(int account_pk, String name, String experience, String skill)
	{
		jdbcTemplate.update("insert into technique (account_pk, name, experience, skill) values (?, ?, ?,?)", new Object[] { account_pk, name, experience, skill });
	}
	/**
	 * <pre>
	 * 1. 메소드명 : selectAll
	 * 2. 작성일 : 2015. 12. 11. 오후 7:04:12
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 기술 리스트
	 * </pre>
	 * @return 기술 리스트
	 */
	public List<TechniqueInfo> selectAll()
	{
		return jdbcTemplate.query("select * from technique",new RowMapper<TechniqueInfo>() {
		    	public TechniqueInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new TechniqueInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("experience")
		    				, resultSet.getString("skill")
		    				, resultSet.getInt("representative"));
		    	}
		    });
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select
	 * 2. 작성일 : 2015. 12. 11. 오후 7:04:32
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 기술 리스트
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @return 기술 리스트
	 */
	public List<TechniqueInfo> select(int account_pk)
	{
		List<TechniqueInfo> list = jdbcTemplate.query("select * from technique where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<TechniqueInfo>() {
		    	public TechniqueInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new TechniqueInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("experience")
		    				, resultSet.getString("skill")
		    				, resultSet.getInt("representative"));
		    	}
		    });
		if(list.size() == 0)
			return null;
		else
			return list;
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : select_skill
	 * 2. 작성일 : 2015. 12. 11. 오후 7:05:08
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 기술 반환
	 * </pre>
	 * @param pk 기술 고유값
	 * @return 특정 기술 반환
	 */
	public TechniqueInfo select_skill(int pk)
	{
		List<TechniqueInfo> list = jdbcTemplate.query("select * from technique where pk = ?",
		    	new Object[] { pk }, new RowMapper<TechniqueInfo>() {
		    	public TechniqueInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
		    	{
		    		return new TechniqueInfo(
		    				resultSet.getInt("pk")
		    				, resultSet.getInt("account_pk")
		    				, resultSet.getString("name")
		    				, resultSet.getString("experience")
		    				, resultSet.getString("skill")
		    				, resultSet.getInt("representative"));
		    	}
		    });
		if(list.size() == 0)
			return null;
		else if(list.size() >1)
		{
			logger.info("해당 pk가 2개이상 존재, 에러!");
			return null;
		}
		else
			return list.get(0);
	}
	
	
	/**
	 * <pre>
	 * 1. 메소드명 : createSkill
	 * 2. 작성일 : 2015. 12. 11. 오후 7:06:00
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기술 생성
	 * </pre>
	 * @param account_pk 특정 계정 고유값
	 * @param name 기술 이름
	 * @param experience 경험
	 * @param skill 숙련도
	 * @return 결과값
	 */
	public String createSkill(int account_pk, String name, String experience, String skill)
	{
		if(!Validator.hasValue(name))
		{
			return "기술명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(name, 1, 20))
		{
			return "기술명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("기술명 : "+name);
		}
		
		if(!Validator.hasValue(experience))
		{
			return "경험을 선택해주세요.";
		}
		else if(!experience.equals("1년미만")&&!experience.equals("1년이상 3년미만")&&!experience.equals("3년이상 5년미만")&&!experience.equals("5년이상 10년미만")&&!experience.equals("10년이상"))
		{
			return "경험을 올바르게 선택해주세요.";
		}
		
		if(!Validator.hasValue(skill))
		{
			return "숙련도를 선택해주세요.";
		}
		else if(!skill.equals("관심있음")&&!skill.equals("초급")&&!skill.equals("중급")&&!skill.equals("고급")&&!skill.equals("특급"))
		{
			return "숙련도를 올바르게 선택해주세요.";
		}
			
		create(account_pk, name, experience, skill);
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : updateSkill
	 * 2. 작성일 : 2015. 12. 11. 오후 7:06:36
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 기술 갱신
	 * </pre>
	 * @param pk 기술 고유값
	 * @param name 기술 이름
	 * @param experience 경험
	 * @param skill 숙련도
	 * @return 결과값
	 */
	public String updateSkill(int pk, String name, String experience, String skill)
	{
		if(!Validator.hasValue(name))
		{
			return "기술명을 입력해주세요.";
		}
		else if(!Validator.isValidLength(name, 1, 20))
		{
			return "기술명은 최대 20자까지 가능합니다.";
		}
		else
		{
			logger.info("기술명 : "+name);
		}
		
		if(!Validator.hasValue(experience))
		{
			return "경험을 선택해주세요.";
		}
		else if(!experience.equals("1년미만")&&!experience.equals("1년이상 3년미만")&&!experience.equals("3년이상 5년미만")&&!experience.equals("5년이상 10년미만")&&!experience.equals("10년이상"))
		{
			return "경험을 올바르게 선택해주세요.";
		}
		
		if(!Validator.hasValue(skill))
		{
			return "숙련도를 선택해주세요.";
		}
		else if(!skill.equals("관심있음")&&!skill.equals("초급")&&!skill.equals("중급")&&!skill.equals("고급")&&!skill.equals("특급"))
		{
			return "숙련도를 올바르게 선택해주세요.";
		}
			
		jdbcTemplate.update("update technique set name=?, experience=?, skill=? where pk=?"
				, new Object[] {name,experience,skill,pk });
		return "성공";
	}
	/**
	 * <pre>
	 * 1. 메소드명 : updateRepresentative
	 * 2. 작성일 : 2015. 12. 11. 오후 7:07:15
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 대표 기술 갱신
	 * </pre>
	 * @param account_pk 계정 계정 고유값
	 * @param pk_list 기술 고유값 리스트
	 * @return 결과값
	 */
	public String updateRepresentative(int account_pk, String[] pk_list)
	{
		//해당 계정의 보유기술 리스트
		List<TechniqueInfo> skill = select(account_pk);
		
		if(skill == null)
			return "보유기술이 존재하지 않으면 대표기술을 선택할 수 없습니다.";
		else
		{
			//대표 기술은 5개
			if(pk_list.length >5)
				return "대표 기술은 최대 5개까지 등록 가능합니다.";
			
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
			for(int i=0;i<skill.size();i++)
			{
				isRepresentative = false;
				for(int j=0;j<pk_list.length;j++)
				{
					if(Integer.parseInt(pk_list[j]) == skill.get(i).getPk())
					{
						isRepresentative = true;
					}
				}
				
				if(isRepresentative)
					jdbcTemplate.update("update technique set representative=1 where account_pk=? and pk=?", new Object[] {account_pk,skill.get(i).getPk() });
				else
					jdbcTemplate.update("update technique set representative=0 where account_pk=? and pk=?", new Object[] {account_pk,skill.get(i).getPk() });

			}
			
			return "성공";
			
		}
		
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : deleteAll
	 * 2. 작성일 : 2015. 12. 11. 오후 7:07:58
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 모든 기술 삭제
	 * </pre>
	 */
	public void deleteAll()
	{
		jdbcTemplate.update("delete from technique");
	}
	/**
	 * <pre>
	 * 1. 메소드명 : delete
	 * 2. 작성일 : 2015. 12. 11. 오후 7:08:04
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 기술 삭제
	 * </pre>
	 * @param pk 특정 기술 고유값
	 * @return 결과값
	 */
	public String delete(int pk)
	{
		
		jdbcTemplate.update("delete from technique where pk = ?", new Object[] { pk });
		return "성공";
	}
	
	/**
	 * <pre>
	 * 1. 메소드명 : hasSkill
	 * 2. 작성일 : 2015. 12. 11. 오후 7:08:18
	 * 3. 작성자 : Hansol
	 * 4. 설명 : 특정 계정의 기술 소유 여부
	 * </pre>
	 * @param account_pk 계정 고유값
	 * @return true, false
	 */
	public boolean hasSkill(int account_pk)
	{
		List<TechniqueInfo> list = select(account_pk);
		if(list != null)
			return true;
		else
			return false;
	}
}
