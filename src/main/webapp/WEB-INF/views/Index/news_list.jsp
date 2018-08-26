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
	
	<div class="tit-80"><a href="/index.html">首页</a>-<a href="/news_list/${newsTypeId}.html">新闻中心</a> - ${newsType}</div>
	    <div class="tabula-box">
    	<div class="max-tit">新闻中心</div>
        <ul>
            
            <li><a href="news_list.jsp">通知公告</a></li>
            <li><a href="news_list.jsp">政策文件</a></li>
            <li><a href="download.html">下载专区</a></li>
            <li><a href="news_list.jsp">常见问题</a></li>
            
        </ul>
    </div>
    <input id="news_typeId" type="hidden" value="${newsTypeId}">
    <input id="news_count" type="hidden" value="${newsCount}">
    <div class="content-box" style="min-height: 450px">
    	<h1>${newsType}</h1>
        <ul id="news_fill">
        </ul>
    </div>
    <div id="news_page" style="text-align: center"></div>

</div>
   
    <!-- footer -->
        <%@include file="foot.jsp"%>
    <!-- footer end-->
 </div>
</body>
<script>
    var type = $('#news_typeId').val();
    var count = $('#news_count').val();
    var limit = 2;
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        laypage.render({
            elem: 'news_page'
            ,count: count
            ,limit: limit
            ,theme: '#0aa6d6'
            ,jump: function(obj, first){
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                toPage(obj.curr);
                if(!first){
                    toPage(obj.curr);
                }
            }
        });
    })

    function toPage(page) {
        $.ajax({
            type:'post',
            url:'/news_page/'+type+'.do',
            dataType: "json",
            data:{
                page:page
                ,limit:limit
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
            var a = $("<a></a>").attr("href","/news/"+item.id+".html").append(item.title);
            var span = $("<span></span>").append(item.createTime);
            $("<li></li>").addClass("text").append(a).append(span).appendTo("#news_fill");
        });
    }
</script>
</html>
