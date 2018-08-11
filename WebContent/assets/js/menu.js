var userId = localStorage.getItem("userId");
var username = localStorage.getItem("username");
var menu = {
	'home': {
		title: '首页',
		menu: [{
			title: '首页',
			icon: 'assets/imgs/main/l03.png',
			href: 'index.html',
			isCurrent: true
		}]
	},

	'project': {
		title: '项目',
		menu: [{
			title: '个人信息',
			icon: 'assets/imgs/main/l01.png',
			href: 'project/userinfo.html?id='+userId,
			isCurrent: true
		},{
			title: '每日签到',
			icon: 'assets/imgs/main/l05.png',
			href: 'project/sign_day.html?userID='+userId
		},{
			title: '请假登记',
			icon: 'assets/imgs/main/l27.png',
			href: 'backend/leave.html?username='+username
		},{
			title: '公告查看',
			icon: 'assets/imgs/main/l30.png',
			href: 'project/list.html'
		}]
	},

/*	'query': {
		title: '查询统计',
		menu: [{
			title: '工作纪实查询',
			icon: 'imgs/main/l09.png',
			isCurrent: true,
			href: 'query/work_situation_query.html'
		},{
			title: '工作总结查询',
			icon: 'imgs/main/l10.png',
			href: 'query/work_summary.html'
		},{
			title: '个人年度工作计划查询',
			icon: 'imgs/main/l11.png',
			href: 'query/personal_query.html'
		},{
			title: '平时考核成绩查询',
			icon: 'imgs/main/l13.png',
			href: 'query/normal_time.html'
		},{
			title: '领导评述查询',
			icon: 'imgs/main/l14.png',
			href: 'query/leader.html'
		},{
			title: '加扣分查询',
			icon: 'imgs/main/l15.png',
			href: 'query/grade_query.html'
		},{
			title: '辖区考核情况统计',
			icon: 'imgs/main/l16.png',
			href: 'query/exam.html'
		}]
	},*/

	'mange': {
		title: '后台管理',
		menu: [{
			title: '机构管理',
			icon: 'assets/imgs/main/l17.png',
			isCurrent: true,
			href: 'backend/organ_manger.html'
		},{
			title: '人员管理',
			icon: 'assets/imgs/main/l18.png',
			href: 'backend/person_manger.html'
		},{
			title: '请假申请',
			icon: 'assets/imgs/main/l26.png',
			href: 'backend/leave_manage.html'
		},{
			title: '考勤登记',
			icon: 'assets/imgs/main/l27.png',
			href: 'backend/sign_manage.html'
		},{
			title: '公告管理',
			icon: 'assets/imgs/main/l30.png',
			href: 'backend/list_manage.html'
		}]
	}
};