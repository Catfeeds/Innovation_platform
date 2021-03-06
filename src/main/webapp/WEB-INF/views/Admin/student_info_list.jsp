<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>学生信息</title>
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
			<div class="layui-inline">
				<button type="button" class="layui-btn layui-btn-normal" id="data-import"><i class="layui-icon"></i>学生数据导入</button>
			</div>
		</div>
	</blockquote>
	<table id="List" lay-filter="ListID"></table>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['table','upload'], function(){
        var table = layui.table,
        upload = layui.upload;

        table.render({
			id:'search_tb',
            elem: '#List',
            url: '${cpath}/manage/student_info_list.do',
            method: 'post',
            toolbar:true,
            defaultToolbar: ['filter', 'print', 'exports'],
            limit: 10,
            cols: [[
                {field:'sno', title: '学号',align:'center',sort:true},
                {field:'nameStudent', title: '姓名',align:'center'},
                {field:'classno', title: '班级',align:'center',sort:true},
                {field:'pname', title: '专业',align:'center',sort:true},
                {field:'phone', title: '联系电话',align:'center'},
                {field:'qq', title: 'QQ',align:'center'},
                {field:'email',title: '邮箱',align:'center'},
                {field:'participateCount', title: '参与项目',templet:'#pcCount',sort:true,width:125},
                {field:'getPrizeCount', title: '获奖项目',templet:'#gpCount',sort:true,width:125},
                {field:'password', title: '登录密码',align:'center'}
//                {title: '操作',width:150,align:'center',toolbar: '#bar',fixed:'right'}
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        upload.render({
            elem: '#data-import'
            ,accept: 'file'
            ,url: '${cpath}/manage/student_import.do'
            ,done: function(res){
                layer.msg(res.msg, {
                    time: 20000, //20s后自动关闭
                    btn: [ '知道了']
                });
            }
        });

        $(".search_btn").click(function() {
            table.reload('search_tb', {
                url: '${cpath}/manage/student_search.do'
                , where: {key: $(".search_input").val()}
            });
        });

        table.on('tool(ListID)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                //window.open('/downloads.html');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除 '+data+' 么?', function(index){
                    $.ajax({
                        url:'${cpath}/manage/xxxx/'+data.id+".do",
                        type:'post',
                        success : function(data) {
                            if(data.status === 0){
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
                        content : "${cpath}/manage/xxxx/"+data.id+".do",
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
            }else if(obj.event === 'enroll_record'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "参与项目记录",
                        type : 2,
                        content : "${cpath}/manage/enroll_record/"+data.sno+".do",
                        success : function(layero, index){
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },500)
                        }
                    });
                    layui.layer.full(index);
                }).resize();
            }else if(obj.event === 'prize_record'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "获奖项目记录",
                        type : 2,
                        content : "${cpath}/manage/prize_record/"+data.sno+".do",
                        success : function(layero, index){
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },500)
                        }
                    });
                    layui.layer.full(index);
                }).resize();
            }
        });
    })
</script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="pcCount">
	<a style="text-decoration:underline" lay-event="enroll_record" href="#">{{ d.participateCount }}</a>
</script>
<script type="text/html" id="gpCount">
	<a style="text-decoration:underline" lay-event="prize_record" href="#">{{ d.getPrizeCount }}</a>
</script>