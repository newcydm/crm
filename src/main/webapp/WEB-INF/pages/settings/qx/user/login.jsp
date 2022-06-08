<%@ page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../../jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../../jquery/jquery-1.11.1-min.js"></script>
	<script src="../../../jquery/jQuery.md5.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var loginAct,loginPwd;
		function login(){
			$.ajax({
				url:"doLogin",
				type:"post",
				data:{
					loginAct:loginAct,
					loginPwd:loginPwd,
					notLogin:$("#notLogin").prop("checked")
				},
				success:function (result) {
					if(result.code==2000){
						location="../../../workbench/index";
					}else{
						$("#msg").text(result.message);
					}
				}
			});
		}
		$(function () {
			//查看用户以前是否选择十天免登录
			$.ajax({
				url:"notLogin",
				success:function (result) {
					if(result.code==2000){
						loginAct=result.data.loginAct;
						loginPwd=result.data.loginPwd;
						login()
					}
				}
			});
			$("#butLogin").click(function () {
				//表单验证
				//账号
				loginAct=$("#loginAct").val();
				loginPwd=$("#loginPwd").val();
				loginPwd=$.md5(loginPwd);
				if(loginAct==''||loginPwd==''){
					alert("账号和密码不能为空");
					return;
				}
				login();
			});
		})
	</script>
</head>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="../../../image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;">&copy;2019&nbsp;动力节点</span></div>
	</div>
	
	<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form action="../../../workbench/index.html" class="form-horizontal" role="form">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input id="loginAct" class="form-control" type="text" placeholder="用户名">
					</div>
					<div style="width: 350px; position: relative;top: 20px;">
						<input id="loginPwd" class="form-control" type="password" placeholder="密码">
					</div>
					<div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
						<label>
							<input id="notLogin" type="checkbox" c> 十天内免登录
						</label>
						&nbsp;&nbsp;
						<span id="msg" style="color: red"></span>
					</div>
					<button id="butLogin" type="button" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>