package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.BankInfo;

public interface BankIDao {
	void setDataSource(DataSource ds);
	void create(int pk, String name);
	List<BankInfo> selectAll();
	String select_pk(int pk);
	int select_name(String name);
	void deleteAll();
	void delete(int pk);
}
