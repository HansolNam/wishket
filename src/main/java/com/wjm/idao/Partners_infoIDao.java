package com.wjm.idao;

import javax.sql.DataSource;

import com.wjm.models.Partners_infoInfo;

public interface Partners_infoIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk);
	Partners_infoInfo select(int account_pk);
	void delete(int account_pk);
}
