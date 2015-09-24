package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.EducationInfo;

public interface EducationIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk,String school_name,String major,String level,String state,String start_date,String end_date);
	List<EducationInfo> selectAll();
	List<EducationInfo> select(int account_pk);
	void deleteAll();
	String delete(int pk);
}
