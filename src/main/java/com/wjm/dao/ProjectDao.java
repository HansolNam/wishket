package com.wjm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wjm.idao.ProjectIDao;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ProjectInfo;

@Repository
public class ProjectDao implements ProjectIDao {

	private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);
	
	@Autowired
	private AreaDao areaDao;

	@Autowired
	private ApplicantDao applicantDao;
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource ds) {
		dataSource = ds;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		logger.info("Updated DataSource ---> " + ds);
		logger.info("Updated jdbcTemplate ---> " + jdbcTemplate);		
	}

	public void create(int account_pk, String categoryL, String categoryM, int another , String name, int period, String budget,
			String plan_status, String description, String technique, Timestamp deadline, String meeting_type,
			String meeting_area, String meeting_area_detail, Timestamp start_date, int managing, String partner_type,
			String purpose, String status)
	{		
		jdbcTemplate.update("insert into project (account_pk, categoryL, categoryM, "
				+"another, name, period, budget, plan_status, description, technique, deadline, "
				+"meeting_type, meeting_area, meeting_area_detail, start_date, managing, partner_type, purpose, status) "
				+"values (?, ?, ?, ?,?,?, ?, ?,?,?, ?, ?,?,?, ?, ?,?,?,?)", 
				new Object[] { account_pk, categoryL, categoryM, another, name, period, budget,
				plan_status, description, technique, deadline, meeting_type,
				meeting_area, meeting_area_detail, start_date, managing, partner_type,
				purpose, status });
	}
	

	public int countAll()
	{
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project",new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
		
		return projectlist.size();
	}
	
	public List<ProjectInfo> selectAll()
	{
		return jdbcTemplate.query("select * from project",new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
	public List<ProjectInfo> select(int account_pk)
	{
		return jdbcTemplate.query("select * from project where account_pk = ?",
		    	new Object[] { account_pk }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
	
	public List<ProjectInfo> selectStatus(int account_pk,String status)
	{
		return jdbcTemplate.query("select * from project where account_pk = ? and status = ?",
		    	new Object[] { account_pk,status }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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

	public ProjectInfo select(int pk,String name)
	{
		List<ProjectInfo> projectlist = jdbcTemplate.query("select * from project where pk = ? and name = ?",
		    	new Object[] { pk,name }, new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
		
		if(projectlist.size() > 1 || projectlist.size() ==0)
		{
			logger.info("프로젝트 pk와 이름에 해당하는 프로젝트가 0개,혹은 그이상 에러");
			return null;
		}
		else
			return projectlist.get(0);
		
	}
	public List<ProjectInfo> selectCondition(String q, String dev, String design, String addr,String sort)
	{
		///////////////////////////////////////////////////////
		///dev filtering
		////////////////////////////////////////////////////////
		String dev_sql = "";
		
		//아무것도 선택 안한 경우
		if(dev.equals("1111111111"))
		{
			dev_sql = "";
		}
		//개발 전체 선택
		else if(dev.equals("2222222222"))
		{
			dev_sql = "(categoryL = 'develop')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<dev.length();i++)
			{
				if(dev.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					dev_sql+="categoryM = ";
					if(i == 1)
						dev_sql+="'웹'";
					else if(i == 2)
						dev_sql+="'애플리케이션'";
					else if(i == 3)
						dev_sql+="'워드프레스'";
					else if(i == 4)
						dev_sql+="'퍼블리싱'";
					else if(i == 5)
						dev_sql+="'일반소프트웨어'";
					else if(i == 6)
						dev_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						dev_sql+="'게임'";
					else if(i == 8)
						dev_sql+="'임베디드'";
					else if(i == 9)
						dev_sql+="'기타'";
					
					dev_sql += " or ";
				}
			}
			
			if(dev_sql.length()>4 && dev_sql.substring(dev_sql.length()-4,dev_sql.length()).equals(" or "))
				{
				dev_sql = dev_sql.substring(0,dev_sql.length()-4);
				dev_sql = "(categoryL = 'develop' and ("+dev_sql+"))";
				}
		}

		logger.info("dev_sql > "+dev_sql);

		///////////////////////////////////////////////////////
		///design filtering
		////////////////////////////////////////////////////////
		String design_sql = "";
		//design
		
		//아무것도 선택 안한 경우
		if(design.equals("11111111111"))
		{
			design_sql = "";
		}
		//디자인 전체 선택
		else if(design.equals("22222222222"))
		{
			design_sql = "(categoryL = 'design')";
		}
		//개별 선택
		else
		{
			for(int i=0;i<design.length();i++)
			{
				if(design.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					design_sql+="categoryM = ";
					if(i == 1)
						design_sql+="'웹'";
					else if(i == 2)
						design_sql+="'애플리케이션'";
					else if(i == 3)
						design_sql+="'제품'";
					else if(i == 4)
						design_sql+="'프레젠테이션'";
					else if(i == 5)
						design_sql+="'인쇄물'";
					else if(i == 6)
						design_sql+="'커머스&쇼핑몰'";
					else if(i == 7)
						design_sql+="'로고'";
					else if(i == 8)
						design_sql+="'그래픽'";
					else if(i == 9)
						design_sql+="'게임'";
					else if(i == 10)
						design_sql+="'기타'";
					
					design_sql += " or ";
				}
			}
			
			if(design_sql.length()>4 && design_sql.substring(design_sql.length()-4,design_sql.length()).equals(" or "))
				{
				design_sql = design_sql.substring(0,design_sql.length()-4);
				design_sql = "(categoryL = 'design' and ("+design_sql+"))";
				}
		}

		logger.info("design_sql > "+design_sql);
		
		////////////////////////////////////////////////////////////
		//addr
		/////////////////////////////////////////////////////////////
		String addr_sql = "";
		
		//아무것도 선택 안한 경우
		if(addr.equals("111111111111111111"))
		{
			addr_sql = "";
		}
		//addr 전체 선택
		else if(addr.equals("122222222222222222"))
		{
			addr_sql = "";
		}
		//개별 선택
		else
		{
			for(int i=0;i<addr.length();i++)
			{
				if(addr.charAt(i) == '2')
				{
					//전체 선택인 경우
					if(i==0)
						break;
					
					//전체 선택 아닌 경우
					addr_sql+="meeting_area = ";
					addr_sql+="'"+areaDao.select(i)+"'";
					
					addr_sql += " or ";
				}
			}
			
			if(addr_sql.length()>4 && addr_sql.substring(addr_sql.length()-4,addr_sql.length()).equals(" or "))
				{
				addr_sql = addr_sql.substring(0,addr_sql.length()-4);
				addr_sql = "("+addr_sql+")";
				}
		}

		logger.info("addr_sql > "+addr_sql);
		
		String sort_sql = "";
		if(sort.isEmpty() || sort.equals("0"))
		{
			sort_sql += "";
		}
		else if(sort.equals("1"))
		{
			sort_sql += " order by budget";
		}
		else if(sort.equals("2"))
		{
			sort_sql += " order by budget desc";
		}
		else if(sort.equals("3"))
		{
			sort_sql += " order by reg_date";
		}
		else if(sort.equals("4"))
		{
			
		}
		//status : 
		
		logger.info("sort_sql > "+sort_sql);
		
		String q_sql = "";
		if(!q.equals("None"))
			q_sql = " name LIKE '%"+q+"%'";

		String status_sql = "(status = '지원자모집중')";
		String sql = getSQL(dev_sql, design_sql, addr_sql, status_sql, sort_sql, q_sql);
		logger.info("sql1 > "+sql);
		
		//진행중인 프로젝트
		List<ProjectInfo> projectlist1 = jdbcTemplate.query(sql,new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
		
		status_sql = "(status = '진행중' or status = '평가대기중' or status = '완료한프로젝트')";
		sql = getSQL(dev_sql, design_sql, addr_sql, status_sql, sort_sql, q_sql);
		logger.info("sql2 > "+sql);
		
		projectlist1.addAll(jdbcTemplate.query(sql,new RowMapper<ProjectInfo>() {
	    	public ProjectInfo mapRow(ResultSet resultSet, int rowNum) throws SQLException 
	    	{
	    		return new ProjectInfo(
	    				resultSet.getInt("pk")
	    				, resultSet.getInt("account_pk")
	    				, resultSet.getString("categoryL")
	    				, resultSet.getString("categoryM")
	    				, resultSet.getInt("another")
	    				, resultSet.getString("name")
	    				, resultSet.getInt("period")
	    				, resultSet.getString("budget")
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
	    }));
		
		return projectlist1;
	}
	public void Save(int account_pk, String categoryL,String categoryM,String is_turnkey, String name,
			int period, String budget, String plan_status, String description, String technique,
			Timestamp deadline, String meeting_type, String meeting_area, String meeting_area_detail,
			Timestamp start_date, String managing,String partner_type, String purpose, String status)
	{
		int managing_int = 0;
		if(managing.equals("true"))
			managing_int = 1;
		else
			managing_int = 0;
		
		int another = 0;
		if(is_turnkey.equals("true"))
			another = 1;
		else
			another = 0;
		
		create(account_pk, categoryL, categoryM, another, name, period, budget,
				plan_status, description, technique, deadline, meeting_type,
				meeting_area, meeting_area_detail, start_date, managing_int, partner_type,
				purpose, status);
		
	}
	
	public String getSQL(String dev_sql, String design_sql, String addr_sql, String status_sql, String sort_sql, String q_sql)
	{
		String sql = "select * from project";
		
		if(!dev_sql.isEmpty() || !design_sql.isEmpty() || !addr_sql.isEmpty() || !status_sql.isEmpty())
		{
			sql += " where ";
			if(!dev_sql.isEmpty() && !design_sql.isEmpty())
			{
				sql += "(" + dev_sql +" or "+design_sql+")";
			}
			else if(!dev_sql.isEmpty())
				sql += dev_sql;
			else if(!design_sql.isEmpty())
				sql += design_sql;
			
			
			if(!addr_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += addr_sql;
				else
					sql += " and "+addr_sql;
			}
			if(!status_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += status_sql;
				else
					sql += " and "+status_sql;
			}

			if(!q_sql.isEmpty())
			{
				if(sql.length()>4 && sql.substring(sql.length()-7, sql.length()).equals(" where "))
					sql += q_sql;
				else
					sql += " and "+q_sql;
			}
			sql += sort_sql;
		}
		
		return sql;
	}
	
	public int getApplicantNum(int project_pk)
	{
		List<ApplicantInfo> applicantlist =  applicantDao.select(project_pk);
		
		return applicantlist.size();
	}
	
	public void deleteAll()
	{
		jdbcTemplate.update("delete from project");
	}
	public void delete(int pk)
	{
		jdbcTemplate.update("delete from project where pk = ?", new Object[] { pk });
	}
}
