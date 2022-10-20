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
	
	<!-- Link s -->
	<%@include file="link.jsp"%>
	<!-- Link e -->

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
							<a class="index-links" href="#"  style="font-size:24pt; font-weight:600;">USER</a>
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
							<a class="index-links" href="#"  style="font-size:24pt; font-weight:600;">ADMIN</a> 
						</div>	
					</div>
				</div>
			</div>
		</div>
	
<!--  스크립트  -->		
	<script src="https://kit.fontawesome.com/63aa3074b3.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	
	<script>
		
	</script>	
</body>
</html>
