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
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/js/jquery.page.js"></script>
    <script src="/static/layui/layui.js"></script>
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
	
	<div class="tit-80"><a href="news_list.jsp">新闻中心</a> - 查看详情</div>
	    <div class="tabula-box">
    	<div class="max-tit">新闻中心</div>
        <ul>
            
            <li><a href="news_list.jsp">通知公告</a></li>
            <li><a href="news_list.jsp">政策文件</a></li>
            <li><a href="download.html">下载专区</a></li>
            <li><a href="news_list.jsp">常见问题</a></li>
            
        </ul>
    </div>
    <input id="news_type" type="hidden" value="${newsType}">
    <div class="content-box">
    	<h1>这里是新闻类型列表标题</h1>
        <ul id="news_fill">
            <%--<c:forEach var="news" items="${news}">--%>
                <%--<li class="text"><a href="news/${news.id}.html">${news.title}</a><span><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd" /></span></li>--%>
            <%--</c:forEach>--%>
        </ul>
        <div id="news_page" style="text-align: center"></div>
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
<script>
    var type = $('#news_type').val();
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        laypage.render({
            elem: 'news_page'
            ,count: 50
            ,theme: '#0aa6d6'
            ,jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                toPage(obj.curr);
                //首次不执行
                if(!first){
                    toPage(obj.curr);
//                    location.href='/news_list/'+type+'.html?page='+obj.curr;
                }
            }
        });
    })

    function toPage(page) {
        $.ajax({
            type:'post',
            url:'/test/1.do',
            dataType: "json",
            data:{
                page:page
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
        $("#news_fill").empty();
        $.each(res.data, function (index, item) {
            var a = $("<a></a>").attr("href","/news/"+item.id+".html").append(item.title);
            var span = $("<span></span>").append(item.createTime);
            $("<li></li>").addClass("text").append(a).append(span).appendTo("#news_fill");
        });
    }
</script>
</html>
