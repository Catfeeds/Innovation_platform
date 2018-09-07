<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>项目申报管理</title>
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
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
	</blockquote>
	<table id="List" lay-filter="ListID"></table>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#List',
            url: '/manage/pass_prize_enroll_list.do',
            method: 'post',
            limit: 10,
            cols: [[
                { title: '序号',align:'center',width:100,type:'numbers'},
                {field:'enrollId', title: 'EnrollID',align:'center',hide:'true'},
                {field:'prizeName', title: '获奖情况',align:'center'},
                {field:'competeName', title: '大赛名称',align:'center'},
                {field:'title', title: '参赛题目',align:'center'},
                {field:'members', title: '小组成员',align:'center',templet:"#members"},
                {field:'gwfinishTime', title: '完成时间',align:'center'},
                {field:'gwintroduce', title: '优秀作品简介',align:'center'},
				{field:'gwcoverUrl', title: '主页封面',align:'center',templet:function(d) {
                    return '<img src="' + d.gwcoverUrl + '" />';}},
                {title: '操作',width:100,align:'center',toolbar: '#bar',fixed:'right'},
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        table.on('tool(ListID)', function(obj){
            var data = obj.data;
			if(obj.event === 'detail'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "详情",
                        type : 2,
                        content : "${cpath}/manage/to_enroll_detail2/"+data.enrollId+".do",
                        success : function(layero, index){
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },300)
                        }
                    })
                    layui.layer.full(index);
                }).resize();
            }
        });
    })
</script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">详情</a>
</script>
<script type="text/html" id="members">
	{{#  layui.each(d.members, function(index, item){ }}
	<span>{{ item.sname }}  </span>
	{{#  }); }}
</script>