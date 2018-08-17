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
	
	<div class="tit-80"><a href="list-text1.html">新闻中心</a> - 查看详情</div>
	    <div class="tabula-box">
        <div class="techer_photo">
        	<img src="${requestScope.teacher.imageUrl}" />
        	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.teacher.nameTeacher}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.teacher.occupationCall}</p>
        </div>
        <div class="teacher_play">
        	<div>
        		<span><img src="/images/u572.png"><span class="tea-play-tit">研究方向</span></span>
                <p>${requestScope.teacher.researchDirection}</p>
        	<p>test传感器与智能仪表</p>
        	<p>test自动检测监控与系统集成</p>
        	</div>
        	<div>
        		<span><img src="/images/u575.png"><span class="tea-play-tit">联系电话</span></span>
        	<p>${requestScope.teacher.phone}</p>
        	<p>0532-80691703</p>
        	
        	</div>
        	<div>
        		<span><img src="/images/u578.png"><span class="tea-play-tit">邮箱</span></span>
        	<p>${requestScope.teacher.email}</p>
        	</div>
        </div>
    </div>
    
    <div class="content-box">
    	<h1>教师详细信息</h1>
        <div class="content">
        	<p style="width: 650px; font-size: 16px;">
                ${requestScope.teacher.introduce}
        	</p>
        </div>
    </div>
    

</div>

   
    <!-- footer -->
    <div id="footer">
		<div class="footer">
			<div class="footer_h3 clearFloat">

				<div class="footer_right">
					<div class="nav">
						
		                <ul>
		                	<li>友情连接：</li>
		                    <li><a href="http://www.sdust.edu.cn/" target="_blank">山东科技大学</a>
		                    </li>
		                    <li><a href="http://lib.sdust.edu.cn/" target="_blank">山东科技大学图书馆</a>
		                    </li>
		                    <li><a href="http://jwc.sdust.edu.cn/" target="_blank">山东科技大学教务处</a>
		                    </li>
		                    <li><a href="http://bjx.sdust.edu.cn/" target="_blank">北极星</a>
		                    </li>
		                    <li><a href="http://xsgzc.sdust.edu.cn/" target="_blank">学生处(部)</a>
		                    </li>
		                    
		                </ul>
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

</html>
