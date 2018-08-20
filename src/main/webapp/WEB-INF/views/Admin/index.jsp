<%--
  Created by IntelliJ IDEA.
  User: TingBin
  Date: 2018/8/1
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${cpath}/static/css/main.css" media="all" />
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo">后台管理</a>
            <!-- 显示/隐藏菜单 -->
            <!--<a href="javascript:;" class="iconfont hideMenu icon-menu1"></a>-->
            <!-- 搜索 -->
            <div class="layui-form component">
                <select name="modules" lay-verify="required" lay-search="">
                    <option value="">直接选择或搜索选择</option>
                    <option value="1">首页管理</option>

                </select>
                <i class="layui-icon">&#xe615;</i>
            </div>
            <!-- 天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
                <script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
                <script>tpwidget("init", {
                    "flavor": "slim",
                    "location": "WX4FBXXFKE4F",
                    "geolocation": "enabled",
                    "language": "zh-chs",
                    "unit": "c",
                    "theme": "chameleon",
                    "container": "tp-weather-widget",
                    "bubble": "disabled",
                    "alarmType": "badge",
                    "color": "#FFFFFF",
                    "uid": "U9EC08A15F",
                    "hash": "039da28f5581f4bcb5c799fb4cdfb673"
                });
                tpwidget("show");</script>
            </div>

        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">

        <div class="navBar layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item">
                    <a  href="../index.html">
                        <i class="iconfont icon-computer" data-icon="icon-computer">
                        </i><cite>主页</cite></a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="iconfont icon-text" data-icon="icon-text"></i>
                        <cite>首页管理</cite><span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="/manage/to_match_list.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>赛事介绍管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_news_list/1.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>通知公告管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_news_list/2.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>政策文件管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_news_list/3.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>常见问题管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_download_list.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>下载专区管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_work_list.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>成果展示管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_tech_list.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>优秀教师管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/to_scroll_list.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>轮播图管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="/manage/links.do">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>友情链接管理</cite></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont icon-text" data-icon="icon-text"></i>
                        <cite>学生管理</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/news/studentInfo.html">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>学生信息管理</cite></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont icon-text" data-icon="icon-text"></i>
                        <cite>项目管理</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="page/item/applyMasage.html">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>项目申报管理</cite>
                        </a>
                        </dd>
                        <dd><a href="javascript:;" data-url="page/item/apply.html">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>赛事报名管理</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="page/item/apply.html">
                            <i class="iconfont icon-text" data-icon="icon-text"></i>
                            <cite>项目统计</cite></a>
                        </dd>
                    </dl>
                </li>

                <span class="layui-nav-bar"></span>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${cpath}/static/page/main.html"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p>Copyright 2018 | 版权所有   山东科技大学电气与自动化工程学院   </p>
    </div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${cpath}/static/js/leftNav.js"></script>
<script type="text/javascript" src="${cpath}/static/js/index.js"></script>
</body>
</html>