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
	
	
	<title>🅷🅴🅻🅻🅾 우주마켓 𝙒𝙝𝙮𝙧𝙖𝙣𝙤...</title> 
	
	<!-- common Link s -->
	<%@include file="link.jsp"%>
	<!-- common Link e -->

	<style type="text/css">
		div {
			display: block;	
		}
		.container {
			scale: 80%;
			margin-top: -10%;
			text-align: center;
		}
		.linkContainer {
			background : #27292A;
			border-radius: 20px;
			width: 600px;
			height: 600px;
			margin: 0px 100px 0px 10px;
		}
		
		.linkicon{
			font-size: 200pt; 
			margin: 20px 0px 20px 0px; 
			color: white;
		}
		.index-links {
			width: 200px;
			height: 70px;
		}
		
		
		
	</style>
	</head>
	<body>
	
	
	
		<div class="container">
			<div class="row justify-content-center">   
				<img alt="" src="/resources/images/space_logo.png" style="scale: 80%;"> 
			</div>
			<div class="row">
				<div class="col linkContainer">
					<div class="row">
						<div class="col linkicon">
							<i class="fa-solid fa-user"></i>
						</div>
					</div>
					<div class="row">
						<div class="main-button">
							<a class="index-links" href="/login"  style="font-size:24pt; font-weight:600;">USER</a>
						</div>	
					</div>
				</div>
				<div class="col linkContainer">
					<div class="row">
						<div class="col linkicon">
							<i class="fa-solid fa-screwdriver-wrench"></i>
						</div>
					</div>
					<div class="row">
						<div class="main-button"> 
							<a class="index-links" href="/login"  style="font-size:24pt; font-weight:600;">ADMIN</a> 
						</div>	
					</div>
				</div>
			</div>
		</div>
	
<!--  스크립트  -->		
	<!-- common script s -->
	<%@include file="script.jsp"%>
	<!-- common script e -->
	
	<script>
		
	</script>	
</body>
</html>
