package com.wjm.models;

import java.sql.Timestamp;

public class AccountInfo {
	private int pk;
	private String email;
	private String id;
	private String password;
	private String account_type;
	private int authorized;
	private String authorization_key;
	private Timestamp reg_date;
	private AccountInformationInfo accountinfo;
	private AuthenticationInfo authenticationinfo;
	
	public AccountInformationInfo getAccountinfo() {
		return accountinfo;
	}
	public void setAccountinfo(AccountInformationInfo accountinfo) {
		this.accountinfo = accountinfo;
	}
	public AuthenticationInfo getAuthenticationinfo() {
		return authenticationinfo;
	}
	public void setAuthenticationinfo(AuthenticationInfo authenticationinfo) {
		this.authenticationinfo = authenticationinfo;
	}
	public AccountInfo(int pk, String email, String id, String password, String account_type, int authorized,
			String authorization_key, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.email = email;
		this.id = id;
		this.password = password;
		this.account_type = account_type;
		this.authorized = authorized;
		this.authorization_key = authorization_key;
		this.reg_date = reg_date;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}
	public int getAuthorized() {
		return authorized;
	}
	public void setAuthorized(int authorized) {
		this.authorized = authorized;
	}
	public String getAuthorization_key() {
		return authorization_key;
	}
	public void setAuthorization_key(String authorization_key) {
		this.authorization_key = authorization_key;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
