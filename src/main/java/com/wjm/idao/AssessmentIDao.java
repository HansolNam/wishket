package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AssessmentInfo;

public interface AssessmentIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk,int account_pk,int professionalism,int satisfaction,int schedule_observance, int activeness, int communication, String recommendation);
	List<AssessmentInfo> selectAll();
	List<AssessmentInfo> select(int project_pk, int account_pk);
	void deleteAll();
	void delete(int pk);
}
