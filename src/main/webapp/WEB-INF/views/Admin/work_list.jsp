<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>作品展示</title>
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
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加作品展示</a>
		</div>
		<%--<div class="layui-inline">--%>
			<%--<a class="layui-btn layui-btn-danger batchDel">批量删除</a>--%>
		<%--</div>--%>

	</blockquote>
	<div class="layui-form news_list">
			<table id="List" lay-filter="ListID"></table>
	</div>
	<div id="page"></div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table;

        $(window).one("resize",function(){
            $(".newsAdd_btn").click(function(){
                var index = layui.layer.open({
                    title : "添加优秀作品",
                    type : 2,
                    content : "${cpath}/manage/to_work_add.do",
                    success : function(layero, index){
                        setTimeout(function(){
                            layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }
                });
                layui.layer.full(index);
            })
        }).resize();

        table.render({
			id:'search_tb',
            elem: '#List',
            url: '${cpath}/manage/work_list.do',
            method: 'get',
            limit: 10,
			size:'lg',
            cols: [[
                {title: '序号',width:100,align:'center',type:'numbers'},
                {field:'id', title: '序号',align:'center',sort:true,hide:'true'},
                {field:'year', title: '年份',align:'center',sort:true},
                {field:'matchName', title: '大赛名称',align:'center'},
                {field:'itemName', title: '项目名称',align:'center'},
                {field:'levelName', title: '赛事级别',align:'center'},
                {field:'prizeName', title: '获奖名次',align:'center'},
                {field:'coverUrl', title: '封面',align:'center',templet:function(d) {
                    return '<img src="' + d.coverUrl + '" />'}},
                {field:'finishTime', title: '完成时间',align:'center',width:125},
                {field:'introduce', title: '简介',align:'center'},
                {title: '操作',align:'center',toolbar: '#bar',fixed:'right',width:200}
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        $(".search_btn").click(function() {
            table.reload('search_tb', {
                url: '${cpath}/manage/work_search.do'
                , where: {key: $(".search_input").val()}
            });
        });

        table.on('tool(ListID)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                window.open('${cpath}/achievement/'+data.id+'.html');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除'+data.title+'么?', function(index){
                    $.ajax({
                        url:'${cpath}/manage/delete_gwork/'+data.id+".do",
                        type:'post',
                        success : function(res) {
                            if(res.status === 0){
                                obj.del();
                                layer.msg(res.msg);
                            }
                            else
                                layer.msg(res.msg);
                        }
                    });
                    layer.close(index);
                });
            }else if(obj.event === 'edit'){
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        title : "编辑优秀作品",
                        type : 2,
                        content : "${cpath}/manage/to_work_edit/"+data.id+".do",
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
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>