<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

<!DOCTYPE html>
<html lang="kr">
<head>

	<title>🛸우주마켓🛸</title>
	
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
			background: #1F2122; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 12pt;   	
		}
		
		input:focus { 
			background: #1F2122; 
			border:  1px solid #E75E8D;
		}
		
		input[type="checkbox"] {
	        cursor: pointer;
	        border-radius:5px; 
	        width:20px; 
	        height: 20px; 
	        position:absolute; 
	        top:33%;    
	        right:13%;
	    } 
	    
	    textarea {
    		padding: 15px;
			width: 100%; 
			background: #1F2122; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 10pt;
	    }
	    
	    .slimscroll::-webkit-scrollbar {
		    width: 10px;
		    height: 10px;
		}
		
		.slimscroll::-webkit-scrollbar-thumb {
		    background-color: gray;
		    border-radius: 10px;
		    background-clip: padding-box;
		    border: 2px solid transparent;
		}
		
		.slimscroll::-webkit-scrollbar-track {
		    background-color: #27292A; 
		}
	    
	</style>
</head> 
<body>
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container header-text"> 
		<form method="POST" id="mainForm">
			<c:set var = "codeList" value = "${CodeServiceImpl.selectListCachedCode('5')}"/>
		    <div class="page-content">
		    	<div class="row mb-4">
		    		<div class="col">
		    			<span style="font-size:16pt; font-weight:bold; color:#E75E8D">중고거래 글쓰기</span>
		    		</div> 
		    	</div>
		    	<div class="d-flex flex-row">  
		    		<div style="margin-right:40px;"> 
		    			<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#1F2122; position:relative; ">
		    				<i class="fa-solid fa-camera" style="font-size:40pt; position:absolute; top:30%; right:36%;"></i> 
		    				<br>
		    				<span style="font-size:16pt; font-weight:bold; position:absolute; top:60%; right:38%;">0/10</span>
		    				<input type="file" multiple="multiple"  id="multipartFile" name="multipartFile" onChange="upload('multipartFile');" style="position:absolute; opacity:0%; width:100px; height:100px; top:10%; right:20%; cursor:pointer;">    
		    			</div>
		    			<!-- <div style="background:red; width:200px; height:200px;"></div> -->			 
		    		</div> 
		    		<div class="d-flex flex-row slimscroll" style="overflow:auto;" id="imgContainer">			     		
			    		<!-- 첨부 이미지들 들어오는 곳 -->
		    		</div>  
		    	</div>
		    	
		    	<div class="row mt-4">
		    		<div class="col">
		    			<input  placeholder="제목">
		    		</div>
		    	</div>
		    	<div class="row my-2"> 
		    		<div class="col-6" >
		    			<button data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" style="background:#1F2122; color:#E75E8D; border-radius:5px; border:none; height:60px; width:100%; font-size:12pt; font-weight:600;">카테고리 선택</button>
		    		</div>
		    		<div class="col-6" style="position:relative;"> 
		    			<input  placeholder="￦ 가격 (선택사항)"> 
		    			<input type="checkbox" value="나눔">  
		    			<span style="position:absolute; font-weight:500; top:30%; right:5%; color:#E75E8D;">나눔</span>
		    		</div> 
		    	</div>
		    	<div class="row my-2">
		    		<div class="col">
		    			<textarea rows="10" cols="" placeholder="판매물품의 정보를 작성해주세요. (가품 및 판매 금지 물품은 게시가 제한될 수 있어요.)"></textarea> 
	    			</div>
		    	</div>
		    	<div class="row mt-4 justify-content-center">
		    		<div class="col text-center">  
		    			<button type="button" class="base-button">돌아가기</button>
		    			<button type="button" class="base-button">게시하기</button>
	    			</div>
		    	</div>
		    </div>
		    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <div class="modal-header justify-content-center">
			                <h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			            	<c:forEach items="${codeList }" var = "list" varStatus="Status">
				                <div class="row justify-content-center mb-2" style="cursor:pointer" onclick="selectCategory('${list.ccSeq}')"> 
				                	<c:out value="${ list.ccName}"/> 	
				                </div>			            	
			            	</c:forEach>
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
	
	<script>
		selectCategory = function(seq){
			alert(seq);
		};
			
		upload = function(objName) {
			
			var files = $("#" + objName +"")[0].files;
			console.log(files);
			
			for(var i = 0; i<files.length; i++){
				
				var file = files[i];
				var picReader = new FileReader();
				
			    picReader.addEventListener("load", addEventListenerCustom (i, file));
			    picReader.readAsDataURL(file);
			}
		};
		
		addEventListenerCustom = function (i, file) { 
			return function(event) {
				var imageFile = event.target;
				var sort = i;
				var txt = "";
				
				txt += '<div style="margin-right:10px; position:relative;">';
				txt += '<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#1F2122; position:relative; ">';
				txt += '<img alt="" src="';
				txt += imageFile.result;
				txt += '" style="width:100%; height:100%; border-radius:10px;"></div>';
				txt += '<i style="font-size: 16pt; color:red; position:absolute; top:3%; right:5%; cursor:pointer;" class="fa-regular fa-circle-xmark"></i></div>';
					
				
				$("#imgContainer").append(txt);
		    };
		};
		
		
	</script>	
</body>
</html>
