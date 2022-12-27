<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

<!DOCTYPE html>
<html lang="kr">
<head>

	<title>🛸동네소식🛸</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	

	<style>
		body {
			color: #212529;
		}
		div	{
			/* border: solid 1px orange; */
		}
		
		.btn {
	        width: 50px; 
	        height: 50px; 
	        border: 1px solid grey;
	        border-radius: 50%; 
	        color: black;
	        display: flex; 
	        margin-left: auto; 
	        margin-right: auto;
	        background: #fff;
	    }

		.btn:hover {
	        background: #E75E8D;
	        color: white;

      	}
	</style>
	<style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	</style>
</head>
<body>

	<!-- Preloader Start -->
	<%@include file="/resources/include/preloader.jsp"%>
	
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<c:set var="poCategoryList" value="${CodeServiceImpl.selectListCachedCode('3')}" />
	
	<form id="mainForm">
	
		<input type="hidden" id="poSeq" name="poSeq">
		<input type="hidden" id="poList" name="poList" value="${list}"> 
		<input type="hidden" id="myAddress" name="myAddress" value="${sessVillageOrName}">
	
		<div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		
		          <!-- ***** 우주지도 Start ***** -->
		          <div class="gaming-library profile-library" style="margin-top: 0px;">
			          <div class="col-lg-12">
				          <div class="heading-section">
			              	<div class="row">
			              		<div class="col-6">
					                <h4><em>동네지도</em></h4>
			              		</div>
			              		<div class="col-6 text-end">
			              			<button class="base-button" style="background: #27292a;" type="button" onclick="myPoint()"><i class="fa-solid fa-location-dot"></i></button>
			              		</div>
			              	</div>
			              </div>
				          <div id="map" style="width:100%;height:350px; border-radius: 25px;"></div>
				      </div>
				  </div>
		          <!-- ***** 우주지도 End ***** -->
	
		          <!-- ***** 동네소식 List Start***** -->
		          <div class="gaming-library profile-library">
		            <div class="col-lg-12">
		              <div class="heading-section">
		              	<div class="row">
		              		<div class="col-6">
				                <h4><em>동네소식</em></h4>
		              		</div>
		              		<div class="col-6 text-end">
		              			<button class="base-button" style="background: #27292a;" type="button" onclick="location.href='/post/postForm'"><i class="fa-solid fa-pen"></i></button>
		              		</div>
		              	</div>
		              </div>
		              <div class="postTable">
		              	<table class="table text-white">
						  <thead>
						    <tr>
						      <th>No.</th>
						      <th>작성자(닉네임)</th>
						      <th>동네</th>
						      <th>카테고리</th>
						      <th>제목</th>
						      <!-- <th>댓글(수)</th> -->
						      <th>작성일자</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
					  			<c:when test="${fn:length(list) eq 0}">
					  				<tr>
					  					<td colspan="7">동네 소식이 없습니다.</td>
					  				</tr>
					  			</c:when>
						  	</c:choose>
						  	<c:forEach items="${list}" var="list">
						  		<tr onclick="openPost(${list.poSeq})">
						  			<td><c:out value="${list.poSeq }"/></td>
						  			<td><c:out value="${list.mmNickName }"/></td>
						  			<td><c:out value="${list.poAddr }"/></td>
						  			<td>
							  			<c:forEach items="${poCategoryList}" var="codeList">
							  				<c:if test="${list.poCategory eq codeList.ccOrder}"><c:out value="${codeList.ccName}"/></c:if>
							  			</c:forEach>
						  			</td>
						  			<td><c:out value="${list.poTitle }"/></td>
						  			<!-- <td>7</td> -->
						  			<%-- <td><c:out value="${list.poComment }"/></td> --%>
						  			<td><c:out value="${list.poCreateDate}"/></td>
						  		</tr>
					  		</c:forEach>
						  </tbody>
						</table>
		              </div>
		            </div>
		          </div>
		          <!-- ***** 동네소식 List End ***** -->
		          
	        </div>
	      </div>
	    </div>
	  </div>
	</form>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efddea1f7d5df9c3c3197204f57f2cc1&libraries=services,clusterer,drawing"></script>
	<script>
		/* list 선택해서 view로 가기 */
		/* var form = $("#mainForm");
		var seq = $("#poSeq");
		var viewForm = "/post/postView";
		
		function viewForm() {
			location.href = viewForm;
		}; */
		
		function openPost(poSeq) {
			$("#poSeq").val(poSeq);
			$("#mainForm").attr("action", "/post/postView").submit();
		}
	</script>
	
	<script> //카카오 map api
	
		 
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var address = $("#myAddress").val();
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		/* geocoder.addressSearch(address, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}); */
		
		//나의 동네로 좌표 이동
		myPoint = function() { 
			geocoder.addressSearch(address, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		};
		
		// 마커를 표시할 위치와 content 객체 배열입니다 
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		var positions = [
			<c:forEach items="${list}" var="list" varStatus="status">
			{
				content: 
					'<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '            <c:out value="${list.poTitle}"/>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="desc">' + 
		            /* '                <div class="ellipsis"><c:out value="${list.poContent}"/></div>' +  */
		            '                <div class="jibun ellipsis"><c:out value="${list.poAddr}"/></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>',
				latlng: new kakao.maps.LatLng('<c:out value="${list.poLat}"/>', '<c:out value="${list.poLng}"/>'),
				seq: '<c:out value="${list.poSeq}"/>'
			},
			</c:forEach>
		];
		  
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
	    
	    

		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		        poSeq : 
		        	<c:forEach items="${list}" var="list" varStatus="status">
		        		<c:out value="${list.poSeq}"/>
		        	</c:forEach>
		    });
		 	
			 // 마커 위에 커스텀오버레이를 표시합니다
			 // 마커를 중심으로 커스텀오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			 var customOverlay = new kakao.maps.CustomOverlay({
			     content: positions[i].content, // 커스텀오버레이에 표시할 내용
			     position: marker.getPosition()  // 커스텀오버레이를 표시할 위치 
			 });
			 
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 함수를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', markerOverListener(map, marker, customOverlay));
		    kakao.maps.event.addListener(marker, 'mouseout', markerOutListener(customOverlay));
		    
		 	// 커스텀오버레이를 표시하는 클로저를 만드는 함수입니다 
			function markerOverListener(map, marker, customOverlay) {
			    return function() {
			    	customOverlay.setMap(map);
			    };
			}

			// 커스텀오버레이를 닫는 클로저를 만드는 함수입니다 
			function markerOutListener(customOverlay) {
			    return function() {
			    	customOverlay.setMap(null);
			    };
			}
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function(poSeq) {
				
				$("#poSeq").val(poSeq)
				
				// 마커 클릭시 게시물로 이동
				$("#mainForm").attr("action", "/post/postView").submit();
			});
		}
		
		
		/* // 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(sessVillageOrName, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리동네</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});   */  
		
		
	</script>
	
</body>
</html>
