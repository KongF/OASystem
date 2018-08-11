<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>修改</title> 
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
				<a  href="javascript:;" class="crumbs-label">公告修改</a>
			</div>
        </div>

        <div id="inner-bd">
     
			<div>
			
			   
                <div class="kv-group-outer">
                  <div class="kv-group clearfix">
                      <div class="kv-item">
                          <div class="item-lt">标题：</div>
                          <div class="item-rt">
                              <input type="text" id="title" name="title" value="${notices.title }">
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
                       <div id="editor-year" class="editor">${notices.content }</div>
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
	
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.select.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
	<script type="text/javascript" src="../assets/js/common.js"></script>
	 <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="../assets/js/lib/umeditor/lang/zh-cn/zh-cn.js"></script>

	<script type="text/javascript">
	var ue = UM.getEditor('editor-year');
	
    $(document).on('click', '#submit1', function() {
    	var data = UM.getEditor('editor-year').getContent();
        var title = document.getElementById("title").value;
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
			            url: "updateNotice.html",
				　　　　　　data: JSON.stringify({"id":${notices.id},"data": data, "title":title}),
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
    
   
</body> 
</html>
