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
	          <div class="row">
	            <div class="col-lg-8">
	              <div class="featured-games header-text">
	                <div class="heading-section">
	                  <h4><em>진행중인</em> Live</h4>
	                </div>
	                <div class="owl-features owl-carousel">
	                  <div class="item">
	                    <div class="thumb">
	                      <img src="/resources/images/liveScene1.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>CS-GO<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                  <div class="item">
	                    <div class="thumb">
	                      <img src="/resources/images/liveScene2.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>Gamezer<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                  <div class="item">
	                    <div class="thumb">
	                      <img src="/resources/images/liveScene3.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>Island Rusty<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                  <div class="item">
	                    <div class="thumb">
	                      <img src="/resources/images/liveScene4.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>CS-GO<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                  <div class="item">
	                    <div class="thumb">
	                      <img src="/resources/images/liveScene5.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>Gamezer<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                  <div class="item">
	                    <div class="thumb"> 
	                      <img src="/resources/images/liveScene6.png" alt="">
	                      <div class="hover-effect">
	                        <h6>2.4K Streaming</h6>
	                      </div>
	                    </div>
	                    <h4>Island Rusty<br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> 4.8</li>
	                      <li><i class="fa fa-download"></i> 2.3M</li>
	                    </ul>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-lg-4">
	              <div class="top-downloaded">
	                <div class="heading-section">
	                  <h4><em>우리동네</em> 인플루언서</h4>
	                </div>
	                <ul>
	                  <li>
	                    <img src="/resources/images/game-01.jpg" alt="" class="templatemo-item">
	                    <h4>갓우갱</h4>
	                    <h6>Sandbox</h6>
	                    <span><i class="fa fa-star" style="color: yellow;"></i> 4.9</span>
	                    <span><i class="fa fa-download" style="color: #ec6090;"></i> 2.2M</span>
	                    <div class="download">
	                      <a href="#"><i class="fa fa-download"></i></a>
	                    </div>
	                  </li>
	                  <li>
	                    <img src="/resources/images/game-02.jpg" alt="" class="templatemo-item">
	                    <h4>띵지</h4>
	                    <h6>Legendary</h6>
	                    <span><i class="fa fa-star" style="color: yellow;"></i> 4.9</span>
	                    <span><i class="fa fa-download" style="color: #ec6090;"></i> 2.2M</span>
	                    <div class="download">
	                      <a href="#"><i class="fa fa-download"></i></a>
	                    </div>
	                  </li>
	                  <li>
	                    <img src="/resources/images/game-03.jpg" alt="" class="templatemo-item">
	                    <h4>사워유자</h4>
	                    <h6>Battle Royale</h6>
	                    <span><i class="fa fa-star" style="color: yellow;"></i> 4.9</span>
	                    <span><i class="fa fa-download" style="color: #ec6090;"></i> 2.2M</span>
	                    <div class="download">
	                      <a href="#"><i class="fa fa-download"></i></a>
	                    </div>
	                  </li>
	                </ul>
	                <div class="text-button">
	                  <a href="profile.html">View All Games</a>
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
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item1.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> KenganC</span>
	                    <h4>Just Talking With Fans</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item2.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> LunaMa</span>
	                    <h4>CS-GO 36 Hours Live Stream</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item3.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> Areluwa</span>
	                    <h4>Maybe Nathej Allnight Chillin'</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item4.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> GangTm</span>
	                    <h4>Live Streaming Till Morning</h4>
	                  </div> 
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item1.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> KenganC</span>
	                    <h4>Just Talking With Fans</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item2.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> LunaMa</span>
	                    <h4>CS-GO 36 Hours Live Stream</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item3.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> Areluwa</span>
	                    <h4>Maybe Nathej Allnight Chillin'</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-3 col-sm-6">
	                <div class="item">
	                  <div class="thumb">
	                    <img src="/resources/images/item4.png" alt="">
	                    <div class="hover-effect">
	                      <div class="content">
	                        <div class="live">
	                          <a href="#">Live</a>
	                        </div>
	                        <ul>
	                          <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
	                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
	                        </ul>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="/resources/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> GangTm</span>
	                    <h4>Live Streaming Till Morning</h4>
	                  </div> 
	                </div>
	              </div>
	              <div class="col-lg-12">
	                <div class="main-button">
	                  <a href="streams.html">전체 상품 보기</a>
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
	                      <img src="/resources/images/service-01.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
	                    </div>
	                    <h4>정우경</h4>
	                    <p>유저에게 도움이되는 서비스를 만드는 개발자</p>
	                    <h6>개별프로젝트</h6> 
	                    <a href="http://3.37.61.229"  style="color:#E75E8D;">SportsMate</a>
	                  </div>
	                </div>
	                <div class="col-lg-4">
	                  <div class="item">
	                    <div class="icon">
	                      <img src="/resources/images/service-02.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
	                    </div>
	                    <h4>신범수</h4>
	                    <p>빨리 배우고 잘 써먹는 신입사원</p>    
	                    <h6>개별프로젝트</h6>
	                    <a href="http://3.38.214.0"  style="color:#E75E8D;">ALBUM's</a>
	                  </div>
	                </div>
	                <div class="col-lg-4">
	                  <div class="item">
	                    <div class="icon">
	                      <img src="/resources/images/service-03.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
	                    </div>
	                    <h4>고명지</h4>
	                    <p>목표를 향해 질주.</p>
	                    <h6>개별프로젝트</h6>
	                    <a href="http://3.35.136.131" style="color:#E75E8D;">MEGABOX</a> 
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
		
	</script>	
</body>
</html>
