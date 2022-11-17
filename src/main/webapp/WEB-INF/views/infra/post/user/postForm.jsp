<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>🛸우주마켓🛸</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	

	<style>
		div	{
			/* border: solid 1px orange; */
		}
		
		.profile-user-img{
	       /* background: red; */
	       width: 50px;
	       height: 50px;
	       border-radius: 50%; 
	       overflow: hidden;
	       text-align: center; 
	    }
	
	    .profile-user-img-img{
	       width: 100%;
	       height: 100%;
	       object-fit: cover;
	    }
	    
	    input { 
		padding: 15px; 
		height: 60px; 
		width: 100%; 
		background: #27292A; 
		border: none; 
		border-radius:5px; 
		color: #E75E8D;  
		font-size: 12pt;   	
		}
		
		input:focus { 
			background: #27292A; 
			border:  1px solid #E75E8D;
		}
		
		textarea {
    		padding: 15px;
			width: 100%; 
			background: #27292A; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 10pt;
	    }
	    
	    textarea:focus { 
			background: #27292A; 
			border:  1px solid #E75E8D;
		}
	</style>
</head>
<body>
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>

	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<c:set var="codeList" value="${CodeServiceImpl.selectListCachedCode('3')}" />
	
	<form id="mainForm" enctype="multipart/form-data" method="post">
	
		<input type="hidden" id="poWriter" name="poWriter" value="${sessSeq }">
		<input type="hidden" id="poCategory" name="poCategory">
		
		<div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		        
		          <!-- ***** 등록Form Start ***** -->
		          <div class="gaming-library mt-0">
		            <div class="col-lg-12">
		              <div class="heading-section">
		                <h4>동네소식 등록</h4>
		              </div>
		            </div>
		            <center>
		              <div class="col-lg-12" style="width: 80%;"> 
		                <div class="container col-8 mt-3">
		                	<div id="ifmmUploadedImage1View" class="col-12 filebox mb-3" style="position: relative; width: 300px; height: 300px; background: transparent; border-radius: 20px; border: 5px solid #27292A">
								<img id="imgProfile" src="" alt="첨부 이미지" style="left: 0%; top: 50%; width:100%; height:100%;">
								<!-- <input id="imgFile" name="multipartFile" multiple="multiple" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);" style="opacity: 0%; position: absolute; left: 0%; height: 100%;"> -->
							</div>
							<input id="imgFile" name="multipartFile" multiple="multiple" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 1);" style="color: #757575;">
		                </div>
		                <hr class="mt-5 mb-5">
		                <div class="container text-center mb-5">
		                  <div class="row mb-5">
		                    <div class="col-3 form">
				    			<button id="categoryBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" style="background:#27292A; color:#E75E8D; border-radius:5px; border:none; height:60px; width:100%; font-size:12pt; font-weight:600;">카테고리 선택</button>
		                    </div>
		                    <div class="col-9">
		                      <input type="text" id="poTitle" name="poTitle" placeholder="제목을 입력해주세요.">
		                    </div>
		                    <div class="col-12 mt-5">
		                      <textarea id="poContent" name="poContent" placeholder="내용을 입력해주세요." rows="10"></textarea>
		                    </div>
		                  </div>
		                </div>
		            </center>
		            <div class="col-lg-12 text-center" style="justify-content: space-between;">
		               <button type="button" class="base-button" onclick="location.href='/post/postList'">돌아가기</button>
		               <button type="button" class="base-button" onclick="Reg()">등록</button>
		               <button type="button" class="base-border-button" onclick="regFormClear()"><i class="fa-solid fa-rotate-left"></i></button>
		            </div>
		          </div>
		          <!-- ***** 등록Form End ***** -->
		          
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header justify-content-center">
		                <h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
		            </div>
		            <div class="modal-body">
		            	<c:forEach items="${codeList }" var = "list" varStatus="Status">
			                <div class="row justify-content-center mb-2"  data-bs-dismiss="modal" style="cursor:pointer" onclick="selectCategory('${list.ccOrder}','${ list.ccName}')"> 
			                	<c:out value="${ list.ccName}"/> 	
			                </div>			            	
		            	</c:forEach>
		            </div>			            
		        </div>
		    </div>
		</div>
	</form>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		/* Url 세팅 */
		var goUrlList = "/post/postList";
		var goUrlInst = "/post/postInst";
		var goUrlUpdt = "/post/postUpdt";
		var goUrlDele = "/post/postDele";
		
		var form = $("#mainForm");
		
		/* 리셋 버튼 */
		function regFormClear() {
	    	$("#imgProfile").attr("src","");
	    	$("#imgFile").val("");
	    	$("#categoryBtn").text("카테고리 선택");
	    	$("#poTitle").val("");
	    	$("#poContent").val("");
	    };
	    
	    /* 카테고리 선택 이벤트 */
	    selectCategory = function(seq,category){
			$("#categoryBtn").text(category);
			$("#poCategory").val(seq);
		};
	    
		/* 게시물 등록 */
		function Reg() {
			form.attr("action", goUrlInst).submit();
		};
		
		/* 이미지 파일 첨부 */
	    upload = function (objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
			
			var totalFileSize = 0;
			var obj = $("#" + objName)[0].files;
			var fileCount = obj.length;
			
			if (uiType == 1) {
				
				var fileReader = new FileReader();
				fileReader.readAsDataURL($("#" + objName)[0].files[0]);
				
				fileReader.onload = function() {
					$("#imgProfile").attr("src", fileReader.result);
				}
			} return false;
		}
	</script>	
</body>
</html>
