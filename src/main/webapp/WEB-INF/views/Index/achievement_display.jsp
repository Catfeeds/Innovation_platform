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
	<link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
	<script src="/js/jquery-1.8.3.min.js"></script>
	<script src="/static/layui/layui.js"></script>
<style type="text/css">
.product{
	width: 100%;
	height: 180px;
	overflow: hidden;
	border: 1px solid #CCCCCC;
	border-radius: 5px;
	margin-bottom: 12px;
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
	float: right;
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
    
    <div class="content-box" id="data_fill">
    	<h1>成果展示</h1>
		<%--<c:forEach var="goodWork" items="${requestScope.goodWorks}">--%>
			<%--<div class="product">--%>
				<%--<img src="/images/robomaster.png" />--%>
				<%--<div class="product_detail">--%>
					<%--<h2>项目名称：${goodWork.itemName}</h2>--%>
					<%--<p>完成时间：<fmt:formatDate value="${goodWork.finishTime}" pattern="yyyy-MM-dd" /></p>--%>

					<%--<div class="index1-right">--%>
						<%--<p>赛事介绍：${fn:substring(goodWork.introduce,0,100)}...<a href="achievement/${goodWork.id}.html" target="_blank">查看更多...</a></p>--%>
					<%--</div>--%>

				<%--</div>--%>
			<%--</div>--%>
		<%--</c:forEach>--%>
    	<%--<div class="product">--%>
    		<%--<img src="/images/robomaster.png" />--%>
    		<%--<div class="product_detail">--%>
    		<%--<h2>项目名称：作品名称作品名称作品名称</h2>--%>
    		<%--<p>完成时间：2017/12/12</p>--%>
    		<%--<div class="index1-right">    	--%>
        		<%--<p>赛事介绍：内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容...<a href="news.html" target="_blank">查看更多...</a></p>--%>
    		<%--</div>--%>
    		<%--</div>    		--%>
    	<%--</div>--%>

</div>
	<div id="PageCode"></div>

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
<script>
    var count = $('#count').val();
    var limit = 2;
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
            url:'/achievement_page.do',
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

    function fillData(res) {
        $("#data_fill div.product").remove();
        $.each(res.data, function (index, item) {
            var img = $("<img/>").attr("src","/images/robomaster.png");
            var h2 = $("<h2></h2>").append("项目名称: "+item.itemName);
            var p =  $("<p></p>").append("完成时间:"+item.finishTime);
            var div2 = $("<div></div>").addClass("index1-right").append($("<p></p>").append("赛事介绍:"+item.introduce))
            var div1 = $("<div></div>").addClass("product_detail").append(h2).append(p).append(div2);
            $("<div></div>").addClass("product").append(img).append(div1).appendTo("#data_fill");
        });
    }
</script>
</html>
