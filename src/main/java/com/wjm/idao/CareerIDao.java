package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.CareerInfo;

public interface CareerIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk, String company_name, String department, String position, Timestamp start_date, Timestamp end_date);
	List<CareerInfo> selectAll();
	List<CareerInfo> select(int account_pk);
	void deleteAll();
	void delete(int pk);
}
