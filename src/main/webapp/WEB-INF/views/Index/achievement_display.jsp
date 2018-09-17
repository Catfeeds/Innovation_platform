<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		min-height: 680px;
	}

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
		margin-right:30px;
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
		/*margin-left: 167px;*/
		width: 100%;
		height: 37px;
		position: relative;
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
		margin-left:385px;

	}
	.search-select select{
		height: 26px;
		border-radius: 3px;
		border: 1px solid #ccc;
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
	
	<div class="tit-80"><a href="${cpath}/index.html">首页</a> - 优秀成果</div>
	    <%@include file="tag.jsp"%>
    
    <div class="content-box" id="data_fill" style="min-height: 661px">
    	<h1>成果展示</h1>
		<div class="search-box">
			<span class="search-select">
			<select name="condition_year" id="c-year">
			</select>
			</span>
			<span class="search-select" style="margin-left: 5px;" >
			<select name="condition_prize" id="c-prize"></select>
			</span>
			<span class="search-select" style="margin-left: 5px;" >
			<select name="condition_level" id="c-level"></select>
			</span>
			<input type="text" name="textfield" id="key-input" class="input-text" placeholder="请输入大赛名称">
			<input type="image" src="${cpath}/static/images/search.png" class="input-submit" id="search-btn"/>
		</div>
</div>
	<div id="layui_page" style="text-align: center"></div>
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
    var count = $('#count').val();
    var limit = 3;

    var a = $(".tag").find("li:eq(5)").find("a");
    a.css("color","#4a00ff");

    layui.use('laypage', function(){
        var laypage = layui.laypage;


        var date=new Date;
        var year=date.getFullYear();
        $("#c-year").append($("<option></option>").attr("value","").append("全部"));
        for (var i=0;i<3;i++)
        {
            var option = $("<option></option>").attr("value",year-i).append(year-i);
            $("#c-year").append(option);
        }

        $.ajax({
            type:'post',
            url:'${cpath}/getPrize.do',
            dataType: "json",
            success:function (res) {
                $("#c-prize").append($("<option></option>").attr("value","").append("全部"));
                $.each(res.data, function (index, item) {
                    var option = $("<option></option>").val(item.id).append(item.prizeName);
                    option.appendTo("#c-prize");
                });
            }
        });

        $.ajax({
            type:'post',
            url:'${cpath}/getLevel.do',
            dataType: "json",
            success:function (res) {
                $("#c-level").append($("<option></option>").attr("value","").append("全部"));
                $.each(res.data, function (index, item) {
                    var option = $("<option></option>").val(item.id).append(item.levelName);
                    option.appendTo("#c-level");
                });
            }
        });

        //初始化数据
        laypage_reload(false);

        $("#search-btn").click(function () {
            toSearchPage(1,true);
        });
        $("#c-year").change(function () {
            toSearchPage(1,true);
        });
        $("#c-prize").change(function () {
            toSearchPage(1,true);
        });
        $("#c-level").change(function () {
            toSearchPage(1,true);
        });


        function laypage_reload(isSearch) {
            laypage.render({
                elem: 'layui_page'
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
                url:'${cpath}/achievement_search.do',
                dataType: "json",
                data:{
                    page:page
                    ,limit:limit
                    ,key:$("#key-input").val()
                    ,condition_year:$("#c-year").val()
					,condition_prize:$("#c-prize").val()
					,condition_level:$("#c-level").val()
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
                url:'${cpath}/achievement_page.do',
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
                var a = $("<a></a>").attr("href","${cpath}/achievement/"+item.id+".html").append($("<img/>").attr("src",item.coverUrl));
                var h2 = $("<h2></h2>").append("项目名称: "+item.itemName);
                var p =  $("<p></p>").append("完成时间:"+(item.finishTime).split(' ')[0]);
                var div2 = $("<div></div>").addClass("index1-right").append($("<p></p>").append("作品简介:"+item.introduce+"..."));
                var div1 = $("<div></div>").addClass("product_detail").append(h2).append(p).append(div2);
                $("<div></div>").addClass("product").append(a).append(div1).appendTo("#data_fill");
            });
        }
    });

</script>
</html>
