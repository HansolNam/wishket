package com.wjm.models;

public class AreaInfo {
	private int pk;
	private String name;
	
	public AreaInfo(int pk, String name) {
		super();
		this.pk = pk;
		this.name = name;
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
	
	
}
