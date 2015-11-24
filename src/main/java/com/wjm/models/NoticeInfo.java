package com.wjm.models;

import java.sql.Timestamp;

public class NoticeInfo {
	private int pk;
	private String name;
	private String content;
	private int flag;
	private Timestamp reg_date;
	
	public NoticeInfo(int pk, String name, String content, int flag, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.name = name;
		this.content = content;
		this.flag = flag;
		this.reg_date = reg_date;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
