package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.TechniqueInfo;

public interface TechniqueIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk, String name, String experience, String skill);
	List<TechniqueInfo> selectAll();
	List<TechniqueInfo> select(int account_pk);
	void deleteAll();
	String delete(int pk);
}
