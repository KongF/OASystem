<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>人员管理</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/person_manger.css" rel="stylesheet">
<link href="../assets/js/lib/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
<div class="page-content-area">
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">人员管理</a>
			</div>
        </div>

        <div id="inner-bd">
        	
       <!--      <div class="kv-group-outer">
		        <div class="kv-group clearfix">
			        <div class="kv-item-wrap" style="max-width: 900px;">
			        	<div class="kv-item kv-col-1">
			                <div class="item-lt">部门内设机构：</div>
			                <div class="item-rt">
			                    <select>
			                        <option>不限</option>
			                    </select>
			                </div>
			            </div>
			            <div class="kv-item kv-col-2">
			                <div class="item-lt">岗位：</div>
			                <div class="item-rt">
			                    <select>
			                        <option>不限</option>
			                    </select>
			                </div>
			            </div>
			            <div class="kv-item kv-col-3">
			                <div class="item-lt">职级：</div>
			                <div class="item-rt">
			                   <select>
			                        <option>不限</option>
			                    </select>
			                </div>
			            </div>
			            <div class="kv-item">
			                <div class="item-lt">性别：</div>
			                <div class="item-rt">
			                   <select>
			                        <option>不限</option>
			                        <option>女</option>
			                        <option>男</option>
			                    </select>
			                </div>
			            </div>

			            <div class="kv-item kv-col-1">
			                <div class="item-lt">人员名称：</div>
			                <div class="item-rt">
			                   <input type="text" placeholder="填写人员名称" >
			                </div>
			            </div>

			            <div class="kv-item kv-col-2">
			                <div class="item-lt">职务：</div>
			                <div class="item-rt">
			                    <input type="text" placeholder="职务" >
			                </div>
			            </div>
			  
			            <div class="kv-item kv-col-1">
			                <div class="item-lt">权限：</div>
			                <div class="item-rt">
			                    <label><input type="checkbox">管理员</label>
			                    <label><input type="checkbox">员工</label>
			                </div>
			            </div>
			        </div>

		        </div>
		    </div> -->

            <div class="button-group">
		        <div class="button current add">
		            <i class="iconfont">&#xe620;</i>
		            <span class="button-label">新增</span>
		        </div>
		        
		    </div>
			
			<table class="kv-table">
				<tbody>
					<tr>
						<td class="kv-label" style="width:230px;">
							<div id="" class="ztree"></div>
						</td>
						<td class="kv-content" valign="top" style="padding: 10px;width:auto;">
							
							<table class="grid">
								<thead>
									<tr>
										<th class="grid-checkbox"><input type="checkbox"></th>
										<th>序号</th>
										<th>部门内设机构</th>
										<th>姓名</th>
										<th>姓别</th>
										<th>职务</th>
										<th>岗位</th>
										<th>权限</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach var="ani" items="${pagehelper.list}" varStatus="status"  >
									<tr>
										<td class="grid-checkbox"><input type="checkbox"></td>
										<td>${status.count }</td>
										<td>${ani.o_name }</td>
										<td>${ani.m_name }</td>
										<c:choose>
								
										   <c:when test="${ani.gender==0}">
										   		<td>女</td>
										   </c:when>
										   <c:otherwise>  
										 		<td>男</td>
										   </c:otherwise>
										  
										</c:choose>
										<td>${ani.job }</td>
										<td>未指定</td>
										<c:choose>
										   <c:when test="${ani.permission=='admin'}">
										   		<td>管理员</td>
										   </c:when>
										   <c:otherwise>  
										 		<td>用户</td>
										   </c:otherwise>
										</c:choose>
										<td>
											<div class="button update" data-id="${ani.id }" data-gender="${ani.gender }" data-job="${ani.job }" 
											data-permission="${ani.permission }" data-organ="${ani.o_name }" 
											data-password="${ani.password }"data-name="${ani.m_name }">
									            <i class="iconfont">&#xe621;</i>
									            <span class="button-label">修改</span>
									        </div>
									        <div data-id="${ani.id }" class="button delete">
									            <i class="iconfont">&#xe609;</i>
									            <span class="button-label">删除</span>
									        </div>
										</td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<%@ include file="/WEB-INF/view/common/pagehelper.jsp"%>
							<script type="text/javascript">
								function queryAllPerson(pageNum, pageSize) {
					
									$("#changeDiv").load(
											"listuserPage?pageNum="+pageNum+"&pageSize="+pageSize);
					
								}
								</script>
						</td>
					</tr>
				</tbody>
				
			</table>
			
			
        </div>

        <div id="inner-ft">
            
        </div>
    </div>
</div>
</div>
	<script type="text/template" id="addTpl">
		<div class="add-manage">
			<form action="addPerson" method="post" name="apersonform">
			<table class="kv-table">
				<tbody>
					<tr>
						<td class="kv-label">
							姓名：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<input name="m_name" type="text">
						</td>
						<td class="kv-label">
							姓别：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<select name="gender">
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="kv-label">
							职务：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<input name="job" type="text">
						</td>
						<td class="kv-label">
							权限：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<select name="permission">
								<option selected="selected" value="ordinary">员工</option>
								<option value="admin">管理员</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="kv-label">
							部门内设机构：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<select name="o_name">
								<c:forEach var="ani" items="${organs}" varStatus="status"  >
								<option value="${ani.o_name}">${ani.o_name}</option>
								</c:forEach>
							</select>
						</td>
						<td class="kv-label">
							密码：
						</td>
						<td class="kv-content" style="padding: 10px;">
							<input name="password" type="password">
						</td>
					</tr>
					
				</tbody>
				
			</table>
			</form>
		</div>
		
	</script>
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../assets/js/global.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>
	<script type="text/javascript" src="../assets/js/lib/ztree/jquery.ztree.all.min.js"></script>
		
	<script type="text/javascript">

		$('select').select();


    $('body').on('click', '.add', function(){
    	layer.open({
    		title: '添加人员',
    		area:['760px','440px'],
    		content: $('#addTpl').html(),
    		btn:['保存', '取消'],
    		yes:function(){
    			apersonform.submit();
    		}
    	});
    	$('select').select();
    })


    var setting = {
		check: {
			enable: false
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

    var zNodes =[
			{ id:1, pId:0, name:"随意勾选 1", open:true},
			{ id:11, pId:1, name:"随意勾选 1-1", open:true},
			{ id:111, pId:11, name:"随意勾选 1-1-1"},
			{ id:112, pId:11, name:"随意勾选 1-1-2"},
			{ id:12, pId:1, name:"随意勾选 1-2", open:true},
			{ id:121, pId:12, name:"随意勾选 1-2-1"},
			{ id:122, pId:12, name:"随意勾选 1-2-2"},
			{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
			{ id:21, pId:2, name:"随意勾选 2-1"},
			{ id:22, pId:2, name:"随意勾选 2-2", open:true},
			{ id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
			{ id:222, pId:22, name:"随意勾选 2-2-2"},
			{ id:23, pId:2, name:"随意勾选 2-3"}
		];

		$.fn.zTree.init($("#ztree1"), setting, zNodes);
	</script>
    <script type="text/javascript">
    $(".delete").click(function(){
		var id = $(this).data("id");
		console.log(id);
		layer.confirm('您确定要删除吗？', {
			icon: 4,
			title: '确定'
		}, function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: 'json',
			contentType:"application/json",
			url: "deletePerson.html",
			data: JSON.stringify({"sid":id}),
			async: false,
			error: function(request) {
			window.location.href="person_manger"
		},
		success: function(){
			window.location.href='person_manger'
		},
		});
										 
										   
		});
	});
    
    $('body').on('click', '.update', function(){
    	var id = $(this).data("id");
    	var name = $(this).data("name");
    	var gender = $(this).data("gender");
    	var job = $(this).data("job");
    	var permission = $(this).data("permission");
    	var organ = $(this).data("organ");
    	var password = $(this).data("password");
    	layer.open({
    		title: '操作区',
    		area:["800px","310px"],
    		content: '<div class="add-manage">'+
			'<form action="updatePersonM" method="post" name="upersonform">'+
			'<table class="kv-table">'+
				'<tbody>'+
					'<tr>'+
						'<td class="kv-label">'+
							'姓名：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
						'	<input name="m_name" value="'+name+'"type="text">'+
						'	<input name="id" value="'+id+'"type="text" style="display:none">'+
						'</td>'+
						'<td class="kv-label">'+
							'姓别：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
							'<select  name="gender">'+
								'<option value="1">男</option>'+
								'<option value="0">女</option>'+
							'</select>'+
						'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="kv-label">'+
							'职务：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
							'<input name="job" value="'+job+'" type="text">'+
						'</td>'+
						'<td class="kv-label">'+
							'权限：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
							'<select name="permission">'+
								'<option selected="selected" value="ordinary">员工</option>'+
								'<option value="admin">管理员</option>'+
							'</select>'+
						'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="kv-label">'+
							'部门内设机构：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
							'<select name="o_name">'+
								'<c:forEach var="ani" items="${organs}" varStatus="status"  >'+
								'<option value="${ani.o_name}">${ani.o_name}</option>'+
								'</c:forEach>'+
							'</select>'+
						'</td>'+
						'<td class="kv-label">'+
							'密码：'+
						'</td>'+
						'<td class="kv-content" style="padding: 10px;">'+
							'<input name="password" value="'+password+'"type="password">'+
						'</td>'+
					'</tr>'+
					
				'</tbody>'+
			
			'</table>'+
			'</form>'+
		'</div>',
    		btn: ['修改', '关闭'],
    		yes:function(){
    			upersonform.submit();
    		},
    		success:function(){
    			$('select').select();
    		}
    	});
});
 
    </script>
</body> 
</html>
