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
		
		.input-area{
			background: #27292A;
			border-radius: 15px;
			padding: 60px;
		}
		
		.inputLabel {
			color: #EC6090; 
			font-weight: 700; 
			font-size: 10pt;  
		} 
		
		.labelBox {
			display: flex; 
			align-items: center;  
		}
		
		input {
			width: 100%; 
			background: transparent; 
			border: none;  
			border-bottom: 1px solid;  
			color: white;
			font-size: 10pt;  
		}
		
		.spaceBtn{
			background: #EC6090; 
			padding: 5px 0px 5px 0px;
			font-size:10pt; 
			color:white;
			border:none;
			min-width: 70px; 
		}
		
		.spaceBtnC{
			background: #EC6090; 
			padding: 5px 0px 5px 0px;
			font-size:10pt; 
			color:white;
			border:none;
			border-radius: 10px;
			min-width: 70px; 
		}
		
		
	</style>
</head>
<body>
	  		
	<div class="container-md" style="width: 600px;">    
		 
		<div class="row jutify-content-center">  
			<div class="col text-center" style=" padding: 10px;">  
				<img alt="" src="/resources/images/space_logo.png" style="width: 420px; height:200px;">       
			</div>			
		</div>  
		
		<form action="">	
			<div class="input-area">
				<div class="row justify-content-center mb-3">
					<img alt="" src="/resources/images/empty.png" style="border-radius: 50%; width: 150px;"> 
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">
						<label class="inputLabel">이름</label>   
					</div>
					<div class="col input">
						<input type="text">			
					</div> 
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox"> 
						<label class="inputLabel">아이디</label>   
					</div>
					<div class="col input">
						<input type="text" placeholder="영문,숫자를 포함하여 구성해주세요">			
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">비밀번호</label>   
					</div>
					<div class="col input">
						<input type="password" placeholder="영문,숫자,특수문자를 포함하여 구성해주세요">			
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">비밀번호 확인</label>   
					</div>
					<div class="col input">
						<input type="password">
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">성별</label>   
					</div>
					<div class="col input">
						<input type="text" placeholder="">			
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">연락처</label>   
					</div>
					<div class="col input">
						<input type="text" placeholder="">			
					</div>
					<div class="col-2 p-0"> 
						<button type="button" class="spaceBtn">인증</button>
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">이메일</label>   
					</div>
					<div class="col input">
						<input type="text" placeholder="">			
					</div>
				</div>  
				<div class="row justify-content-center mb-3">
					<div class="col-3 labelBox">  
						<label class="inputLabel">비밀번호</label>   
					</div> 
					<div class="col input">
						<input type="text" placeholder="">			
					</div>
				</div>  
			 	<div class="row justify-content-center mb-3">
			 		<button type="button" class="spaceBtn">인증</button>  
			 		<br>    <br> <br> <br> <br> 
			 		
			 		<button type="button" class="spaceBtnC">인증</button>
			 	</div>
				
			</div>
		</form>
	</div>  
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
</body>
</html>
