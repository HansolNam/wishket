package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.LicenseInfo;

public interface LicenseIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk, String name, String publishing_office, String serial_num, String publication_date);
	List<LicenseInfo> selectAll();
	List<LicenseInfo> select(int account_pk);
	void deleteAll();
	String delete(int pk);
}
