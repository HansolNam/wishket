package com.wjm.models;

import java.sql.Timestamp;

public class CancellistInfo {
	private int pk;
	private int project_pk;
	private int applicant_pk;
	private int contract_pk;
	private Timestamp reg_date;
	
	private ProjectInfo project;
	private AccountInfo client;
	private AccountInfo partners;
	
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
	public CancellistInfo(int pk, int project_pk, int applicant_pk, int contract_pk, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.project_pk = project_pk;
		this.applicant_pk = applicant_pk;
		this.contract_pk = contract_pk;
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
	public int getApplicant_pk() {
		return applicant_pk;
	}
	public void setApplicant_pk(int applicant_pk) {
		this.applicant_pk = applicant_pk;
	}
	public int getContract_pk() {
		return contract_pk;
	}
	public void setContract_pk(int contract_pk) {
		this.contract_pk = contract_pk;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	

}
