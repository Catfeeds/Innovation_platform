<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>项目统计</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/news.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
</head>
<body class="childrenBody">
<form class="layui-form">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
			<div class="layui-inline">
				<%--<button type="button" class="layui-btn" id="data-import"><i class="layui-icon"></i>数据导入</button>--%>
				<button type="button" class="layui-btn layui-btn-normal" id="data-import">选择文件</button>
				<button type="button" class="layui-btn" id="data-import-btn">开始上传</button>
			</div>
		</div>
	</blockquote>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>数据导入</legend>
</fieldset>

<div style="padding: 20px; background-color: #F2F2F2;">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">导入须知</div>
				<div class="layui-card-body">
					Content
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['table','laydate','upload'], function() {
        var table = layui.table,
            upload = layui.upload,
            laydate = layui.laydate;

        //选完文件后不自动上传
        upload.render({
            elem: '#data-import'
            , accept: 'file'
            ,url: '/manage/data_import.do'
            ,auto: false
            //,multiple: true
            ,bindAction: '#data-import-btn'
            ,done: function(res){
                layer.msg(res.msg, {
                    time: 20000, //20s后自动关闭
                    btn: [ '知道了']
                });
            }
        });

    });
</script>
