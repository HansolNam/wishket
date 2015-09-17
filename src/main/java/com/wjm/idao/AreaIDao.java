package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AreaInfo;

public interface AreaIDao {
	void setDataSource(DataSource ds);
	void create(String name);
	List<AreaInfo> selectAll();
	String select(int pk);
}
