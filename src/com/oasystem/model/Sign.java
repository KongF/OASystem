package com.oasystem.model;

public class Sign {
	private int id;
	private int m_id;
	private String m_name;
	private int signcount;
	private int scount;
	private String lastModifyTime;
	private String signHistory;
	public Sign() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getSigncount() {
		return signcount;
	}
	public void setSigncount(int signcount) {
		this.signcount = signcount;
	}
	public String getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(String lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	public String getSignHistory() {
		return signHistory;
	}
	public void setSignHistory(String signHistory) {
		this.signHistory = signHistory;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getScount() {
		return scount;
	}
	
	

}
