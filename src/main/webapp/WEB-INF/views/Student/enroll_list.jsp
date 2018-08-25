<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的项目</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/news.css" media="all" />
	
</head>
<body class="childrenBody">
	<table id="List" lay-filter="ListID"></table>
	 <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#List',
                url: '${cpath}/stu/enroll_list.do',
                method: 'post',
				size:'lg',
                cols: [[
                    {field:'competeName', title: '赛事名称',align:'center'},
                    {field:'title', title: '参赛题目',align:'center'},
                    {field:'groupName', title: '团队名称',align:'center'},
                    {field:'instructor', title: '指导老师',align:'center'},
					{field:'status',title: '状态',align:'center',templet:'#status'},
                    {title: '操作',width:200,align:'center',toolbar: '#bar',fixed:'right'},
                ]],
                done: function (res, curr, count) {

                }
            });

        })
	</script>
</body>
<script type="text/html" id="status">
	{{#  if(d.status === 0){ }}
	<span style="color: #ffc657;">待审核</span>
	{{#  } else if(d.status === 1){ }}
	<span style="color: green;">通过/立项</span>
	{{#  } else if(d.status === 2){ }}
	<span style="color: red;">未通过</span>
	{{#  } else { }}
	<span style="color: #f1a02f;">未知参数</span>
	{{#  } }}
</script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>