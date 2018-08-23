<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>大赛添加</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/public.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${cpath}/static/kindeditor/kindeditor-all-min.js"></script>
	<script src="${cpath}/static/js/MyTextarea.js"></script>
</head>
<body class="childrenBody">
	<input id="action"  type="hidden" value="${action}">
	<br>
	<form class="layui-form layui-row layui-col-space10">
		<div class="layui-col-md9 layui-col-xs12">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md9 layui-col-xs7">
					<div class="layui-form-item">
						<label class="layui-form-label">赛事名称</label>
						<div class="layui-input-block">
							<c:if test="${action=='edit'}">
								<input id="matchID" name="id" type="hidden" value="${match.id}">
								<input name="nameMatch" type="text" class="layui-input newsName" lay-verify="required" value="${match.nameMatch}">
							</c:if>
							<c:if test="${action=='add'}">
								<input name="nameMatch" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入赛事名称">
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">官网链接</label>
						<div class="layui-input-block">
							<c:if test="${action=='edit'}">
								<input name="linkUrl" type="text" class="layui-input newsName" lay-verify="required" value="${match.linkUrl}">
							</c:if>
							<c:if test="${action=='add'}">
								<input name="linkUrl" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入官网链接">
							</c:if>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">赛事级别</label>
							<div class="layui-input-inline">
								<select name="levelMatch" class="Level" lay-filter="browseLook">
									<option value="1">国家级</option>
									<option value="2">省级</option>
									<option value="3">校级</option>
									<option value="4">院级</option>
								</select>
							</div>
						</div>
						<label class="layui-form-label">封面优先级</label>
						<div class="layui-input-inline">
							<c:if test="${action=='edit'}">
								<input name="priority" type="text" class="layui-input " lay-verify="required" value="${match.priority}">
							</c:if>
							<c:if test="${action=='add'}">
								<input name="priority" type="text" class="layui-input " lay-verify="required" placeholder="请输入封面优先级">
							</c:if>
						</div>
					</div>
				</div>
				<%--<div class="layui-col-md3 layui-col-xs5">--%>
					<%--<div class="layui-upload-list thumbBox mag0 magt3">--%>
						<%--<img class="layui-upload-img thumbImg" >--%>
					<%--</div>--%>
				<%--</div>--%>
				<div class="layui-col-md3 layui-col-xs5">
					<div class=" thumbBox mag0 magt3">
						<img class=" thumbImg" >
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">赛事简介</label>
					<div class="layui-input-block">
						<c:if test="${action=='add'}">
							<textarea id="mytextarea" name="introduce" lay-verify="content"  class="mytextarea"></textarea>
						</c:if>
						<c:if test="${action=='edit'}">
							<textarea id="mytextarea" name="introduce" lay-verify="content"  class="mytextarea">${match.introduce}</textarea>
						</c:if>
					</div>
				</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="addNews">确认</button>
					</div>
				</div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript" >
        var action = $("#action").val();
        layui.use(['form','layer','layedit','laydate','upload'],function(){
            var form = layui.form
            layer = parent.layer === undefined ? layui.layer : top.layer,
                laypage = layui.laypage,
                upload = layui.upload,
                layedit = layui.layedit,
                laydate = layui.laydate,
                $ = layui.jquery;

            lay('.time').each(function(){
                laydate.render({
                    elem: this,
					type:'datetime'
                });
            });
            if(action=='edit'){
                $('.thumbImg').attr('src', '${match.imgUrl}');
                $("select option[value='${match.levelMatch}']").attr("selected","selected");
            }

            //上传缩略图
            upload.render({
                elem: '.thumbBox',
                url: '../../json/userface.json',
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('.thumbImg').attr('src', result); //图片链接（base64）
                    });
                },
                done: function(res, index, upload){
                    $('.thumbImg').attr('src',res.data[num].src);
                    $('.thumbBox').css("background","#fff");
                }
            });

            var editIndex = layedit.build('news_content');

            form.on("submit(addNews)",function(data){
                layedit.sync(editIndex);
                if(action=='edit'){
                    $.ajax({
                        type:'post',
                        url:'/manage/match_update.do',
                        data:data.field,
                        success:function (data) {
                            layer.msg(data.msg);
                        },
                        error:function (data) {
                            layer.msg('接口错误');
                        }
                    });

                }else if(action=='add'){
                    $.ajax({
                        type:'post',
                        url:'${cpath}/manage/match_add.do',
                        data:data.field,
                        success:function (data) {
                            layer.msg(data.msg);
                        },
                        error:function (data) {
                            layer.msg(data);
                        }
                    });
                }
                setTimeout(function(){
                    layer.closeAll("iframe");
                    parent.location.reload();
                },800);
                return false;
            })
        })
	</script>
</body>
</html>