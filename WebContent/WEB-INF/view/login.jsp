   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>OA办公系统</title> 
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/platform/login.css" rel="stylesheet">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/login.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		
		//打开会员注册
		$("#Regist_start_").click(function() {
			$("#login_container").hide();
			$("#_close").show();
			$("#_start").animate({
				left: '350px',
				height: '520px',
				width: '400px'
			}, 500, function() {
				$("#regist_container").show(500);
				$("#_close").animate({
					height: '40px',
					width: '40px'
				}, 500);
			});
		});
		//关闭
		$("#_close").click(function() {
			
			$("#_close").animate({
				height: '0px',
				width: '0px'
			}, 500, function() {
				$("#_close").hide(500);
				$("#login_container").hide(500);
				$("#regist_container").hide(500);
				$("#_start").animate({
					left: '0px',
					height: '0px',
					width: '0px'
				}, 500);
			});
		});
		
	});
</script>

<script type="text/javascript">
       function myCheck1()
       {
          form1.submit();
       }
       
    </script>
</head> 
<body>
	<div class="left-bg"></div>
    <div class="right-bg"></div>
    <div class=""></div>
    <div class="login-center">
				
    	<div class="login-content">
    		<div class="notice">
    			<div class="notice-title">
    				<i class="notice-icon"></i>
    				<span>通知公告</span>
    			</div>
    			<ul class="notice-list">
    			<c:forEach var="ani" items="${pagehelper.list}" varStatus="status"  >
    				<li class="list-item ellipsis">
    					<a href="../inform.html?id=${ani.id }" target="_blank">
    						<i class="rt-icon"></i>
    						${ani.title }
    					</a>
    				</li>
    				</c:forEach>
    				
    			</ul>
    		</div>
    		<form name="form1" action="dologin.html" method="post">
    		<div class="login-input">
    			<div class="login-label">用户登录<span>&nbsp;&nbsp;&nbsp;&nbsp;</span><a id="Regist_start_" class="" style="width:100px;height:40px;border-radius: 0;">注册</a></div>
    			<div class="username">
    				<i class="username-icon"></i>
    				<input type="text" name="username" placeholder="用户">
    			</div>
    			
    			<div class="password">
    				<i class="password-icon"></i>
    				<input type="password" name="password" placeholder="密码">
    			</div>
    			

							<input type="text" name="mark" value="1" style="display:none;" />


			
    			<input class="login-btn" type="submit" value="马上登录" onclick="myForm1();" />
    			
				

    		</div>
    		</form>
    		
    		
    	 <!-- 会员登录  -->
			<!--<div id='Login_start' style="position: absolute;" >-->
			<div id='_start'>
				<div id='_close' style="display: none;">
					<span class="glyphicon glyphicon-remove"></span>
				</div>
				<br /> 
				<form name="form2" action="register"  method="post">
					<!-- 会员注册 register.html -->
					<div id='regist_container' style="display: none;">
						<div id="lab1">
							<span id="lab_login">注册</span>
						</div>
						
						<div id="form_container2" style="padding-top: 25px;">
							
							<input type="text" class="form-control" name="username" value="" placeholder="真实姓名" id="regist_account">
							<select name="gender" style="color:black;margin:center;">
								  <option value="1">男</option>
								  <option value="0">女</option>
							</select>
							<input type="password" class="form-control" placeholder="密码" name="password" id="regist_password1" />
							<input type="password" class="form-control" placeholder="确认密码"  id="regist_password2" />
							<input type="text" class="form-control" placeholder="手机号" name="phone" id="regist_phone" />
							<input type="text" class="form-control" placeholder="邮箱" name="email" id="regist_email" />
				
						</div>
						<div class="button  btn-success current regist_btn">
				            <span class="button-label">注册</span>
				        </div>
					
						
					</div>
				</form>
			</div>
    		
    	</div>
    	
    	

    	
    </div>
    
 

</body> 
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/global.js"></script>
<script type="text/javascript" src="assets/js/lib/layer/layer.js"></script>
    
<script type="text/javascript">
$('body').on('click', '.notice-list>li>a', function(){
     layer.open({
        type: 2,
        title: '',
        shadeClose: true,
        shade: 0.8,
        area: ['1100px', '640px'],
        content: 'inform.html' //iframe的url
    }); 
})
   
</script>
<script type="text/javascript">
$(".regist_btn").click(function(){
		var loginName=document.getElementById("regist_account").value; 
		 var pwd=document.getElementById("regist_password1").value;
		 var pwd2 = document.getElementById("regist_password2").value;
		
		if(loginName == "")     
		{   alert("用户名不能为空!");  
		return;  
		}else if(pwd == ""){
			alert("密码不能为空!"); 
		} else if(pwd !=pwd2 ){
			alert("请确认密码");
		}else{
		form2.submit();
		}   
									 
});

</script>

</html>
