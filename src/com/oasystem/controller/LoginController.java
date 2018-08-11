package com.oasystem.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.oasystem.model.Notices;
import com.oasystem.service.MainService;
import com.oasystem.service.NoticeService;
import com.oasystem.service.UserService;

@Controller
public class LoginController {

	@Resource
	private MainService service;
	@Resource
	private UserService userService;
	@Resource 
	private NoticeService noticeService;
	private UsernamePasswordToken token;

	@RequestMapping(value = "login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> list_page = noticeService.listNotices(null,null);
		model.addObject("pagehelper",list_page);
		return model;
	}

	@RequestMapping(value = "admin")
	public ModelAndView  admin() {
		ModelAndView model = new ModelAndView();
		PageInfo<Notices> list_page = noticeService.listNotices(null,null);
		model.addObject("pagehelper",list_page);
		return model;
	}
	
	@RequestMapping(value = "dologin")
	public String doLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String mark = request.getParameter("mark");
		System.out.println("userName" + userName);
		System.out.println("password" + password);
		System.out.println("mark" + mark);
		
		// Shiro

		/**
		 * 第一步：收集用户身份和证明
		 */
		System.out.println("第一步：收集用户身份和证明");
		token = new UsernamePasswordToken(userName, password);// 创建用户名/密码身份验证Token（即用户身份/凭证）
		token.setRememberMe(true);
		System.out.println("第一步：收集用户身份和证明结束");
		/**
		 * 第二步：提交身份和证明
		 */
		System.out.println("第二步：提交身份和证明");
		Subject subject = SecurityUtils.getSubject(); // 得到Subject
		System.out.println("第二步：提交身份和证明2222");

		try {
			subject.login(token);// 进行身份验证
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.getRequestDispatcher("error2.html").forward(request,
					response);
		}
		if (subject.isAuthenticated()&&mark!=null) {
			System.out.println(mark);
			int id = userService.getUserId(userName,password);
			switch (mark) {
			case "1":
				// 进行权限验证
				if (subject.hasRole("ordinary")) {
					request.getRequestDispatcher(
							"main2.html?username=" + userName+"&id="+id).forward(
							request, response);
				} else {
					request.getRequestDispatcher("error.html").forward(request,
							response);
				}
				break;
			case "2":
				// 进行权限验证
				if (subject.hasRole("admin")) {
					request.getRequestDispatcher(
							"main.html?username=" + userName+"&id="+id).forward(
							request, response);
				} else {
					request.getRequestDispatcher("error.html").forward(request,
							response);
				}
				break;
			default:
				request.getRequestDispatcher("error.html").forward(request,
						response);
				break;
			}
		} else {
			System.out.println("123456789");
			return "error";
		}
		return null;

	}

	@RequestMapping("error")
	public String error() {
		return "error";
	}
	
	@RequestMapping("error2")
	public String error2() {
		return "error2";
	}

	/**
	 * 添加用户信息
	 * 
	 * @param username
	 * @param password
	 * @param permission
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "register")
	public String addUser(@Param("username")String username,@Param("gender")String gender,@Param("phone")String phone,@Param("email")String email, @Param("password")String password)
			throws UnsupportedEncodingException {
		username = new String(username.getBytes("iso-8859-1"), "UTF-8");
		System.out.println("-----------------------------------");
		System.out.println(username+gender+phone+email+password+"ordinary");
		service.addUser(username,gender,phone,email,password,"ordinary");
		return "login";
	}
	@RequestMapping(value="ValidateName")
	public String ValidateName(@RequestBody JSONObject json){
		String loginName = json.getObject("loginName", String.class);
		System.out.println("-------------"+loginName);
		userService.ValidateName(loginName);
		return "true";
	}

	/**
	 * 删除用户操作
	 * 
	 * @param id
	 */
	public void deleteUser(@RequestParam("id") String id) {
		
		service.deleteUser(Integer.parseInt(id));
	}

	/**
	 * 修改用户操作
	 * 
	 * @param id,gender,birth,zhengzhi,rz_time,job
	 * @throws UnsupportedEncodingException
	 */
	/*@RequestMapping(value="updateUser")
	public String UpdataUser(@RequestParam("id")String id,@RequestParam("gender")String gender,@RequestParam("birth")String birth,@RequestParam("zhengzhi")String zhengzhi,@RequestParam("rz_time")String rz_time,@RequestParam("job")String ,)
			throws UnsupportedEncodingException {
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String zhengzhi = request.getParameter("zhengzhi");
		String rz_time = request.getParameter("rz_time");
		String job = request.getParameter("")
		if(permission.equals("1")){
			permission = "管理员";
		}
		if(permission.equals("2")){
			permission = "员工";
		}
		service.UpdataUser(Integer.parseInt(id), username, password, permission);
		return "project/userinfo";
	}
*/
	/**
	 * 初始化用户管理页面
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "User")
	public ModelAndView User(HttpServletRequest request)
			throws UnsupportedEncodingException {
		ModelAndView model = new ModelAndView();
		String username = request.getParameter("username");
		if (username != null) {
			username = new String(username.getBytes("iso-8859-1"), "UTF-8");
			//List<Users> list = service.getUser();
			//model.addObject("User", list);
			model.addObject("username", username);
			model.setViewName("User");
		} else {
			model.setViewName("error");
		}

		return model;
	}

}
