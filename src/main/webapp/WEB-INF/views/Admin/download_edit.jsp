<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>下载文件编辑</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
</head>
<body class="childrenBody">
<br>
<br>
	<form class="layui-form" style="width: 70%">
		<input id="action"  type="hidden" value="${action}">
		<div class="layui-form-item">
			<label class="layui-form-label">大赛名称</label>
			<div class="layui-input-block">
				<c:if test="${action == 'add' }">
					<input name="nameMatch" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入大赛名称">
				</c:if>
				<c:if test="${action == 'edit' }">
					<input name="id" id="downloadID"  type="hidden" value="${download.id}">
					<input name="nameMatch" type="text" class="layui-input newsName" lay-verify="required" value="${download.nameMatch}">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">作品名称</label>
			<div class="layui-input-block">
				<c:if test="${action == 'add' }">
					<input name="titleWork" type="text" class="layui-input productName" lay-verify="required" placeholder="请输入作品名称">
				</c:if>
				<c:if test="${action == 'edit' }">
					<input name="titleWork" type="text" class="layui-input productName" lay-verify="required" value="${download.titleWork}">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">作者姓名</label>
			<div class="layui-input-block">
				<c:if test="${action == 'add' }">
					<input name="author" type="text" class="layui-input productAuthor" lay-verify="required" placeholder="请输入作者姓名">
				</c:if>
				<c:if test="${action == 'edit' }">
					<input name="author" type="text" class="layui-input productAuthor" lay-verify="required"value="${download.author}">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师</label>
			<div class="layui-input-block">
				<c:if test="${action == 'add' }">
					<input name="instructor" type="text" class="layui-input teacher" lay-verify="required" placeholder="请输入指导老师">
				</c:if>
				<c:if test="${action == 'edit' }">
					<input name="instructor" type="text" class="layui-input teacher" lay-verify="required" value="${download.instructor}">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">作品附件</label>
			<div class="layui-input-block">
				<input id="attachment" type="hidden" name="attachment">
				<button type="button" class="layui-btn" id="upload_btn">
					<i class="layui-icon">&#xe67c;</i>上传附件
				</button>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">确认</button>
		    </div>
		</div>
	</form>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script type="text/javascript" >
    var action = $("#action").val();
    layui.use(['form','upload','layer','jquery'], function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            upload = layui.upload,
            $ = layui.jquery;


        if(action=='edit'){
            $('.thumbImg').attr('src', '${download.attachment}');
            $('#attachment').val('${download.attachment}');
        }
        //执行实例
        var uploadInst = upload.render({
            elem: '#upload_btn' //绑定元素
            ,url: '${cpath}/manage/fileUpload.do' //上传接口
            ,done: function(res){
                if(res.error==0){
                    layer.msg('文件上传成功'+res.url);
                    $('#attachment').attr("value",res.url);
				}else{
                    layer.msg(res.message);
				}
            }
            ,error: function(){
                layer.msg('请求接口异常');
            }
        });


        form.on("submit(addNews)",function(data){
            if(action=='edit'){
                $.ajax({
                    type:'post',
                    url:'${cpath}/manage/download_update.do',
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
                    url:'${cpath}/manage/download_add.do',
                    data:data.field,
                    success:function (data) {
                        layer.msg(data.msg);
                    },
                    error:function (data) {
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
</html>