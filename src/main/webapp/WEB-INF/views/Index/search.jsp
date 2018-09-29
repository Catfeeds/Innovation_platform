<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>科技创新项目管理平台</title>
    <link rel="stylesheet" type="text/css" href="${cpath}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${cpath}/static/css/index.css">
    <link rel="stylesheet" type="text/css" href="${cpath}/static/layui/css/layui.css">
    <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
    <script src="${cpath}/static/layui/layui.js"></script>
    <style>
        .tabula-box{
            min-height: 530px;
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
        <div class="top_slide_wrap about_pic">
            <ul class="slide_box bxslider">
                <li>
                    <a href="#"><img src="${cpath}/static/images/about_slide.jpg" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- slide end -->
<div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="${cpath}/index.html">首页</a> - <a href="#">搜索结果</a></div>
    	<%@include file="tag.jsp"%>
    <input id="news_count" type="hidden" value="${newsCount}">
    <input id="search_key" type="hidden" value="${key}">
    <div class="content-box" style="min-height: 489px">
    	<h1>搜索结果</h1>
        <ul id="news_fill">
        </ul>
    </div>
    <div id="news_page" style="text-align: center"></div>
</div>
   
    <!-- footer -->
        <div id="footer">
            <div class="footer">
                <div class="footer_h3 clearFloat">

                    <div class="footer_right">
                        <div class="nav">
                        </div>
                    </div>
                </div>

                <div class="footer_h3 footer_copyright clearFloat">
                    <p>Copyright 2018 | 版权所有   山东科技大学电气与自动化工程学院   </p>

                </div>
            </div>
        </div>
    <!-- footer end-->
 </div>
</body>
<script>
    $(document).ready(function() {
    var count = $('#news_count').val();
    var limit = 10;

    layui.use('laypage', function(){
        var laypage = layui.laypage;

        laypage.render({
            elem: 'news_page'
            ,count: count
            ,limit: limit
            ,theme: '#0aa6d6'
            ,jump: function(obj, first){
                toPage(obj.curr);
                if(!first){
                    toPage(obj.curr);
                }
            }
        });
    });

    function toPage(page) {
        $.ajax({
            type:'post',
            url:'${cpath}/search_page.do',
            dataType: "json",
            data:{
                page:page
                ,limit:limit
                ,key: $('#search_key').val()
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
        $("#news_fill").empty();
        $.each(res.data, function (index, item) {
            var a = $("<a></a>").attr("href","${cpath}/news/"+item.id+".html").append(item.title);
            var span = $("<span></span>").append(item.createTime);
            $("<li></li>").addClass("text").append(a).append(span).appendTo("#news_fill");
        });
    }
    });
</script>
</html>
