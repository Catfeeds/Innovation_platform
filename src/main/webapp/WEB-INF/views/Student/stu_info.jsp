<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>个人资料</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/user.css" media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="user_left">
			<div class="layui-form-item">
			    <label class="layui-form-label">姓名：</label>
			    <div class="layui-input-block">
			    	<input type="text" value="${stu.nameStudent}" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">学号：</label>
			    <div class="layui-input-block">
			    	<input type="text" value="${stu.sno}" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">班级：</label>
			    <div class="layui-input-block">
			    	<input type="text" value="${stu.classno}" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<!--<div class="layui-form-item" pane="">
			    <label class="layui-form-label">性别：</label>
			    <div class="layui-input-block userSex">
			    	<input type="radio" name="sex" value="男" title="男" checked="">
	     			<input type="radio" name="sex" value="女" title="女">
	     			<input type="radio" name="sex" value="保密" title="保密">
			    </div>
			</div>-->
			<div class="layui-form-item">
			    <label class="layui-form-label">联系电话：</label>
			    <div class="layui-input-block">
			    	<input name="phone" type="tel" value="${stu.phone}" placeholder="请输入手机号码" lay-verify="required" class="layui-input userPhone">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">QQ：</label>
			    <div class="layui-input-block">
			    	<input name="qq" type="text" value="${stu.qq}" placeholder="QQ" lay-verify="required" class="layui-input">
			    </div>
			</div>
			<!--<div class="layui-form-item userAddress">
			    <label class="layui-form-label">家庭住址：</label>
			    <div class="layui-input-inline">
	                <select name="province" lay-filter="province">
	                    <option value="">请选择省</option>
	                </select>
	            </div>
	            <div class="layui-input-inline">
	                <select name="city" lay-filter="city" disabled>
	                    <option value="">请选择市</option>
	                </select>
	            </div>
	            <div class="layui-input-inline">
	                <select name="area" lay-filter="area" disabled>
	                    <option value="">请选择县/区</option>
	                </select>
	            </div>
			</div>-->
			
			<div class="layui-form-item">
			    <label class="layui-form-label">邮箱：</label>
			    <div class="layui-input-block">
			    	<input name="email" type="text" value="${stu.email}" placeholder="请输入邮箱" lay-verify="required|email" class="layui-input userEmail">
			    </div>
			</div>
			<!--<div class="layui-form-item">
			    <label class="layui-form-label">自我描述：</label>
			    <div class="layui-input-block">
			    	<textarea placeholder="请输入内容" class="layui-textarea myself"></textarea>
			    </div>
			</div>-->
		</div>
		<div class="user_right">
			<img src="${stu.imgurl}" class="layui-circle" id="userFace">
		</div>
		<div class="layui-form-item" style="margin-left: 5%;">
		    <div class="layui-input-block">
		    	<button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
</body>
</html>