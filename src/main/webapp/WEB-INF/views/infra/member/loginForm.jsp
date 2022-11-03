<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	

	<title>▶▶▶우주마켓◀◀◀</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>

	<style>
		div	{
			/* border: solid 1px orange; */
		}
		
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		
		.box {
			position: relative;
			width: 380px;
			height: 420px;
			background: #1c1c1c;
			border-radius: 8px;
			overflow: hidden;
		}
		
		.box::before {
			content: '';
			position: absolute;
			top: -50%;
			left: -50%;
			width: 380px;
			height: 420px;
			background: linear-gradient(0deg, transparent, #E86390, #E86390);
			transform-origin: bottom right;
			animation: animate 6s linear infinite;
		}
 
		.box::after {
			content: '';
			position: absolute;
			top: -50%;
			left: -50%;
			width: 380px;
			height: 420px;
			background: linear-gradient(0deg, transparent, #E86390, #E86390);
			transform-origin: bottom right;
			animation: animate 6s linear infinite;
			animation-delay: -3s;
		}
 
		@keyframes animate {
			
			0%
			{
				transform: rotate(0deg);	
			}		
			100%
			{
				transform: rotate(360deg);
			}
		}

		.form {
			position: absolute;
			inset: 2px;
			border-radius: 8px;
			background: #28292d; 
			z-index: 10;
			padding: 50px 40px;
			display: flex;
			flex-direction: column;
		}

		.form h2 {
			color: #E86390;
			font-weight: 500;
			text-align: center;
			letter-spacing: 0.1em;
		}
		
		.inputBox {
			position: relative;
			width: 300px;
			margin-top: 35px;
		}

		.inputBox input {
			position: relative;
			width: 100%;
			padding: 20px 10px 10px;
			background: transparent;
			border: none;
			outline: none;
			/* color: #ffff; */
			font-size: 1em;
			letter-spacing: 0.05em;
			z-index: 10;
		}

		.inputBox span {
			position: absolute;
			left: 0;
			padding: 20px 0px 10px;
			font-size: 1em;
			color: #8f8f8f;
			pointer-events: none;
			letter-spacing: 0.05em;
			transition: 0.5s;
		}

		.inputBox input:valid ~ span,
		.inputBox input:focus ~ span {
			color: #E86390;
			transform: translateX(0px) translateY(-34px);
			font-size: 0.75em;
		}
		.inputBox i {
			position: absolute;
			left: 0;
			bottom: 0;
			width: 100%;
			height: 2px;
			background: #E86390;
			border-radius: 4px;
			transition: 0.5s;
			pointer-events: none;
			z-index: 9;ss
		}

		.inputBox input:valid ~ i,
		.inputBox input:focus ~ i {
			height: 44px;
		}

		.links {
			display: flex;
			justify-content: space-between;
		}

		.links a {
			margin: 10px 0;
			font-size: 0.75em;
			color: #8f8f8f;
			text-decoration: none;
		}

		.links a:hover,
		.links a:nth-child(2) {
			color: #E86390;
		}

		input[type="submit"] {
			border: none;
			outline: none;
			background: #E86390;
			/* color: #ffff; */
			padding: 11px 25px;
			width: 100px;
			margin-top: 10px;
			border-radius: 4px;
			font-weight: 600;
			cursor: pointer;
		}
		
		input[type="submit"]:active {
			opacity: 0.8;
		}
		
		.main-button {
			background: #E86390;
			color: #28292D;   
			border-radius: 5px;
			border:none;
			height: 50px; 
			width: 80px;
			font-weight: bold; 
		}
		
	</style>
</head>
<body>
	<form id="mainForm" method="POST">
		<!-- index에서 받아온 seq에 따라 user/admin 로그인 분류 -->
		<input type="hidden" id="mmAdminNy" value="${loginCheck.xdminNy}">
		<div class="container-md">
			<div class="row jutify-content-center">  
				<div class="col text-center" style=" padding: 10px;">  
					<img src="/resources/images/space_logo.png" style="width: 620px; height:300px;">       
				</div>			
			</div>  
			<div class="row justify-content-center pb-5">
				<div class="box">
					<div class="form">
						<h2>Login</h2>
						<div class="inputBox">
							<input type="text"  id="mmId" value="space">
							<span>ID</span>
							<i></i>
						</div>
						<div class="inputBox">
							<input type="password" id="mmPassword" value="1234">
							<span>Password</span>
							<i></i> 
						</div>
						<div class="links">
							<a href="#">Find ID/Password</a>
							<a href="/member/joinForm">Signup</a> 
						</div>
						<button class="main-button" type="button" onclick="login()">Login</button>  
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		
		login = function() {
			
			$.ajax({
				url: '/member/login'
				,type: 'POST'
				,datatype: 'json'
				,data: {
					mmId: $("#mmId").val()
					,mmPassword: $("#mmPassword").val()
					,mmAdminNy: $("#mmAdminNy").val()
				},
				success:function(result){
					if(result.rt=="success"){
						swal("로그인 성공!", result.mmId + " 회원님 로그인되었습니다.", "success")
						.then(function() {
							if(result.mmAdminNy == 1) {				
								location.href="/adminhome";   //관리자
							} else {				
								location.href="/home";  //일반 사용자
							}
						});
					}else{
						alert("로그인 정보가 일치하는 회원이 없습니다.","fail");
					}
				},
				error:function(){
					alert("ajax error...");
					
				}
			});
			
		}
	
	</script>	
</body>
</html>
