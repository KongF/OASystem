package com.oasystem.model;

public class Leave {
	private int id;
	private String m_name;
	private String reason ;
	private String ldate;
	private String hdate;
	private int state;
	private int operation;
	
	
	
	public Leave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getOperation() {
		return operation;
	}
	public void setOperation(int operation) {
		this.operation = operation;
	}
	

}
