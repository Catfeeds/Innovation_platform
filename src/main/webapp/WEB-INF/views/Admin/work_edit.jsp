<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%>
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
							<c:if test="${action == 'add' }">
								<input name="matchName" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入大赛名称">
							</c:if>
							<c:if test="${action == 'edit' }">
								<input name="id" type="hidden" value="${work.id}">
								<input name="matchName" type="text" class="layui-input newsName" lay-verify="required" value="${work.matchName}">
							</c:if>
						</div>
					</div>
					<div class="layui-form-item magt3">
						<label class="layui-form-label">项目名称</label>
						<div class="layui-input-block">
							<c:if test="${action == 'add' }">
								<input name="itemName" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入项目名称">
							</c:if>
							<c:if test="${action == 'edit' }">
								<input name="itemName" type="text" class="layui-input newsName" lay-verify="required" value="${work.itemName}">
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">完成时间</label>
						<div class="layui-input-inline">
							<c:if test="${action == 'add' }">
								<input name="finishTime" id="finishTime" type="text" placeholder="点击选择时间" class="layui-input time" lay-verify="required" >
							</c:if>
							<c:if test="${action == 'edit' }">
								<input name="finishTime" id="finishTime" type="text" value="<fmt:formatDate value="${work.finishTime}" pattern="yyyy-MM-dd" />" class="layui-input time" lay-verify="required" >
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">赛事级别</label>
							<div class="layui-input-inline">
								<select name="levelId" class="Level" lay-filter="browseLook" id="data_fill">
								</select>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">获奖等级</label>
							<div class="layui-input-inline">
								<select name="prizeId" class="Prize" lay-filter="browseLook" id="data_fill2">
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
			</div>
			<input type="hidden" name="coverUrl" id="coverUrl" value="">

			<div class="layui-form-item magb0">
				<label class="layui-form-label">文章内容</label>
				<div class="layui-input-block">
					<c:if test="${action == 'add' }">
						<textarea class="mytextarea" name="introduce" lay-verify="required" id="mytextarea"></textarea>
					</c:if>
					<c:if test="${action == 'edit' }">
						<textarea class="mytextarea" name="introduce" lay-verify="required" id="mytextarea">${work.introduce}</textarea>
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
        layui.use(['form','layer','laydate','upload'],function(){
            var form = layui.form
            layer = parent.layer === undefined ? layui.layer : top.layer,
                laypage = layui.laypage,
                upload = layui.upload,
                laydate = layui.laydate,
                $ = layui.jquery;

            $.ajax({
                type:'post',
                url:'${cpath}/getLevel.do',
                dataType: "json",
                success:function (data) {
                    fillData(data);
                },
                error:function () {
                    layer.msg('接口错误');
                }
            });

            $.ajax({
                type:'post',
                url:'${cpath}/getPrize.do',
                dataType: "json",
                success:function (res) {
                    $.each(res.data, function (index, item) {
                        var option = $("<option></option>").val(item.id).append(item.prizeName);
                        option.appendTo("#data_fill2");
                    });
                    if(action === 'edit'){
                        $("select option[value='${work.prizeId}']").attr("selected","selected");
                    }
                    form.render('select');
                }
            });

            function fillData(res) {
                $.each(res.data, function (index, item) {
                    var option = $("<option></option>").val(item.id).append(item.levelName);
                    option.appendTo("#data_fill");
                });
                if(action === 'edit'){
                    $("select option[value='${work.levelId}']").attr("selected","selected");
                }
                form.render('select');
            }

            if(action=='edit'){
                $('.thumbImg').attr('src', '${work.coverUrl}');
                $('#coverUrl').val('${work.coverUrl}');
            }

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

            laydate.render({
                elem: '#finishTime',
                type: 'date'
            });

            form.on("submit(addNews)",function(data){
                if(action === 'edit'){
                    $.ajax({
                        type:'post',
                        url:'${cpath}/manage/update_gwork.do',
						dataType:'json',
                        data:data.field,
                        success:function (data) {
                            layer.msg(data.msg);
                        },
                        error:function (data) {
                            layer.msg('接口错误');
                        }
                    });
                }else if(action === 'add'){
                    $.ajax({
                        type:'post',
                        url:'${cpath}/manage/add_gwork.do',
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
            })



        })
	</script>
</body>
</html>