package com.wjm.models;

import java.sql.Timestamp;

public class LicenseInfo {
	private int pk;
	private int account_pk;
	private String name;
	private String publishing_office;
	private String serial_num;
	private String publication_date;
	public LicenseInfo(int pk, int account_pk, String name, String publishing_office, String serial_num,
			String publication_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.name = name;
		this.publishing_office = publishing_office;
		this.serial_num = serial_num;
		this.publication_date = publication_date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublishing_office() {
		return publishing_office;
	}
	public void setPublishing_office(String publishing_office) {
		this.publishing_office = publishing_office;
	}
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getPublication_date() {
		return publication_date;
	}
	public void setPublication_date(String publication_date) {
		this.publication_date = publication_date;
	}
	
	
}
