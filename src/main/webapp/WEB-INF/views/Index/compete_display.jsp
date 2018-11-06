<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>科技创新项目管理平台</title>
    <link rel="stylesheet" type="text/css" href="${cpath}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${cpath}/static/css/index.css">
	<link rel="stylesheet" type="text/css" href="${cpath}/static/layui/css/layui.css">
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${cpath}/static/layui/layui.js"></script>
	<style type="text/css">
		.tabula-box{
			min-height: 670px;
		}

		.product{
			width: 100%;
			height: 180px;
			overflow: hidden;
			border: 1px solid #CCCCCC;
			border-radius: 5px;
			margin-bottom: 12px;
		}

		.product p{
			font-size: 16px;
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
			float: left;
			margin-left: 15px;
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

		.search-box {
			width: 100%;
			height: 20px;
			position: relative;
			margin-bottom: 20px;
		}
		.search-box .input-text {
			width: 120px;
			height: 15px;
			position: absolute;
			top: 0;
			right: 0;
			padding: 5px 30px 5px 5px;
			border: 1px solid #ccc;
			border-radius: 3px;
			background: #fff;
		}

		.search-box .input-submit {
			width: 25px;
			height: 25px;
			position: absolute;
			top: 0;
			right: 0;
			border: 1px solid #ccc;
			border-top-right-radius: 3px;
			border-bottom-right-radius: 3px;
		}
		.search-box .search-select{
			height: 26px;
			margin-left:545px;
			border: 1px solid #ccc;
			border-radius: 3px;
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
                    <a href="#"><img src="${cpath}/static/images/about_slide.jpg" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- slide end -->
		<input id="count" type="hidden" value="${count}">
<div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="${cpath}/index.html">首页</a>  - 赛事介绍</div>
			<%@include file="tag.jsp"%>
    
    <div class="content-box" id="data_fill" style="min-height: 680px">
    	<h1>赛事介绍</h1>
		<div class="search-box">
			<select class="search-select" name="level" id="c-level">
				<option value="">全部</option>
				<option value="1">国家级</option>
				<option value="2">省级</option>
				<option value="3">校类A级</option>
				<option value="4">校类B级</option>
				<option value="5">校类C级</option>
			</select>
			<input type="text" name="textfield" id="key-input" class="input-text" placeholder="请输入关键词">
			<input type="image" src="${cpath}/static/images/search.png" class="input-submit" id="search-btn" />
		</div>
	</div>
			<div id="PageCode" style="text-align: center"></div>
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
    layui.use('laypage', function(){
        var laypage = layui.laypage;
		var limit = 3;

        var a = $(".tag").find("li:eq(4)").find("a");
        a.css("color","#4a00ff");

        $("#search-btn").click(function () {
            toSearchPage(1,true);
        });

        //初始化数据
        laypage_reload(false);

        $("#c-level").change(function () {
            toSearchPage(1,true);
        });

        function laypage_reload(isSearch) {
            laypage.render({
                elem: 'PageCode'
                ,count: $('#count').val()
                ,limit: limit
                ,theme: '#0aa6d6'
                ,jump: function(obj, first){
					if(!isSearch){
                        toPage(obj.curr);
                    }
                    if(!first){
					    if(!isSearch){
                            toPage(obj.curr);
                        }else {
                            toSearchPage(obj.curr,false);
                        }
                    }
                }
            });
        }

        function toSearchPage(page,first) {
            $.ajax({
                type:'post',
                url:'${cpath}/compete_search.do',
                dataType: "json",
                data:{
                    page:page
                    ,limit:limit
                    ,key:$("#key-input").val()
                    ,condition:$("#c-level").val()
                },
                success:function (res) {
                    $('#count').val(res.count);
                    if(first){
                        laypage_reload(true);
                    }
                    fillData(res);
                }
            });
        }

        function toPage(page) {
            $.ajax({
                type:'post',
                url:'${cpath}/compete_page.do',
                dataType: "json",
                data:{
                    page:page
                    ,limit:limit
                },
                success:function (data) {
                    fillData(data);
                }
            });
        }

        function fillData(res) {
            $("#data_fill div.product").remove();
            $.each(res.data, function (index, item) {
                var img = $("<img/>").attr("src",item.imgUrl);
                var a = $("<a></a>").append(img).attr("href","${cpath}/compete/"+item.id+".html");
                var h2 = $("<h2></h2>").append("大赛名称: "+item.nameMatch);
                var p2 =  $("<p></p>").append("赛事级别:"+item.levelName);
                var div2 = $("<div></div>").addClass("index1-right").append($("<p></p>").append("赛事介绍:"+item.introduce+"..."))
                var div1 = $("<div></div>").addClass("product_detail").append(h2).append(p2).append(div2);
                $("<div></div>").addClass("product").append(a).append(div1).appendTo("#data_fill");
            });
        }
    });

</script>
</html>
