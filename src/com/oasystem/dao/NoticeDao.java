package com.oasystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oasystem.model.Notices;

@Repository
public interface NoticeDao {
	/**
	 * 初始化公告列表
	 * @return List
	 */
	public List<Notices> listnotices();
	public List<Notices> listnotice(@Param("num")int num);
	public List<Notices> mlistnotices();
	/**
	 * 获取公告
	 * @return Notices
	 */
	public Notices getNotices(@Param("id")int id);
	public int deleteNotice(@Param("id")int id);
	public int stateNotice(@Param("id")int id,@Param("state")int state);
	public int updateNotice(@Param("id")int id,@Param("data")String data,@Param("title")String title);
	public int writeNotice(@Param("title")String title,@Param("content")String content,@Param("author")String author,@Param("state")int state);
}
