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
				<input type="text" name="chooseTime" class="layui-input" id="chooseTime" placeholder="">
			</div>
			<label style="padding: 10px;width: 80px">  专业:</label>
			<div class="layui-inline">
				<select name="p">
					<option value=""></option>
					<option value="0">电气专业</option>
					<option value="1">自动化专业</option>
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
	<legend>面板</legend>
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
    var barPc = echarts.init(document.getElementById('chartPCountBar'));
    var barIc = echarts.init(document.getElementById('chartICountBar'));

    var piePc = echarts.init(document.getElementById('chartPCountPie'));
    var pieIc = echarts.init(document.getElementById('chartICountPie'));

    //myChartPie.setOption(optionPie);
	$(".show-chart").click(function () {
        $.ajax({
            type:'post',
            url:'/manage/get_prize_pc.do',
            dataType: "json",
            success:function (res) {
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
                barPc.setOption(optionBar);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });

        barPc.on('click', function (params) {
            $.ajax({
                type:'post',
                url:'/manage/get_prize_pc2.do',
                dataType: "json",
				data:{
                    levelId:params.data.id,
				},
                success:function (res) {
                    var optionPie = {
                        title : {
                            text: params.data.name+'获奖项目数及人数',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: res.categories
                        },
                        series : [
                            {
                                name: '项目数/人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:res.data,
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
                    piePc.setOption(optionPie);
                }
			});
        });

        $.ajax({
            type:'post',
            url:'/manage/get_prize_ic.do',
            dataType: "json",
            success:function (res) {
                // 指定图表的配置项和数据
                var optionBar = {
                    color: ['#3398DB'],
                    title: {
                        text: '统计获奖项目数'
                    },
                    tooltip: {},
                    legend: {
                        data:['项目数']
                    },
                    xAxis: {
                        data: res.categories
                    },
                    yAxis: {},
                    series: [{
                        name: '项目数',
                        type: 'bar',
                        data: res.data
                    }]
                };
                barIc.setOption(optionBar);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });
	});


</script>
<script type="text/javascript">
    layui.use(['table','laydate','upload'], function(){
        var table = layui.table,
            upload = layui.upload,
            laydate = layui.laydate;

        upload.render({
            elem: '#data-import'
            ,accept: 'file'
            ,url: '/manage/data_import.do'
            ,done: function(res){
                console.log(res)
            }
        });

        laydate.render({
            elem: '#chooseTime'
            ,range: true
        });

        table.render({
            elem: '#List',
            url: '/manage/excellent_list.do',
            method: 'post',
            limit: 10,
            cols: [[
                { title: '序号',align:'center',width:100,type:'numbers'},
                {field:'enrollId', title: 'EnrollID',align:'center',hide:'true'},
                {field:'year', title: '年份',align:'center',sort:true,width:100},
                {field:'competeName', title: '赛事名称',align:'center',sort:true},
                {field:'title', title: '参赛题目',align:'center'},
                {field:'members', title: '团队成员',align:'center'},
                {field:'instructor', title: '指导老师',align:'center',sort:true},
//                {field:'status',title: '状态',align:'center',templet:'#status'},
                {field:'prizeName', title: '获奖情况',align:'center',sort:true},
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