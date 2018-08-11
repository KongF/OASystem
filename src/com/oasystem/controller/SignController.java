package com.oasystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.oasystem.model.Sign;
import com.oasystem.service.SignService;

@Controller
public class SignController {
	@Resource
	private SignService SignService;

	/**
	 * 请假列表分页
	 *return
	 **/
	@RequestMapping(value="backend/msignpage")
	public ModelAndView gonggaolistpage(@RequestParam("pageNum") String pageNum,
			@RequestParam("pageSize") String pageSize){
		
		ModelAndView model = new ModelAndView();
		PageInfo<Sign> page = SignService.mlistSign(pageNum, pageSize);
		model.addObject("pagehelper", page);
		model.setViewName("backend/sign_manage");
		return model;
	}
	@RequestMapping(value="project/newSign")
	public String newSign(@RequestBody JSONObject json) {
		int m_id = json.getObject("m_id", Integer.class);
		String lastModifyTime = json.getObject("lastModifyTime", String.class);
		String signHistory = json.getObject("signHistory", String.class);
		int scount = json.getObject("signHistory", Integer.class);
		System.out.println("lastModifyTime"+signHistory+"signHistory"+signHistory);
		SignService.newSign(m_id, lastModifyTime, signHistory,scount);
		return "redirect:/project/sign_day";
	}
}
