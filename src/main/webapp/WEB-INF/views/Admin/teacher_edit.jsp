<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="headTag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>文章列表--layui后台管理模板 2.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/public.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<style>
		.thumbBox:after{
			content: "测试";
		}
	</style>
</head>
<body class="childrenBody">
<form class="layui-form layui-row layui-col-space10">
	<div class="layui-col-md9 layui-col-xs12">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md9 layui-col-xs7">
				<div class="layui-form-item magt3">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输姓名">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">职称</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入职称">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入联系方式">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入邮箱">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">研究方向</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输研究方向">
					</div>
				</div>
			</div>
			<div class="layui-col-md3 layui-col-xs5">
				<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg">
				</div>
			</div>
		</div>
		<div class="layui-form-item magb0">
			<label class="layui-form-label">介绍内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="content" lay-verify="requried" id="news_content"></textarea>
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
    layui.use(['form','layer','layedit','laydate','upload'],function(){
        var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
            laypage = layui.laypage,
            upload = layui.upload,
            layedit = layui.layedit,
            laydate = layui.laydate,
            $ = layui.jquery;

        //用于同步编辑器内容到textarea
        layedit.sync(editIndex);

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

		laydate.render({
            elem: '#release',
            type: 'datetime',
            trigger : "click",
            done : function(value, date, endDate){
                submitTime = value;
            }
        });
        form.on("radio(release)",function(data){
            if(data.elem.title == "定时发布"){
                $(".releaseDate").removeClass("layui-hide");
                $(".releaseDate #release").attr("lay-verify","required");
            }else{
                $(".releaseDate").addClass("layui-hide");
                $(".releaseDate #release").removeAttr("lay-verify");
                submitTime = time.getFullYear()+'-'+(time.getMonth()+1)+'-'+time.getDate()+' '+time.getHours()+':'+time.getMinutes()+':'+time.getSeconds();
            }
        });

        form.on("submit(addNews)",function(data){
            //截取文章内容中的一部分文字放入文章摘要
            var abstract = layedit.getText(editIndex).substring(0,50);
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            // 实际使用时的提交信息
            // $.post("上传路径",{
            //     newsName : $(".newsName").val(),  //文章标题
            //     abstract : $(".abstract").val(),  //文章摘要
            //     content : layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0],  //文章内容
            //     newsImg : $(".thumbImg").attr("src"),  //缩略图
            //     classify : '1',    //文章分类
            //     newsStatus : $('.newsStatus select').val(),    //发布状态
            //     newsTime : submitTime,    //发布时间
            //     newsTop : data.filed.newsTop == "on" ? "checked" : "",    //是否置顶
            // },function(res){
            //
            // })
            setTimeout(function(){
                top.layer.close(index);
                top.layer.msg("文章添加成功！");
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            },500);
            return false;
        })

        //预览
        form.on("submit(look)",function(){
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行文章内容页面访问");
            return false;
        })

        //创建一个编辑器
        var editIndex = layedit.build('news_content',{
            height : 535,
            uploadImage : {
                url : "../../json/newsImg.json"
            }
        });

    })
</script>
</html>