<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>报名详情</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${cpath}/static/css/user.css" media="all" />
	<style type="text/css">
		table,tr,th,td{
			border: 1px gainsboro solid;
		}
		tr{height: 40px;}
		td{text-align: center;}
		table input{
			border: none;
			width: 98.5%;
			height: 40px;
		}
	</style>
</head>
<body class="childrenBody">
<br>
	<form id="form_enroll" class="layui-form" style="width:80%; display: block; float: left;">
		<input  name="id" type="hidden" value="${item.enrollId}">
		<div class="layui-form-item">
			<label class="layui-form-label">参赛名称:</label>
			<div class="layui-input-block">
				<input  type="text" disabled class="layui-input layui-disabled "  value="${item.competeName}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">队长姓名：</label>
			<div class="layui-input-block">
				<input  type="text" disabled class="layui-input layui-disabled "  value="${item.leader.nameStudent}">
			</div>			
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学号：</label>
			<div class="layui-input-block">
				<input type="text" disabled class="layui-input layui-disabled " lay-verify="required" value="${item.leader.sno}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">班级：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.classno}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系电话：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.phone}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.qq}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled "  value="${item.leader.email}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参赛题目：</label>
			<div class="layui-input-block">
				<input  type="text" disabled class="layui-input layui-disabled"  value="${item.title}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled"  value="${item.instructor}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">团队名称：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled"  value="${item.groupName}">
			</div>
		</div>		
		
		<div class="layui-form-item">
			<label class="layui-form-label">团队成员：</label>
			<table id="dynamicTable"  class="layui-table" style="float: right;width: 90%">
		<thead>
			<tr>
					<th style="width: 25%;">学号</th>
					<th style="width: 25%;">姓名</th>
					<th style="width: 25%;">班级</th>
					<th style="width: 25px;">电话</th>
				</tr>
		</thead>
		<tbody>
		<c:forEach items="${item.members}" var="member">
			<tr>
				<td height="30" align="center">${member.sno}</td>
				<td align="center">${member.sname}</td>
				<td align="center">${member.classno}</td>
				<td align="center">${member.phone}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">附件：</label>
			<div class="layui-input-block">
				<button type="button" class="layui-btn layui-btn-primary layui-btn-sm download-btn">下载附件</button>
				<input id="attachmentVal"  type="hidden" value="${item.attachment}">
			</div>
		</div>
	</form>

</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script>
    $(".download-btn").click(function () {
        window.open("/file_download.do?filename="+$("#attachmentVal").val());
    });
</script>
</html>