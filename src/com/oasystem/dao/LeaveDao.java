 package com.oasystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oasystem.model.Leave;


public interface LeaveDao {
	/**
	 * 初始化请假列表
	 * @return List
	 */
	public List<Leave> listleaves(@Param("username")String username);
	/**
	 * 初始化管理请假列表
	 * @return List
	 */
	public List<Leave> mlistleaves();
	public int deleteLeave(@Param("id")int id);
	public int leaveState(@Param("id")int id,@Param("state") int state);
	public int addLeave(@Param("m_name")String m_name,@Param("reason")String reason,@Param("ldate")String ldate,@Param("hdate")String hdate);
}
