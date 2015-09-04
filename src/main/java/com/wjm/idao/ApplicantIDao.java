package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.ApplicantInfo;

public interface ApplicantIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk, int account_pk,int application_cost,int application_period,String application_content,int portfolio_pk,String portfolio_description);
	List<ApplicantInfo> selectAll();
	List<ApplicantInfo> select(int project_pk, int account_pk);
	void deleteAll();
	void delete(int pk);
}
