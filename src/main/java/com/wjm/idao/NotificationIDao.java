package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.NotificationInfo;

public interface NotificationIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk, String content);
	List<NotificationInfo> selectAll();
	void deleteAll();
	void delete(int pk);
}
