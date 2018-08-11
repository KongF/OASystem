<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>每日签到</title> 
<link href="../assets/css/base.css" rel="stylesheet">
<link href="../assets/css/project/normal_exam.css" rel="stylesheet">
<link href="../assets/js/lib/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">

<style type="text/css">
		 *{
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .home {
                width: 100%;
            }

            .thead {
                width: 100%;
            }

            .thead li {
                float: left;
                width: 14.28%;
                text-align: center;
            }

            .home tbody>tr>td {
            	border: 1px #fff solid;
                width: 14.28%;
                height: 40px;
                background: #ececec;
                text-align: center;
            }

            button{
                width: 100px;
                height: 40px;
                font-size: 20px;
                float: left;
            }

            #month {
                text-align: center;
            }

            .qiandao {
                color: red;
            }
</style>
</head> 
<body>
    <div class="container">
        <div id="inner-hd" >
            <div class="crumbs">
				<i class="crumbs-arrow"></i>
				<a href="javascript:;" class="crumbs-label">签到</a>
			</div>
        </div>

        <div id="inner-bd">
        
        		<div id="button" class="button current save">
					<span class="button-label">签&nbsp;&nbsp;到</span>  
				</div>
				<div id="button2" class="button current save">
					<span class="button-label">签到天数</span>  
				</div>
				<div id="button3" class="button current save">
					<span class="button-label">查询上月</span>  
				</div>
				<div id="button4" class="button current save">
					<span class="button-label">返&nbsp;&nbsp; 回</span>  
				</div>
		       
	       <div class="home">
       			<h1 id="month"></h1>
        		<table cellspacing="1" cellpadding="1" class="home">
	            	<ul class="thead">
		                <li>日</li>
		                <li>一</li>
		                <li>二</li>
		                <li>三</li>
		                <li>四</li>
		                <li>五</li>
		                <li>六</li>
	            	</ul>
            		<tbody id="tbody"></tbody>
        		</table>
        	
		    </div>
	        
        </div>
        <div id="inner-ft">
            
        </div>
    </div>
  <script type="text/javascript" src="../assets/js/jquery.js"></script>
  <script type="text/javascript" src="../assets/s/global.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.select.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.pagination.js"></script>
  <script type="text/javascript" src="../assets/js/lib/layer/layer.js"></script>
  <script type="text/javascript" src="../assets/js/common.js"></script>
  <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="../assets/js/lib/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" src="../assets/js/lib/umeditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
    
  //本地模拟已签到日期天数
    var localDate = {
        date: []
    }
   var arrlist = new Array();
  arrlist="${slist}".replace("[","").replace("]","").split(',');
  for(var i=0;i<arrlist.length;i++){
  arrlist[i] = arrlist[i].replace(/^\s*/,"");}
  localDate.date=arrlist;
   

    //初始化日期数据
    var slidate = new Date();
    var x = slidate.getMonth() + 1;
    var n = slidate.getMonth();
    var monthFirst = new Date(slidate.getFullYear(), parseInt(n), 1).getDay(); //获取当月的1日等于星期几
    var m = slidate.getMonth() + 1;
    var d = new Date(slidate.getFullYear(), parseInt(m), 0); //获取月
    var conter = d.getDate(); //获取当前月的天数
    var monthNum = "0" + (slidate.getMonth() + 1) + "月";
    var monthCheck = (slidate.getMonth() + 1);
    var y = slidate.getDate();

    function initall() {
        dateHandler(monthFirst, d, conter, monthNum);
        checkDate(monthCheck);
    }

    function dateHandler(monthFirst, d, conter, monthNum) {
        var u = 1;
        var blank = true;
        var $tbody = $('#tbody'),
            $month = $("#month"),
            _nullnei = '';
        var p = document.createElement("p");
        var monthText = document.createTextNode(monthNum);
        p.appendChild(monthText);
        $month.append(p);
        //遍历日历网格
        for(var i = 1; i <= 6; i++) {
            _nullnei += "<tr>";
            for(var j = 1; j <= 7; j++) {
                _nullnei += '<td></td>';
            }
            _nullnei += "</tr>";
        }
        $tbody.html(_nullnei);

        //遍历网格内容
        var $slitd = $tbody.find("td");
        for(var i = 0; i < conter; i++) {
            $slitd.eq(i + monthFirst).html("<p>" + parseInt(i + 1) + "</p>")
        }
        //给有日期的td加上id
        var dayBlock = document.getElementsByTagName("td");
        for(var i = 0; i < dayBlock.length; i++) {
            if(dayBlock[i].textContent != "") {
                dayBlock[i].setAttribute("id", "td" + u);
                u++;
            }
        }
        //若日期不足排满每一行的tr，则删除最后一个tr
        var blankTr = document.getElementsByTagName("tr");
        var blankTd = blankTr[5].getElementsByTagName("td");
        for(var i = 0; i < blankTd.length; i++) {
            if(blankTd[i].textContent != "") {
                blank = false;
            }
        }
        if(blank == true) {
            blankTr[5].remove();
        }
    }

    function checkDate(prep) {
        var dateArray = [];
        var newArray = [];
        //删除不是本月的日期
        for(var i = 0; i < localDate.date.length; i++) {
            dateArray.push(localDate.date[i]);
        }
        for(var i = 0; i < dateArray.length; i++) {
            if(dateArray[i].charAt(1) != prep) {
                dateArray[i] = undefined;
            }
        }
        for(var i = 0; i < dateArray.length; i++) {
            if(dateArray[i] != undefined) {
                newArray.push(dateArray[i]);
            }
        }
        //遍历数组为已签到日期添加class
        for(var i = 0; i < newArray.length; i++) {
            if(newArray[i].charAt(2) == 0) {
                for(var j = 0; j < 10; j++) {
                    if(newArray[i].charAt(3) == j) {
                        var checked = "#td" + j;
                        $(checked).addClass("qiandao");
                    }
                }
            } else if(newArray[i].charAt(2) == 1) {
                for(var j = 0; j < 10; j++) {
                    if(newArray[i].charAt(3) == j) {
                        var checked = "#td1" + j;
                        $(checked).addClass("qiandao");
                    }
                }
            } else {
                for(var j = 0; j < 10; j++) {
                    if(newArray[i].charAt(3) == j) {
                        var checked = "#td2" + j;
                        $(checked).addClass("qiandao");
                    }
                }
            }
        }
    }
    //当天签到添加样式
    $("#button").on("click", function() {
        $("tr").remove();
        $("p").remove();
        dateHandler(monthFirst, d, conter, monthNum);
        checkDate(monthCheck);
        var thisDay = "#td" + y;
        var checkPic = false;
        if(m > 10 && y < 10) {
            var thisBlock = m.toString() + y.toString();
        } else if(m < 10 && y > 10){
            var thisBlock = "0" + m.toString() + y.toString();
        }else if(m > 10 && y < 10){
            var thisBlock = m.toString() + "0" + y.toString();
        }else if(m < 10 && y < 10){
            var thisBlock = "0" + m.toString() + "0" + y.toString();
        }
        for(var e = 0; e < localDate.date.length; e++) {
            if(localDate.date[e] === thisBlock) {
                checkPic = true;
            }
        }
        if(checkPic == true) {
            
            layer.confirm('您今天已经签到了！', {
                icon: 4,
  			  title: '确定' //按钮
  			});
        } else {
            $(thisDay).addClass("qiandao");
           
            layer.confirm('已签到', {
                icon: 4,
  			  title: '确定', //按钮
  			  yes:function(){
  				$.ajax({
  					cache: true,
  					type: "POST",
  					dataType: 'json',
  					contentType:"application/json",
  					url: "newSign.html",
  					data: JSON.stringify({"m_id": localStorage.getItem("userId"),"scount":localDate.date.length,"lastModifyTime":thisBlock,signHistory:thisBlock}),
  					async: false,
  					error: function(request) {
  						window.location.href='sign_day?userID='+localStorage.getItem("userId")
  					},
  					success: function(){
  						window.location.href='sign_day?userID='+localStorage.getItem("userId")
  					}
  					});
  				  layer.close();
  			  }
  			});
            localDate.date.push(thisBlock);
           
        }
    })

    //查询已签到天数
    $("#button2").on("click", function() {
        
        layer.confirm('您已经签到了'+ localDate.date.length + "天！", {
            icon: 4,
			  title: '确定' //按钮
			});
        
    })
    //查询历史记录
    $("#button3").on("click", function() {
        $("tr").remove();
        $("p").remove();
        if(m > 0 && n > 0) {
            m--, n--;
        }
        var monthFirst = new Date(slidate.getFullYear(), parseInt(n), 1).getDay(); //获取当月的1日等于星期几
        var d = new Date(slidate.getFullYear(), parseInt(m), 0); //获取月
        var conter = d.getDate(); //获取当前月的天数
        var monthNum = "0" + (m) + "月";
        var monthCheck = m;
        dateHandler(monthFirst, d, conter, monthNum);
        checkDate(monthCheck);
    })
    //返回上月记录
    $("#button4").on("click", function() {
        $("tr").remove();
        $("p").remove();
        if(m < x) {
            m++, n++;
        }
        var monthFirst = new Date(slidate.getFullYear(), parseInt(n), 1).getDay(); //获取当月的1日等于星期几
        var d = new Date(slidate.getFullYear(), parseInt(m), 0); //获取月
        var conter = d.getDate(); //获取当前月的天数
        var monthNum = "0" + (m) + "月";
        var monthCheck = m;
        dateHandler(monthFirst, d, conter, monthNum);
        checkDate(monthCheck);
    })

    window.addEventListener("load", initall, false);
	</script>
</body> 
</html>
