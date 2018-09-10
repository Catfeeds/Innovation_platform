<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
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
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>${user.sno}${user.nameStudent}</legend>
</fieldset>

<div style="padding: 20px; background-color: #F2F2F2;">
	<div class="layui-row layui-col-space15">
		<c:forEach var="item" items="${items}" varStatus="status">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">项目${status.index+1}</div>
				<div class="layui-card-body">
					<table class="layui-table">
					<thead>
					<tr>
					<th>审批状态</th>
					<th>大赛名称</th>
					<th>参赛项目</th>
					<th>年份</th>
					<th>赛事级别</th>
					<th>团队名称</th>
					<th>指导老师</th>
					<th>获奖名次</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td><c:if test="${item.status==0}">
							<span style="color: black;">待审核</span>
						</c:if>
						<c:if test="${item.status==1}">
							<span style="color: green;">已通过</span>
						</c:if>
						<c:if test="${item.status==2}">
							<span style="color: red;">未通过</span>
						</c:if>
						<c:if test="${item.status==3}">
							<span style="color: darkorange;">未知参数</span>
						</c:if></td>
					<td>${item.competeName}</td>
					<td>${item.title}</td>
					<td>${item.year}</td>
					<td>${item.competeName}</td>
					<td>${item.groupName}</td>
					<td>${item.instructor}</td>
					<td>${item.prizeName}</td>
					</tr>
					</tbody>
					</table>
					<br>
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
					<c:forEach var="member" items="${item.members}">
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