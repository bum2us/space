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
	  		
	<div class="container">
	    <form method="POST" id="mainForm">
	        <div class="row">
	            <div class="col-lg-12">
	            	<div class="row jutify-content-center">
                        <div class="col text-center" style=" padding: 10px;">
                            <img alt="" src="/resources/images/space_logo.png"
                                style="width: 420px; height:200px;">
                        </div>
                    </div>
	                <div class="page-content">
	                    <!-- ***** Featured Games Start ***** -->
	                    <div class="main-profile ">
	                    	<div class="row justify-content-center mb-2">
	                    		<div class="col">
	                                <span style="font-weight: bold; font-size: 22pt; color: #EC6090;">회원가입</span> 	                    		
	                    		</div>
	                    	</div>
	                    </div>
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
