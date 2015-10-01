package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.AssessmentInfo;

public interface AssessmentIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk,int assessing_pk, int assessed_pk,int professionalism,int satisfaction,int schedule_observance, int activeness, int communication, String recommendation);
	List<AssessmentInfo> selectAll();
	AssessmentInfo select_assessing(int project_pk, int assessing_pk);
	AssessmentInfo select_assessed(int project_pk, int assessed_pk);
	void deleteAll();
	void delete(int pk);
}
