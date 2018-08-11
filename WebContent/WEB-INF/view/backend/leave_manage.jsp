<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>工作总结会退</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/summarize.css" rel="stylesheet">
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
<div class="page-content-area">
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">请假申请管理</a>
			</div>
        </div>

        <div id="inner-bd">
        	<div class="tab-wraper">
        		<ul class="tab">
		           	<li class="current"><a href="javaScript:;">请假申请管理</a></li>
	            </ul>
        	</div>
            


            <div class="kv-group-outer">
		        <div class="kv-group clearfix">
		            <div class="kv-item kv-col-1">
		                <div class="item-lt">年份：</div>
		                <div class="item-rt">
		                    <select>
		                        <option>2015年</option>
		                    </select>
		                </div>
		            </div>
		            <div class="kv-item kv-col-2">
		                <div class="item-lt">周期：</div>
		                <div class="item-rt">
		                    <select>
		                        <option>第一季度</option>
		                        <option>第二季度</option>
		                        <option>第三季度</option>
		                    </select>
		                </div>
		            </div>
		            <div class="kv-item">
		                <div class="item-lt">部门：</div>
		                <div class="item-rt">
		                   <select>
		                        <option>全部</option>
		                        <option>办公室</option>
		                    </select>
		                </div>
		            </div>

		            <div class="kv-item kv-col-1">
		                <div class="item-lt">人员名称：</div>
		                <div class="item-rt">
		                   <input type="text" placeholder="填写人员名称" >
		                </div>
		            </div>
		        </div>
		    </div>

           <!--  <div class="button-group">
		        <div class="button current" id="tuis">
		            <i class="iconfont">&#xe614;</i>
		            <span class="button-label">批量回退</span>
		        </div>
		        <div class="button current" id="guos">
		            <i class="iconfont">&#xe614;</i>
		            <span class="button-label">批量通过</span>
		        </div>
		    </div> -->
			
			<table class="grid">
				<colgroup>
					<col width="50"></col>
					<col width="70"></col>
					<col width="*"></col>
					<col width="150"></col>
				</colgroup>
				<thead>
					<tr>
						<th class="grid-checkbox"><input type="checkbox"></th>
						<th class="num">人员</th>
						<th>原因</th>
						<th>时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="ani" items="${pagehelper.list}" varStatus="status">
						<tr>
							<td class="grid-checkbox"><input id="flag" type="checkbox" value="${status.index}"></td>
							<td class="num">${ani.m_name }</td>
							<td class="title">${ani.reason }</td>
							<td class="num">${ani.ldate }--${ani.hdate }</td>
							<c:choose>
								
								   <c:when test="${ani.state==0 && ani.operation==1 }">
								   		<td class="text-success">未通过</td>
								   </c:when>
								   <c:when test="${ani.state==1 && ani.operation==1 }">
								   		<td class="text-success">已同意</td>
								   </c:when>
								   <c:otherwise>  
								 		<td>未审核</td>
								   </c:otherwise>
								  
								</c:choose>
							<td>
								<c:if test="${ani.operation==0 }">
								<div data-id="${ani.id }" class="button current tui"><span class="button-label">回退</span></div>
								<div data-id="${ani.id }" class="button current guo"><span class="button-label">同意</span></div>
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
	
					$("#changeDiv").load(
							"meavepage?pageNum="+pageNum+"&pageSize="
									+ pageSize);
	
				}
			</script>
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../assets/js/global.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>
 <script type="text/javascript">
 		
	$(".tui").click(function(){
		var id = $(this).data("id");
		layer.confirm('您确定要拒绝该申请吗？', {
			icon: 4,
			title: '确定'
		}, function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: 'json',
			contentType:"application/json",
			url: "tleaveState.html",
			data: JSON.stringify({"state":0,"id":id}),
			async: false,
			error: function(request) {
			window.location.href='leave_manage'
		},
		success: function(){
			window.location.href='leave_manage'
		},
		});
										 
										   
		});
	});
 
 
					
	 </script>
	<script type="text/javascript">

		$('select').select();


    $('body').on('click', '.add', function(){
    	layer.open({
    		title: '加扣分类型操作管理'
    	});
    })
	</script>
	
						
   
	 <script type="text/javascript">
		$(document).on('click', '.guo', function() {
			var id = $(this).data("id");			    	
			layer.confirm('您确定要同意该申请吗？', {
			icon: 4,
			title: '确定' //按钮
			}, function(){
				$.ajax({
				cache: true,
				type: "POST",
				dataType: 'json',
				contentType:"application/json",
				url: "gleaveState.html",
				data: JSON.stringify({"state": 1,"id":id}),
				async: false,
				error: function(request) {
					window.location.href='leave_manage'
				},
				success: function(){
					window.location.href='leave_manage'
				}
				});
										 
										   
				});
			});
							
	</script>
</body> 
</html>
