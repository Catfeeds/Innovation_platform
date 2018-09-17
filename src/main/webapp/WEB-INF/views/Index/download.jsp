<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../headTag.jsp"%>
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
    	table,tr,td,th{border: 1px #000000 solid;}
    	td,th{text-align: center;}
    	tr{height:40px;}
    	.download{	
    		cursor: pointer;	
    	}
         .tabula-box{
             min-height: 550px;
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
            margin-left:565px;
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
<div id="detail2-box" class="clearfix">
	
	<div class="tit-80"><a href="${cpath}/index.html">首页</a> - 下载专区</div>
    	<%@include file="tag.jsp"%>
    
    <div class="content-box" style="min-height: 470px">
    	<h1>下载专区</h1>
        <div class="search-box">
            <select class="search-select" name="condition" id="c-year">
                <%--<option value="">全部</option>--%>
                <%--<option value="2018">2018</option>--%>
                <%--<option value="2017">2017</option>--%>
            </select>
            <input type="text"  name="textfield"  id="key-input" class="input-text" placeholder="请输入关键词">
            <input type="image" src="${cpath}/static/images/search.png" class="input-submit" id="search-btn"/>
        </div>
        <input id="count" type="hidden" value="${count}">
		<table style="width: 100%;" id="data_fill">
        	<tr>
        		<th style="width: 5%;">序号</th>
        		<th style="width: 35%;">大赛名称</th>
        		<th style="width: 25%;">作品标题</th>
        		<th style="width: 15%;">作者姓名</th>
        		<th style="width: 15%;">指导老师</th>
        		<th style="width: 5%;">下载</th>        		
        	</tr>
        </table>
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
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        var limit = 8;
        var a = $(".tag").find("li:eq(3)").find("a");
        a.css("color","#4a00ff");

        var date=new Date;
        var year=date.getFullYear();
        $(".search-select").append($("<option></option>").attr("value","").append("全部"));
        for (var i=0;i<3;i++)
        {
            var option = $("<option></option>").attr("value",year-i).append(year-i);
            $(".search-select").append(option);
        }


        $("#search-btn").click(function () {
            toSearchPage(1,true);
        });

        //初始化数据
        laypage_reload(false);

        $("#c-year").change(function () {
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
                url:'${cpath}/download_search.do',
                dataType: "json",
                data:{
                    page:page
                    ,limit:limit
                    ,key:$("#key-input").val()
                    ,condition:$("#c-year").val()
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
                type:'get',
                url:'${cpath}/download_page.do',
                dataType: "json",
                data:{
                    page:page,
                    limit:limit
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
            $("#data_fill tr:not(:first)").remove();
            $.each(res.data, function (index, item) {
                var id = $("<th></th>").append(item.id);
                var nameMatch = $("<th></th>").append(item.nameMatch);
                var titleWork = $("<th></th>").append(item.titleWork);
                var author = $("<th></th>").append(item.author);
                var instructor = $("<th></th>").append(item.instructor);
                var download = $("<th></th>").addClass('download').append($("<a></a>").attr('href','${cpath}/download_file/'+item.id+'.html').append($("<img/>").attr('src','${cpath}/static/images/u404.png')));
                var tr = $("<tr></tr>").append(id).append(nameMatch).append(titleWork).append(author).append(instructor).append(download);
                tr.appendTo("#data_fill");
            });
        }



    });

</script>
</html>
