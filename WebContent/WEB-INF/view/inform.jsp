<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>通知公告</title> 
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/pages/inform.css" rel="stylesheet">
</head> 
<body>
	<div class="notice-title">
        <i class="notice-icon"></i>
        <span>通知公告</span>
    </div>
    <div class="notice-name">${notice.title }</div>
    <div class="notice-time">发布日期:${notice.date }</div>
    <div class="notice-wrap">
        <div class="notice-content">
            <p>${notice.content }</p>
        </div>
    </div>
</body> 
</html>
