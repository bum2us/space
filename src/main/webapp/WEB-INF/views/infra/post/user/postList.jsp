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
	
		<div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		
		          <!-- ***** 우주지도 Start ***** -->
		          <div id="map" style="width:100%;height:100%; border-radius: 25px;"></div>
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
						      <th>댓글(수)</th>
						      <th>작성일자</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
					  			<c:when test="${fn:length(list) eq 0}">
					  				<tr>
					  					<td colspan="7">동네 소식이 없습니다!</td>
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
						  			<td>7</td>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efddea1f7d5df9c3c3197204f57f2cc1"></script>
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
	
	<!-- <script type="text/javascript"> /* 카카오지도 */
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		//mapOtion값으로 id값이 map인 div를 파라미터를 가져가 카카오 맵을 생성한다.
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 장소 검색 객체를 생성합니다
		/* var ps = new kakao.maps.services.Places(map); */ 
		/* console.log(ps);  */
		
		window.onload = function(){
			
			// 마커 이미지
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			
			// 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
			
			<c:forEach items='${list}' var='list' varStatus="status">
				var markerPosition = new kakao.maps.LatLng('<c:out value="${list.poLat}"/>', '<c:out value="${list.poLng}"/>')
				console.log(markerPosition, '<c:out value="${list.poCategory}"/>');
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
			   
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({ 
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng('<c:out value="${list.poLat}"/>', '<c:out value="${list.poLng}"/>'), // 마커를 표시할 위치
			        title : '<c:out value="${list.poTitle}"/>', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			        
				 // 커스텀 오버레이에 표시할 컨텐츠 입니다
				 // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
				 // 별도의 이벤트 메소드를 제공하지 않습니다 
				 var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '            카카오 스페이스닷원' + 
					            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
					            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
					            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';   
				             
				             
				             
				             
		             
		           // 마커 위에 커스텀오버레이를 표시합니다
		          // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		          var overlay = new kakao.maps.CustomOverlay({
		              content: content,
		              map: map,
		              position: marker.getPosition()            
		          });   
		          
	       		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		          kakao.maps.event.addListener(marker, 'click', function() {
		              
		              overlay.setMap(map); 
		          }); 
	       		
		       // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		          
				             
			        
			    
		     	/* // 마커에 마우스오버 이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'mouseover', function() {
			          // 마커 위에 인포윈도우를 표시합니다
			          
			          alert('게시물 제목 : <c:out value="${list.poTitle}"/>');
			          
			    	 //infowindow.open(map, marker);     
			    });
		     	
			 	// 마커에 마우스아웃 이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'mouseout', function() {
			        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			        infowindow.close(map, marker);
			    }); */
				 
			</c:forEach>
			
		} 
		
	</script> -->
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    }; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		
		<c:forEach items="${list}" var="list" varStatus="status">
		
			// 지도에 마커를 표시합니다 
			var marker = new kakao.maps.Marker({
			    map: map, 
			    position: new kakao.maps.LatLng('<c:out value="${list.poLat}"/>', '<c:out value="${list.poLng}"/>')
			});
			
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title">' + 
			            '            카카오 스페이스닷원' + 
			            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';
			
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});
			
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			    overlay.setMap(map);
			});
			
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
			    overlay.setMap(null);     
			}
		</c:forEach>
		
		
	</script>
</body>
</html>
