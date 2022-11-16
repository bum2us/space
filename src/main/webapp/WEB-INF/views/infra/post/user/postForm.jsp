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
	</style>
</head>
<body>
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>

	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
	    <div class="row">
	      <div class="col-lg-12">
	        <div class="page-content">
	
	
	
	          <!-- ***** Gaming Library Start ***** -->
	          <div class="gaming-library">
	            <!-- <div class="col-lg-12">
	              <div class="heading-section">
	                <h4>V</h4>
	              </div>
	            </div> -->
	            <center>
	              <div class="col-lg-12" style="width: 80%;"> 
	                <div class="container text-center col-8 mt-3">
	                	<div id="ifmmUploadedImage1View" class="col-12 filebox">
							<img id="imgProfile" src="" alt="업로드 이미지" style="padding-top: 10px; padding-bottom: 10px; width:300px; height:300px; border-color: solid black 2px;">
							<input id="imgFile" class="form-control" name="multipartFile" multiple="multiple" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);">
						</div>
	                </div>
	                <hr class="mt-5 mb-5">
	                <div class="container text-center mb-5">
	                  <div class="row mb-5">
	                    <div class="col-2 form">
	                      <select class="form-select" id="category">
	                        <option value="" selected>카테고리</option>
	                        <option value="1">1</option>
	                        <option value="2">2</option>
	                        <option value="3">3</option>
	                      </select>
	                    </div>
	                    <div class="col-10">
	                      <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요.">
	                    </div>
	                    <div class="col-12 mt-5">
	                      <textarea class="form-control" id="contents" placeholder="내용을 입력해주세요." rows="10"></textarea>
	                    </div>
	                  </div>
	                </div>
	            </center>
	            <div class="col-lg-12 text-center" style="justify-content: between;">
	               <button type="button" class="base-border-button" onclick="regFormClear()"><i class="fa-solid fa-rotate-left"></i></button>
	               <button type="button" class="base-button" onclick="">등록</button>
	               <button type="button" class="base-border-button" onclick="">취소</button>
	            </div>
	          </div>
	          <!-- ***** Gaming Library End ***** -->
	        </div>
	      </div>
	    </div>
	  </div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		function regFormClear() {
	    	$("#imgProfile").attr("src","");
	    	$("#imgFile").val("");
	    	$("#category").val("");
	    	$("#title").val("");
	    	$("#contents").val("");
	    };
	    
	    upload = function (objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
			
			var totalFileSize = 0;
			var obj = $("#" + objName)[0].files;
			var fileCount = obj.length;
			
			if (uiType == 3) {
				
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
