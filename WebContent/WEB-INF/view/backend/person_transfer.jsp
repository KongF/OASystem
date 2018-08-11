<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>äººåè°å¨</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/backend/person_transfer.css" rel="stylesheet">
</head> 
<body>
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">äººåè°å¨</a>
			</div>
        </div>

        <div id="inner-bd">

            <div class="button-group">
		        <div class="button current add">
		            <i class="iconfont">&#xe76a;</i>
		            <span class="button-label">ä¿å­</span>
		        </div>
		        
		    </div>
			<div class="kv-group clearfix">
	            <div class="kv-item kv-col-1">
	                <div class="item-lt">é¨é¨ï¼</div>
	                <div class="item-rt">
	                    åäº¬è¿ç¨å­¦ä¹ ä¸­å¿
	                </div>
	            </div>
		    </div>
			<table class="kv-table">
				<tbody>
					<tr>
						<td class="kv-label">
							<div class="wrap">é¨é¨åè®¾æºæï¼</div>
							<div class="wrap">äººåï¼</div>
						</td>
						<td class="kv-content" style="padding: 10px;">
							<div class="wrap">
								<select>
									<option>åäº¬è¿ç¨å­¦ä¹ ä¸­å¿</option>
								</select>
							</div>
							<div class="wrap">
								<select>
									<option>uimaker</option>
								</select>
							</div>
						</td>
						<td class="kv-label">
							è½¬å¥é¨é¨åè®¾æºæï¼
						</td>
						<td class="kv-content">
							<select>
								<option>åå¬å®¤</option>
							</select>
						</td>
					</tr>
					<!-- <tr>
						<td class="kv-label">
							è½¬å¥é¨é¨åè®¾æºæï¼
						</td>
						<td class="kv-content" style="padding: 10px;">
							<select>
								<option>åå¬å®¤</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="kv-label">
							äººåï¼
						</td>
						<td class="kv-content" style="padding: 10px;">
							<select>
								<option>uimaker</option>
							</select>
						</td>
					</tr> -->
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


    $('body').on('click', '.add', function(){
    	layer.open({
    		title: 'å æ£åç±»åæä½ç®¡ç'
    	});
    })
	</script>
    
</body> 
</html>
