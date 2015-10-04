package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AssessmentInfo;
import com.wjm.models.NoticeInfo;

public interface NoticeIDao {
	void setDataSource(DataSource ds);
	void create(String name, String content);
	List<NoticeInfo> selectAll();
	void deleteAll();
	void delete(int pk);
}
