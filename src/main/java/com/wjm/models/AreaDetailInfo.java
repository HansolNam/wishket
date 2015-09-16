package com.wjm.models;

public class AreaDetailInfo {
	private int pk;
	private int area_pk;
	private String name;
	public AreaDetailInfo(int pk, int area_pk, String name) {
		super();
		this.pk = pk;
		this.area_pk = area_pk;
		this.name = name;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getArea_pk() {
		return area_pk;
	}
	public void setArea_pk(int area_pk) {
		this.area_pk = area_pk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
