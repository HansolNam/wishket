package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.CancellistInfo;
import com.wjm.models.ContractInfo;

public interface CancellistIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk, int applicant_pk, int contract_pk);
	List<CancellistInfo> selectAll();
	void deleteAll();
	void delete(int pk);
}
