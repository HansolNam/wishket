package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AccountInfo;
import com.wjm.models.AreaDetailInfo;

public interface AreaDetailIDao {
	void setDataSource(DataSource ds);
	void create(int area_pk, String name);
	List<AreaDetailInfo> selectAll();
	List<String> select(String area);
}
