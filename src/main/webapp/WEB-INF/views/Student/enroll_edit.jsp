<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../headTag.jsp"%><!DOCTYPE html>
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
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${cpath}/static/css/user.css" media="all" />
	<script type="text/javascript">
		$(function () {
			var show_count = 20;
			$("#btn_addtr").click(function () {
				var length = $("#dynamicTable tbody tr").length;
				if (length < show_count)
				{
					$("#tab11 tbody tr").clone().appendTo("#dynamicTable tbody");
				}
			});
		});
		function deltr(opp) {
			var length = $("#dynamicTable tbody tr").length;
			if (length <= 0) {

			} else {
				$(opp).parent().parent().remove();
			}
		}
	</script>
	<style type="text/css">
		table,tr,th,td{
			border: 1px gainsboro solid;
		}
		tr{height: 40px;}
		td{text-align: center;}
		table input{
			border: none;
			width: 98.5%;
			height: 40px;
		}
	</style>
</head>
<body class="childrenBody">
<br>
	<form id="form_enroll" class="layui-form" style="width:80%; display: block; float: left;">
		<input  name="enrollId" type="hidden" value="${item.enrollId}">
		<input  name="groupId" type="hidden" value="${item.groupId}">
		<input  name="status" type="hidden" value="${item.status}">
		<input  name="competeId" type="hidden" value="${item.competeId}">
		<div class="layui-form-item">
			<label class="layui-form-label">参赛名称:</label>
			<div class="layui-input-block">
				<input  type="text" disabled class="layui-input layui-disabled "  value="${item.competeName}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">队长姓名：</label>
			<div class="layui-input-block">
				<input  type="text" disabled class="layui-input layui-disabled "  value="${item.leader.nameStudent}">
			</div>			
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学号：</label>
			<div class="layui-input-block">
				<input name="grouper" type="tel" disabled class="layui-input layui-disabled " lay-verify="required" value="${item.leader.sno}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">班级：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.classno}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系电话：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.phone}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled " value="${item.leader.qq}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label>
			<div class="layui-input-block">
				<input  type="tel" disabled class="layui-input layui-disabled "  value="${item.leader.email}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参赛题目：</label>
			<div class="layui-input-block">
				<input name="title" type="tel" class="layui-input linksUrl" lay-verify="required" placeholder="请输入参赛题目" value="${item.title}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师：</label>
			<div class="layui-input-block">
				<input name="instructor" type="tel" class="layui-input linksUrl" lay-verify="required" placeholder="请输入指导老师" value="${item.instructor}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">团队名称：</label>
			<div class="layui-input-block">
				<input name="groupName" type="tel" class="layui-input linksUrl" lay-verify="required" placeholder="团队名称" value="${item.groupName}">
			</div>
		</div>		
		
		<div class="layui-form-item">
			<label class="layui-form-label">团队成员：</label>

	<table id="tab11" style="display: none;">
		<tbody>
			<tr>
				<td height="30" align="center">
					<input name="members2" onblur="getInfo($(this))" class="layui-input" type="text" /></td>
				<td align="center">
					<input class="layui-input" type="text" disabled/></td>
				<td align="center">
					<input class="layui-input" type="text"  disabled/></td>
				<td>
					<input type="button" onClick="deltr(this)" value="删行" class="layui-btn layui-btn-danger layui-btn-xs" >
				</td>
			</tr>
		</tbody>
	</table>

	<input type="button" id="btn_addtr" value="增行" class="layui-btn" style="margin-bottom: 10px">
	<table id="dynamicTable"  class="layui-table" style="float: right;width: 90%">
		<thead>
			<tr>
					<th style="width: 30%;">学号</th>
					<th style="width: 30%;">姓名</th>
					<th style="width: 30%;">班级</th>
					<th style="width: 10px;">操作</th>
				</tr>
		</thead>
		<tbody id="info-reload">
		<c:forEach var="member" items="${item.members}">
			<tr>
			<td height="30" align="center">
			<input name="members2" onblur="getInfo($(this))" class="layui-input" type="text" value="${member.sno}"/></td>
			<td align="center">
			<input class="layui-input layui-disabled" type="text" disabled/></td>
			<td align="center">
			<input class="layui-input layui-disabled" type="text" disabled/></td>
			<td>
			<input type="button" onClick="deltr(this)" value="删行" class="layui-btn layui-btn-danger layui-btn-xs" >
			</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">上传附件：</label>
			<div class="layui-input-block">
				<button type="button" class="layui-btn" id="attachment"><i class="layui-icon"></i>上传文件</button>
				<input id="attachmentVal" name="attachment" type="hidden" value="${item.attachment}">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="add">修改提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
</body>
<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
<script>
    layui.use(['form','upload'],function() {
        var form = layui.form,
			upload = layui.upload,
        	$ = layui.jquery;

        upload.render({
            elem: '#attachment'
            ,url: '${cpath}/manage/fileUpload.do?dir=file'
            ,accept: 'file'
            ,done: function(res){
                if(res.error === 0){
                    layer.msg("上传成功！");
                    $('#attachmentVal').val(res.url);
                }else{
                    layer.msg("上传失败(请打包成压缩文件上传!)");
                }
            },error:function () {
                layer.msg('上传文件接口错误');
            }
        });

        form.on("submit(add)", function (data) {
            $.ajax({
                type: 'post',
                url: '${cpath}/stu/enroll_edit.do',
                data: $('#form_enroll').serialize(),
                success: function (res) {
                    layer.msg(res.msg);
                },
                error: function () {
                    layer.msg('接口错误');
                }
            });

            setTimeout(function () {
                layer.closeAll("iframe");
                parent.location.reload();
            }, 500);
            return false;
        })
    });

    function getInfo(obj) {
        if(obj.val() === ''){
            obj.parents("tr").find("td:eq(1)").find("input").val("");
            obj.parents("tr").find("td:eq(2)").find("input").val("");
		}else{
			$.ajax({
				url:'${cpath}/stu/get_info2.do',
				type:'post',
				dataType:'json',
				data:{
					sno:obj.val()
				},
				success : function(res) {
					console.log(res);
					if(res.status === 0){
						obj.parents("tr").find("td:eq(1)").find("input").val(res.data.nameStudent);
						obj.parents("tr").find("td:eq(2)").find("input").val(res.data.classno);
					}
					else{
						layer.msg(res.msg);
                        obj.parents("tr").find("td:eq(1)").find("input").val("");
                        obj.parents("tr").find("td:eq(2)").find("input").val("");
					}
				}
			});
		}
    }
</script>
</html>