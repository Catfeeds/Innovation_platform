<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>优秀教师滚动图</title>
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
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加滚动图</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
		<input type="hidden" id="newType" value="debug">
			<table id="List" lay-filter="listID"></table>
	</div>
	<div id="page"></div>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="isShow">
	<input type="checkbox" value="{{d.id}}" lay-skin="switch" lay-filter="show" lay-text="是|否" {{ d.isShow == 1 ? 'checked' : '' }} >
</script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table
            ,form = layui.form;

        $(window).one("resize",function(){
            $(".newsAdd_btn").click(function(){
                var index = layui.layer.open({
                    title : "添加滚动图",
                    type : 2,
                    content : "/manage/to_scroll_add/2.html",
                    success : function(layero, index){
                        setTimeout(function(){
                            layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
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
            url: '/manage/teacherScroll_list.do',
            method: 'post',
            limit: 10,
			size:'lg',
            cols: [[
                {title: '序号',align:'center',width:100,type:'numbers'},
                {field:'id', title: 'id',align:'center',hide:'true'},
                {field:'urlImg', title: '图片',align:'center',templet:function(d) {
					return '<img src="' + d.urlImg + '" style="height:50px;width:110px"/>';
				}},
				{field:'link', title: '超链接',align:'center'},
                {field:'isShow', title: '是否展示',align:'center',templet:'#isShow'},
                {title: '操作',align:'center',toolbar: '#bar',fixed:'right'},
            ]],
            page: true,
            done: function (res, curr, count) {

            }
        });

        form.on('switch(show)', function(obj){
            var action;
            if(obj.elem.checked){
                action='show';
			}else {
                action='hide';
			}
            $.ajax({
                url:'/manage/update_scroll_show.do',
                type:'post',
				data:{
                    id:this.value,
                  	showAction:action,
				},
                success : function(data) {
					layer.msg(data.msg);
                },
				error:function (data) {
                    layer.msg("接口错误");
                }
            });
            return false;
        });

        table.on('tool(listID)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                window.open("/index.html");
            } else if(obj.event === 'del'){
                layer.confirm('真的要删除么?', function(index){
                    $.ajax({
                        url:'/manage/delete_scroll/'+data.id+'.do',
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
            }
        });

        table.on('edit(listID)', function(obj){
            var value = obj.value
                ,data = obj.data
                ,field = obj.field;

            $.ajax({
                url:'/manage/update_scroll.do',
                type:'post',
                data:{
                    id:data.id,
                    nameLink:data.nameLink,
                    url:data.url,
                },
                success : function(data) {
                    layer.msg(data.msg);
                },
                error:function () {
                    layer.msg("服务器错误");
                }
            });
        });
    })
</script>

</html>
