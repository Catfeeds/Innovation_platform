<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>文章添加--后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
</head>
<body class="childrenBody">
<br>
<br>
<input id="downloadID"  type="hidden" value="${download.id}">
<input id="action"  type="hidden" value="${action}">
	<form class="layui-form" style="width: 80%">
		<div class="layui-form-item">
			<label class="layui-form-label">大赛名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入大赛名称">
			</div>
		</div>
		<div class="layui-form-item">
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">作品名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input productName" lay-verify="required" placeholder="请输入作品名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">作者姓名</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input productAuthor" lay-verify="required" placeholder="请输入作者姓名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input teacher" lay-verify="required" placeholder="请输入指导老师">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">作品附件</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="news_content"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">确认添加</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript" >
    var action = $("#action").val();
    var downloadID = $("#downloadID").val();
    layui.use(['form','layer','jquery','layedit'], function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            layedit = layui.layedit,
            $ = layui.jquery;

        //var editIndex = layedit.build('news_content');

        form.on("submit(addNews)",function(data){
            layedit.sync(editIndex);
            if(action=='edit'){
                $.ajax({
                    type:'post',
                    url:'/manage/download_update.do',
                    data:{
                        id:downloadID,
                        title:$("#news_title").val(),
                        content:$("#news_content").val()
                    },
                    success:function (data) {
                        layer.msg(data.msg);
                    },
                    error:function (data) {
                        layer.msg('接口错误');
                    }
                });
            }else if(action=='add'){
                $.ajax({
                    type:'post',
                    url:'/manage/download_add.do',
                    data:{
                        typeNews:1,
                        title:$("#news_title").val(),
                        content:$("#news_content").val()
                    },
                    success:function (data) {
                        layer.msg(data.msg);
                    },
                    error:function (data) {
                        layer.msg('接口错误');
                    }
                });
            }
            setTimeout(function(){
                layer.closeAll("iframe");
                parent.location.reload();
            },800);
            return false;
        })
    })
</script>
</html>