package com.oasystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.oasystem.model.Leave;
import com.oasystem.service.LeaveService;

@Controller
public class LeaveController {

	@Resource
	private LeaveService leaveService;
	/**
	 * 请假列表分页
	 *return
	 **/
	@RequestMapping(value="backend/leavepage")
	public ModelAndView listleaves(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize,@RequestParam("username")String username){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Leave> page = leaveService.listleaves(pageNum, pageSize,username);
		model.addObject("pagehelper", page);
		model.setViewName("backend/leave");
		return model;
	}
	@RequestMapping(value="backend/meavepage")
	public ModelAndView mlistleaves(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Leave> page = leaveService.mlistleaves(pageNum, pageSize);
		model.addObject("pagehelper", page);
		model.setViewName("backend/leave_manage");
		return model;
	}
	@RequestMapping(value="backend/tleaveState")
	public void tleaveState(@RequestBody JSONObject json) {
		int id = json.getObject("id", Integer.class);
		int state = json.getObject("state", Integer.class);
		leaveService.leaveState((int)id, state);
		
	}
	@RequestMapping(value="backend/gleaveState")
	public void gleaveState(@RequestBody JSONObject json) {
		int id = json.getObject("id", Integer.class);
		int state = json.getObject("state", Integer.class);
		leaveService.leaveState(id,state);
		
	}
	@RequestMapping(value="backend/addLeave")
	public String addLeave(@RequestParam("username")String username,@RequestParam("reason")String reason,@RequestParam("ldate")String ldate,@RequestParam("hdate")String hdate) {
		
		leaveService.addleave(username, reason, ldate, hdate);
		return "redirect:/backend/leave?username="+username;
	}
	@RequestMapping(value="backend/deleteLeave")
	public String deleteLeave(@RequestBody JSONObject json) {
		int id = json.getObject("sid", Integer.class);
		System.out.println(id);
		leaveService.deleteLeave(id);
		return "redirect:/backend/leave";
	}
}
