<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>科技创新项目平台-学生个人中心</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/main.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<p  class="logo">个人中心</p>
				<!-- 显示/隐藏菜单 -->
				<!--<a href="javascript:;" class="iconfont hideMenu icon-menu1"></a>-->

			    <!-- 天气信息 -->
			    <div class="weather" pc>
			    	<div id="tp-weather-widget"></div>
					<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
					<script>tpwidget("init", {
					    "flavor": "slim",
					    "location": "WX4FBXXFKE4F",
					    "geolocation": "enabled",
					    "language": "zh-chs",
					    "unit": "c",
					    "theme": "chameleon",
					    "container": "tp-weather-widget",
					    "bubble": "disabled",
					    "alarmType": "badge",
					    "color": "#FFFFFF",
					    "uid": "U9EC08A15F",
					    "hash": "039da28f5581f4bcb5c799fb4cdfb673"
					});
					tpwidget("show");
					</script>
			    </div>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">			    	
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
							<img onerror='this.src="/static/images/timg.jpg"' src="${student.imgurl}" class="layui-circle" width="35" height="35">
							<cite>${student.nameStudent}</cite>
						</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" data-url="/stu/stuInfo.html"><i class="layui-icon layui-icon-username" ></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="/stu/changePwd.html"><i class="layui-icon layui-icon-set" ></i><cite>修改密码</cite></a></dd>
							<dd><a href="javascript:window.open('/index.html');" ><i class="layui-icon layui-icon-home" ></i><cite>主页</cite></a></dd>
							<dd><a href="/stu/logout.html" class="signOut"><i class="layui-icon layui-icon-close"></i><cite>退出</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="这头像够帅了" ><img onerror='this.src="/static/images/timg.jpg"' src="${student.imgurl}"></a>
				<p><span class="userName">${student.nameStudent}</span></p>
			</div>
			<div class="navBar layui-side-scroll" style="height: 200px;">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item">
						
						<a href="javascript:;" data-url="/stu/main.html">
							<i class="layui-icon layui-icon-home">
								
							</i><cite>首页</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="/stu/to_enroll_list.html">
							<i class="layui-icon layui-icon-form" ></i>
							<cite>我的项目</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="/stu/to_compete_list.html">
							<i class="layui-icon layui-icon-tabs">

							</i><cite>赛事报名</cite></a>
					</li>
					<span class="layui-nav-bar" style="top: 112.5px; height: 0px; opacity: 0;"></span>
				</ul>
			</div>
			<!--<div class="navBar layui-side-scroll"></div>-->
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="/stu/main.html"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p>Copyright 2018 | 版权所有   山东科技大学电气与自动化工程学院   </p>
		</div>
	</div>
	
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript" src="${cpath}/static/js/leftNav.js"></script>
	<script type="text/javascript" src="${cpath}/static/js/index.js"></script>
</body>
</html>