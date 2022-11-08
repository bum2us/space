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
		
	</style>
</head>
<body>
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	<div class="container">
	    <div class="page-content">
	        <div class="row">
			    <div class="col-lg-12">
			        <div class="main-profile ">
			            <div class="row">
			                <div class="col-lg-4">
			                    <img src="
			                    <c:if test="${item.upPath eq null }">/resources/images/empty.png</c:if>
			                    <c:if test="${item.upPath ne null }">${item.upPath }${item.upUuidName }</c:if>
			                    " alt=""  style="width: 300px; height:300px; overflow:hidden; border-radius: 23px; ">
			                </div>
			                <div class="col-lg-4 align-self-center">
			                    <div class="main-info header-text">
			                        <h4><c:out value="${item.mmNickName }"/></h4>
			                        <p>안녕하세요. 질 좋고 값 싼 물건만 연쇄적으로 판매합니다.</p>
			                        <div class="main-border-button">
			                            <a href="#">프로필 편집</a>
			                        </div>
			                    </div>
			                </div>
			                <div class="col-lg-4 align-self-center">
			                    <ul>
			                        <li>팔로워 <span>3</span></li>
			                        <li>판매상품 <span>16</span></li>
			                        <li>구매상품 <span>None</span></li>
			                    </ul>
			                </div>
			            </div>
			
			            <div class="row">
			                <div class="col-lg-12">
			                    <div class="clips">
			                        <div class="row">
			                            <div class="col-lg-12">
			                                <div class="heading-section">
			                                    <h4>판매상품</h4>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item1.png" alt="" style="border-radius: 23px;">
			                                        <a href="" target="_blank"><i class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>스투시 컨버스</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 36000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item2.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>마샬 스피커</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 125000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item3.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>에어팟 프로</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 100000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item4.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>데스크탑</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 525000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-lg-12">
			                    <div class="clips">
			                        <div class="row">
			                            <div class="col-lg-12">
			                                <div class="heading-section">
			                                    <h4>구매상품</h4>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item1.png" alt="" style="border-radius: 23px;">
			                                        <a href="" target="_blank"><i class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>스투시 컨버스</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 36000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item2.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>마샬 스피커</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 125000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item3.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>에어팟 프로</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 100000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="col-lg-3 col-sm-6">
			                                <div class="item">
			                                    <div class="thumb">
			                                        <img src="assets/images/item4.png" alt="" style="border-radius: 23px;">
			                                        <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i
			                                                class="fa fa-play"></i></a>
			                                    </div>
			                                    <div class="down-content">
			                                        <h4>데스크탑</h4>
			                                        <span><i class="fa-solid fa-comments-dollar"></i> 525000원</span>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			
			        </div>
			    </div>
			</div>
	    </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		
	</script>	
</body>
</html>
