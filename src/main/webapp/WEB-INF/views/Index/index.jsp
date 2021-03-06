<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>科技创新项目管理平台</title>
	<link rel="stylesheet" type="text/css" href="${cpath}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${cpath}/static/css/index.css">
	<!-- slide -->
	<script type="text/javascript" src="${cpath}/static/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${cpath}/static/js/jquery.bxslider_e88acd1b.js"></script>
	<!-- 成果展示轮播图 -->
	<script type="text/javascript" src="${cpath}/static/js/jquery.SuperSlide2.js"></script>
	<!-- 优秀教师轮播图 -->
	<script src="${cpath}/static/js/jquery.foucs.js" type="text/javascript"></script>

</head>

<body>
<div class="all-web">
	<!-- header -->
	<%@include file="head.jsp"%>
	<!-- header end-->
	<!-- slide -->
	<div id="index-slide">

		<div class="top_slide_wrap">
			<ul class="slide_box bxslider">
				<c:forEach var="img" items="${coverScroll}">
					<li>
						<a href="${img.link}"><img src="${img.urlImg}" alt="${img.link}"></a>
					</li>
				</c:forEach>
			</ul>
			<div class="op_btns clearFloat">
				<a href="#" class="op_btn op_prev"><span></span></a>
				<a href="#" class="op_btn op_next"><span></span></a>
			</div>
		</div>
	</div>
	<script type="text/javascript">(function() {
        $(".bxslider").bxSlider({
            auto: true,
            prevSelector: $(".top_slide_wrap .op_prev")[0],
            nextSelector: $(".top_slide_wrap .op_next")[0]
        });
    })();</script>
	<!-- slide end -->

	<div id="content">
		<div class="content">
			<div class="content_index">
				<div class="index_about clearFloat">
					<!--赛事介绍模块 begin-->
					<div class="index_left" style="height: 645px;">
						<div class="index_left_h3">
							<h3>赛事介绍
								<span><a href="${cpath}/compete_display.html" target="_blank"><img src="${cpath}/static/images/bai2.png"></a></span>
							</h3>

						</div>
						<div class="complate">
							<c:forEach var="match" items="${requestScope.matches}">
								<div class="index1-left">
									<img src="${match.imgUrl}" align="left" style="width: 200px;height: 150px;margin: 10px"><div style="margin-left: 230px;margin-top: 15px;margin-right: 15px"><h1>大赛名称:  ${match.nameMatch}</h1><h1>大赛级别:  ${match.levelName}</h1>大赛简介: ${fn:substring(match.introduce,0,120)}...<a href="${cpath}/compete/${match.id}.html" style="color: #1d6fa6"> 查看更多</a></div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!--赛事介绍模块 final-->


					<div class="index_right ">
						<div class="index_left  index_projecte">
							<div class="index_left_h3">
								<h3>登陆入口</h3>
							</div>
							<div class="login" style="height: 237px;">
								<div class="index1-list-menu">
									<ul>
										<li><a target="_blank" href="${cpath}/login.html">用户登陆</a></li>
										<li><a  href="${cpath}/person.html" target="_blank">个人中心</a></li>

									</ul>
								</div>
							</div>
						</div>
						<div class="index_left  index_projecte" style="margin-top: 25px;">
							<div class="index_left_h3">
								<h3>常见问题
									<span><a href="${cpath}/news_list/3.html" target="_blank"><img src="${cpath}/static/images/bai2.png"></a></span>
								</h3>
							</div>
							<div class="login" style="height: 237px;">
								<div class="index1-right300">
									<ul>
										<c:forEach var="question" items="${requestScope.questions}">
											<li><a href="${cpath}/news/${question.id}.html" title="${question.title}">${question.title}</a><span><fmt:formatDate value="${question.createTime}" pattern="yyyy-MM-dd" /></span></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>


				<div class="index_about clearFloat">
					<div class="index_left  index_projecte">
						<div class="index_left_h3">
							<h3>通知公告
								<span><a href="${cpath}/news_list/1.html" target="_blank"><img src="${cpath}/static/images/bai2.png"></a></span>
							</h3>
						</div>
						<div class="index1-right300">
							<ul>
								<c:forEach var="notice" items="${requestScope.notices}">
									<li><a href="${cpath}/news/${notice.id}.html" title="${notice.title}">${notice.title}</a><span><fmt:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd" /></span></li>
								</c:forEach>
							</ul>
						</div>

					</div>
					<div class="index_left  index_projecte index_projecte2">
						<div class="index_left_h3">
							<h3>政策文件
								<span><a href="${cpath}/news_list/2.html" target="_blank"><img src="${cpath}/static/images/bai2.png"></a></span>
							</h3>
						</div>
						<div class="index1-right300">
							<ul>
								<c:forEach var="policy" items="${requestScope.policies}">
									<li><a href="${cpath}/news/${policy.id}.html" title="${policy.title}">${policy.title}</a><span><fmt:formatDate value="${policy.createTime}" pattern="yyyy-MM-dd" /></span></li>
								</c:forEach>
							</ul>
						</div>

					</div>
					<div class="index_left  index_projecte index_projecte3">
						<div class="index_left_h3">
							<h3>下载专区
								<span><a href="${cpath}/downloads.html" target="_blank"><img src="${cpath}/static/images/bai2.png"></a></span>
							</h3>
						</div>
						<div class="index1-right300">
							<ul>
								<c:forEach var="download" items="${requestScope.downloadFiles}">
									<li><a href="${cpath}/downloads.html" target="_blank" title="${download.titleWork}">${download.titleWork}</a><span><fmt:formatDate value="${download.createTime}" pattern="yyyy-MM-dd" /></span></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>


			</div>
		</div>

		<div class="content2">
			<div class="index_about clearFloat">
				<div class="index_class">
					<h3 class="title_float"><a href="${cpath}/achievements.html" target="_blank">优秀成果展示</a></h3>
				</div>
				<div class="friend">
					<div class="mr_frbox">
						<img class="mr_frBtnL prev" src="${cpath}/static/images/mfrl.gif" />
						<div class="mr_frUl" >
							<ul id="mr_fu">
								<c:forEach var="gw" items="${goodWorks}">
									<li>
										<a href="${cpath}/achievement/${gw.id}.html">
											<img title="${gw.itemName}" src="${gw.coverUrl}" />
										</a>
									</li>
								</c:forEach>
								<%--<li>--%>
									<%--<a href="news.jsp">--%>
										<%--<img src="images/成果4.jpg" />--%>
									<%--</a>--%>
								<%--</li>--%>
							</ul>
						</div>
						<img class="mr_frBtnR next" src="${cpath}/static/images/mfrr.gif" />
					</div>
				</div>
				<script type="text/javascript">
					$(".mr_frbox").slide({
                    titCell: "",
                    mainCell: ".mr_frUl ul",
                    autoPage: true,
                    effect: "leftLoop",
                    autoPlay: true,
                    vis: 3
                });</script>
				<script type="text/javascript">$(document).ready(function() {

                    $(".mr_zhe_hover").css("top", $('.mr_zhe').eq(0).height());
                    $("li").mouseout(function(e) {
                        if((e.pageX < $(this).offset().left || e.pageX > ($(this).offset().left + $(this).width())) || (e.pageY < $(this).offset().top || e.pageY > ($(this).offset().top + $(this).height()))) {
                            $(this).find('.mr_zhe_i').show();
                            $(this).find('.mr_zhe_hover').hide().stop().animate({
                                top: '300px'
                            }, {
                                queue: false,
                                duration: 190
                            });
                            return false;
                        }

                    });
                    $('.mr_zhe').mouseover(function(event) {
                        $(this).find('.mr_zhe_i').hide();
                        $(this).find('.mr_zhe_hover').show().stop().animate({
                            top: '190px'
                        }, {
                            queue: false,
                            duration: 190
                        });
                        return false;
                    });

                    $("#searchBtn").on('click', function(){
                        var key = $("#searchKey").val();
                        if(key===""){
                            alert("关键词不能为空!");
						}else{
                            location.href="${cpath}/search.html?key="+key;
						}
                    });

                    });
				</script>
			</div>
		</div>
		<div class="content2">
			<div class="index_about clearFloat" id="good-teacher">
				<div class="index_class index_teacher">
					<h1 class="title_float"><a href="${cpath}/teacher.html" target="_blank">优秀指导教师</a></h1>
				</div>
				<!-- 代码 开始 -->
				<div id="main">
					<div id="index_b_hero">
						<div class="hero-wrap">
							<ul class="heros clearfix">
								<c:forEach var="ts" items="${teacherScroll}">
									<li class="hero">
										<a href="${ts.link}">
											<img src="${ts.urlImg}" class="thumb"  />
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="helper">
							<div class="mask-left">
							</div>
							<div class="mask-right">
							</div>
							<a  class="prev icon-arrow-a-left"></a>
							<a  class="next icon-arrow-a-right"></a>
						</div>
					</div>
				</div>
				<script type="text/javascript">
                    $.foucs({ direction: 'right' });
				</script>
				<!-- 代码 结束 -->
			</div>
		</div>

	</div>
	<!-- footer -->
	<%@include file="foot.jsp"%>
	<!-- footer end-->
</div>
</body>

</html>

