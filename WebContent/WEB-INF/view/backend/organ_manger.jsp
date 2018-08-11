<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>机构管理</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/organ_manger.css" rel="stylesheet">
</head> 
<body>
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">机构管理</a>
			</div>
        </div>

        <div id="inner-bd">
        	
            <div class="button-group">
		        <div class="button current add">
		            <i class="iconfont">&#xe620;</i>
		            <span class="button-label">新增</span>
		        </div>
		       
		    </div>
			 
			<table class="kv-table">
				<tbody>
					<tr>
						<td class="kv-label">
							
						</td>
						<td class="kv-content" style="padding: 10px;">
							
							<table class="grid">
								<thead>
								
									<tr>
										<th class="grid-checkbox"><input type="checkbox"></th>
										<th>序号</th>
										<th>部门内设机构</th>
										<th></th>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach var="ani" items="${organs}" varStatus="status"  >
									<tr>
										<td class="grid-checkbox"><input type="checkbox"></td>
										<td>${status.count }</td>
										<td>${ani.o_name }</td>
										<td>
											<div data-id="${ani.id }" data-oname="${ani.o_name }" class="button update">
									            <i class="iconfont">&#xe621;</i>
									            <span class="button-label">修改</span>
									        </div>
										</td>
									</tr>
								</c:forEach>
									
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
				
			</table>
			
			
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

	<script type="text/javascript">

		$('select').select();

     $('body').on('click', '.sort', function(){
    	layer.open({
    		title: '内设机构排序',
    		area:["828px","470px"],
		    content: '<div class="table-zone">'+
             '<table>' +
                '<thead>' +
                  '<tr>' +
                    '<td class="number">序号</td>' +
                    '<td class="dept">部门内设机构</td>' +
                    '<td class="sort">部门排序</td>' +
                  '</tr>' +
                '</thead>' +
                '<tbody>' +
                  '<tr>' +
                    '<td>1</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                  '<tr>' +
                    '<td>1</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                  '<tr>' +
                    '<td>3</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                   '<tr>' +
                    '<td>4</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                   '<tr>' +
                    '<td>5</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                   '<tr>' +
                    '<td>6</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                   '<tr>' +
                    '<td>7</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                   '<tr>' +
                    '<td>8</td>' +
                    '<td>办公室</td>' +
                    '<td><input type="text"></td>' +
                  '</tr>' +
                '</tbody>' +
             '</table>' +
            '</div>'
    	});
    });
	

	$('body').on('click', '.add', function(){
		    	layer.open({
		    		title: '操作区',
		    		area:["800px","310px"],
		    		content: '<table class="kv-table">' +
								'<tbody>' +
									'<tr>' +
										'<td class="kv-label" style="width:167px;">' +
											'单位内设机构名称：'+
										'</td>' +
										'<td class="kv-content" style="padding: 10px; width:auto;">' +
											'<form name="organform" action="addorgan" method="post">'+
											'<input name="o_name" type="text">'+'</form>'+
										'</td>'+
									'</tr>'+
								'</tbody>'+
							'</table>',
		    		btn: ['添加', '关闭'],
		    		yes:function(){
		    			organform.submit();
		    		},
		    		success:function(){
		    			$('select').select();
		    		}
		    	});
	    });
	$('body').on('click', '.update', function(){
		var id = $(this).data('id');
		var oname=$(this).data('oname');
    	layer.open({
    		title: '操作区',
    		area:["800px","310px"],
    		content: '<table class="kv-table">' +
						'<tbody>' +
							'<tr>' +
								'<td class="kv-label" style="width:167px;">' +
									'单位内设机构名称：'+
								'</td>' +
								'<td class="kv-content" style="padding: 10px; width:auto;">' +
									'<form name="organupdate" action="addorgan" method="post">'+
									'<input name="o_name" value="'+oname+'" type="text">'+'</form>'+
									'<input name="id" value="'+id+'" type="text" style="display:none">'+
									'<input name="oldname" value="'+oname+'" type="text" style="display:none">'+	
								'</td>'+
							'</tr>'+
						'</tbody>'+
					'</table>',
    		btn: ['添加', '关闭'],
    		yes:function(){
    			organupdate.submit();
    		},
    		success:function(){
    			$('select').select();
    		}
    	});
});
	
 
	</script>
    
</body> 
</html>
