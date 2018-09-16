<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="Admin/headTag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<title>科技创新项目管理平台</title>

	<meta name="description" content="User login page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${cpath}/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${cpath}/assets/font-awesome/4.2.0/css/font-awesome.min.css" />

	<!-- text fonts -->
	<link rel="stylesheet" href="${cpath}/assets/fonts/fonts.googleapis.com.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="${cpath}/assets/css/ace.min.css" />

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
	<![endif]-->
	<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.min.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	<script src="${cpath}/static/js/jquery-1.8.3.min.js"></script>
</head>

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									科技创新项目管理平台
								</h1>

							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<!--<i class="ace-icon fa fa-lock green"></i>-->
												请输入您的登录信息
											</h4>

											<div class="space-6"></div>

											<form id="login" name="login" method="post" action="#">
												<fieldset>
													<label class="inline" style="margin-right:30px;">
	                                                    <input name="radio"  type="radio" id="radio1" value="radio" class="ace" checked><span class="lbl"> 学生登录</span>
                                                    </label>
                                                    <label class="inline">
                                                        <input name="radio" type="radio"  id="radio2" value="radio" class="ace" ><span class="lbl"> 老师登录</span>
                                                    </label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input value="1800300818" id="username" name="username" type="text" class="form-control" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
													  </span>
												  </label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input value="123456" id="password" name="password" type="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="clearfix" style="width:100px;">
														<span class="input-icon input-icon-right">
															<input name="vCode" id="vcode" type="text" class="form-control" placeholder="验证码" />
														</span>
													</label>
													<img id="code" src="${cpath}/makeCode.html" width="116" height="34">

													<label class="block clearfix">
														<span id="message" class="block input-icon input-icon-right" style="color: red;">
															${message}
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">


														<button id="btn-login" type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<span class="bigger-110">登录</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>


										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>

											</div>

											<div>
												<a href="#" class="user-signup-link">
													忘记密码
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--[if !IE]> -->
		<script src="assets/js/jquery.2.1.1.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script src="assets/js/jquery.1.11.1.min.js"></script>
		<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
            window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");

            /**重新生成验证码*/
            function reqCaptcha() {
                var url = "${cpath}/makeCode.html?nocache=" + new Date().getTime()
                $('#code').attr("src",url)
            }
            /**点击验证码重新生成*/
            $('#code').on('click', function () {
                reqCaptcha();
            });

			$("#btn-login").click(function () {
			    var student = $("#radio1").prop("checked");
                var teacher = $("#radio2").prop("checked");
				var username_el = $("#username");
				var password_el = $("#password");
				if($.trim(username_el.val()) === ""){
                    $("#message").html("用户名不能为空！");
				}else if($.trim(password_el.val()) === ""){
                    $("#message").html("密码不能为空！");
				}else if($.trim($("#vcode").val()) === ""){
                    $("#message").html("验证码不能为空！");
                }else {
                        if(teacher){
                            $.ajax({
                                url:'${cpath}/admin/login.do',
                                type:'post',
                                data:$('#login').serialize(),
                                dataType:'json',
                                success : function(data) {
                                    if(data.status === 1){
                                        $('#message').html("");
                                        $('#message').append(data.msg);
                                    }else if(data.status === 0){
                                        location.href="${cpath}/admin/index.html";
                                    }
                                }
                            });
                        }else if(student){
                            $.ajax({
                                url:'${cpath}/stu/login.do',
                                type:'post',
                                data:$('#login').serialize(),
                                dataType:'json',
                                success : function(data) {
                                    if(data.status === 1){
                                        $("#message").html("");
                                        $('#message').append(data.msg);
                                    }else if(data.status === 0){
                                        location.href="${cpath}/stu/index.html";
                                    }
                                }
                            });
                        }
                    }
            	});
		</script>
	</body>
</html>
