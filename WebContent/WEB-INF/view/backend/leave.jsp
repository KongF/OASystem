<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>请假</title> 
	<link href="../assets/css/base.css" rel="stylesheet">
	<link href="../assets/css/backend/study/list.css" rel="stylesheet">
	<link href="../assets/js/lib/datepicker/css/bootstrap.css" rel="stylesheet">   
	<link href="../assets/js/lib/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">   
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
				<div class="page-content-area">
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">请假登记</a>
			</div>
        </div>

        <div id="inner-bd">
        	

            <div class="button-group">
		        <div class="button current add">
		            <i class="iconfont">&#xe620;</i>
		            <span class="button-label">提交</span>
		        </div>
		        
		    </div>
			
					<table class="grid">
						<thead>
							<tr>
								<th class="grid-checkbox"><input type="checkbox"></th>
								<th class="num">序号</th>
								<th class="title">原因</th>
								<th>时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach var="ani" items="${pagehelper.list}" varStatus="status"  >
							<tr>
								<td class="grid-checkbox"><input type="checkbox"></td>
								<td class="num">${status.count }</td>
								<td class="title">${ani.reason }</td>
								<td>${ani.ldate }--${ani.hdate }</td>
								<c:choose>
								
								   <c:when test="${ani.state==0 && ani.operation==1 }">
								   		<td>未通过</td>
								   </c:when>
								   <c:when test="${ani.state==1 && ani.operation==1 }">
								   		<td>已同意</td>
								   </c:when>
								   <c:otherwise>  
								 		<td>未审核</td>
								   </c:otherwise>
								  
								</c:choose>
								<td>
									<c:if test="${ani.operation==0 }">
								        <div data-id="${ani.id }" class="button che">
								            <i class="iconfont">&#xe604;</i>
								            <span class="button-label">撤销</span>
								        </div>
									</c:if>
								</td>
							
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
			
			<%@ include file="/WEB-INF/view/common/pagehelper.jsp"%>
				
        </div>

        <div id="inner-ft">
            
        </div>
    </div>
  </div>
</div>
			<script type="text/javascript">
			function queryAllPerson(pageNum, pageSize) {
				var username = localStorage.getItem("username");
				$("#changeDiv").load(
						"leavepage?pageNum="+pageNum+"&pageSize="
								+ pageSize+"&username="+username);

			}
			</script>

	<script type="text/template" id="addTpl">
	<form method="post" name="leaveform" action="addLeave">
		<table class="kv-table">
			<tbody>
				
				<tr>
					<td class="kv-label">
						姓名：
					</td>
					<td class="kv-content" style="padding: 10px;">
						<input type="text" value="" name="username" id="username">
					</td>
				</tr>
				<tr>
					<td class="kv-label">
						请假原因：
					</td>
					<td class="kv-content" style="padding: 10px;">
						
						<textarea name="reason"  placeholder="请假原因"></textarea>
					</td>
				</tr>
				<tr>
					<td class="kv-label">
						时间：
					</td>
					<td class="kv-label" >
							<div class="date" style="width:190px;float:left">
	                            <input type="text" name="ldate" id="ldate" value="开始日期"style="width:150px;">
	                            <i class="iconfont">&#xe784;</i>
	                       </div>
							<div class="date" style="width:190px;float:left">
	                            <input type="text" name="hdate" id="gdate" value="终止日期"style="width:150px;">
	                            <i class="iconfont">&#xe784;</i>
	                       </div>
					</td>
					
				</tr>
			</tbody>
			
		</table>
</form>
		</script>
	
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/global.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>
	
	
<script type="text/javascript" src="../assets/js/lib/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../assets/js/lib/datepicker/locales/bootstrap-datepicker.zh-CN.min.js">
</script>
	<script type="text/javascript">
    $('body').on('click', '.add', function(){
    	
    	
    	layer.open({
    		title: '请假申请',
    		area:['750px','400px'],
    		content: $('#addTpl').html(),
    		btn:['提交'],
    		yes:function(){
    			
    			leaveform.submit();
    		}
    	});
    	$('select').select();
   	 $("#ldate").datepicker({
        "language":"zh-CN",
        "format": 'yyyy-mm-dd'
   	    })
   	    $("#gdate").datepicker({
   	        "language":"zh-CN",
   	        "format": 'yyyy-mm-dd'
   	    })
   	    $(".date .iconfont").click(function(){
   	        $(this).prev().trigger("focus");
   	    });
    });
   
	</script>
    <script type="text/javascript">
 		
	$(".che").click(function(){
		var id = $(this).data("id");
		console.log(id);
		layer.confirm('您确定要撤销该申请吗？', {
			icon: 4,
			title: '确定'
		}, function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: 'json',
			contentType:"application/json",
			url: "deleteLeave.html",
			data: JSON.stringify({"sid":id}),
			async: false,
			error: function(request) {
			window.location.href="leave?username="+localStorage.getItem("username")
		},
		success: function(){
			window.location.href='leave?username='+localStorage.getItem("username")
		},
		});
										 
										   
		});
	});
 
 
					
	 </script>
</body> 
</html>
