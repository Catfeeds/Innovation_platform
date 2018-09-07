<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
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
	<link rel="stylesheet" href="${cpath}/static/css/public.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>

</head>
<body class="childrenBody">
	<input id="action"  type="hidden" value="${action}">
	<br>
	<form class="layui-form layui-row layui-col-space10">
		<div class="layui-col-md9 layui-col-xs12">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md9 layui-col-xs7">
					<div class="layui-form-item">
						<label class="layui-form-label">大赛名称</label>
						<div class="layui-input-block">
							<c:if test="${action=='edit'}">
								<input id="competeID" name="id" type="hidden" value="${compete.id}">
								<input name="nameCompete" type="text" class="layui-input " lay-verify="required" value="${compete.nameCompete}">
							</c:if>
							<c:if test="${action=='add'}">
								<input name="nameCompete" type="text" class="layui-input " lay-verify="required" placeholder="请输入大赛名称">
							</c:if>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">报名时间</label>
							<div class="layui-input-inline">
								<c:if test="${action=='edit'}">
									<input name="startTime" id="startTime" value="<fmt:formatDate value="${compete.startTime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text" placeholder="起始时间"  class="layui-input time" lay-verify="required|datetime" >
								</c:if>
								<c:if test="${action=='add'}">
									<input name="startTime" id="startTime" type="text" placeholder="起始时间"  class="layui-input time" lay-verify="required" >
								</c:if>
							</div>
							<div class="layui-input-inline">
								<c:if test="${action=='edit'}">
									<input value="<fmt:formatDate value="${compete.endTime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" name="endTime" id="endTime" type="text" placeholder="截止时间" class="layui-input time" lay-verify="required|datetime" >
								</c:if>
								<c:if test="${action=='add'}">
									<input name="endTime" id="endTime" type="text" placeholder="截止时间" class="layui-input time" lay-verify="required" >
								</c:if>
							</div>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">赛事级别</label>
							<div class="layui-input-inline">
								<select name="levelCompete" class="Level" lay-filter="browseLook" id="data_fill">
									<%--<option value="1">国家级</option>--%>
									<%--<option value="2">省级</option>--%>
									<%--<option value="3">校级A类</option>--%>
									<%--<option value="4">校级B类</option>--%>
									<%--<option value="5">校级C类</option>--%>
								</select>
							</div>
						</div>
					</div>


				</div>
				<div class="layui-col-md3 layui-col-xs5">
					<div class="layui-upload-list thumbBox mag0 magt3">
						<img class="layui-upload-img thumbImg">
					</div>
				</div>
				<input type="hidden" name="coverUrl" id="coverUrl" value="">
				<div class="layui-form-item">
					<label class="layui-form-label">报名要求</label>
					<div class="layui-input-block">
						<c:if test="${action=='add'}">
							<textarea class="layui-textarea layui-hide" name="requirement" lay-verify="content" id="mytextarea"></textarea>
						</c:if>
						<c:if test="${action=='edit'}">
							<textarea class="layui-textarea layui-hide" name="requirement" lay-verify="content" id="mytextarea">${compete.requirement }</textarea>
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
   	 	$(document).ready(function(){
            $.ajax({
                type:'post',
                url:'/manage/getLevel.do',
                dataType: "json",
                success:function (data) {
                    fillData(data);
                },
                error:function () {
                    layer.msg('接口错误');
                }
            });

            function fillData(res) {
                $.each(res.data, function (index, item) {
                    var option = $("<option></option>").val(item.id).append(item.levelName);
                    option.appendTo("#data_fill");
                });
            }
        });


        layui.use(['form','layedit','laydate','upload'],function(){
            var form = layui.form,
                layedit = layui.layedit,
                laydate = layui.laydate,
				upload = layui.upload,
                $ = layui.jquery;

            var editIndex = layedit.build('mytextarea');

            lay('.time').each(function(){
                laydate.render({
                    elem: this,
                    type:'datetime'
                });
            });

            if(action=='edit'){
                $('.thumbImg').attr('src', '${compete.coverUrl}');
                $('#coverUrl').val('${compete.coverUrl}');
                $("select option[value='${compete.levelCompete}']").attr("selected","selected");
            }

			upload.render({
                elem: '.thumbBox',
                url: '/manage/fileUpload.do',
                done: function(res){
                    if(res.error==0){
                        $('#coverUrl').val(res.url);
                        $('.thumbImg').attr('src',res.url);
                        $('.thumbBox').css("background","#fff");
                    }else{
                        layer.msg(res.message);
                    }
                },
				error: function(){
                    layer.msg('接口错误');
                }
            });

            form.on("submit(addNews)",function(data){
                console.log(layedit.getContent(editIndex)+':'+layedit.getText(editIndex));
                layedit.sync(editIndex);
                data.field.requirement=$("#mytextarea").val();
                if(action=='edit'){
                    $.ajax({
                        type:'post',
                        url:'/manage/update_compete.do',
                        data:data.field,
                        success:function (data) {
                            layer.msg(data.msg);
                        },
                        error:function () {
                            layer.msg('接口错误');
                        }
                    });
                }else if(action=='add'){
                    $.ajax({
                        type:'post',
                        url:'${cpath}/manage/add_compete.do',
                        data:data.field,
                        success:function (data) {
                            layer.msg(data.msg);
                        },
                        error:function () {
                            layer.msg('接口错误');
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