<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>赛事介绍--后台管理模板</title>
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
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加文章</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		
	</blockquote>
	<div class="layui-form news_list">
	  	<%--<table class="layui-table">--%>
		    <%--<colgroup>--%>
				<%--<col width="50">--%>
				<%--<col>--%>
				<%--<col width="9%">--%>
				<%--<col width="9%">--%>
				<%--<col width="9%">--%>
				<%--<col width="9%">--%>
				<%--<col width="9%">--%>
				<%--<col width="15%">--%>
		    <%--</colgroup>--%>
		    <%--<thead>--%>
				<%--<tr>--%>
					<%--<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>--%>
					<%--<th style="text-align:left;">赛事名称</th>--%>
					<%--<th>发布人</th>					--%>
					<%--<th>赛事级别</th>--%>
					<%--<th>赛事简介</th>--%>
					<%--<th>赛事时间</th>--%>
					<%--<th>封面图片</th>--%>
					<%--<th>发布时间</th>--%>
					<%--<th>操作</th>--%>
				<%--</tr> --%>
		    <%--</thead>--%>
		    <%--<tbody class="news_content"></tbody>--%>
		<%--</table>--%>
		<table id="linkTableList" lay-filter="linkTableId"></table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        var $;
        layui.config({
            base : "${cpath}/static/js/"
        }).use(['form', 'table', 'layer','common'], function () {
            $ =  layui.$;
            var form = layui.form,
                table = layui.table,
                layer = layui.layer,
                common = layui.common;

            var loading = layer.load(0,{ shade: [0.3,'#000']});
            /**用户表格加载*/
            table.render({
                elem: '#linkTableList',
                url: '${cpath}/manage/links.do',
                id:'linkTableId',
                method: 'get',
                height:'full-140',
                skin:'row',
                even:'true',
                size: 'sm',
                cols: [[
                    {type:"checkbox"},
                    {field:'id', title: '序号',align:'center',sort:true},
                    {field:'nameLink', title: '链接名称',align:'center'},
                    {field:'url', title: '用户状态',align:'center',width: '8%',templet: '#userStatusTpl'},
                    {field:'logo', title: '拥有角色',align:'center'},
                ]],
                page: true,
                done: function (res, curr, count) {
                    common.resizeGrid();
                    layer.close(loading);
                }
            });
		})
	</script>
</body>
</html>