<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>赛事报名</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="${cpath}/static/js/jquery1.7.js"></script>
<script type="text/javascript">
$(function () {
	var show_count = 20;   //要显示的条数
	var count = 1;    //递增的开始值，这里是你的ID
	$("#btn_addtr").click(function () {

		var length = $("#dynamicTable tbody tr").length;
		//alert(length);
		if (length < show_count)    //点击时候，如果当前的数字小于递增结束的条件
		{
			$("#tab11 tbody tr").clone().appendTo("#dynamicTable tbody");   //在表格后面添加一行
			changeIndex();//更新行号
		}
	});


});


function deltr(opp) {
	var length = $("#dynamicTable tbody tr").length;
	//alert(length);
	if (length <= 1) {
		alert("至少保留一行!!!");
	} else {
		$(opp).parent().parent().remove();//移除当前行
		changeIndex();
	}
}
</script>
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
	<form class="layui-form" style="width:80%; display: block; float: left;">
		<div class="layui-form-item">
			<label class="layui-form-label">队长姓名：</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" lay-verify="required" placeholder="请输入队长姓名">
			</div>			
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学号：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入队长学号">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">班级：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入队长班级">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系电话：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入联系电话">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入QQ">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入邮箱">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参赛题目：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入参赛题目">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入指导老师">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">团队名称：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="团队名称">
			</div>
		</div>		
		
		<div class="layui-form-item">
			<label class="layui-form-label">团队成员：</label>
			<!--<div class="layui-input-block">
				<textarea placeholder="请输入团队成员，学号，命名，班级，联系电话" class="layui-textarea linksDesc"></textarea>
			</div>-->
			
	<table id="tab11" style="display: none;">
		<tbody>
			<tr>
				<td height="30" align="center">
					<input type="text" name="start_end_time" /></td>
				<td align="center">
					<input type="text" name="start_end_time" /></td>
				<td align="center">
					<input type="text" name="unit_department" /></td>
				<td align="center">
					<input type="text" name="post" /></td>
				<td>
					<input style="border: gray 1px solid; margin-left: 10px;" type="button" id="Button1" onClick="deltr(this)" value="删行" >
				</td>
			</tr>
		</tbody>
	</table>
	<input type="button" id="btn_addtr" value="增行" style="margin-bottom: 8px;">
	<table id="dynamicTable" width="88%" style="float: right;">
		<thead>
			<tr>
							
					<th style="width: 30%;">学号</th>
					<th style="width: 20%;">姓名</th>
					<th style="width: 20%;">班级</th>
					<th style="width: 30%;">联系电话</th>
				</tr>
		</thead>
		<tbody>
			<tr>
				<td height="30" align="center">
					<input type="text" name="start_end_time" /></td>
				<td align="center">
					<input type="text" name="start_end_time" /></td>
				<td align="center">
					<input type="text" name="unit_department" /></td>
				<td align="center">
					<input type="text" name="post" /></td>					
				<td>
					<input type="button" id="Button2" onClick="deltr(this)" value="删行" style="border: gray 1px solid; margin-left: 10px;">
				</td>
			</tr>
		</tbody>
	</table>
			
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">上传附件：</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="" >
				<img src="../../images/u831.png">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addLinks">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<div style="float: right; height: 50px; width: 200px;">
		<span><img src="../../../images/u827.png">
		本科学生大一不能参加超过2项竞赛，大二不能参加超过2项竞赛，本科四年不能参加超过10项竞赛
		</span>
		
	</div>
	
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
</body>
</html>