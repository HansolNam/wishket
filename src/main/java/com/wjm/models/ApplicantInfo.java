package com.wjm.models;

import java.sql.Timestamp;

public class ApplicantInfo {
	private int pk;
	private int project_pk;
	private int account_pk;
	private int application_cost;
	private int application_period;
	private String application_content;
	private int has_portfolio;
	private int portfolio_pk1;
	private int portfolio_pk2;
	private int portfolio_pk3;
	private String portfolio_description;
	private String status;
	private Timestamp reg_date;
	private String name;
	public ApplicantInfo(int pk, int project_pk, int account_pk, int application_cost, int application_period,
			String application_content, int has_portfolio, int portfolio_pk1, int portfolio_pk2, int portfolio_pk3,
			String portfolio_description, String status, Timestamp reg_date, String name) {
		super();
		this.pk = pk;
		this.project_pk = project_pk;
		this.account_pk = account_pk;
		this.application_cost = application_cost;
		this.application_period = application_period;
		this.application_content = application_content;
		this.has_portfolio = has_portfolio;
		this.portfolio_pk1 = portfolio_pk1;
		this.portfolio_pk2 = portfolio_pk2;
		this.portfolio_pk3 = portfolio_pk3;
		this.portfolio_description = portfolio_description;
		this.status = status;
		this.reg_date = reg_date;
		this.name = name;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getProject_pk() {
		return project_pk;
	}
	public void setProject_pk(int project_pk) {
		this.project_pk = project_pk;
	}
	public int getAccount_pk() {
		return account_pk;
	}
	public void setAccount_pk(int account_pk) {
		this.account_pk = account_pk;
	}
	public int getApplication_cost() {
		return application_cost;
	}
	public void setApplication_cost(int application_cost) {
		this.application_cost = application_cost;
	}
	public int getApplication_period() {
		return application_period;
	}
	public void setApplication_period(int application_period) {
		this.application_period = application_period;
	}
	public String getApplication_content() {
		return application_content;
	}
	public void setApplication_content(String application_content) {
		this.application_content = application_content;
	}
	public int getHas_portfolio() {
		return has_portfolio;
	}
	public void setHas_portfolio(int has_portfolio) {
		this.has_portfolio = has_portfolio;
	}
	public int getPortfolio_pk1() {
		return portfolio_pk1;
	}
	public void setPortfolio_pk1(int portfolio_pk1) {
		this.portfolio_pk1 = portfolio_pk1;
	}
	public int getPortfolio_pk2() {
		return portfolio_pk2;
	}
	public void setPortfolio_pk2(int portfolio_pk2) {
		this.portfolio_pk2 = portfolio_pk2;
	}
	public int getPortfolio_pk3() {
		return portfolio_pk3;
	}
	public void setPortfolio_pk3(int portfolio_pk3) {
		this.portfolio_pk3 = portfolio_pk3;
	}
	public String getPortfolio_description() {
		return portfolio_description;
	}
	public void setPortfolio_description(String portfolio_description) {
		this.portfolio_description = portfolio_description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
