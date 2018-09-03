<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<c:forEach var="compete" items="${competes}">
			<div class="test">
				<img src="${compete.coverUrl}" />
				<h1>大赛名称：${compete.nameCompete}</h1>
				<h1>大赛级别：${compete.levelName}</h1>
				<p class="time">报名开始时间：<span><fmt:formatDate value="${compete.startTime}" pattern="yyyy-MM-dd HH:mm" /></span></p>
				<p class="time">报名结束时间：<span><fmt:formatDate value="${compete.endTime}" pattern="yyyy-MM-dd HH:mm" /></span></p>
				<%--<p>报名要求:${fn:substring(compete.requirement,0,200)}...</p>--%>
				<div class="layui-inline">
					<a class="layui-btn linksAdd_btn" competeId="${compete.id}" style="background-color:#5FB878">报名</a>
				</div>
			</div>
		</c:forEach>

	 <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	</div>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        $(".linksAdd_btn").click(function(){
            var id = $(this).attr("competeId");
            var index = layui.layer.open({
                title : "赛事报名",
                type : 2,
                content : "/stu/to_compete_enroll/"+id+".html",
                success : function(layero, index){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回友链列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            })
            $(window).resize(function(){
                layui.layer.full(index);
            })
            layui.layer.full(index);
        })
    })
</script>
</body>
</html>