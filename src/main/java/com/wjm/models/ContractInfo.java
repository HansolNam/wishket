package com.wjm.models;

import java.sql.Timestamp;

public class ContractInfo {
	private int pk;
	private int project_pk;
	private int client_pk;
	private int partners_pk;
	private String name;
	private String partners_id;
	private String client_id;
	private int budget;
	private int term;
	private String status;
	private Timestamp reg_date;
	private ProjectInfo project;
	private AccountInfo client;
	private AccountInfo partners;
	private AssessmentInfo assessed;
	private AssessmentInfo assessing;
	
	public AssessmentInfo getAssessed() {
		return assessed;
	}
	public void setAssessed(AssessmentInfo assessed) {
		this.assessed = assessed;
	}
	public AssessmentInfo getAssessing() {
		return assessing;
	}
	public void setAssessing(AssessmentInfo assessing) {
		this.assessing = assessing;
	}
	public ProjectInfo getProject() {
		return project;
	}
	public void setProject(ProjectInfo project) {
		this.project = project;
	}
	public AccountInfo getClient() {
		return client;
	}
	public void setClient(AccountInfo client) {
		this.client = client;
	}
	public AccountInfo getPartners() {
		return partners;
	}
	public void setPartners(AccountInfo partners) {
		this.partners = partners;
	}
	public ContractInfo(int pk, int project_pk, int client_pk, int partners_pk, String name, String partners_id,
			String client_id, int budget, int term, String status, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.project_pk = project_pk;
		this.client_pk = client_pk;
		this.partners_pk = partners_pk;
		this.name = name;
		this.partners_id = partners_id;
		this.client_id = client_id;
		this.budget = budget;
		this.term = term;
		this.status = status;
		this.reg_date = reg_date;
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
	public int getClient_pk() {
		return client_pk;
	}
	public void setClient_pk(int client_pk) {
		this.client_pk = client_pk;
	}
	public int getPartners_pk() {
		return partners_pk;
	}
	public void setPartners_pk(int partners_pk) {
		this.partners_pk = partners_pk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPartners_id() {
		return partners_id;
	}
	public void setPartners_id(String partners_id) {
		this.partners_id = partners_id;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
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
	
}
