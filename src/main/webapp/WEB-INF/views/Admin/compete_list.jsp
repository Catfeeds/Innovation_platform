<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>赛事介绍</title>
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
		<%--<div class="layui-inline">--%>
		    <%--<div class="layui-input-inline">--%>
		    	<%--<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">--%>
		    <%--</div>--%>
		    <%--<a class="layui-btn search_btn">查询</a>--%>
		<%--</div>--%>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加赛事报名</a>
		</div>
		
		<%--<div class="layui-inline">--%>
			<%--<a class="layui-btn layui-btn-danger batchDel">批量删除</a>--%>
		<%--</div>--%>
	</blockquote>

	<table id="List" lay-filter="ListID"></table>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table;

        $(window).one("resize",function(){
            $(".newsAdd_btn").click(function(){
                var index = layui.layer.open({
                    title : "添加赛事报名",
                    type : 2,
                    content : "${cpath}/manage/to_compete_add.do",
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }
                })
                layui.layer.full(index);
			})
		}).resize();

			table.render({
                elem: '#List',
                url: '${cpath}/manage/compete_list.do',
                method: 'post',
				size:'lg',
                limit: 10,
                cols: [[
                    {title: '序号',align:'center',width:100,type:'numbers'},
                    {field:'id', title: '序号',align:'center',sort:true,hide:'true'},
                    {field:'nameCompete', title: '大赛名称',align:'center'},
                    {field:'levelName', title: '大赛级别',align:'center'},
                    {field:'coverUrl', title: '封面图片',align:'center',templet:function(d) {
                        return '<img src="' + d.coverUrl + '" />';
                    }},
                    {field:'startTime', title: '开始时间',align:'center'},
                    {field:'endTime',title: '结束时间',align:'center'},
                    {field:'createTime', title: '创建时间',align:'center'},
                    {field:'requirement', title: '报名要求',align:'center'},
                    {title: '操作',width:200,align:'center',toolbar: '#bar',fixed:'right'},
                ]],
                page: true,
                done: function (res, curr, count) {

                }
            });

            table.on('tool(ListID)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    //window.open(data.url);
                } else if(obj.event === 'del'){
                    layer.confirm('真的删除 '+data.nameCompete+' 么?', function(index){
                        $.ajax({
                            url:'${cpath}/manage/delete_compete/'+data.id+".do",
                            type:'post',
                            success : function(data) {
                                if(data.status==0){
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
                            title : "编辑赛事报名",
                            type : 2,
                            content : "${cpath}/manage/to_compete_edit/"+data.id+".do",
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
                }
            });
        })
</script>
<script type="text/html" id="bar">
	<%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>
</html>