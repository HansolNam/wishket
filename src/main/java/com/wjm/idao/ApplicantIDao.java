package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.ApplicantInfo;

public interface ApplicantIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk, int account_pk,int application_cost,
			int application_period,String application_content,
			int has_portfolio, int portfolio_pk1, int portfolio_pk2,
			int portfolio_pk3, String portfolio_description,
			String status);
	List<ApplicantInfo> selectAll();
	List<ApplicantInfo> select_project(int project_pk);
	List<ApplicantInfo> select_applicant(int applicant_pk);
	void deleteAll();
	void delete(int pk);
}