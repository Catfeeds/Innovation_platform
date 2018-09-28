<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
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
			id:'search_tb',
            elem: '#List',
            url: '${cpath}/manage/enroll_list.do',
            method: 'post',
            toolbar:true,
            defaultToolbar: ['filter', 'print'],
            limit: 10,
            cols: [[
                {title: '序号',width:100,align:'center',type:'numbers'},
                {field:'enrollId', title: '报名表ID',align:'center',hide:'true'},
                {field:'competeName', title: '赛事名称',align:'center',sort:true},
                {field:'title', title: '参赛题目',align:'center'},
                {field:'members', title: '团队成员',align:'center',templet:'#members'},
                {field:'instructor', title: '指导老师',align:'center',sort:true},
                {field:'status',title: '状态',align:'center',templet:'#status',sort:true},
                {title: '操作',width:150,align:'center',toolbar: '#bar',fixed:'right'}
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        $(".search_btn").click(function() {
            table.reload('search_tb', {
                url: '${cpath}/manage/enroll_search.do'
                , where: {key: $(".search_input").val()}
            });
        });

        table.on('tool(ListID)', function(obj){
            var data = obj.data;
			if(obj.event === 'detail'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "详情",
                        type : 2,
                        content : "${cpath}/manage/to_enroll_detail/"+data.enrollId+".do",
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
<script type="text/html" id="status">
	{{#  if(d.status === 0){ }}
		<span style="color: black;">待审核</span>
	{{#  } else if(d.status === 1){ }}
		<span style="color: #ffa10e;">修改后/待审核</span>
	{{#  } else if(d.status === 2){ }}
		<span style="color: red;">未通过</span>
	{{#  } else if(d.status === 3){ }}
		<span style="color: green;">已通过</span>
	{{#  } else { }}
		<span style="color: #f1a02f;">未知参数</span>
	{{#  } }}
</script>