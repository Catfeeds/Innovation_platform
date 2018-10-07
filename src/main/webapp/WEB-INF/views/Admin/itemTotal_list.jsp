<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
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
	<script src="${cpath}/static/js/echarts.min.js"></script>
</head>
<body class="childrenBody">
<form class="layui-form">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入参赛题目" class="layui-input search_input">
		    </div>
		    <a class="layui-btn layui-btn-primary search_btn">查询</a>
			<label style="padding: 10px;width: 80px">选择时间:</label>
			<div class="layui-input-inline">
				<input type="text" name="chooseTime" class="layui-input" id="chooseTime" placeholder="~">
			</div>
			<label style="padding: 10px;width: 80px">  专业:</label>
			<div class="layui-inline">
				<select name="profession" id="pId">
					<option value="">请选择专业</option>
					<option value="1">自动化专业</option>
					<option value="2">电气专业</option>
				</select>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal show-chart">图表显示</a>
			</div>
			<div class="layui-inline">
				<button type="button" class="layui-btn" id="data-import"><i class="layui-icon"></i>数据导入</button>
			</div>
		</div>
	</blockquote>
</form>
	<table id="List" lay-filter="ListID"></table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>数据统计</legend>
</fieldset>

<div style="padding: 20px; background-color: #F2F2F2;">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md6">
			<div class="layui-card">
				<div class="layui-card-header">人数</div>
				<div class="layui-card-body" id="chartPCountBar" style="width: 100%;height: 400px"></div>
				<div class="layui-card-body" id="chartPCountPie" style="width: 100%;height: 400px"></div>
			</div>
		</div>
		<div class="layui-col-md6">
			<div class="layui-card">
				<div class="layui-card-header">项目</div>
				<div class="layui-card-body" id="chartICountBar" style="width: 100%;height: 400px"></div>
				<div class="layui-card-body" id="chartICountPie" style="width: 100%;height: 400px"></div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${cpath}/static/js/itemTotal_list.js"></script>
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
		<span style="color: green;">已通过</span>
	{{#  } else if(d.status === 2){ }}
		<span style="color: red;">未通过</span>
	{{#  } else { }}
		<span style="color: #f1a02f;">未知参数</span>
	{{#  } }}
</script>
<script type="text/html" id="profession">
	{{#  if(d.pId === 1){ }}
	<span>自动化专业</span>
	{{#  } else if(d.pId === 2){ }}
	<span >电气专业</span>
	{{#  } else { }}
	<span style="color: #f1a02f;">未知参数,待拓展专业名</span>
	{{#  } }}
</script>