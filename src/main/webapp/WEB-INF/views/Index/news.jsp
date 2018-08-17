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
            
            <li><a href="news_list.jsp">通知公告</a></li>
            <li><a href="news_list.jsp">政策文件</a></li>
            <li><a href="download.html">下载专区</a></li>
            <li><a href="news_list.jsp">常见问题</a></li>
            
        </ul>
    </div>
    
    <div class="content-box">
    	<h1>${requestScope.news.title}</h1>
        <div class="content">
        	<br /><br />
            ${requestScope.news.content}
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
        <div class="n-p-box clearfix">
        	<div class="prv"><a href="#">上一篇：11新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题新闻</a></div>
            <div class="next"><a href="#">下一篇：22新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题新闻</a></div>
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
