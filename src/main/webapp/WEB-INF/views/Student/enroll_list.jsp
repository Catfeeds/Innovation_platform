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
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <thead>
				<tr>
					<th>编号</th>
					<th>赛事名称</th>
					<th>参赛题目</th>
					<th>状态</th>
					<th>团队名称</th>					
					<th>团队成员</th>
					<th>指导老师</th>
				</tr> 
		    </thead>
		    <tr>
		    	<td>1</td>
		    	<td>第七届robomaster机器人大赛</td>
		    	<td>参赛题目参赛题目参赛题目</td>
		    	<td>通过</td>
		    	<td>smartrobot</td>
		    	<td>成员 成员成员 成员成员</td>
		    	<td>老师 老师</td>
		    </tr>
		</table>
	</div>

	<table id="List" lay-filter="ListID"></table>

	 <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#List',
                url: '${cpath}/stu/xxxx.do',
                method: 'post',
                cols: [[
                    {field:'id', title: '序号',align:'center',sort:true},
                    {field:'matchId', title: '赛事ID',align:'center'},
                    {field:'title', title: '参赛题目',align:'center'},
                    {field:'clicks',title: '状态',align:'center'},
                    {field:'createTime', title: '团队名称',align:'center'},
                    {field:'createTime', title: '指导老师',align:'center'},
                ]],
                done: function (res, curr, count) {

                }
            });

        })
	</script>
</body>
</html>