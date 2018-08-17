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
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/js/jquery.page.js"></script>
    <style type="text/css">
    	table,tr,td,th{border: 1px #000000 solid;}
    	td,th{text-align: center;}
    	tr{height:40px;}
    	.download{	
    		cursor: pointer;	
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
	
	<div class="tit-80"><a href="news_list.html">新闻中心</a> - 查看详情</div>
	    <div class="tabula-box">
    	<div class="max-tit">新闻中心</div>
        <ul>
            
            <li><a href="news_list.html">通知公告</a></li>
            <li><a href="news_list.html">政策文件</a></li>
            <li><a href="download.html">下载专区</a></li>
            <li><a href="news_list.html">常见问题</a></li>
            
        </ul>
    </div>
    
    <div class="content-box">
    	<h1>下载专区</h1>
        <table style="width: 100%;">
        	<tr>
        		<th style="width: 5%;">序号</th>
        		<th style="width: 35%;">大赛名称</th>
        		<th style="width: 25%;">作品标题</th>
        		<th style="width: 15%;">作者姓名</th>
        		<th style="width: 15%;">指导老师</th>
        		<th style="width: 5%;">下载</th>        		
        	</tr>
			<c:forEach var="download" varStatus="s" items="${requestScope.download}">
				<tr>
					<th>${s.count}</th>
					<th>${download.nameMatch}</th>
					<th>${download.titleWork}</th>
					<th>${download.author}</th>
					<th>${download.instructor}</th>
					<th class="download"><a href="/download_file/${download.id}.html"><img src="/images/u404.png"></a></th>
				</tr>
			</c:forEach>
        	<tr>
        		<th>8</th>
        		<th>第六届robomaster机器人大赛</th>
        		<th>html测试模板</th>
        		<th></th>
        		<th></th>
        		<th class="download"><img src="/images/u404.png"></th>
        	</tr>
        </table>
        <div class="tcdPageCode"></div>
    </div>
    

</div>

<script>
    $(".tcdPageCode").createPage({
        pageCount:100,
        current:1,
        backFn:function(p){
            //console.log(p);
        }
    });
</script>
   
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
