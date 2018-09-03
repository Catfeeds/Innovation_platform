<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>优秀作品添加</title>
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
<br>
	<input id="action"  type="hidden" value="${action}">
	<form class="layui-form layui-row layui-col-space10">
		<div class="layui-col-md9 layui-col-xs12">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md9 layui-col-xs7">
					<div class="layui-form-item magt3">
						<label class="layui-form-label">大赛名称</label>
						<div class="layui-input-block">
								<input name="enrollId" type="hidden" value="${item.enrollId}">
								<input  type="text" disabled class="layui-input layui-disabled" lay-verify="required" value="${item.competeName}">
						</div>
					</div>
					<div class="layui-form-item magt3">
						<label class="layui-form-label">项目名称</label>
						<div class="layui-input-block">
								<input  type="text" disabled class="layui-input layui-disabled" lay-verify="required" value="${item.title}">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">获奖级别</label>
							<div class="layui-input-inline">
								<select name="prizeId"   id="data_fill"></select>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">完成时间</label>
						<div class="layui-input-inline">
							<c:if test="${action == 'add' }">
								<input name="finishTime" id="finishTime" type="text" placeholder="点击选择时间" class="layui-input time" lay-verify="required" >
							</c:if>
							<c:if test="${action == 'edit' }">
								<input name="finishTime" id="finishTime" type="text" value="<fmt:formatDate value="${excellent.finishTime}" pattern="yyyy-MM-dd" />" class="layui-input time" lay-verify="required" >
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
			<input type="hidden" name="coverUrl" id="coverUrl" value="">

			<div class="layui-form-item magb0">
				<label class="layui-form-label">介绍内容</label>
				<div class="layui-input-block">
					<c:if test="${action == 'add' }">
						<textarea class="mytextarea" name="introduce" id="mytextarea"></textarea>
					</c:if>
					<c:if test="${action == 'edit' }">
						<textarea class="mytextarea" name="introduce"  id="mytextarea">${excellent.introduce}</textarea>
					</c:if>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">确认</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        var action = $("#action").val();

        $.ajax({
            type:'post',
            url:'/manage/getPrize.do',
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
                var option = $("<option></option>").val(item.id).append(item.prizeName);
                option.appendTo("#data_fill");
            });
        }

        layui.use(['form','laydate','upload'],function(){
            var form = layui.form
                laypage = layui.laypage,
                upload = layui.upload,
                laydate = layui.laydate;

            if(action=='edit'){
                $('.thumbImg').attr('src', '${excellent.coverUrl}');
                $('#coverUrl').val('${excellent.coverUrl}');
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
                }
            });

            laydate.render({
                elem: '#finishTime',
                type: 'date',
            });

            form.on("submit(addNews)",function(data){
                if(action=='edit'){
                    $.ajax({
                        type:'post',
                        url:'/manage/xxx.do',
						dataType:'json',
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
                        url:'/manage/excellent_add.do',
                        data: data.field,
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
                },500);
                return false;
            });

        });
	</script>
</body>
</html>