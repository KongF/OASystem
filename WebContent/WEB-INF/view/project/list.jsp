﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
	<div class="page-content-area">
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">公告查看</a>
			</div>
        </div>

        <div id="inner-bd">
			
			<table class="grid">
				<thead>
					<tr>
						<th class="grid-checkbox"><input type="checkbox"></th>
						<th class="num">序号</th>
						<th class="title">标题</th>
						<th>作者</th>
						<th>时间</th>
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
    
</body> 
</html>
