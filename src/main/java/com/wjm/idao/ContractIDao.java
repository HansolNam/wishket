package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.ContractInfo;

public interface ContractIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk, int client_pk, int partners_pk, String name, String partners_id,
			String client_id, int budget, int term, String status);
	List<ContractInfo> selectAll();
	List<ContractInfo> select_project(int project_pk);
	List<ContractInfo> select_client(int client_pk);
	List<ContractInfo> select_partners(int partners_pk);
	void deleteAll();
	void delete(int pk);
}
