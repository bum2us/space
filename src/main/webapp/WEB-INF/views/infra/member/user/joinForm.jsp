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
		
		.inputLabel {
			color:white; 
			font-weight:800;
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
		}
		 
		
		
	</style>
</head>
<body>
	  		
	<div class="container-md" style="width: 25%">   
		
		<div class="row jutify-content-center">  
			<div class="col text-center" style=" padding: 10px;">  
				<img alt="" src="/resources/images/space_logo.png" style="width: 420px; height:200px;">       
			</div>			
		</div>  
		
		<form action="">	
			<div class="input-area">
				
				<div class="row justify-content-center mb-3">
					<div class="col-2 labelBox">
						<label class="inputLabel">이름</label>   
					</div>
					<div class="col input">
						<input type="text" placeholder="이름">			
					</div>
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
