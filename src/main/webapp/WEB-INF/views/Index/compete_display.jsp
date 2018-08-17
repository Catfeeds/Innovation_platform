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
<style type="text/css">
.test{
	width: 280px;
	float: left;
	margin: 30px;
	border: solid darkgray 1px;
	padding-bottom: 10px;
	border-radius: 5px;
}
	.test img{
		width: 260px;
		height: 200px;
		margin: 10px;
	}
		.test h2{
		font-size: 15px;
		font-weight: bold;
		padding: 5px 10px;
	}
	.test .time{
		padding:5px 10px ;
		font-weight: bold;
	}
	.test p{
		padding:5px 10px ;
	}
	.test input{
		width: 100px;
		margin: 10px 80px;
		border: 1px solid gray;
		border-radius: 5px;
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
    	<div class="max-tit">新闻中心</div>
        <ul>
            
            <li><a href="news_list.html">通知公告</a></li>
            <li><a href="news_list.html">政策文件</a></li>
            <li><a href="download.html">下载专区</a></li>
            <li><a href="news_list.html">常见问题</a></li>
            
        </ul>
    </div>
    
    <div class="content-box">
    	<h1>赛事介绍</h1>
		<c:forEach var="match" items="${requestScope.match}">
			<div class="test">
				<img src="${match.imgUrl}" />
				<h2>大赛名称：${match.nameMatch}</h2>
				<p class="time">报名时间：<span><fmt:formatDate value="${match.startTime}" pattern="yyyy-MM-dd" />-<fmt:formatDate value="${match.endTime}" pattern="yyyy-MM-dd" /></span></p>
				<p>赛事简介：${fn:substring(match.introduce, 0, 100)}...</p>
				<div class="layui-inline">
					<a href="compete/${match.id}.html"><input  type="button"  value="详情"  /></a>
				</div>
			</div>
		</c:forEach>
        <div class="test">
				<img src="/images/robomaster.png" />
				<h2>大赛名称：大赛名称大赛名称大赛名称</h2>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
				<div class="layui-inline">
					<a href="news.html"><input  type="button"  value="详情"  /></a>
				</div>
		</div>
		<div class="test">
				<img src="/images/robomaster.png" />
				<h2>大赛名称：大赛名称大赛名称大赛名称</h2>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
				<div class="layui-inline">
					<a href="news.html"><input  type="button"  value="详情"  /></a>
				</div>
					
			
		</div>	
		<div class="test">
				<img src="/images/robomaster.png" />
				<h2>大赛名称：大赛名称大赛名称大赛名称</h2>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
				<div class="layui-inline">
					<a href="news.html"><input  type="button"  value="详情"  /></a>
				</div>
					
			
		</div>	
		<div class="test">
				<img src="/images/robomaster.png" />
				<h2>大赛名称：大赛名称大赛名称大赛名称</h2>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
				<div class="layui-inline">
					<a href="news.html"><input  type="button" id="" value="详情"  /></a>
				</div>
		</div>			
 <div class="tcdPageCode" style="float: left; margin-left: 150px;"></div>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/jquery.page.js"></script>
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
