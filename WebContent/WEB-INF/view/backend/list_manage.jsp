<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>学习园地</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/study/list.css" rel="stylesheet">
<link href="../assets/css/project/work_summary.css" rel="stylesheet">
<link href="../assets/js/lib/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
<div class="page-content-area">
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a  href="javascript:;" class="crumbs-label">公告管理</a>
			</div>
        </div>

        <div id="inner-bd">
        	<div class="tab-wraper">
	            <ul class="tab">
	              <li name="month" class="current"><a href="javascript:;">公告管理</a></li>
	              <li name="year"><a href="javascript:;">发布公告</a></li>
	           	</ul>
        	</div>
			<div class="month">
           
			<table class="grid">
				<thead>
					<tr>
						<th class="grid-checkbox"><input type="checkbox"></th>
						<th class="num">序号</th>
						<th class="title">标题</th>
						<th>作者</th>
						<th>时间</th>
						<th>状态</th>
						<th>操作</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="ani" items="${pagehelper.list}" varStatus="status"  >
						<tr>
							<td class="grid-checkbox"><input type="checkbox"></td>
							<td class="num">${status.count }</td>
							<td class="title"><a href="../inform.html?id=${ani.id }">${ani.title }</a></td>
							<td>${ani.author }</td>
							<td>${ani.date }</td>
							<c:choose>
								<c:when test="${ani.state==1 }">
									<td>已发布</td>
									<td>
										<div class="button changeNotice" data-id="${ani.id }">
								            <i class="iconfont">&#xe621;</i>
								            <span class="button-label">修改</span>
								        </div>
								        <div class="button deleteNotice"  data-id="${ani.id }">
								            <i class="iconfont">&#xe609;</i>
								            <span class="button-label">删除</span>
								        </div>
									</td>
									<td>
										<div class="button stateNotice" data-state="0" data-id="${ani.id }">
								            <i class="iconfont">&#xe604;</i>
								            <span class="button-label">撤销发布</span>
								        </div>
									</td>
								</c:when>
								<c:otherwise>
									<td class="text-success">审核中</td>
									<td>
										<div class="button changeNotice"  data-id="${ani.id }">
								            <i class="iconfont">&#xe621;</i>
								            <span class="button-label">修改</span>
								        </div>
								        <div class="button deleteNotice"  data-id="${ani.id }">
								            <i class="iconfont">&#xe609;</i>
								            <span class="button-label">删除</span>
								        </div>
									</td>
									<td>
										<div class="button stateNotice"  data-state="1" data-id="${ani.id }">
								            <i class="iconfont">&#xe622;</i>
								            <span class="button-label">发布</span>
								        </div>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@ include file="/WEB-INF/view/common/pagehelper.jsp"%>
				<script type="text/javascript">
				function queryAllPerson(pageNum, pageSize) {
	
					$("#changeDiv").load(
							"listpage?pageNum="+pageNum+"&pageSize="
									+ pageSize);
	
				}
				</script>
			</div>
			<div class="year">
			
			   
                <div class="kv-group-outer">
                  <div class="kv-group clearfix">
                      <div class="kv-item">
                          <div class="item-lt">标题：</div>
                          <div class="item-rt">
                              <input type="text" id="title" name="title" value="">
                          </div>
                      </div>
                 <div class="button" id="submit1">
		            <i class="iconfont">&#xe622;</i>
		            <span class="button-label">发布</span>
		        </div>
                  </div>
              	</div>
              <table class="kv-table">
                <tbody>
                  <tr>
                    <td class="kv-label" style="width:167px;">正文内容：</td>
                    <td class="kv-content hasEdit" style="width:auto;">
                       <div id="editor-year" class="editor"></div>
                    </td>
                  </tr>
                </tbody> 
             </table>
             
           
            </div>
			
			
        </div>

        <div id="inner-ft">
            
        </div>
    </div>
</div>
</div>
	<script type="text/template" id="addTpl">
		<table class="kv-table">
			<tbody>
				<tr>
					<td class="kv-label">
						标题：
					</td>
					<td class="kv-content" style="padding: 10px;">
						<input type="text" placeholder="标题">
					</td>
				</tr>
				<tr>
					<td class="kv-label">
						内容：
					</td>
					<td class="kv-content" style="padding: 10px;">
						<textarea  placeholder="标题"></textarea>
					</td>
				</tr>
				<tr>
					<td class="kv-label">
						附件：
					</td>
					<td class="kv-content" style="padding: 10px;">
						<a href="javascript:;" class="a-upload">
							<input type="file" name="" id="">选择文件
						</a>
						<span class="text-tip">未选择任何文件</span>
						<div class="button current">
							<span class="button-label">上传附件</span>
						</div>
						<div class="button">
							<span class="button-label">删除附件</span>
						</div>
						<div class="button">
							<span class="button-label">打开附件</span>
						</div>
					</td>
				</tr>
			</tbody>
			
		</table>
	</script>
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>
	 <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="../assets/js/lib/umeditor/lang/zh-cn/zh-cn.js"></script>

	<script type="text/javascript">


    $('body').on('click', '.add', function(){
    	layer.open({
    		title: '添加文章',
    		area:['750px','400px'],
    		content: $('#addTpl').html(),
    		btn:['保存', '保存并发布']
    	});
    })
	</script>
	<script type="text/javascript">
	var ue = UM.getEditor('editor-year');
	
    $(document).on('click', '#submit1', function() {
    	var data = UM.getEditor('editor-year').getContent();
        var title = document.getElementById("title").value;
        var author = localStorage.getItem("username");
        layer.confirm('您确定要发布吗？', {
          icon: 4,
		  title: '确定' //按钮
		}, function(){
			 if(title===""||title===null){
				 layer.confirm('请输入标题', {
			          icon: 4,
					  title: '确定' //按钮
				});
			 }else if(data===""||data===null){
				 layer.confirm('内容不能为空', {
			          icon: 4,
					  title: '确定' //按钮
				})
			 }else{
			    	
			       $.ajax({
			            cache: true,
			            type: "POST",
			            dataType: 'json',
			            contentType:"application/json",
			            url: "writeNotice.html",
				　　　　　　data: JSON.stringify({"data": data, "title":title,"author":author}),
			            async: false,
			            error: function(request) {
			                window.location.href='list_manage'
			            },
			            success: function(){
			                window.location.href='list_manage'
			            }
			        });
			 }
			   
		});
    });

    </script>
    <script type="text/javascript">
    var umYear;
    $('select').select();
    var isYearInit = false;
    $(".tab > li").click(function(){
        $(".tab > li").removeClass("current");
        $(this).addClass("current");
        $(".month,.year").hide();
        $("." + $(".tab >li.current").attr("name")).show();
        if($(this).attr("name") === "year" && !isYearInit){
            umYear = UM.getEditor('editor-year');
            isYearInit = true;
        }
    });
    </script>
    <script type="text/javascript">
    $(".deleteNotice").click(function(){
		var id = $(this).data("id");
		layer.confirm('您确定要删除吗？', {
			icon: 4,
			title: '确定'
		}, function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: 'json',
			contentType:"application/json",
			url: "deleteNotice.html",
			data: JSON.stringify({"id":id}),
			async: false,
			error: function(request) {
			window.location.href="list_manage"
		},
		success: function(){
			window.location.href='list_manage'
		},
		});
										 
										   
		});
	});
    
    $(".stateNotice").click(function(){
		var id = $(this).data("id");
		var state=$(this).data("state");
		layer.confirm('您确定要发布或撤销？', {
			icon: 4,
			title: '确定'
		}, function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: 'json',
			contentType:"application/json",
			url: "stateNotice.html",
			data: JSON.stringify({"id":id,"state":state}),
			async: false,
			error: function(request) {
			window.location.href="list_manage"
		},
		success: function(){
			window.location.href='list_manage'
		},
		});
										 
										   
		});
	});
    $(".changeNotice").click(function(){
		var id = $(this).data("id");
		window.location.href='changeNotice?id='+id
		});
										 
		
    </script>
    
</body> 
</html>
