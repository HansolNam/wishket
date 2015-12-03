package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AdditionInfo;

public interface AdditionIDao {
	void setDataSource(DataSource ds);
	void create(int contract_pk, String title, int budget, int term, String status);
	List<AdditionInfo> selectAll();
	List<AdditionInfo> select_contract(int contract_pk);
	AdditionInfo select(int pk);
	void deleteAll();
	void delete(int pk);
}
