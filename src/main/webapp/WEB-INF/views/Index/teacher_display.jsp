<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <style>
        .tabula-box{
            min-height: 560px;
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
        <input id="count" type="hidden" value="${count}">

        <div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="/index.html">首页</a> - 优秀教师</div>
        <%@include file="tag.jsp"%>
    
    <div class="content-box">
    	<h1>优秀指导教师</h1>
        <ul class="clearfix" id="data_fill" style=" width:705px; margin-left:-10px;">
            <%--<li class="pic">--%>
            	<%--<div class="img-box">                	--%>
                		<%--<img src="/images/黄鹤松（优秀教师）.jpg">--%>
                <%--</div>--%>
                <%--<h3><a href="teacher_detail.html">黄鹤松</a></h3>--%>
            <%--</li>--%>
        </ul>
    </div>
    <div id="PageCode" style="text-align: center;" ></div>
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
    var count = $('#count').val();
    var limit = 6;
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        laypage.render({
            elem: 'PageCode'
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
            url:'/teacher_page.do',
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
        $("#data_fill").empty();
        $.each(res.data, function (index, item) {
            var img = $("<img/>").attr("src","/images/黄鹤松（优秀教师）.jpg");
            var div = $("<div></div>").addClass("img-box").append(img);
            var h3 = $("<h3></h3>").append($("<a></a>").attr("href","teacher/"+item.id+".html").append(item.nameTeacher));
            $("<li></li>").addClass("pic").append(div).append(h3).appendTo("#data_fill");
        });
    }
</script>
</html>
