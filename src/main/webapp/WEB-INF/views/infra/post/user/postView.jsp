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
		
		textarea {
    		padding: 15px;
			width: 100%; 
			background: #27292A; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 10pt;
	    }
	</style>
</head>
<body>
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>
	
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<form id="mainForm">
		<input type="hidden" name="poSeq" id="poSeq" value="${one.poSeq}">
		
		<div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		
		          <!-- ***** Gaming Library Start ***** -->
		          <div class="gaming-library">
					<div class="col-lg-12 mb-5" style="text-align: center; margin: auto; width: 80%;">
		              	<div class="heading-section">
		              		<h4>자세한 이야기</h4>
		              	</div>
					</div>
		            <center>
		              <div class="col-lg-12 mb-5">
		                <div id="carouselExampleControls" style="width: 40%;" class="carousel slide" data-bs-ride="carousel">
		                  <div class="carousel-inner">
		                    <div class="carousel-item active">
		                      <img src="/resources/images/yuza.jpg">
		                    </div>
		                    <div class="carousel-item">
		                      <img src="/resources/images/yuza2.jpg">
		                    </div>
		                  </div>
		                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                    <span class="visually-hidden">Previous</span>
		                  </button>
		                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                    <span class="visually-hidden">Next</span>
		                  </button>
		                </div>
		              </div>
		              
		              <div class="col-lg-12" style="width: 80%;"> 
		              	<div class="row">
			            	<div class="col-2">
			            		<div class="row">
			            			<div class="col">
			            				<img src="/resources/images/bums.jpg" alt="이미지" style="width: 45px; height: 45px; border-radius: 50%;">
			            			</div>
			            		</div>
			            	</div>
			            	<div class="col-3">
			            		<div class="row">
			            			<div class="col">
			            				<input type="text" value="${one.mmNickName }" readonly>
			            			</div>
			            		</div>
			            		<div class="row">
			            			<div class="col">
			            				<input type="text" value="${one.poAddr }" readonly>
			            			</div>
			            		</div>
			            	</div>
			            	<div class="col-2">
			            		<div class="row">
			            			<div class="col">
			            				<button type="button" class="base-border-button" style="padding: 15px 25px;"">팔로우</button>
			            			</div>
			            		</div>
			            	</div>
			            	<div class="col-5">
			            		<div class="row">
			            			<div class="col">
			            				<input type="text" value="🚀팔로워 95" readonly>
			            			</div>
			            		</div>
			            	</div>
			            </div>
		                <hr>
		                <div class="container mb-5" style="height: 300px;">
		                  <div class="row">
		                    <div class="col-8">
		                    	<input type="text" value="${one.poTitle }" readonly>
		                    </div>
		                    <div class="col-4">
		                    	<input type="text" value="좋아요 7&nbsp댓글 7&nbsp조회수 7" readonly>
		                    </div>
		                  </div>
		                  <div class="row text-start mt-4">
		                    <div class="col-12 mt-1">
		                    	<textarea rows="10">${one.poContent }</textarea>
		                    </div>
		                  </div>
		                </div>
		                
		                <!-- 댓글달기 부분 -->
		                <!-- <div class="container text-center">
		                  <div class="row mb-5">
		                    <div class="col-md-10">
		                      <input class="form-control">
		                    </div>
		                    <div class="col-md-2 ms-auto">
		                      <button type="button" class="main-button">댓글달기</button>
		                    </div>
		                  </div>
		                  <div class="row mb-5">
		                    <div class="col-1" style="display: flex; justify-content: center; align-items: center;">
		                      <div class="profile-user-img"> 
		                      <img src="assets/images/astronaut1920.jpg" alt="" class="profile-user-img-img"> 
		                      </div>
		                    </div>
		                    <div class="col-7">
		                      <div class="row">
		                        <div class="col-4">
		                          닉네임
		                        </div>
		                        <div class="col-8 text-start">
		                          2022-10-31
		                        </div>
		                      </div>
		                      <div class="row">
		                        <div class="col text-start">
		                          댓글을 작성하면 이곳에 댓글 내용이 보여지게 됩니다.
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row mb-5">
		                    <div class="col-1" style="display: flex; justify-content: center; align-items: center;">
		                      <div class="profile-user-img"> 
		                      <img src="assets/images/astronaut1920.jpg" alt="" class="profile-user-img-img"> 
		                      </div>
		                    </div>
		                    <div class="col-7">
		                      <div class="row">
		                        <div class="col-4">
		                          닉네임
		                        </div>
		                        <div class="col-8 text-start">
		                          2022-10-31
		                        </div>
		                      </div>
		                      <div class="row">
		                        <div class="col text-start">
		                          댓글을 작성하면 이곳에 댓글 내용이 보여지게 됩니다.
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row mb-5">
		                    <div class="col-1" style="display: flex; justify-content: center; align-items: center;">
		                      <div class="profile-user-img"> 
		                      <img src="assets/images/astronaut1920.jpg" alt="" class="profile-user-img-img"> 
		                      </div>
		                    </div>
		                    <div class="col-7">
		                      <div class="row">
		                        <div class="col-4">
		                          닉네임
		                        </div>
		                        <div class="col-8 text-start">
		                          2022-10-31
		                        </div>
		                      </div>
		                      <div class="row">
		                        <div class="col text-start">
		                          댓글을 작성하면 이곳에 댓글 내용이 보여지게 됩니다.
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                </div> -->
		              </div>
		            </center>
		            
		            
		            <div class="col-lg-12">
		              <div class="main-button">
		              	<button type="button" class="base-button" style="width: 15%;" onclick="location.href='/post/postList'">돌아가기</button>
		              	<button type="button" class="base-button" style="width: 15%;" onclick="modify()">수정하기</button>
		               	<!-- <a href="#">댓글 더 보기</a> -->
		              </div>
		            </div>
		          </div>
		          <!-- ***** Gaming Library End ***** -->
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
		modify = function() {
			
			alert("ok");
			$("#mainForm").attr("action", "/post/postForm").submit();
			
		}
		
	</script>	
</body>
</html>
