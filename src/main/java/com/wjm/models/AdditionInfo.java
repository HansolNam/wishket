package com.wjm.models;

import java.sql.Timestamp;

public class AdditionInfo {
	private int pk;
	private int contract_pk;
	private String title;
	private int budget;
	private int term;
	private String status;
	private Timestamp reg_date;
	private String descrition;
	private String filename;
	
	private ContractInfo contract;
	
	public ContractInfo getContract() {
		return contract;
	}
	public void setContract(ContractInfo contract) {
		this.contract = contract;
	}
	
	
	public AdditionInfo(int pk, int contract_pk, String title, int budget, int term, String status, Timestamp reg_date,
			String descrition, String filename) {
		super();
		this.pk = pk;
		this.contract_pk = contract_pk;
		this.title = title;
		this.budget = budget;
		this.term = term;
		this.status = status;
		this.reg_date = reg_date;
		this.descrition = descrition;
		this.filename = filename;
	}
	
	
	
	public String getDescrition() {
		return descrition;
	}
	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getContract_pk() {
		return contract_pk;
	}
	public void setContract_pk(int contract_pk) {
		this.contract_pk = contract_pk;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
