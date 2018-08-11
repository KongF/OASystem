package com.oasystem.service;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oasystem.dao.MainDao;
@Service
public class MainService {

	@Resource
	private MainDao dao;
	
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	

	/**
	 * 添加用户信息
	 * @param username
	 * @param password
	 * @param permission
	 * @throws UnsupportedEncodingException
	 */
	public void addUser(String username,String gender,String phone,String email,String password,String permission) {
		// TODO Auto-generated method stub
		dao.addUser(username,gender,phone,email,password,permission);
	}

	/**
	 * 删除用户
	 * @param id
	 */
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		dao.deleteUser(id);
		dao.deleteUserPermission(id);
	}

	/**
	 * 更新用户
	 * @param id
	 * @param username
	 * @param password
	 * @param permission
	 */
	public void UpdataUser(int id, String username, String password,
			String permission) {
		// TODO Auto-generated method stub
		dao.UpdataUser(username,password,permission);
		dao.UpdataUserPermission(username,permission);
	}

	/**
	 * 初始化用户管理页面
	 * @return
	 */
	/*public List<Users> getUser() {
		// TODO Auto-generated method stub
		//return dao.getUser();
	}*/

}
