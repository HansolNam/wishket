package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.ProjectInfo;

public interface ProjectIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk, String categoryL, String categoryM, int another, String name, int period, int budget,
			String plan_status, String description, String technique, Timestamp deadline, String meeting_type,
			String meeting_area, String meeting_area_detail, Timestamp start_date, int managing, String partner_type,
			String purpose, String status, String filename);
	List<ProjectInfo> selectAll();
	List<ProjectInfo> select(int account_pk);
	void deleteAll();
	void delete(int pk);
}
