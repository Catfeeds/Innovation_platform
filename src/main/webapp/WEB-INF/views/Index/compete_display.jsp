<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<%--<style type="text/css">--%>
	<%--.tabula-box{--%>
		<%--min-height: 530px;--%>
	<%--}--%>
	<%--.test{--%>
		<%--width: 280px;--%>
		<%--float: left;--%>
		<%--margin: 30px;--%>
		<%--border: solid darkgray 1px;--%>
		<%--padding-bottom: 10px;--%>
		<%--border-radius: 5px;--%>
	<%--}--%>
	<%--.test img{--%>
		<%--width: 260px;--%>
		<%--height: 200px;--%>
		<%--margin: 10px;--%>
	<%--}--%>
		<%--.test h2{--%>
		<%--font-size: 15px;--%>
		<%--font-weight: bold;--%>
		<%--padding: 5px 10px;--%>
	<%--}--%>
	<%--.test .time{--%>
		<%--padding:5px 10px ;--%>
		<%--font-weight: bold;--%>
	<%--}--%>
	<%--.test p{--%>
		<%--padding:5px 10px ;--%>
	<%--}--%>
	<%--.test input{--%>
		<%--width: 100px;--%>
		<%--margin: 10px 80px;--%>
		<%--border: 1px solid gray;--%>
		<%--border-radius: 5px;--%>
	<%--}	--%>
<%--</style>--%>

	<style type="text/css">
		.tabula-box{
			min-height: 650px;
		}

		.product{
			width: 100%;
			height: 180px;
			overflow: hidden;
			border: 1px solid #CCCCCC;
			border-radius: 5px;
			margin-bottom: 12px;
		}

		.product p{
			font-size: 16px;
		}
		.product img{
			width: 250px;
			height: 150px;
			float: left;
			margin: 12px;
		}
		.product_detail{
			width:60% ;
			min-height: 10px;
			float: left;
			margin-left: 15px;
			margin-top: 12px;

		}
		.product_detail p{
			margin: 2px;
		}
		.index1-right {
			width: 100%;
			height: 170px;
			float: left;
			margin-bottom: 15px;
			overflow: hidden;

		}


		.index1-right p a {
			margin-left: 20px;
			color: #0aa6d6;
			font-size: 12px;
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
	
	<div class="tit-80"><a href="/index.html">首页</a>  - 赛事介绍</div>
			<%@include file="tag.jsp"%>
    
    <div class="content-box" id="data_fill" style="min-height: 420px">
    	<h1>赛事介绍</h1>
		<%--<c:forEach var="match" items="${requestScope.match}">--%>
			<%--<div class="test">--%>
				<%--<img src="${match.imgUrl}" />--%>
				<%--<h2>大赛名称：${match.nameMatch}</h2>--%>
				<%--<p class="time">报名时间：<span><fmt:formatDate value="${match.startTime}" pattern="yyyy-MM-dd" />-<fmt:formatDate value="${match.endTime}" pattern="yyyy-MM-dd" /></span></p>--%>
				<%--<p>赛事简介：${fn:substring(match.introduce, 0, 100)}...</p>--%>
				<%--<div class="layui-inline">--%>
					<%--<a href="compete/${match.id}.html"><input  type="button"  value="详情"  /></a>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</c:forEach>--%>
        <%--<div class="test">--%>
				<%--<img src="/images/robomaster.png" />--%>
				<%--<h2>大赛名称：大赛名称大赛名称大赛名称</h2>--%>
				<%--<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>--%>
				<%--<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介--%>
					<%--赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>--%>
				<%--<div class="layui-inline">--%>
					<%--<a href="news.html"><input  type="button"  value="详情"  /></a>--%>
				<%--</div>--%>
		<%--</div>--%>

	</div>
			<div id="PageCode" style="text-align: center"></div>

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
    var limit = 3;

    var a = $(".tag").find("li:eq(4)").find("a");
    a.css("color","#4a00ff");
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
            url:'/compete_page.do',
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

//    function fillData(res) {
//        $("#data_fill div.test").remove();
//        $.each(res.data, function (index, item) {
//            var img = $("<img/>").attr("src","/images/robomaster.png");
//            var h2 = $("<h2></h2>").append("大赛名称: "+item.nameMatch);
//			var p = $("<p></p>").addClass("time").append("报名时间: ").append($("<span></span>").append("2017/12/12-2017/12/13"));
//            var div = $("<div></div>").addClass("layui-inline").append($("<a></a>").attr("href","xxxx").append($("<input/>").val("详情").attr("type","button")));
//            $("<div></div>").addClass("test").append(img).append(h2).append(p).append(div).appendTo("#data_fill");
//        });
//    }

    function fillData(res) {
        $("#data_fill div.product").remove();
        $.each(res.data, function (index, item) {
            var img = $("<img/>").attr("src",item.imgUrl);
            var a = $("<a></a>").append(img).attr("href","/compete/"+item.id+".html");
            var h2 = $("<h2></h2>").append("大赛名称: "+item.nameMatch);
            var p2 =  $("<p></p>").append("赛事级别:"+item.levelName);
            var div2 = $("<div></div>").addClass("index1-right").append($("<p></p>").append("赛事介绍:"+item.introduce+"..."))
            var div1 = $("<div></div>").addClass("product_detail").append(h2).append(p2).append(div2);
            $("<div></div>").addClass("product").append(a).append(div1).appendTo("#data_fill");
        });
    }
</script>
</html>
