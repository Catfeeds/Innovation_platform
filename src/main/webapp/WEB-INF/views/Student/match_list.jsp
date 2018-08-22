<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>赛事报名</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/news.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
<style type="text/css">
	.context{
		float: left;
	}
.test{
		width: 300px;
		float: left;
		border: solid darkgray 1px;
		margin: 30px;
		padding-bottom: 10px;
		border-radius: 5px;
		
	}
	.test img{
		width: 280px;
		height: 200px;
		margin: 10px;
	}
	.test h1{
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
	.test .layui-inline{
		width: 100px;
		margin: 10px 100px;
	}
</style>
</head>
<body class="childrenBody">
	<div class="context">
		<c:forEach var="match" items="${matches}">
			<div class="test">
				<img src="${match.imgUrl}" />
				<h1>大赛名称：${match.nameMatch}</h1>
				<%--<p class="time">报名开始时间：<span><fmt:formatDate value="${match.startTime}" pattern="yyyy-MM-dd mm:HH" />-<fmt:formatDate value="${match.endTime}" pattern="yyyy-MM-dd mm:HH" /></span></p>--%>
				<p class="time">报名开始时间：<span><fmt:formatDate value="${match.startTime}" pattern="yyyy-MM-dd HH:mm" /></span></p>
				<p class="time">报名结束时间：<span><fmt:formatDate value="${match.endTime}" pattern="yyyy-MM-dd HH:mm" /></span></p>
				<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
				</div>
			</div>
		</c:forEach>

			<div class="test">
				<img src="../../images/robomaster.png" />
				<h1>大赛名称：大赛名称大赛名称大赛名称</h1>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
					<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
				</div>
			
			</div>
			<div class="test">
				<img src="../../images/robomaster.png" />
				<h1>大赛名称：大赛名称大赛名称大赛名称</h1>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
					<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
				</div>
			
			</div>
			<div class="test">
				<img src="../../images/robomaster.png" />
				<h1>大赛名称：大赛名称大赛名称大赛名称</h1>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
					<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
				</div>
			
			</div>
			<div class="test">
				<img src="../../images/robomaster.png" />
				<h1>大赛名称：大赛名称大赛名称大赛名称</h1>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
					<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
					</div>
			
			</div>
			<div class="test">
				<img src="../../images/robomaster.png" />
				<h1>大赛名称：大赛名称大赛名称大赛名称</h1>
				<p class="time">报名时间：<span>2017/12/12-2017/12/13</span></p>
				<p>赛事简介：赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介
					赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介赛事简介</p>
					<div class="layui-inline">
						<a class="layui-btn linksAdd_btn" style="background-color:#5FB878">报名</a>
					</div>
			</div>
	 <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	</div>
	
	<div id="page"></div>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //添加友情链接
        $(".linksAdd_btn").click(function(){
            var index = layui.layer.open({
                title : "赛事报名",
                type : 2,
                content : "/stu/to_enroll_match.html",
                success : function(layero, index){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回友链列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            })
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layui.layer.full(index);
            })
            layui.layer.full(index);
        })
    })
</script>
</body>
</html>