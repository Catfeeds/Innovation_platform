<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Admin/headTag.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的项目</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${cpath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${cpath}/static/css/news.css" media="all" />
	
</head>
<body class="childrenBody">
	<table id="List" lay-filter="ListID"></table>
	 <script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${cpath}/static/layui/layui.js"></script>
	<script type="text/javascript">
        $(".editEnroll").click(function () {
            console.log(this);
            //console.log($(this).attr("enrollId"));
        });

        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#List',
                url: '${cpath}/stu/enroll_list.do',
                method: 'post',
				size:'lg',
                cols: [[
                    {title: '序号',align:'center',type:'numbers',width:100},
                    {field:'enrollId', title: '报名表ID',align:'center',hide:'true'},
                    {field:'competeName', title: '赛事名称',align:'center'},
                    {field:'title', title: '参赛题目',align:'center'},
                    {field:'groupName', title: '团队名称',align:'center'},
                    {field:'members', title: '团队成员',align:'center',templet:'#members'},
                    {field:'instructor', title: '指导老师',align:'center'},
					{field:'status',title: '状态',align:'center',templet:'#status'},
                ]],
                done: function (res, curr, count) {

                }
            });

            window.toEdit = function(obj) {
                console.log(obj);
                var eId = $(obj).attr('enrollId');
                console.log(eId);
                var index = layui.layer.open({
                    title : "赛事报名",
                    type : 2,
                    content : "/stu/to_enroll_edit/"+eId+".html",
                    success : function(layero, index){
                        setTimeout(function(){
                            layui.layer.tips('点击此处返回友链列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }
                });
                $(window).resize(function(){
                    layui.layer.full(index);
                });
                layui.layer.full(index);
            }
        });

	</script>
	<script type="text/html" id="members">
		{{#  layui.each(d.members, function(index, item){ }}
		<span>{{ item.sname }}  </span>
		{{#  }); }}
	</script>
	<script type="text/html" id="status">
		{{#  if(d.status === 0){ }}
		<span style="color: black;">待审核</span>
		{{#  } else if(d.status === 1){ }}
		<span style="color: green;">通过/立项</span>
		{{#  } else if(d.status === 2){ }}
		<a href="javascript:;" onclick="toEdit(this)"  enrollId ={{ d.enrollId }} style="text-decoration: underline;color: red;">未通过</a>
		{{#  } else { }}
		<span style="color: #f1a02f;">未知参数</span>
		{{#  } }}
	</script>
</body>

</html>