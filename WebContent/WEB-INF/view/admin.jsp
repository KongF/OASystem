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
    				<li class="list-item ellipsis">
    					<a  href="../inform.html?id=${ani.id }" target="_blank">
    						<i class="rt-icon"></i>
    						${ani.title }
    					</a>
    				</li>
    			</ul>
    		</div>
    		<form id="" action="dologin.html" method="post">
    		<div class="login-input">
    			<div class="login-label">管理员登录<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
    			<div class="username">
    				<i class="username-icon"></i>
    				<input type="text" name="username" placeholder="用户">
    			</div>
    			<div class="password">
    				<i class="password-icon"></i>
    				<input type="password" name="password" placeholder="密码">
    			</div>
    			

							<input type="text" name="mark" value="2" style="display:none;" />


			
    			<input class="login-btn" type="submit" style="background:#FFA500;" value="马上登录" />
    			
				

    		</div>
    		</form>
    			
    	</div>
    	
    	

    	
    </div>
    
 

</body> 
</html>
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
