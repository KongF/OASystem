<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>个人信息</title> 
    <link href="../assets/js/lib/datepicker/css/bootstrap.css" rel="stylesheet">   
<link href="../assets/js/lib/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">   
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/project/userinfo.css" rel="stylesheet">
<script type="text/javascript">
       function myform()
       {
          userform.submit();
       }
    </script>

</head> 
<body>
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">个人信息</a>
			</div>
        </div>
	<form name="userform" action="updateUser" method="post">
        <div id="inner-bd">
            <div class="button-group">
				<div class="button current save" onclick="myform();">
					<i class="iconfont">&#xe76a;</i>
					<span class="button-label">保存</span>  
				</div>
			</div>
		<!-- 	<input type="text" name="sname" value="" /> -->
			<table class="kv-table">
				<tbody>
					<tr>
						<td class="kv-label">姓名</td>
						<td class="kv-content">${userinfo.m_name}</td>
						<input type="text" name="userid" value="${userinfo.id}" style="display:none"/>
						<td class="kv-label">性别</td>
						<td class="kv-content">
							<select name="gender">
							<c:choose>
								<c:when test="${userinfo.gender==0}">
								<option value="1">男</option>
								<option selected="selected" value="0">女</option>
								</c:when>
								<c:otherwise>
								<option selected="selected" value="1">男</option>
								<option value="0">女</option>
								</c:otherwise>
							</c:choose>
							
							
								
							</select>
						</td>
						
						<td class="kv-label">出生年月</td>
						<td class="kv-content">
							<div class="date">
	                            <input type="text" name="birth" id="born" value="${userinfo.birth }">
	                            <i class="iconfont">&#xe784;</i>
	                       </div>
						</td>
					</tr>
					
					<tr>
						<td class="kv-label">政治面貌</td>
						<td class="kv-content">
							<input type="text" name="zhengzhi" value="${userinfo.zhengzhi }">
						</td>
						
						<td class="kv-label">现任职时间</td>
						<td class="kv-content" colspan="3">
							<div class="date">
	                            <input type="text" name="rz_time" value="${userinfo.rz_time }" id="now">
	                            <i class="iconfont">&#xe784;</i>
	                       </div>
						</td>
						
					</tr>
					
					<tr>
						<td class="kv-label">职务</td>
						<td class="kv-content" colspan="5">
							<div class="textarea-wrap">
								<textarea name="job">${userinfo.job }</textarea>
							</div>
						</td>
					</tr>
					
					
					
				</tbody>
				
			</table>
			
	</form>	
        </div>

        <div id="inner-ft">
            
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../assets/js/global.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>

<script type="text/javascript" src="../assets/js/lib/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../assets/js/lib/datepicker/locales/bootstrap-datepicker.zh-CN.min.js">
</script>
    <script type="text/javascript">
    	   $('body').on('click', '.save', function(){
		    	layer.open({
		    		title: '信息提示',
		    		area:["500px","218px"],
		    		content: '<div class="content-wrap">'+
					    		'<div class="content-left"></div>'+
					    		'<div class="content-right">'+
						    		'<div class="result">保存成功！</div>'+
						    		'<div class="tip">确定请点击确定按钮，否则请关闭！</div>'+
					    		'</div>' +
					    	 '</div>'
		    	});
		    })
    	   $('select').select();
    	   $("#born").datepicker({
	        "language":"zh-CN",
	        "format": 'yyyy-mm-dd'
		    })
		    $("#now").datepicker({
		        "language":"zh-CN",
		        "format": 'yyyy-mm-dd'
		    })
		    $(".date .iconfont").click(function(){
		        $(this).prev().trigger("focus");
		    });
    </script>
</body> 
</html>
