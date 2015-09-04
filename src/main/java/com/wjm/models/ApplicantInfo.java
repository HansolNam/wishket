package com.wjm.models;

public class ApplicantInfo {
	private int pk;
	private int project_pk;
	private int account_pk;
	private int application_cost;
	private int application_period;
	private String application_content;
	private int portfolio_pk;
	private String portfolio_description;

	public ApplicantInfo(int pk, int project_pk, int account_pk, int application_cost, int application_period,
			String application_content, int portfolio_pk, String portfolio_description) {
		this.pk = pk;
		this.project_pk = project_pk;
		this.account_pk = account_pk;
		this.application_cost = application_cost;
		this.application_period = application_period;
		this.application_content = application_content;
		this.portfolio_pk = portfolio_pk;
		this.portfolio_description = portfolio_description;
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

	public int getPortfolio_pk() {
		return portfolio_pk;
	}

	public void setPortfolio_pk(int portfolio_pk) {
		this.portfolio_pk = portfolio_pk;
	}

	public String getPortfolio_description() {
		return portfolio_description;
	}

	public void setPortfolio_description(String portfolio_description) {
		this.portfolio_description = portfolio_description;
	}
	
	
}
