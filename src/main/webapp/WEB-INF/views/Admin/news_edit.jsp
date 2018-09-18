<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>文章编辑</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${cpath}/static/kindeditor/kindeditor-all-min.js"></script>
	<script src="${cpath}/static/js/MyTextarea.js"></script>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 90%">
		<input id="action"  type="hidden" value="${action}">
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label">文章标题</label>
			<div class="layui-input-block">
				<c:if test="${action == 'edit' }">
					<input id="newsID" name="id" type="hidden" value="${news.id}">
					<input name="title" value="${news.title}" id="news_title" type="text" class="layui-input newsName" lay-verify="required" placeholder="编辑文章">
				</c:if>
				<c:if test="${action == 'add' }">
					<input name="typeNews" id="newsType"  type="hidden" value="${newsType}">
					<input name="title" id="news_title" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入文章标题">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">文章内容</label>
			<div class="layui-input-block">
				<c:if test="${action == 'edit' }">
					<textarea id="mytextarea" name="content" style="width:100%;height: 400px ">${news.content}</textarea>
				</c:if>
				<c:if test="${action == 'add' }">
					<textarea id="mytextarea" name="content" style="width:100%;height: 400px "></textarea>
				</c:if>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">${action == 'add' ? "确认添加":"确认编辑"}</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript" >
		var action = $("#action").val();
        layui.use(['form','layer','jquery','layedit'], function(){
            var form = layui.form,
                layer = parent.layer === undefined ? layui.layer : parent.layer,
                layedit = layui.layedit,
                $ = layui.jquery;

            var editIndex = layedit.build('news_content');

            form.on("submit(addNews)",function(data){
                layedit.sync(editIndex);
                if(action=='edit'){
                    $.ajax({
                        type:'post',
                        url:'${cpath}/manage/update_news.do',
                        data:data.field,
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
                        url:'${cpath}/manage/add_news.do',
                        data: data.field,
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
</body>
</html>