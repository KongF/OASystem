package com.oasystem.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oasystem.dao.LeaveDao;
import com.oasystem.model.Leave;
@Service
public class LeaveService {
	@Resource
	private LeaveDao dao;
	 public PageInfo<Leave> listleaves(String pageNum,String pageSize,String username){
		 	int num = 1;
			int size = 8;
			if (pageNum != null && !"".equals(pageNum)) {
				num = Integer.parseInt(pageNum);
			}
			if (pageSize != null && !"".equals(pageSize)) {
				size = Integer.parseInt(pageSize);
			}

			PageHelper.startPage(num, size);
			List<Leave> tabOne = dao.listleaves(username);
			PageInfo<Leave> page = new PageInfo<Leave>(tabOne);

			return page;
	}
	 public PageInfo<Leave> mlistleaves(String pageNum,String pageSize){
		 	int num = 1;
			int size = 8;
			if (pageNum != null && !"".equals(pageNum)) {
				num = Integer.parseInt(pageNum);
			}
			if (pageSize != null && !"".equals(pageSize)) {
				size = Integer.parseInt(pageSize);
			}

			PageHelper.startPage(num, size);
			List<Leave> tabOne = dao.mlistleaves();
			PageInfo<Leave> page = new PageInfo<Leave>(tabOne);

			return page;
	}
	 public int leaveState(int id,int state) {
		 return dao.leaveState(id,state);
	 }
	 public int addleave(String m_name,String reason,String ldate,String hdate) {
		 
		 return dao.addLeave(m_name, reason, ldate, hdate);
	 }
	 public int deleteLeave(int id) {
		 return dao.deleteLeave(id);
	 }

}
