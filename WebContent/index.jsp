<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" href="js/vendor/jgrowl/css/jquery.jgrowl.min.css">

<link rel="stylesheet" type="text/css" href="css/component.css" />

<style>
	input::-webkit-input-placeholder{
		color:rgba(0, 0, 0, 0.726);
	}
	input::-moz-placeholder{   /* Mozilla Firefox 19+ */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
		color:rgba(0, 0, 0, 0.726);
	}
</style>
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>QILAN HOTEL</h3>
						<form id="longinform" action="" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input id="ID" name="logname" class="text" style="color: #000000 !important" type="text" placeholder="输入账号">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input id="PASSWORD" name="logpass" class="text" style="color: #000000 !important" value="" type="password" placeholder="输入密码">
							</div>
							<div id="LOGIN" class="mb2"><a class="act-but submit" href="javascript:;" onclick="login()" style="color: #FFFFFF">登录</a></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/TweenLite.min.js"></script>
		<script src="js/EasePack.min.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/rAF.js"></script>
		<script src="js/demo-1.js"></script>
		<script src="js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
		<script>
		function login(){
    			var username = document.getElementById("ID").value;
   			 	var password = document.getElementById("PASSWORD").value;
    			if(username==""){
        			$.jGrowl("用户名不能为空！", { header: '提醒' });
    			}else if(password==""){
        			$.jGrowl("密码不能为空！", { header: '提醒' });
    			}else{
        			$.post("${pageContext.request.contextPath}/longin.action",$("#longinform").serialize(),
        			function(data){
        				if(data=="OK"){
        					window.location.href="${pageContext.request.contextPath}/room.action"
        				}else if(data=="passerror"){
        					alert("密码错误");
        				}else{
        					alert("该账号不存在");
        				}
        			});
    			}
}
		</script>
		<div style="text-align:center;">
		</div>
	</body>
</html>