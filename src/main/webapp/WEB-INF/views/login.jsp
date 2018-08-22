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

		<link rel="stylesheet" href="${cpath}/assets/css/ace-rtl.min.css" />

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
	                                                    <input name="radio" type="radio" id="radio1" value="radio" class="ace" ><span class="lbl"> 学生登录</span>
                                                    </label>
                                                    <label class="inline">
                                                        <input type="radio" name="radio" id="radio2" value="radio" class="ace" checked><span class="lbl"> 老师登录</span>
                                                    </label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input value="admin" id="username" type="text" class="form-control" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
													  </span>
												  </label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input value="123456" id="password" type="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<div class="code"><img src="${cpath}/makeCode.html" width="116" height="36"></div>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														

														<button id="btn-login" type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
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
		<script src="${cpath}/assets/js/jquery.2.1.1.min.js"></script>


<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");

            /**重新生成验证码*/
            function reqCaptcha() {
                var url = "/makeCode.html?nocache=" + new Date().getTime()
                $('.code img').attr("src",url)
            }
            /**点击验证码重新生成*/
            $('.code img').on('click', function () {
                reqCaptcha();
            });

			$("#btn-login").click(function () {
			    var student = $("#radio1").prop("checked");
                var teacher = $("#radio2").prop("checked");
				var username_el = $("#username");
				var password_el = $("#password");
				if($.trim(username_el.val()) == ""){
				    alert("用户名不能为空！");
				}
				else if($.trim(password_el.val()) == ""){
				    alert("密码不能为空！");
				}else {
				    if(teacher){
                        $.ajax({
                            url:'/admin/login.do',
                            type:'post',
                            data:{
                                username:username_el.val(),
                                password:password_el.val(),
                            },
                            dataType:'json',
                            success : function(data) {
                                if(data.status==1){
                                    alert(data.msg);
                                }else if(data.status==0){
                                    location.href="/admin/index.html";
                                }
                            }
                        });
					}else if(student){
                        $.ajax({
                            url:'/stu/login.do',
                            type:'post',
                            data:{
                                sno:username_el.val(),
                                password:password_el.val(),
                            },
                            dataType:'json',
                            success : function(data) {
                                if(data.status==1){
                                    alert(data.msg);
                                }else if(data.status==0){
                                    location.href="/stu/index.html";
                                }
                            }
                        });
					}

                }
            });
		</script>
	</body>
</html>
