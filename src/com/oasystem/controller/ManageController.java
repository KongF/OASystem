package com.oasystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.oasystem.model.Leave;
import com.oasystem.model.Notices;
import com.oasystem.model.Organ;
import com.oasystem.model.Sign;
import com.oasystem.model.Users;
import com.oasystem.service.LeaveService;
import com.oasystem.service.NoticeService;
import com.oasystem.service.OrganService;
import com.oasystem.service.SignService;
import com.oasystem.service.UserService;
import com.oasystem.util.StringUtil;
@Controller
public class ManageController {
	@Resource
	private UserService UserService;
	@Resource 
	private LeaveService leaveService;
	@Resource
	private NoticeService noticeService;
	@Resource
	private OrganService organService;
	@Resource 
	private SignService SignService;
	@RequestMapping(value = "main")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mainModel = new ModelAndView();
		String username = request.getParameter("username");
		String id = request.getParameter("id");
		List<Notices> notices = noticeService.listNotice("5");
		List<String> notice =new ArrayList<String>();
		for(Notices n: notices) {
			notice.add(n.getTitle());
		}
		mainModel.addObject("username", username);
		mainModel.addObject("userId", id);
		mainModel.addObject("notices", notice);
		return mainModel;
	}
	@RequestMapping(value = "main2")
	public ModelAndView login2(HttpServletRequest request) {
		ModelAndView mainModel = new ModelAndView();
		String username = request.getParameter("username");
		String id = request.getParameter("id");
		List<Notices> notices = noticeService.listNotice("5");
		List<String> notice =new ArrayList<String>();
		for(Notices n: notices) {
			notice.add(n.getTitle());
		}
		mainModel.addObject("username", username);
		mainModel.addObject("userId", id);
		mainModel.addObject("notices", notice);
		return mainModel;
	}
	@RequestMapping(value="index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		List<Notices> notices = noticeService.listNotice("10");
		model.addObject("notices", notices);
		return model;
	}
	
	@RequestMapping(value = "project/sign_day")
	public ModelAndView sign_day(@RequestParam("userID")String userID) {
		int userId  = Integer.parseInt(userID);
		ModelAndView smodel = new ModelAndView();
		Sign sign = SignService.getHistory(userId);
		StringUtil stringUtil = new StringUtil();
		List<String> stringdate = stringUtil.cutString(sign.getSignHistory());
		for(String s:stringdate) {
			System.out.println(s);
		}
		smodel.addObject("slist", stringdate);
		return smodel;
	}
	@RequestMapping(value = "backend/leave")
	public ModelAndView leave(@RequestParam("username")String username) {
		ModelAndView l_model = new ModelAndView();
		PageInfo<Leave> page = leaveService.listleaves(null, null,username);
		l_model.addObject("pagehelper", page);
		l_model.setViewName("backend/leave");
		return l_model;
	}
	
	@RequestMapping(value = "project/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> list_page = noticeService.listNotices(null,null);
		model.addObject("pagehelper",list_page);
		model.setViewName("project/list");
		return model;
	}
	@RequestMapping(value = "backend/organ_manger")
	public ModelAndView organ_manger() {
		ModelAndView om_model = new ModelAndView();
		List<Organ> organs = organService.getOrgan();
		om_model.addObject("organs", organs);
		return om_model;
	}
	
	@RequestMapping(value = "backend/person_manger")
	public ModelAndView person_manger() {
		ModelAndView pmmodel = new ModelAndView();
		PageInfo<Users> users = UserService.listUsers(null,null);
		List<Organ> organs = organService.getOrgan();
		pmmodel.addObject("pagehelper",users);
		pmmodel.addObject("organs",organs);
		return pmmodel;
	}
	@RequestMapping(value = "backend/sign_manage")
	public ModelAndView sign_manger() {
		ModelAndView smodel = new ModelAndView();
		PageInfo<Sign> signs = SignService.mlistSign(null, null);
		smodel.addObject("pagehelper",signs);
		return smodel;
	}
	@RequestMapping(value = "backend/leave_manage")
	public ModelAndView leave_manage() {
		ModelAndView lmodel = new ModelAndView();
		PageInfo<Leave> mleaves = leaveService.mlistleaves(null, null);
		lmodel.addObject("pagehelper",mleaves);
		return lmodel;
	}
	@RequestMapping(value = "backend/attendance_record")
	public String attendance_record() {

		return "backend/attendance_record";
	}
	@RequestMapping(value = "backend/list_manage")
	public ModelAndView list_manage() {
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> list_page = noticeService.mlistNotices(null,null);
		model.addObject("pagehelper",list_page);
		model.setViewName("backend/list_manage");
		return model;
	}
	@RequestMapping(value = "backend/person_transfer")
	public String person_transfer() {
		return "backend/person_transfer";
	}
	@RequestMapping(value = "inform")
	public ModelAndView inform(@RequestParam("id")String id) {
		ModelAndView model = new ModelAndView();
		int id1 = Integer.parseInt(id);
		Notices notices = noticeService.getNotices(id1);
		model.addObject("notice", notices);
		return model;
	}
	@RequestMapping(value="backend/organupdate")
	public String organupdate(@RequestParam("id")String id,@RequestParam("oname")String oname,@RequestParam("oldname")String oldname) {
		int idi = Integer.parseInt(id);
		organService.updateOrgan(idi,oname,oldname);
		return "redirect:/backend/organ_manager";
	}
	
	
}
