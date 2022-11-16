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
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>

	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
        <div class="page-content">
        	 <div class="gaming-library">
				<div class="heading-section">
	                <h4>내 동네 설정</h4>
              	</div>
              <div class="col-lg-12" style="width: 80%;">
              <div class="input-group">
				<input type="text" class="form-control" id="sample3_postcode" name="" placeholder="" aria-describedby="btnAddress" readonly>
              	<button type="button" class="base-border-button" id="btnAddress">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
			</div>
			<div class="col-lg-12" style="width: 80%;">	
               	<div id="map" style="width:500px;height:400px;"></div> 
            </div> 
            <div class="col-lg-12 text-center" style="justify-content: between;">
	             <button type="button" class="base-border-button" onclick=""><i class="fa-solid fa-rotate-left"></i></button>
	             <button type="button" class="base-button" onclick="">등록</button>
	             <button type="button" class="base-border-button" onclick="">취소</button>
            </div>
        <!-- ***** Gaming Library Start ***** -->
         
       	 </div>
	  </div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=263b1f1f8b5b20704d4c80bb266c50c8"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	</script>
	
</body>
</html>
