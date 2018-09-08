<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>科技创新项目管理平台</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
	<link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
	<script src="/js/jquery-1.8.3.min.js"></script>
	<script src="/static/layui/layui.js"></script>
	<style type="text/css">
    	table,tr,td,th{border: 1px #000000 solid;}
    	td,th{text-align: center;}
    	tr{height:40px;}
    	.download{	
    		cursor: pointer;	
    	}
         .tabula-box{
             min-height: 550px;
         }

        .search-box {
            width: 100%;
            height: 20px;
            position: relative;
            margin-bottom: 20px;
        }
        .search-box .input-text {
            width: 120px;
            height: 15px;
            position: absolute;
            top: 0;
            right: 0;
            padding: 5px 30px 5px 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background: #fff;
        }

        .search-box .input-submit {
            width: 25px;
            height: 25px;
            position: absolute;
            top: 0;
            right: 0;
            border: 1px solid #ccc;
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px;
        }
        .search-box .search-select{
            height: 26px;
            margin-left:550px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    </style>
</head>

<body>
	<div class="all-web">
    <!-- header -->
		<%@include file="head.jsp"%>
    <!-- header end-->
    <!-- slide -->
    <div id="slide">
        <div class="slide_top slide_about">
        </div>
        <div class="top_slide_wrap about_pic">
            <ul class="slide_box bxslider">
                <li>
                    <a href="#"><img src="/images/about_slide.jpg" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- slide end -->
<div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="/index.html">首页</a> - 下载专区</div>
    	<%@include file="tag.jsp"%>
    
    <div class="content-box" style="min-height: 470px">
    	<h1>下载专区</h1>
        <div class="search-box">
            <select class="search-select">
                <option >全部</option>
                <option >2018</option>
                <option >2017</option>
                <option >2016</option>
                <option >2015</option>
            </select>
            <input type="text" name="textfield" id="textfield" class="input-text" placeholder="请输入关键词">
            <input type="image" src="images/search.png" class="input-submit" />
        </div>
        <input id="count" type="hidden" value="${count}">
		<table style="width: 100%;" id="data_fill">
        	<tr>
        		<th style="width: 5%;">序号</th>
        		<th style="width: 35%;">大赛名称</th>
        		<th style="width: 25%;">作品标题</th>
        		<th style="width: 15%;">作者姓名</th>
        		<th style="width: 15%;">指导老师</th>
        		<th style="width: 5%;">下载</th>        		
        	</tr>
        </table>
    </div>
	<div id="layui_page" style="text-align: center"></div>
</div>

    <!-- footer -->
		<%@include file="foot.jsp"%>
    <!-- footer end-->
 </div>
</body>
<script>
    var count = $('#count').val();
    var limit = 8;
    var a = $(".tag").find("li:eq(3)").find("a");
    a.css("color","#4a00ff");
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        laypage.render({
            elem: 'layui_page'
            ,count: count
            ,limit:limit
            ,theme: '#0aa6d6'
            ,jump: function(obj, first){
                toPage(obj.curr);
                if(!first){
                    toPage(obj.curr);
                }
            }
        });
    })

    function toPage(page) {
        $.ajax({
            type:'get',
            url:'/download_page.do',
            dataType: "json",
            data:{
                page:page,
				limit:limit,
            },
            success:function (data) {
                fillData(data);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });
    }

    function fillData(res) {
        $("#data_fill tr:not(:first)").remove();
        $.each(res.data, function (index, item) {
            var id = $("<th></th>").append(item.id);
            var nameMatch = $("<th></th>").append(item.nameMatch);
            var titleWork = $("<th></th>").append(item.titleWork);
            var author = $("<th></th>").append(item.author);
            var instructor = $("<th></th>").append(item.instructor);
            var download = $("<th></th>").addClass('download').append($("<a></a>").attr('href','/download_file/'+item.id+'.html').append($("<img/>").attr('src','/images/u404.png')));
            var tr = $("<tr></tr>").append(id).append(nameMatch).append(titleWork).append(author).append(instructor).append(download);
            tr.appendTo("#data_fill");
        });
    }
</script>
</html>
