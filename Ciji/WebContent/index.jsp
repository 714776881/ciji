<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/js.cookie.js"></script>
</head>
<body>
<c:if test="${!empty error}">
    <script>
            alert("${error}");
            window.location.href="login.html";
</script>
</c:if>
<c:if test="${!empty succ}">
    <script>
            alert("${succ}");
            window.location.href="login.html";
</script>
</c:if>
<div class="materialContainer" >
	<div class="box">
		<div class="title" style="color:black;text-align: center;font-size: 60px;font-family: '楷体'">词记
		</div>
		<div class="title"></div>
		<div class="input">
			<label for="name"  style="font-size: 30px;font-family: '楷体'">邮箱</label>
			<input type="text" name="user_email" id="name">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="pass" style="font-size: 30px;font-family: '楷体'">密码</label>
			<input type="password" name="user_password" id="pass">
			<span class="spin"></span>
		</div>
		<div class="checkbox text-right" style="color:black;font-size: 16px;font-family: '楷体'">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
            <a href="#" style="color:red">忘记密码</a>
            <div style="color: red;font-size:14px;float:right" id="info" ></div>
        </div>
		<div class="button login">
			<button type="submit" id="loginButton" onclick="logining()">
				<span>登录</span>
				<i class="fa" aria-hidden="true">登录</i>
			</button>
		</div>
		
		
	</div>

	<div class="overbox">
		<div class="material-button alt-2">
			<span class="shape"></span>
		</div>
		<div class="title">注册
		<div style="color:white;font-size:14px;float:right"id="reinfo" ></div>
		</div>
		<!--  
		<form method="POST" action="addUser">
		-->
		<div class="input">
			<label for="regname">邮箱...</label>
			<input type="text" name="user_email" id="regname">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="regpass">密码...</label>
			<input type="password" name="user_password" id="regpass">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="reregpass">确认密码...</label>
			<input  type="password" name="user_password2" onfocus="f()" onblur="b()" id="reregpass">
			<span class="spin"></span>
		</div>
		
		<div class="button" type="sumbit" onclick="registing()">
			<button >
				<span>注册</span>
			</button>
		</div>
		<!--
		</form>
		  -->
	</div>

</div>

<script>
$("#name").keyup(
        function () {
        	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test($("#name").val())){
            	
                $("#info").text("提示:请输入有效的邮箱");
            }
            else {
                $("#info").text("");
            }
        }
    )
$("#regname").keyup(
        function () {
        	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test($("#regname").val())){
                $("#reinfo").text("提示:请输入有效的邮箱");
            }
            else {
                $("#reinfo").text("");
            }
        }
    )
function f(){
	$("#reinfo").text("请输入一致的密码");
}
 
function b(){
	var repasswd=$("#regpass").val();
    if(repasswd != ($("#reregpass").val())){
        $("#reinfo").text("密码不一致");
    }
    else {
        $("#reinfo").text("");
    }
}
     // 记住登录信息
        function rememberLogin(name, pass, checked) {
            Cookies.set('loginStatus', {
                name: name,
                pass: pass,
                remember: checked
            }, {expires: 30, path: ''})
        }
      
//若选择记住登录信息，则进入页面时设置登录信息
function setLoginStatus() {
    var loginStatusText = Cookies.get('loginStatus')
    if (loginStatusText) {
        var loginStatus
        try {
            loginStatus = JSON.parse(loginStatusText);
            $('#name').val(loginStatus.username);
            $('#pass').val(loginStatus.password);
            $("#remember").prop('checked',true);
        } catch (__) {}
    }
}


// 设置登录信息
setLoginStatus();
function logining(){
	var name =$("#name").val();
    var pass=$("#pass").val();
    var remember=$("#remember").prop('checked');
    if (name == '') {
        $("#info").text("提示:账号不能为空");
    }
    else if(pass ==''){
        $("#info").text("提示:密码不能为空");
    }
    else {
        $.ajax({
            type: "POST",
            url: "checkUser",
            data: {
                name:name ,
                pass:pass
            },
            dataType: "json",
            success: function(data) {
                if (data.stateCode.trim() == "0") {
                    $("#info").text("提示:密码错误！");
                } else if (data.stateCode.trim() == "1") {
                    $("#info").text("提示:无此账号");
                } else if (data.stateCode.trim() == "2") {
                	 $("#info").text("提示:登陆成功，跳转中...");
                     window.location.href="Web-2.0-main.html";
                    if(remember){
                        rememberLogin(name,pass,remember);
                    }else {
                        Cookies.remove('loginStatus');
                    }
                   
                }else if (data.stateCode.trim() == "3") {
                	$("#info").text("提示:欢迎你，主人!...");
                    window.location.href="/admin_main.html";
                }
            },
            error : function() {
            	alert("提交数据失败！");
            }
        });
    }
}
<!--注册-->
function registing(){
	var name =$("#regname").val();
    var pass=$("#regpass").val();
    var repass=$("#reregpass").val();
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (name == '') {
        $("#reinfo").text("提示:账号不能为空");
    }
    else if(pass ==''){
        $("#reinfo").text("提示:密码不能为空");
    }
    else if(repass ==''){
        $("#reinfo").text("提示:重复确认密码没有输入");
    }
    else if(pass!= ($("#reregpass").val())){
    	$("#reinfo").text("提示:密码输入不一致");
    }
    else if(!myreg.test($("#regname").val())){
        $("#reinfo").text("提示:请输入有效的邮箱");
    }
    else {
        $.ajax({
            type: "POST",
            url: "addUser",
            data: {
                name:name ,
                pass:pass ,
                repass:repass
            },
            dataType: "json",
            success: function(data) {
                if (data.stateCode.trim() == "0") {
                    $("#reinfo").text("提示:密码不一致！");
                } else if (data.stateCode.trim() == "1") {
                    $("#reinfo").text("提示:账号已经被注册");
                } else if (data.stateCode.trim() == "2") {
                	 $("#reinfo").text("提示:注册成功，跳转中...");
                     window.location.href="AboutUs.html";
                     
                     if(remember){
                         rememberLogin(name,pass,remember);
                     }else {
                         Cookies.remove('loginStatus');
                     }
                }else if (data.stateCode.trim() == "3") {
                	$("#reinfo").text("提示:欢迎你，主人!...");
                    window.location.href="/admin_main.html";
                }
                
            },
            error : function() {
            	alert("提交数据失败！");
            }
        });
    }
}
</script>

<script src="js/jquery.min.js"></script>
<script src="js/index.js"></script>

</body>
</html>