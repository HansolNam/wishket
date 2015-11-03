package com.wjm.models;

public class AssessmentInfo {
	private int pk;
	private int project_pk;
	private int assessing_pk;
	private int assessed_pk;
	private int professionalism;
	private int satisfaction;
	private int schedule_observance;
	private int activeness;
	private int communication;
	private String recommendation;
	private ProjectInfo project;
	private AccountInfo client;
	private ContractInfo contract;
	private String profile;
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public ContractInfo getContract() {
		return contract;
	}
	public void setContract(ContractInfo contract) {
		this.contract = contract;
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
	public AssessmentInfo(int pk, int project_pk, int assessing_pk, int assessed_pk, int professionalism,
			int satisfaction, int schedule_observance, int activeness, int communication, String recommendation) {
		super();
		this.pk = pk;
		this.project_pk = project_pk;
		this.assessing_pk = assessing_pk;
		this.assessed_pk = assessed_pk;
		this.professionalism = professionalism;
		this.satisfaction = satisfaction;
		this.schedule_observance = schedule_observance;
		this.activeness = activeness;
		this.communication = communication;
		this.recommendation = recommendation;
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
	public int getAssessing_pk() {
		return assessing_pk;
	}
	public void setAssessing_pk(int assessing_pk) {
		this.assessing_pk = assessing_pk;
	}
	public int getAssessed_pk() {
		return assessed_pk;
	}
	public void setAssessed_pk(int assessed_pk) {
		this.assessed_pk = assessed_pk;
	}
	public int getProfessionalism() {
		return professionalism;
	}
	public void setProfessionalism(int professionalism) {
		this.professionalism = professionalism;
	}
	public int getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(int satisfaction) {
		this.satisfaction = satisfaction;
	}
	public int getSchedule_observance() {
		return schedule_observance;
	}
	public void setSchedule_observance(int schedule_observance) {
		this.schedule_observance = schedule_observance;
	}
	public int getActiveness() {
		return activeness;
	}
	public void setActiveness(int activeness) {
		this.activeness = activeness;
	}
	public int getCommunication() {
		return communication;
	}
	public void setCommunication(int communication) {
		this.communication = communication;
	}
	public String getRecommendation() {
		return recommendation;
	}
	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}
	
}
