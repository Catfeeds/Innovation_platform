<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>下载专区</title>
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
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入作品标题" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加下载</a>
		</div>
		<%--<div class="layui-inline">--%>
			<%--<a class="layui-btn layui-btn-danger batchDel">批量删除</a>--%>
		<%--</div>--%>
	</blockquote>
	<table id="downloadList" lay-filter="downloadListID"></table>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table;

        $(window).one("resize",function(){
            $(".newsAdd_btn").click(function(){
                var index = layui.layer.open({
                    title : "添加下载",
                    type : 2,
                    content : "${cpath}/manage/to_download_add.do",
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }
                })
                layui.layer.full(index);
            })
        }).resize();

        table.render({
			id:'search_tb',
            elem: '#downloadList',
            url: '${cpath}/manage/download_list.do',
            method: 'post',
            limit: 10,
            cols: [[
                {title: '序号',align:'center',width:100,type:'numbers'},
                {field:'id', title: '序号',align:'center',sort:true,hide:'true'},
                {field:'nameMatch', title: '大赛名称',align:'center',sort:true},
                {field:'titleWork', title: '作品标题',align:'center'},
                {field:'author', title: '作者姓名',align:'center'},
                {field:'instructor', title: '指导老师',align:'center'},
                {field:'attachment',title: '附件',align:'center',templet:'#attach',sort:true},
                {title: '操作',width:200,align:'center',toolbar: '#bar',fixed:'right'},
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        $(".search_btn").click(function() {
            table.reload('search_tb', {
                url: '/manage/download_search.do'
                , where: {key: $(".search_input").val()}
            });
        });

        table.on('tool(downloadListID)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                window.open('/downloads.html');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除 '+data.titleWork+' 么?', function(index){
                    $.ajax({
                        url:'${cpath}/manage/download_delete/'+data.id+".do",
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
            }else if(obj.event === 'edit'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "编辑",
                        type : 2,
                        content : "${cpath}/manage/to_download_edit/"+data.id+".do",
                        success : function(layero, index){
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },500)
                        }
                    })
                    layui.layer.full(index);
                }).resize();
            }
        });
    })
</script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="attach">
	{{# if(d.attachment==''){ }}
		<span style="color:red">未上传</span>
	{{#}else{ }}
		<span style="color:green">已上传</span>
	{{#} }}
</script>