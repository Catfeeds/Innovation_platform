<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码--管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/user.css" media="all" />
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
</head>
<body class="childrenBody">
	<form class="layui-form changePwd">
		<div style="margin:0 0 15px 110px;color:#f00;"><!--旧密码请输入“123456”，-->新密码必须两次输入一致才能提交</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">用户名</label>
		    <div class="layui-input-block">
		    	<input type="text" value="${stu.nameStudent}" disabled class="layui-input layui-disabled">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">学号</label>
		    <div class="layui-input-block">
		    	<input type="text" value="${stu.sno}" disabled class="layui-input layui-disabled">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">旧密码</label>
		    <div class="layui-input-block">
		    	<input name="oldPwd" type="password"  placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">新密码</label>
		    <div class="layui-input-block">
		    	<input name="newPwd" type="password" placeholder="请输入新密码" lay-verify="required|newPwd" id="oldPwd" class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">确认密码</label>
		    <div class="layui-input-block">
		    	<input name="" type="password"  placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
		    </div>
		</div>
		<div class="layui-form-item">
		    <div class="layui-input-block">
		    	<button class="layui-btn" lay-submit="" lay-filter="changePwd">立即修改</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
</body>
<script type="text/javascript">
    layui.use(['form','layer'],function(){
        var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
            laypage = layui.laypage,
            $ = layui.jquery;

        form.verify({
            userLoginName: function(value, item){
                //验证登陆账号
                if(!new RegExp("^[0-9A-Za-z_]{2,20}$").test(value)){
                    return '登陆账号只能为英文、数字、下划线，长度2-20位';
                }
            },
            userName: function(value, item){
                //验证用户名
                if(!new RegExp("^([\u4e00-\u9fa5]){2,10}$").test(value)){
                    return '用户姓名只能为中文，长度2-7位';
                }
            }
        });

        form.on("submit(changePwd)",function(data){
            $.ajax({
                url : '/stu/change_pwd.do',
                type : 'post',
                data : data.field,
                success : function(data) {
                   	top.layer.msg(data.msg);
                },
				error:function(data){
                    top.layer.msg("接口错误");
                }
            });
            setTimeout(function(){
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            },800);
            return false;
        });

    });

</script>
</html>