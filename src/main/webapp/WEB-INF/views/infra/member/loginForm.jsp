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
			color: #23242a;
			font-size: 1em;
			letter-spacing: 0.05em;
			z-index: 10;
		}

		.inputBox span {
			position: absolute;
			left: 0;
			padding: 20px 0px 10px;
			font-size: 1em;
			color: #ffff;
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
			z-index: 9;
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
			color: #ffff;
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
			padding: 11px 25px;
			width: 100px;
			margin-top: 10px;
			border-radius: 4px;
			font-weight: 600;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center" style="height: 400px;">   
			<img alt="" src="/resources/images/space_logo.png"  height="100%" width="auto">
		</div>
		<div class="row justify-content-center pb-4">
			<div class="box">
				<div class="form">
					<h2>Login</h2>
					<div class="inputBox">
						<input type="text" required="required">
						<span>Username</span>
						<i></i>
					</div>
					<div class="inputBox">
						<input type="password" required="required">
						<span>Password</span>
						<i></i> 
					</div>
					<div class="links">
						<a href="#">Forgot Password</a>
						<a href="#">Signup</a>
					</div>
					<input type="submit" value="Login">
				</div>
			</div>
		</div>
	</div>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		
	</script>	
</body>
</html>
