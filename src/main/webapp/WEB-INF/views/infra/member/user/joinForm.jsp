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
		
		input { 
			padding: 15px; 
			height: 60px; 
			width: 100%; 
			background: #27292A; 
			border: none; 
			border-radius:5px; 
			color: #EC6090;  
			font-size: 10pt;   	
		}
		
		input:focus {
			background: #1F2122; 
			border:  1px solid #EC6090;
		}
		 
		.input_label {
			font-weight: 400;  
			font-size: 10pt; 
			color: #EC6090;
		}
		
		.spaceBtn{
			background: #EC6090;  
			padding: 5px 0px 5px 0px;
			font-size:10pt; 
			color:white;
			border:none; 
			border-radius: 10px;
			height: 40px;
			min-width: 70px; 
		}
		
		.spaceBtnInner{
			background: #EC6090; 
			padding: 5px 0px 5px 0px;
			font-size:10pt; 
			color:white;
			border:none; 
			border-radius: 10px;
			height: 60%; 
			min-width: 70px; 
			position: absolute; 
			top:20%; 
			right:5%;
		} 
		
		
	</style>
</head>
<body>  
	 <div class="container-md" style="width:40%">  
	    <form method="POST" id="mainForm"> 
	        <div class="row jutify-content-center"> 
	            <div class="col text-center" style=" padding: 10px;">
	                <img alt="" src="/resources/images/space_logo.png" style="width: 420px; height:200px;">
	            </div>
	        </div>  
	        <div class="page-content" style="margin-top:30px;"> 
	            <!-- ***** Featured Games Start ***** -->
	            <div class="main-profile p-5">
	                <div class="row justify-content-center mb-2"> 
	                    <div class="col text-center"> 
	                        <span style="font-weight: bold; font-size: 20pt; color: #EC6090;">회원가입</span>
	                    </div> 
	                </div> 
	                <div class="row my-4 justify-content-center" style="position:relative"> 
	                	<img alt="" src="/resources/images/empty.png"  style="border-radius:50%; border:none; width:100px; height:auto; ">  
	                	<input type="file" style="position:absolute; opacity:0; cursor:pointer;"> 
	                </div>
	                <div class="row my-3">
	                	<div class="col"> 
	                		<input type="text" name="mmId" placeholder="아이디">   
	                	</div>
	                </div>	     
	                <div class="row my-3">
	                	<div class="col"> 
	                		<input type="text" name="mmNickName" placeholder="닉네임">  
	                	</div>
	                </div>	       
	                 <div class="row my-3">  
	                	<div class="col"> 
	                		<input type="password" name="mmPassword" placeholder="비밀번호">  
	                	</div>
	                </div>	          
	                 <div class="row my-3">
	                	<div class="col"> 
	                		<input type="password" placeholder="비밀번호 확인">    
	                	</div>
	                </div>	     
	                <div class="row my-3">
	                	<div class="col"> 
	                		<input type="text" name="mmName" placeholder="이름">    
	                	</div>
	                </div>
	                <div class="row my-3">
	                	<div class="col-5">
	                		<input type="text" name="mmDob" placeholder="생년월일 6자리">    
	                	</div> 
	                	<div class="col-1 text-center">
	                		<span style="font-size:26pt;">-</span>
	                	</div> 
	                	<div class="col-2">
	                		<input style="text-align:center;" name="mmGender" type="text" placeholder="성별">    
	                	</div>
                		<div class="col-4">    
	                		<span style="font-size:26pt; " > · · · · · ·</span>  
	                	</div> 
	                </div>	  
	                 <div class="row my-3">
	                 	<div class="col"> 
	                		<input type="text" placeholder="휴대폰 번호를 (-) 제외하고 입력해주세요">
	                		<button class="spaceBtnInner" name="mmPhone" type="button" onclick="">인증요청</button>    
	                	</div>
	                </div>
	                <div class="row my-3">
	                	<div class="col" style="position:relative;">  
	                		<input type="text" placeholder="인증번호 6자리를 입력해주세요">
	                		<button class="spaceBtnInner" type="button" onclick="">인증확인</button>        
	                	</div>  
	                </div> 
	                <div class="row justify-content-center mt-4">   
	                	<div class="col text-center">
	                		<button type="button" class="spaceBtn" onclick="location.href='/loginForm'">돌아가기</button>     
		                	<button type="button" class="spaceBtn" onclick="goForm()">가입하기</button>                	
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
