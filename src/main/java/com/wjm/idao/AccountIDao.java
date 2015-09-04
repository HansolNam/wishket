package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AccountInfo;

public interface AccountIDao {
	void setDataSource(DataSource ds);
	void create(String email, String id, String password, String account_type);
	List<AccountInfo> selectAll();
	List<AccountInfo> select(String id);
	void deleteAll();
	void delete(String id);
}
