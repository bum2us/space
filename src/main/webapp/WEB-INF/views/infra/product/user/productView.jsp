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
		
	</style>
</head>
<body>
	<c:set var = "ccState" value = "${CodeServiceImpl.selectListCachedCode('4')}"/>
	<c:set var = "ccCategory" value = "${CodeServiceImpl.selectListCachedCode('5')}"/>
	<c:set var = "ccType" value = "${CodeServiceImpl.selectListCachedCode('6')}"/>
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>
	
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
	    <div class="page-content">
			<form method="POST" id="mainForm">
				<input type="hidden" value="${item.pdSeq}">
                <div class="row justify-content-center">
                    <div class="col">
                        <div id="carouselExampleFade" class="carousel carousel-fade" data-bs-ride="carousel"
                            style="width: 500px; height: 500px;">
                            <div class="carousel-inner" style="width: 100%; height: 100%;">
                                <div class="carousel-item active" style="width: 100%; height: 100%;">
                                    <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 15px;"
                                        src="../images/item1.png">
                                </div>
                                <div class="carousel-item" style="width: 100%; height: 100%;">
                                    <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 15px;"
                                        src="../images/item2.png">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="col ml-2 p-2">
                        <div class="row">
                            <div class="col">
                                <span style="color:gray; font-size: 10pt;">
                                	<c:forEach items="${ccCategory }" var="list" varStatus="status">
										<c:if test="${item.pdCategory eq list.ccOrder}"><c:out value="${list.ccName}"/></c:if>
                                	</c:forEach>                                	
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h3 class="my-1" style="padding: 0; font-weight: bold;"><c:out value="${item.pdTitle}"/></h3>
                            </div>
                            <div class="col-3 pt-1" style="justify-content:end;">
                                <span style="padding: 4px; background: #1F2122; border-radius: 5px; color:gray; font-size: 12pt; width:auto;">
                                	<c:forEach items="${ccState}" var ="list" varStatus="status">
                                		<c:if test="${item.pdState eq list.ccOrder }"><c:out value="${list.ccName}"/></c:if>    
                                	</c:forEach>
                                </span>
                            </div>
                        </div>
                        <div class="row my-3 pt-3" style="border-top:1px solid #1F2122;">
                            <div class="col">
                                <h3 style="color:#E75E8D; font-weight: bold; margin: 0;"><c:out value="${item.pdPrice}"/>원</h3>
                            </div>
                        </div>
                        <div class="row my-2 pt-3" style="border-top:1px solid #1F2122;">
                            <div class="col">
                                <img src="../images/empty.png" alt=""
                                    style="width:30px; height: 30px; border-radius:50%;">
                                <span style="color:gray;"><c:out value="${item.pdSeller}"/></span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col" style="background: #1F2122; height: 230px; border-radius: 10px;">
                                <textarea name="" id="" cols="69" rows="10"
                                    style="background: transparent; border:none; padding: 10px; font-size: 10pt; color:white"><c:out value="${item.pdContent}"/></textarea>
                            </div>
                        </div>
                        <div class="row mt-3" style="justify-content:space-between;">
                            <button type="button" class="base-button" style="width:30%">돌아가기</button>
                            <button type="button" class="base-button" style="width:30%">찜하기</button>
                            <button type="button" class="base-button" style="width:30%">채팅보내기</button> 
                        </div>
                    </div>
                </div>
            </form>
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
