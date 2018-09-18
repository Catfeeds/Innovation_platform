<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>优秀教师</title>
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
	<style>
		.thumbBox:after{
			content: "优秀教师图片";
		}
	</style>
</head>
<body class="childrenBody">
<form class="layui-form layui-row layui-col-space10">
	<input id="action"  type="hidden" value="${action}">
	<div class="layui-col-md9 layui-col-xs12">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md9 layui-col-xs7">
				<div class="layui-form-item magt3">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<c:if test="${action == 'add' }">
							<input name="nameTeacher" type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输姓名">
						</c:if>
						<c:if test="${action == 'edit' }">
							<input name="id" type="hidden" value="${teacher.id}">
							<input name="nameTeacher" type="text" class="layui-input newsName" lay-verify="newsName" value="${teacher.nameTeacher}">
						</c:if>
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">职称</label>
					<div class="layui-input-inline">
						<c:if test="${action == 'add' }">
							<input name="occupationCall" type="text" class="layui-input newsName"  placeholder="请输入职称">
						</c:if>
						<c:if test="${action == 'edit' }">
							<input name="occupationCall" type="text" class="layui-input newsName"  value="${teacher.occupationCall}">
						</c:if>
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
						<c:if test="${action == 'add' }">
							<input name="phone" type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入联系方式">
						</c:if>
						<c:if test="${action == 'edit' }">
							<input name="phone" type="text" class="layui-input newsName" lay-verify="newsName" value="${teacher.phone}">
						</c:if>
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<c:if test="${action == 'add' }">
							<input name="email" type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入邮箱">
						</c:if>
						<c:if test="${action == 'edit' }">
							<input name="email" type="text" class="layui-input newsName" lay-verify="newsName" value="${teacher.email}">
						</c:if>
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">研究方向</label>
					<div class="layui-input-block">
						<c:if test="${action == 'add' }">
							<input name="researchDirection" type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输研究方向">
						</c:if>
						<c:if test="${action == 'edit' }">
							<input name="researchDirection" type="text" class="layui-input newsName" lay-verify="newsName" value="${teacher.researchDirection}">
						</c:if>
					</div>
				</div>
			</div>
			<div class="layui-col-md3 layui-col-xs5">
				<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg">
				</div>
			</div>
		</div>
		<input type="hidden" name="imageUrl" id="coverUrl" value="">
		<div class="layui-form-item magb0">
			<label class="layui-form-label">介绍内容</label>
			<div class="layui-input-block">
				<c:if test="${action == 'add' }">
					<textarea  name="introduce" lay-verify="requried"  class="mytextarea" id="mytextarea"></textarea>
				</c:if>
				<c:if test="${action == 'edit' }">
					<textarea  name="introduce" lay-verify="requried" class="mytextarea" id="mytextarea">${teacher.introduce}</textarea>
				</c:if>
			</div>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit="" lay-filter="addNews">确认添加</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript" >
    var action = $("#action").val();
    layui.use(['form','layer','upload'],function(){
        var form = layui.form,
            upload = layui.upload,
            $ = layui.jquery;


        if(action=='edit'){
            $('.thumbImg').attr('src', '${teacher.imageUrl}');
            $('#coverUrl').val('${teacher.imageUrl}');
        }
        //上传缩略图
        upload.render({
            elem: '.thumbBox',
            url: '${cpath}/manage/fileUpload.do',
            done: function(res){
                if(res.error==0){
                    $('#coverUrl').val(res.url);
                    $('.thumbImg').attr('src',res.url);
                    $('.thumbBox').css("background","#fff");
                }else{
                    layer.msg(res.message);
                }
            }
        });

        form.on("submit(addNews)",function(data){
            console.log(action);
            if(action=='edit'){
                $.ajax({
                    type:'post',
                    url:'${cpath}/manage/update_teacher.do',
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
                    url:'${cpath}/manage/add_teacher.do',
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
                //刷新父页面
                parent.location.reload();
            },500);
            return false;
        })

    })
</script>
</html>