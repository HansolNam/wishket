package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AccountInformationInfo;

public interface AccountInformationIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk);
	List<AccountInformationInfo> selectAll();
	AccountInformationInfo select(int acount_pk);
	List<AccountInformationInfo> select(String id);
	void deleteAll();
	void delete(String id);
}
