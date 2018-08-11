package com.oasystem.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oasystem.dao.MainDao;
import com.oasystem.dao.UserDao;
import com.oasystem.model.Users;

@Service
public class UserService {

	@Resource
	private MainDao dao;
	@Resource
	private UserDao	userdao;
	/**
	 * 初始化用户信息页面
	 * @return
	 */
	public Users getUserInfo(int id) {
		// TODO Auto-generated method stub
		return dao.getUserInfo(id);
	}
	public int getUserId(String username,String password) {
		return userdao.getUserId(username,password);
	}
	public void updatePerson(int id,int gender,String birth,String zhengzhi,String rz_time,String job) {
		userdao.updatePerson(id,gender,birth,zhengzhi,rz_time,job);
	};
	public PageInfo<Users> listUsers(String pageNum,String pageSize){
		int num = 1;
		int size = 8;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		PageHelper.startPage(num,size);
		List<Users> tab = userdao.listUsers();
		PageInfo<Users> pageInfo = new PageInfo<Users>(tab);
		return pageInfo;
	}
	public int addPerson(String m_name,int gender,String job,String permission,String o_name,String password) {
		
		return userdao.addPerson(m_name, gender, job, permission, o_name, password);
	}
	public int deletePerson(int id) {
		return userdao.deletePerson(id);
	}
	public int updatePersonM(int id, String m_name,String gender,String job,String permission,String password,String o_name) {
		return userdao.updatePersonM(id, m_name, gender, job, permission, password, o_name);
	}
	public boolean ValidateName(String loginName) {
		Users user = userdao.ValidateName(loginName);
		System.out.println(user.getM_name());
		if(user.getM_name()==""||user.getM_name().equals(null)) {
			return true;
		}else {
			return false;
		}
		
	}

}
