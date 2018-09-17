<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            min-height: 585px;
        }
        .search-box {
            width: 100%;
            height: 20px;
            position: relative;
            margin-bottom: 10px;
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
        <input id="count" type="hidden" value="${count}">

        <div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="${cpath}/index.html">首页</a> - 优秀教师</div>
        <%@include file="tag.jsp"%>
    
    <div class="content-box">
    	<h1>优秀指导教师</h1>
        <div class="search-box">
            <input type="text" name="textfield" id="key-input" class="input-text" placeholder="请输入教师名称">
            <input type="image" src="${cpath}/static/images/search.png" class="input-submit" id="search-btn"/>
        </div>

        <div style="margin-left: 40px;margin-top: 40px;min-height: 483px">
            <ul class="clearfix" id="data_fill" style=" width:705px; margin-left:-10px;">
            </ul>
        </div>
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

    var a = $(".tag").find("li:eq(6)").find("a");
    a.css("color","#4a00ff");

    layui.use('laypage', function(){
        var laypage = layui.laypage;

        $("#search-btn").click(function () {
            toSearchPage(1,true);
        });

        //初始化数据
        laypage_reload(false);

        function laypage_reload(isSearch) {
            laypage.render({
                elem: 'PageCode'
                ,count: $('#count').val()
                ,limit: limit
                ,theme: '#0aa6d6'
                ,jump: function(obj, first){
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    if(!isSearch){
                        toPage(obj.curr);
                    }
                    if(!first){
                        if(!isSearch){
                            toPage(obj.curr);
                        }else {
                            toSearchPage(obj.curr,false);
                        }
                    }
                }
            });
        }

        function toSearchPage(page,first) {
            $.ajax({
                type:'post',
                url:'${cpath}/teacher_search.do',
                dataType: "json",
                data:{
                    page:page
                    ,limit:limit
                    ,key:$("#key-input").val()
                },
                success:function (res) {
                    $('#count').val(res.count);
                    if(first){
                        laypage_reload(true);
                    }
                    fillData(res);
                }
            });
        }

        function toPage(page) {
            $.ajax({
                type:'post',
                url:'${cpath}/teacher_page.do',
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
                var img = $("<img/>").attr("src",item.imageUrl);
                var a = $("<a></a>").attr("href","${cpath}/teacher/"+item.id+".html").append(img);
                var div = $("<div></div>").addClass("img-box").append(a);
                var h3 = $("<h3></h3>").append($("<a></a>").attr("href","${cpath}/teacher/"+item.id+".html").append(item.nameTeacher));
                $("<li></li>").addClass("pic").append(div).append(h3).appendTo("#data_fill");
            });
        }

    })


</script>
</html>
