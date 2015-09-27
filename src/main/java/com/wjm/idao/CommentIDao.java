package com.wjm.idao;

import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.CommentInfo;

public interface CommentIDao {
	void setDataSource(DataSource ds);
	void create(int project_pk,int account_pk, String content);
	List<CommentInfo> selectAll();
	List<CommentInfo> select(int project_pk);
	void deleteAll();
	void delete(int pk);
}
