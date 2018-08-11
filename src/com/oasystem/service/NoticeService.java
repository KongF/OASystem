package com.oasystem.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oasystem.dao.NoticeDao;
import com.oasystem.model.Notices;

@Service
public class NoticeService {
	@Resource
	private NoticeDao noticeDao;

	public PageInfo<Notices> listNotices(String pageNum,String pageSize){
		int num = 1;
		int size = 8;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		PageHelper.startPage(num,size);
		List<Notices> tabOne = noticeDao.listnotices();
		PageInfo<Notices> pageInfo = new PageInfo<Notices>(tabOne);
		return pageInfo;
	}
	public PageInfo<Notices> mlistNotices(String pageNum,String pageSize){
		int num = 1;
		int size = 8;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		PageHelper.startPage(num,size);
		List<Notices> tabOne = noticeDao.mlistnotices();
		PageInfo<Notices> pageInfo = new PageInfo<Notices>(tabOne);
		return pageInfo;
	}
	public Notices getNotices(int id) {
		Notices notices = noticeDao.getNotices(id);
		return notices;
	}
	public int writeNotice(String title,String content,String author,int state) {
		return noticeDao.writeNotice(title,content,author,state);
	}
	public int deleteNotice(int id) {
		return noticeDao.deleteNotice(id);
	}
	public int stateNotice(int id,int state) {
		return noticeDao.stateNotice(id, state);
	}
	public Notices getNoticeById(int id) {
		return noticeDao.getNotices(id);
	}
	public int updateNotice(int id,String data,String title) {
		return noticeDao.updateNotice(id,data,title);
	}
	public List<Notices> listNotice(String num){
		int numi = Integer.parseInt(num);
		return noticeDao.listnotice(numi);
	}
}
