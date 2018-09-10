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
    <script src="/js/jquery-1.8.3.min.js"></script>
<style>
.techer_photo,.teacher_play{margin: 25px 0px 50px 42px;}
.techer_photo img{
	width:150px; height: 200px;
	/*margin: 25px 42px 10px 42px;*/
}	
.teacher_play img{
	margin: 0px;
	padding: 0px;
}
.teacher_play img{
	width: 18px; height: 18px;
	margin-bottom: -3px;
}
.teacher_play div{
	margin-bottom: 20px;
}
.teacher_play .tea-play-tit
{
	font-size: 18px;
	font-weight: bold;
	color: #000000;
	margin: 0px 0px 10px 20px;
		
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
                    <a href="#"><img src="/images/about_slide.jpg" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- slide end -->
<div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="/index.html">首页</a> - <a href="/teacher.html">优秀教师</a> - 教师详情</div>
	    <div class="tabula-box">
        <div class="techer_photo">
        	<img src="${teacher.imageUrl}" />
        	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${teacher.nameTeacher}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${teacher.occupationCall}</p>
        </div>
        <div class="teacher_play">
        	<div>
        		<span><img src="/images/u572.png"><span class="tea-play-tit">研究方向</span></span>
                <p>${teacher.researchDirection}</p>
        	</div>
        	<div>
        		<span><img src="/images/u575.png"><span class="tea-play-tit">联系电话</span></span>
        	<p>${teacher.phone}</p>
        	
        	</div>
        	<div>
        		<span><img src="/images/u578.png"><span class="tea-play-tit">邮箱</span></span>
        	<p>${teacher.email}</p>
        	</div>
        </div>
    </div>
    
    <div class="content-box">
    	<h1>教师详细信息</h1>
        <div class="content" style="width: 100%">
			${teacher.introduce}
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
    var a = $(".tag").find("li:eq(6)").find("a");
    a.css("color","#4a00ff");
</script>
</html>
