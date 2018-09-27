<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>获奖项目</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${cpath}/static/css/user.css" media="all" />
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>${user.sno}${user.nameStudent}</legend>
</fieldset>

<div style="padding: 20px; background-color: #F2F2F2;">
	<div class="layui-row layui-col-space15">
		<c:forEach var="excellent" items="${excellents}" varStatus="status">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">项目${status.index+1}</div>
				<div class="layui-card-body">
					<table class="layui-table">
					<thead>
					<tr>
						<th>年份</th>
						<th>大赛名称</th>
						<th>参赛项目</th>
						<th>赛事级别</th>
						<th>指导老师</th>
						<th>获奖等级</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>${excellent.year}</td>
						<td>${excellent.competeName}</td>
						<td>${excellent.title}</td>
						<td>${excellent.levelName}</td>
						<td>${excellent.instructor}</td>
						<td>${excellent.prizeName}</td>
					</tr>
					</tbody>
					</table>
					<p>团队成员</p>
					<table class="layui-table" style="table-layout:fixed">
					<colgroup>
					<col width="150">
					<col width="150">
					<col width="150">
					<col>
					</colgroup>
					<thead>
					<tr>
					<th >姓名</th>
					<th >学号</th>
					<th >班级</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="member" items="${excellent.members2}">
					<tr>
					<td>${member.sname}</td>
					<td>${member.sno}</td>
					<td>${member.classno}</td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>

</html>