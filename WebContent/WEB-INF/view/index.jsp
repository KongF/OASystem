<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>首页</title> 
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/pages/index.css" rel="stylesheet">

 
</head> 
<body>
    <div class="container">
        <div id="inner-hd">
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">首页</a>
			</div>
        </div>
        <div id="inner-bd">
              <div class="inner-bd-wrap clearfix">
                <div class="bd-rt">
                    <div class="split-field yellow">
                        <div class="icon green">
                             <i class="iconfont">&#xe60d;</i>
                        </div>
                        <span class="name">联系方式</span>
                    </div>
                    <div class="phone">
                        <div class="phone-label">
                            <div class="label-icon">
                                <i class="iconfont">&#xe610;</i>
                            </div>
                            <span class="label-name">电话：</span>
                        </div>
                        <ul>
                            <li>000-123456、</li>
                            <li>123456、&nbsp;123456、</li>
                            <li>123456、&nbsp;123456、</li>
                            <li>123456</li>
                        </ul>
                    </div>
                    <div class="fax">
                        <div class="fax-label">
                            <div class="label-icon">
                                <i class="iconfont">&#xe60b;</i>
                            </div>
                            <span class="label-name">传真：</span>
                            <span class="label-value">0000000</span>
                        </div>
                    </div>
                    <div class="email">
                        <div class="email-label">
                            <div class="label-icon">
                                <i class="iconfont">&#xe60f;</i>
                            </div>
                            <span class="label-name">邮件：</span>
                            <span class="label-value">admin@oa.com</span>
                        </div>
                    </div>
                </div>
                <div class="bd-lt">
                    <div class="split-field green">
                        <div class="icon yellow"><i class="iconfont">&#xe628;</i></div>
                        <span class="name">规章制度</span>
                    </div>
                    <div class="process">
                   
                     <div class="notice">
    			
    			<ul class="notice-list">
    			<c:forEach var="ani" items="${pagehelper.list}" varStatus="status"  >
    				<li class="list-item ellipsis">
    					<a href="../inform.html?id=${ani.id }" target="_blank">
    						<i class="rt-icon"></i>
    						${ani.title }
    					</a>
    				</li>
    				</c:forEach>
    				
    			</ul>
    		</div>
                    </div>
                </div>
              </div>
        </div>
        <div id="inner-ft">
            
        </div>
    </div>
</body> 
</html>
