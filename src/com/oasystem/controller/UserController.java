package com.oasystem.controller;


import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.oasystem.model.Users;
import com.oasystem.service.OrganService;
import com.oasystem.service.UserService;

@Controller
public class UserController {

	@Resource
	private UserService service;
	@Resource
	private OrganService organService;
	@RequestMapping(value="project/userinfo")
	@ResponseBody
	public ModelAndView userInfo(HttpServletRequest request) throws Exception {
		ModelAndView user_model  = new ModelAndView();
		String id = request.getParameter("id");
		int idi = Integer.parseInt(id);
		Users userinfo = service.getUserInfo(idi);
		user_model.addObject("userinfo", userinfo);
		return user_model;
	}
	
	/**
	 * 修改个人信息
	 * id,gender,birth,zhengzhi,rz_time,job
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="project/updateUser")
	public String UpdataUser(@RequestParam("userid")String sid,@RequestParam("gender")String gender,@RequestParam("birth")String birth,@RequestParam("zhengzhi")String zhengzhi,@RequestParam("rz_time")String rz_time,@RequestParam("job")String job)
			throws UnsupportedEncodingException {
		int id = Integer.parseInt(sid);
		int igender = Integer.parseInt(gender);
		service.updatePerson(id,igender,birth,zhengzhi,rz_time,job);
		return "redirect:/project/userinfo?id="+sid;
	}
	/**
	 * 用户列表分页
	 */
	@RequestMapping(value="backend/listuserPage")
	public ModelAndView gonggaolistpage(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Users> page = service.listUsers(pageNum, pageSize);
		model.addObject("pagehelper", page);
		model.setViewName("backend/person_manger");
		return model;
	}
	@RequestMapping(value="backend/addorgan")
	public String addOrgan(@RequestParam("o_name")String o_name) {
		organService.addOrgan(o_name);
		return "redirect:/backend/organ_manger";
	}
	@RequestMapping(value="backend/addPerson")
	public String addPerson(@RequestParam("m_name")String m_name,@RequestParam("gender")String gender,@RequestParam("job")String job,
			@RequestParam("permission")String permission,@RequestParam("o_name")String o_name,@RequestParam("password")String password) {
		int igender = Integer.parseInt(gender);
		service.addPerson(m_name,igender,job,permission,o_name,password);
		return "redirect:/backend/person_manger.html";
	}
	@RequestMapping(value="backend/deletePerson")
	public String deletePerson(@RequestBody JSONObject json) {
		int id = json.getObject("sid", Integer.class);
		service.deletePerson(id);
		return "redirect:/backend/person_manger";
	}
	@RequestMapping(value="backend/updatePersonM")
	public String updatePerson(@RequestParam("id")String id,@RequestParam("m_name")String m_name,@RequestParam("gender")String gender,
			@RequestParam("job")String job,@RequestParam("permission")String permission,@RequestParam("password")String password,
			@RequestParam("o_name")String o_name){
		int idi = Integer.parseInt(id);
		service.updatePersonM(idi, m_name, gender, job, permission, password, o_name);
		return "redirect:/backend/person_manger";
	}
}
