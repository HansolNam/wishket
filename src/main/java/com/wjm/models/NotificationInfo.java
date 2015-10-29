package com.wjm.models;

import java.sql.Timestamp;

public class NotificationInfo {
	private int pk;
	private int account_pk;
	private String content;
	private Timestamp reg_date;
	public NotificationInfo(int pk, int account_pk, String content, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.content = content;
		this.reg_date = reg_date;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getAccount_pk() {
		return account_pk;
	}
	public void setAccount_pk(int account_pk) {
		this.account_pk = account_pk;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
