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
	<script src="${cpath}/static/js/echarts.min.js"></script>
</head>
<body class="childrenBody">
<form class="layui-form">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn layui-btn-primary">查询</a>
			<label style="padding: 10px;width: 80px">选择时间:</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="chooseTime" placeholder=" - ">
			</div>
			<label style="padding: 10px;width: 80px">  专业:</label>
			<div class="layui-inline">
				<select name="p">
					<option value=""></option>
					<option value="0">土木工程</option>
					<option value="1" selected="">计算机</option>
				</select>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal show-chart">图表显示</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn newsAdd_btn">数据导入</a>
			</div>
		</div>
	</blockquote>
</form>
	<table id="List" lay-filter="ListID"></table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>卡片面板</legend>
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
				<div class="layui-card-body" id="echartDom2" style="width: 100%;height: 400px"></div>
				<div class="layui-card-body" id="echartDom22" style="width: 100%;height: 400px"></div>
			</div>
		</div>
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">标题</div>
				<div class="layui-card-body">
					内容
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartPCountBar'));

    var myChartPie = echarts.init(document.getElementById('chartPCountPie'));
    var optionPie = {
        title : {
            text: '获奖项目数及人数',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['一等奖','二等奖','三等奖','鼓励奖']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:335, name:'一等奖'},
                    {value:310, name:'二等奖'},
                    {value:234, name:'三等奖'},
                    {value:135, name:'鼓励奖'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    //myChartPie.setOption(optionPie);
	$(".show-chart").click(function () {

        $.ajax({
            type:'post',
            url:'/manage/get_level_json.do',
            dataType: "json",
            success:function (res) {
                // 填入数据
                console.log(res.categories);
                console.log(res.data);
                console.log(res);
                // 指定图表的配置项和数据
                var optionBar = {
                    color: ['#3398DB'],
                    title: {
                        text: '统计获奖人数'
                    },
                    tooltip: {},
                    legend: {
                        data:['人数']
                    },
                    xAxis: {
                        data: res.categories
                    },
                    yAxis: {},
                    series: [{
                        name: '人数',
                        type: 'bar',
                        data: res.data
                    }]
                };
                myChart.setOption(optionBar);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });

        myChartPie.setOption(optionPie);
	})
</script>
<script type="text/javascript">
    layui.use(['table','laydate'], function(){
        var table = layui.table,
            laydate = layui.laydate;

        laydate.render({
            elem: '#chooseTime'
            ,range: true
        });

        table.render({
            elem: '#List',
            url: '/manage/pass_prize_enroll_list.do',
            method: 'post',
            limit: 10,
            cols: [[
                { title: '序号',align:'center',width:100,type:'numbers',sort:true},
                {field:'enrollId', title: 'EnrollID',align:'center',hide:'true'},
                {field:'competeName', title: '赛事名称',align:'center'},
                {field:'title', title: '参赛题目',align:'center'},
                {field:'members', title: '团队成员',align:'center',templet:'#members'},
                {field:'instructor', title: '指导老师',align:'center'},
                {field:'status',title: '状态',align:'center',templet:'#status'},
                {field:'prizeName', title: '获奖情况',align:'center'},
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