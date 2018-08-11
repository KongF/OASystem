package com.oasystem.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.oasystem.model.Notices;
import com.oasystem.service.NoticeService;

@Controller
public class NoticeController {
	@Resource 
	private NoticeService noticeservice;
	/**
	 * 请假列表分页
	 *return
	 **/
	@RequestMapping(value="project/listpage")
	public ModelAndView listpage(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> page = noticeservice.listNotices(pageNum, pageSize);
		model.addObject("pagehelper", page);
		model.setViewName("project/list");
		return model;
	}
	@RequestMapping(value="project/mlistpage")
	public ModelAndView mlistpage(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> page = noticeservice.listNotices(pageNum, pageSize);
		model.addObject("pagehelper", page);
		model.setViewName("../backend/list_manage");
		return model;
	}
	@RequestMapping(value="/backend/writeNotice")
	public String writeNotice(@RequestBody JSONObject json) throws IOException {
		String title = json.getObject("title", String.class);
		String data = json.getObject("data", String.class);
		String author = json.getObject("author", String.class);
		int state = 0;
		if(author.equals("admin"))
			state = 1;
		else state=0;
		
		noticeservice.writeNotice(title,data,author,state);
		
		return "backend/list_manage";
	}
	@RequestMapping(value="backend/deleteNotice")
	public String deleteNotice(@RequestBody JSONObject json) {
		int id = json.getObject("id", Integer.class);
		noticeservice.deleteNotice(id);
		return "redirect:/list_manage";
	}
	@RequestMapping(value="backend/stateNotice")
	public String stateNotice(@RequestBody JSONObject json) {
		int id = json.getObject("id", Integer.class);
		int state = json.getObject("state", Integer.class);
		noticeservice.stateNotice(id, state);
		return "redirect:/list_manage";
	}
	@RequestMapping(value="backend/changeNotice")
	public ModelAndView changeNotice(@RequestParam("id")String id) {
		int idi = Integer.parseInt(id);
		ModelAndView modelAndView = new ModelAndView();
		Notices notices = noticeservice.getNoticeById(idi);
		modelAndView.addObject("notices",notices);
		return modelAndView;
		
	}
	@RequestMapping(value="backend/updateNotice")
	public String updateNotice(@RequestBody JSONObject json){
		int id=json.getObject("id", Integer.class);
		String data = json.getObject("data", String.class);
		String title = json.getObject("title", String.class);
		noticeservice.updateNotice(id, data, title);
		return "redirect:/list_manage";
		
	}
}
