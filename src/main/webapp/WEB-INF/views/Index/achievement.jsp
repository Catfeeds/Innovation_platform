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
	<script src="/js/jquery-1.8.3.min.js"></script>
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
	
	<div class="tit-80"><a href="/index.html">首页</a> - <a href="/achievement.html">优秀作品</a> - <a href="#">作品详情</a></div>
    <%@include file="tag.jsp"%>
    
    <div class="content-box" >
    	<h1>${excellent.itemName}</h1>
        <div class="content" style="width: 100%">
            <p style="margin-bottom: 15px"><img src="/images/calendar.png" style="width: 15px"> 发布于 <fmt:formatDate value="${excellent.finishTime}" pattern="yyyy-MM-dd  HH:mm:ss" /></p>
        ${excellent.introduce}
        </div>
    </div>
    

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
    var a = $(".tag").find("li:eq(5)").find("a");
    a.css("color","#4a00ff");
</script>
</html>
