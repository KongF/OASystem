<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>签到</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/summarize.css" rel="stylesheet">
</head> 
<body>
<div class="am-form am-g" id="changeDiv">
<div class="page-content-area">
    <div class="container">
       

        <div id="inner-bd">
        	<div class="tab-wraper">
        		<ul class="tab">
		           	<li class="current"><a href="javaScript:;">员工考勤信息</a></li>
	            </ul>
        	</div>
            


           <!--  <div class="kv-group-outer">
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
						<th>签到次数</th>
						<th>时间</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="ani" items="${pagehelper.list}" varStatus="status">
						<tr>
							<td class="grid-checkbox"><input type="checkbox"></td>
							<td class="num">${ani.m_name }</td>
							<td class="title">${ani.scount }</td>
							<td class="num">${ani.lastModifyTime }</td>
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
							"msignpage?pageNum="+pageNum+"&pageSize="
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

		$('select').select();


    $('body').on('click', '.add', function(){
    	layer.open({
    		title: '加扣分类型操作管理'
    	});
    })
	</script>
    
</body> 
</html>
