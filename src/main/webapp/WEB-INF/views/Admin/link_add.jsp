<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>友情链接</title>
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
	<form class="layui-form" style="width:80%;">
		<div class="layui-form-item">
			<label class="layui-form-label">链接名称</label>
			<div class="layui-input-block">
				<input name="nameLink" id="link_name" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入链接名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">链接url</label>
			<div class="layui-input-block">
				<input name="url" id="link_url" type="text" class="layui-input productName" lay-verify="required" placeholder="请输入网址">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">确认添加</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        layui.use(['form'], function(){
            var form = layui.form;

            form.on("submit(addNews)",function(data){
                $.ajax({
					type:'post',
					url:'/manage/add_link.do',
					data:data.field,
					success:function (res) {
						layer.msg(res.msg);
                    },
                    error:function (res) {
						layer.msg('接口错误');
                    }
				});
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