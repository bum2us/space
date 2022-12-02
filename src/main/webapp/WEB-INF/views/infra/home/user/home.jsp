<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
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
		.main-banner-main{			
			background-position: center center;
			background-size: cover;
			min-height: 380px;
			border-radius: 23px;
			padding: 80px 60px;
		}
		
		
		.main-banner-main h6 { 
			font-size: 20px;
			color: #fff;
			font-weight: 400;
			margin-bottom: 25px;
		}
		
		.main-banner-main h4 {
			  font-size: 45px;
			  text-transform: uppercase;
			  margin-bottom: 25px;
		}
			
		.main-banner-main h4 em {
			  font-style: normal;
			  color: #ec6090;
		}
	</style>
</head>
<body>
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>

	<div class="container">
	
	    <div class="page-content">
	
	        <!-- ***** Banner Start ***** -->
	        <div id="main-banner" class="main-banner-main">
	            <input id="bannerPath" type="hidden" value="url(/resources/images/mainBanner${no}.PNG)">
	        </div><br><br>
	        <!-- ***** Banner End ***** -->
	        <!-- ***** Featured Games Start ***** -->
	        <form id="mainForm" method="POST">
	        	<input type="hidden" id="pdSeq" name="pdSeq">
	        	<input type="hidden" id="liveSeq" name="liveSeq">
		        <div class="row">
		            <div class="col-lg">
		                <div class="featured-games header-text">
		                    <div class="heading-section">
		                        <h4><em>진행중인</em> Live</h4>
		                    </div>
		                    <div class="owl-features owl-carousel">
		                    	
		                    	<c:forEach items="${liveList}" var="list" varStatus="status">
			                        <div class="item">
			                            <div class="thumb">
			                                <img src="${list.upPath }${list.upUuidName}" alt="">
			                                <div class="hover-effect">
			                                    <h6 onclick="goForm('live','${list.liveSeq}')">라이브 시청하기</h6>
			                                </div>
			                            </div>
			                            <h4><c:out value="${list.liveTitle }" /><br><span><c:out value="${list.mmNickName }"/></span></h4>
			                            <ul>
			                                <li><i class="fa fa-star"></i> 4.8</li>
			                                <li><i class="fa fa-download"></i> 2.3M</li>
			                            </ul>
			                        </div>	                    	
		                    	</c:forEach>
		                    
		                        
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- ***** Featured Games End ***** -->
		
		        <!-- ***** Live Stream Start ***** -->
		        <div class="live-stream">
		            <div class="col-lg-12">
		                <div class="heading-section">
		                    <h4><em>지금</em>Hot<em>한 상품</em></h4>
		                </div> 
		            </div>
		            <div class="row"> 
						<c:forEach items="${productList }" var="list" varStatus="status">					
			                <div class="col-lg-3 col-sm-6">
			                    <div class="item">
			                        <div class="thumb"> 
			                            <img src="${list.productPath }${list.productUuidName}" alt="">
			                            <div class="hover-effect">
			                                <div class="content"> 
			                                    <div class="live">
			                                        <!-- <a href="#">Live</a>  -->
			                                    </div>
			                                    <ul>
			                                        <li><a href="javascript:goForm('product','${list.pdSeq}')"><i class="fa fa-eye"></i> 상품보기</a></li>
			                                        <!-- <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li> -->
			                                    </ul>
			                                </div>  
			                            </div>
			                        </div>
			                        <div class="down-content">
			                            <div class="avatar">
			                                <img src="/resources/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
			                            </div>
			                            <h4><c:out value="${list.pdTitle }" /></h4>
			                            <span><i class="fa-solid fa-won-sign"></i> <c:out value="${list.pdPrice }"/> 원</span>
			                        </div>
			                    </div>
			                </div>
						</c:forEach>
		
		
		                <div class="col-lg-12">
		                    <div class="main-button">
		                        <a href="streams.html">내 물건 팔기</a>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- ***** Live Stream End ***** -->
		
		        <!-- ***** Start Stream Start ***** -->
		        <div class="start-stream">
		            <div class="col-lg-12">
		                <div class="heading-section">
		                    <h4><em>STATION</em> 동네사람들</h4>
		                </div>
		                <div class="row">
		                    <div class="col-lg-4">
		                        <div class="item">
		                            <div class="icon">
		                                <img src="/resources/images/service-01.jpg" alt=""
		                                    style="max-width: 60px; border-radius: 50%;">
		                            </div>
		                            <h4>정우경</h4>
		                            <p>유저에게 도움이되는 서비스를 만드는 개발자</p>
		                            <h6>개별프로젝트</h6>
		                            <a href="http://3.37.61.229" style="color:#E75E8D;" target="_blank">SportsMate</a>
		                        </div>
		                    </div>
		                    <div class="col-lg-4">
		                        <div class="item">
		                            <div class="icon">
		                                <img src="/resources/images/service-02.jpg" alt=""
		                                    style="max-width: 60px; border-radius: 50%;">
		                            </div>
		                            <h4>신범수</h4>
		                            <p>빨리 배우고 잘 써먹는 신입사원</p>
		                            <h6>개별프로젝트</h6>
		                            <a href="http://3.38.214.0" style="color:#E75E8D;" target="_blank">ALBUM's</a>
		                        </div>
		                    </div>
		                    <div class="col-lg-4">
		                        <div class="item">
		                            <div class="icon">
		                                <img src="/resources/images/service-03.jpg" alt=""
		                                    style="max-width: 60px; border-radius: 50%;">
		                            </div>
		                            <h4>고명지</h4>
		                            <p>목표를 향해 질주.</p>
		                            <h6>개별프로젝트</h6>
		                            <a href="http://3.35.136.131" style="color:#E75E8D;" target="_blank">MEGABOX</a>
		                        </div>
		                    </div>
		                    <div class="col-lg-12">
		                        <div class="main-button">
		                            <a href="profile.html">Go To Profile</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- ***** Start Stream End ***** -->
	        </form>
	    </div>
	</div>

	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		window.onload = function() {
			
			$("#main-banner").css('background-image',$("#bannerPath").val()); 
		};
		
		goForm = function(key,seq)
		{
			var url="";
			
			switch (key) {
			case 'live':
			{
				url="/live/view";
				$("#liveSeq").val(seq); 
				break;
			}
			case 'product':
			{
				url="/product/productView";
				$("#pdSeq").val(seq); 
				break;
			}

			default:
				break;
			}	
			
			$("#mainForm").attr("action",url).submit();
		}
		
	</script>	
</body>
</html>
