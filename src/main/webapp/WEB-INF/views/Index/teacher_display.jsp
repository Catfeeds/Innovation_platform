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
    	<div class="max-tit">新闻中心</div>
        <ul>
            
            <li><a href="news_list.html">通知公告</a></li>
            <li><a href="news_list.html">政策文件</a></li>
            <li><a href="news_list.html">下载专区</a></li>
            <li><a href="news_list.html">常见问题</a></li>
            
        </ul>
    </div>
    
    <div class="content-box">
    	<h1>优秀指导教师</h1>
        <ul class="clearfix" style=" width:705px; margin-left:-10px;">
            <c:forEach var="tech" items="${requestScope.goodTeachers}">
                <li class="pic">
                    <div class="img-box">
                        <img src="${tech.imageUrl}">
                    </div>
                    <h3><a href="teacher/${tech.id}.html">${tech.nameTeacher}</a></h3>
                </li>
            </c:forEach>
            <li class="pic">
            	<div class="img-box">                	
                		<img src="/images/黄鹤松（优秀教师）.jpg">
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>
            <li class="pic">
            	<div class="img-box">                	
                		<img src="/images/黄鹤松（优秀教师）.jpg">
                    
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>
            <li class="pic">
            	<div class="img-box">
                	
                		<img src="/images/黄鹤松（优秀教师）.jpg">
                    
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>
            <li class="pic">
            	<div class="img-box">
                	
                		<img src="/images/黄鹤松（优秀教师）.jpg">
                   
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>
            <li class="pic">
            	<div class="img-box">
                		<img src="/images/黄鹤松（优秀教师）.jpg">
                    
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>
            <li class="pic">
            	<div class="img-box">
                	
                		<img src="images/黄鹤松（优秀教师）.jpg">
                    
                </div>
                <h3><a href="teacher_detail.html">黄鹤松</a></h3>
            </li>

        </ul>
 <div class="tcdPageCode"></div>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.page.js"></script>
<script>
    $(".tcdPageCode").createPage({
        pageCount:100,
        current:1,
        backFn:function(p){
            //console.log(p);
        }
    });
</script>       
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
