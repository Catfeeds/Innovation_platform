<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>友情链接显示</title>
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
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加链接</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
		<input type="hidden" id="newType" value="debug">
			<table id="linkTableList" lay-filter="linkTableId"></table>
	</div>
	<div id="page"></div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
	var a = '';
    layui.use('table', function(){
        var table = layui.table;

        $(window).one("resize",function(){
            $(".newsAdd_btn").click(function(){
                var index = layui.layer.open({
                    title : "添加新友情链接",
                    type : 2,
                    content : "/manage/to_link_add.html",
                    success : function(layero, index){
                        setTimeout(function(){
                            layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }
                })
                layui.layer.full(index);
            })
        }).resize();

        table.render({
            elem: '#linkTableList',
            url: '${cpath}/manage/link.do',
            method: 'get',
            limit: 10,
            cols: [[
                {field:'id', title: '序号',align:'center',sort:true},
                {field:'nameLink', title: '链接名称',align:'center',edit: 'text',},
                {field:'url', title: '链接地址',align:'center',edit: 'text',},
                {title: '操作',align:'center',toolbar: '#bar'},
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        table.on('tool(linkTableId)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                window.open(data.url);
            } else if(obj.event === 'del'){
                layer.confirm('真的删除'+data.nameLink+'么?', function(index){
                    $.ajax({
                        url:'/manage/delete_link/'+data.id+'.do',
                        type:'post',
                        success : function(data) {
                            if(data.status==0){
                                obj.del();
                                layer.msg(data.msg);
                            }
                            else
                                layer.msg(data.msg);
                        }
                    });
                    layer.close(index);
                });
            }
        });

        table.on('edit(linkTableId)', function(obj){
            var value = obj.value
                ,data = obj.data
                ,field = obj.field;

            $.ajax({
                url:'/manage/update_link.do',
                type:'post',
                data:{
                    id:data.id,
                    nameLink:data.nameLink,
                    url:data.url,
                },
                success : function(data) {
                    layer.msg(data.msg);
                },
                error:function () {
                    layer.msg("服务器错误");
                }
            });
        });
    })
</script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>
