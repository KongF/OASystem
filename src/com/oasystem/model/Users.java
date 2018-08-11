package com.oasystem.model;

public class Users {
	
	private int id;
	private String m_name;
	private String password;
	private String permission;
	private String email;
	private String phone;
	private String job;
	private String birth;
	private String rz_time;
	private String zhengzhi;
	private String o_name;
	public String getZhengzhi() {
		return zhengzhi;
	}
	public void setZhengzhi(String zhengzhi) {
		this.zhengzhi = zhengzhi;
	}
	private int gender;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getGender() {
		return gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRz_time() {
		return rz_time;
	}
	public void setRz_time(String rz_time) {
		this.rz_time = rz_time;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	
	

}
