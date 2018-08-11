package com.oasystem.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oasystem.dao.SignDao;
import com.oasystem.model.Sign;

@Service
public class SignService {
	@Resource
	private SignDao signDao;
	
	public PageInfo<Sign> mlistSign(String pageNum,String pageSize){
		int num = 1;
		int size = 8;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		PageHelper.startPage(num,size);
		List<Sign> tabOne = signDao.mlistsigns();
		PageInfo<Sign> pageInfo = new PageInfo<Sign>(tabOne);
		return pageInfo;
	}
	public int newSign(int m_id,String lastModifyTime,String signHistory,int scount ) {
		String nsignHistory = "0000,"+signHistory;
		String osignHistory = ","+signHistory;
		return signDao.newSign(lastModifyTime, osignHistory, nsignHistory, m_id,scount);
	}
	public Sign getHistory(int userid) {
		return signDao.getHistory(userid);
	}

}
