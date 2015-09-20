package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AuthenticationInfo;

public interface AuthenticationIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk);
	List<AuthenticationInfo> selectAll();
	AuthenticationInfo select(int account_pk);
	void deleteAll();
	void delete(int account_pk);
}
