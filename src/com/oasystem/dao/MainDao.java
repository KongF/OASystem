package com.oasystem.dao;

import java.io.UnsupportedEncodingException;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oasystem.model.Users;


@Repository
public interface MainDao {


	/**
	 * 添加用户信息
	 *
	 * @param m_name,igender,job,permission,o_name,password
	 *
	 * @throws UnsupportedEncodingException
	 */
	void addUser(@Param("username")String username,@Param("gender")String gender,@Param("phone")String phone,@Param("email")String email, @Param("password")String password, @Param("permission")String permission);

	/**
	 * 添加用户权限
	 * @param username
	 * @param password
	 * @param permission
	 * @throws UnsupportedEncodingException
	 */
	void addUserPermission(@Param("role_name")String role_name, @Param("permission")String permission);

	/**
	 * 删除用户
	 * @param id
	 */
	void deleteUser(int id);
	/**
	 * 删除用户权限
	 * @param id
	 */
	void deleteUserPermission(int id);

	/**
	 * 更新用户
	 * @param id
	 */
	void UpdataUser(@Param("username")String username, @Param("password")String password, @Param("permission")String permission);
	/**
	 * 更新用户权限
	 * @param id
	 */
	void UpdataUserPermission(@Param("role_name")String role_name, @Param("permission")String permission);

	/**
	 * 初始化用户管理页面
	 * @return
	 */
	Users getUserInfo(@Param("id")int id);


}
