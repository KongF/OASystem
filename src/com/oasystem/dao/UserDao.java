package com.oasystem.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oasystem.model.Users;

@Repository
public interface UserDao {
	/**
	 * 更改个人信息id,gender,birth,zhengzhi,rz_time,job
	 */
	void updatePerson(@Param("id")int id,@Param("gender")int gender,@Param("birth")String birth,@Param("zhengzhi")String zhengzhi,
			@Param("rz_time")String rz_time,@Param("job")String job);
	int getUserId(@Param("username")String username,@Param("password")String password);
	List<Users> listUsers();
	int addPerson(@Param("m_name")String m_name,@Param("gender")int gender,@Param("job")String job,
			@Param("permission")String permission,@Param("o_name")String o_name,@Param("password")String password) ;
	int deletePerson(@Param("id")int id);
	int updatePersonM(@Param("id")int id,@Param("m_name")String m_name,@Param("gender")String gender,@Param("job")String job,
			@Param("permission")String permission,@Param("password")String password,@Param("o_name")String o_name );
	Users ValidateName(@Param("m_name")String m_name);
}
