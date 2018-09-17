<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>优秀教师</title>
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
	<style type="text/css">
		.layui-table-cell{
			height:60px;
			line-height:60px;
		}
	</style>
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
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加优秀教师</a>
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
                    title : "添加优秀教师",
                    type : 2,
                    content : "/manage/to_tech_add.do",
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
			id:'search_tb',
			elem: '#List',
			url: '/manage/teacher_list.do',
			method: 'post',
			limit: 10,
			size:'lg',
			cols: [[
				{title: '序号',width:100,align:'center',type:'numbers'},
				{field:'id', title: '序号',align:'center',sort:true,hide:'true'},
				{field:'nameTeacher', title: '教师姓名',align:'center'},
				{field:'occupationCall', title: '职称',align:'center'},
				{field:'imageUrl', title: '照片',align:'center',templet:function(d) {
					return '<img src="' + d.imageUrl + '" style="height:50px;width:35px"/>';
				}},
				{field:'researchDirection', title: '研究方向',align:'center'},
				{field:'phone',title: '联系方式',align:'center'},
				{field:'email', title: '邮箱',align:'center'},
				{field:'introduce', title: '介绍内容',align:'center'},
				{title: '操作',width:200,align:'center',toolbar: '#bar',fixed:'right'},
			]],
			page: true,
			done: function (res, curr, count) {

			}
		});

        $(".search_btn").click(function() {
            table.reload('search_tb', {
                url: '/manage/teacher_search.do'
                , where: {key: $(".search_input").val()}
            });
        });

            table.on('tool(ListID)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    window.open('/teacher/'+data.id+'.html');
                } else if(obj.event === 'del'){
                    layer.confirm('真的删除 '+data.nameMatch+' 么?', function(index){
                        $.ajax({
                            url:'/manage/delete_teacher/'+data.id+".do",
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
                            title : "编辑优秀教师",
                            type : 2,
                            content : "${cpath}/manage/to_tech_edit/"+data.id+".do",
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
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</html>