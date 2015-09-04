package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.PortfolioInfo;

public interface PortfolioIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk,int representative,String name,String categoryL,String categoryM,String description,Timestamp start_date, Timestamp end_date, int participation_rate,String img0,String explanation0,String img1,String explanation1,String img2,String explanation2,String tag);
	List<PortfolioInfo> selectAll();
	List<PortfolioInfo> select(int account_pk);
	void deleteAll();
	void delete(int pk);
}
