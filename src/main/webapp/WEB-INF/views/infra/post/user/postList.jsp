<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

<!DOCTYPE html>
<html lang="kr">
<head>

	<title>πΈλλ€μμπΈ</title>
	
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
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, 'λμ', sans-serif;line-height: 1.5;}
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
		
		          <!-- ***** μ°μ£Όμ§λ Start ***** -->
		          <div class="gaming-library profile-library" style="margin-top: 0px;">
			          <div class="col-lg-12">
				          <div class="heading-section">
			              	<div class="row">
			              		<div class="col-6">
					                <h4><em>λλ€μ§λ</em></h4>
			              		</div>
			              		<div class="col-6 text-end">
			              			<button class="base-button" style="background: #27292a;" type="button" onclick="myPoint()"><i class="fa-solid fa-location-dot"></i></button>
			              		</div>
			              	</div>
			              </div>
				          <div id="map" style="width:100%;height:350px; border-radius: 25px;"></div>
				      </div>
				  </div>
		          <!-- ***** μ°μ£Όμ§λ End ***** -->
	
		          <!-- ***** λλ€μμ List Start***** -->
		          <div class="gaming-library profile-library">
		            <div class="col-lg-12">
		              <div class="heading-section">
		              	<div class="row">
		              		<div class="col-6">
				                <h4><em>λλ€μμ</em></h4>
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
						      <th>μμ±μ(λλ€μ)</th>
						      <th>λλ€</th>
						      <th>μΉ΄νκ³ λ¦¬</th>
						      <th>μ λͺ©</th>
						      <!-- <th>λκΈ(μ)</th> -->
						      <th>μμ±μΌμ</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
					  			<c:when test="${fn:length(list) eq 0}">
					  				<tr>
					  					<td colspan="7">λλ€ μμμ΄ μμ΅λλ€.</td>
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
		          <!-- ***** λλ€μμ List End ***** -->
		          
	        </div>
	      </div>
	    </div>
	  </div>
	</form>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  μ€ν¬λ¦½νΈ  -->		
	<%@include file="/resources/include/script.jsp"%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efddea1f7d5df9c3c3197204f57f2cc1&libraries=services,clusterer,drawing"></script>
	<script>
		/* list μ νν΄μ viewλ‘ κ°κΈ° */
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
	
	<script> //μΉ΄μΉ΄μ€ map api
	
		 
	
		var mapContainer = document.getElementById('map'), // μ§λλ₯Ό νμν  div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // μ§λμ μ€μ¬μ’ν
		        level: 4 // μ§λμ νλ λ λ²¨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // μ§λλ₯Ό μμ±ν©λλ€
		
		var address = $("#myAddress").val();
		
		// μ£Όμ-μ’ν λ³ν κ°μ²΄λ₯Ό μμ±ν©λλ€
		var geocoder = new kakao.maps.services.Geocoder();
		
		/* geocoder.addressSearch(address, function(result, status) {
			
		    // μ μμ μΌλ‘ κ²μμ΄ μλ£λμΌλ©΄ 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
		        // μ§λμ μ€μ¬μ κ²°κ³Όκ°μΌλ‘ λ°μ μμΉλ‘ μ΄λμν΅λλ€
		        map.setCenter(coords);
		    } 
		}); */
		
		//λμ λλ€λ‘ μ’ν μ΄λ
		myPoint = function() { 
			geocoder.addressSearch(address, function(result, status) {
			
			    // μ μμ μΌλ‘ κ²μμ΄ μλ£λμΌλ©΄ 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
			        // μ§λμ μ€μ¬μ κ²°κ³Όκ°μΌλ‘ λ°μ μμΉλ‘ μ΄λμν΅λλ€
			        map.setCenter(coords);
			    } 
			});
		};
		
		// λ§μ»€λ₯Ό νμν  μμΉμ content κ°μ²΄ λ°°μ΄μλλ€ 
		// μ»€μ€ν μ€λ²λ μ΄μ νμν  μ»¨νμΈ  μλλ€
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
		  
		// λ§μ»€ μ΄λ―Έμ§μ μ΄λ―Έμ§ μ£Όμμλλ€
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    // λ§μ»€ μ΄λ―Έμ§μ μ΄λ―Έμ§ ν¬κΈ° μλλ€
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // λ§μ»€ μ΄λ―Έμ§λ₯Ό μμ±ν©λλ€    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
	    
	    

		for (var i = 0; i < positions.length; i ++) {
		    
		    // λ§μ»€λ₯Ό μμ±ν©λλ€
		    var marker = new kakao.maps.Marker({
		        map: map, // λ§μ»€λ₯Ό νμν  μ§λ
		        position: positions[i].latlng, // λ§μ»€λ₯Ό νμν  μμΉ
		        image : markerImage // λ§μ»€ μ΄λ―Έμ§ 
		        poSeq : 
		        	<c:forEach items="${list}" var="list" varStatus="status">
		        		<c:out value="${list.poSeq}"/>
		        	</c:forEach>
		    });
		 	
			 // λ§μ»€ μμ μ»€μ€νμ€λ²λ μ΄λ₯Ό νμν©λλ€
			 // λ§μ»€λ₯Ό μ€μ¬μΌλ‘ μ»€μ€νμ€λ²λ μ΄λ₯Ό νμνκΈ°μν΄ CSSλ₯Ό μ΄μ©ν΄ μμΉλ₯Ό μ€μ νμ΅λλ€
			 var customOverlay = new kakao.maps.CustomOverlay({
			     content: positions[i].content, // μ»€μ€νμ€λ²λ μ΄μ νμν  λ΄μ©
			     position: marker.getPosition()  // μ»€μ€νμ€λ²λ μ΄λ₯Ό νμν  μμΉ 
			 });
			 
			// λ§μ»€μ mouseover μ΄λ²€νΈμ mouseout μ΄λ²€νΈλ₯Ό λ±λ‘ν©λλ€
		    // μ΄λ²€νΈ λ¦¬μ€λλ‘λ ν¨μλ₯Ό λ§λ€μ΄ λ±λ‘ν©λλ€ 
		    // forλ¬Έμμ ν΄λ‘μ λ₯Ό λ§λ€μ΄ μ£Όμ§ μμΌλ©΄ λ§μ§λ§ λ§μ»€μλ§ μ΄λ²€νΈκ° λ±λ‘λ©λλ€
		    kakao.maps.event.addListener(marker, 'mouseover', markerOverListener(map, marker, customOverlay));
		    kakao.maps.event.addListener(marker, 'mouseout', markerOutListener(customOverlay));
		    
		 	// μ»€μ€νμ€λ²λ μ΄λ₯Ό νμνλ ν΄λ‘μ λ₯Ό λ§λλ ν¨μμλλ€ 
			function markerOverListener(map, marker, customOverlay) {
			    return function() {
			    	customOverlay.setMap(map);
			    };
			}

			// μ»€μ€νμ€λ²λ μ΄λ₯Ό λ«λ ν΄λ‘μ λ₯Ό λ§λλ ν¨μμλλ€ 
			function markerOutListener(customOverlay) {
			    return function() {
			    	customOverlay.setMap(null);
			    };
			}
			
			// λ§μ»€μ ν΄λ¦­μ΄λ²€νΈλ₯Ό λ±λ‘ν©λλ€
			kakao.maps.event.addListener(marker, 'click', function(poSeq) {
				
				$("#poSeq").val(poSeq)
				
				// λ§μ»€ ν΄λ¦­μ κ²μλ¬Όλ‘ μ΄λ
				$("#mainForm").attr("action", "/post/postView").submit();
			});
		}
		
		
		/* // μ£Όμ-μ’ν λ³ν κ°μ²΄λ₯Ό μμ±ν©λλ€
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		// μ£Όμλ‘ μ’νλ₯Ό κ²μν©λλ€
		geocoder.addressSearch(sessVillageOrName, function(result, status) {
			
		    // μ μμ μΌλ‘ κ²μμ΄ μλ£λμΌλ©΄ 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // κ²°κ³Όκ°μΌλ‘ λ°μ μμΉλ₯Ό λ§μ»€λ‘ νμν©λλ€
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // μΈν¬μλμ°λ‘ μ₯μμ λν μ€λͺμ νμν©λλ€
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">μ°λ¦¬λλ€</div>'
		        });
		        infowindow.open(map, marker);

		        // μ§λμ μ€μ¬μ κ²°κ³Όκ°μΌλ‘ λ°μ μμΉλ‘ μ΄λμν΅λλ€
		        map.setCenter(coords);
		    } 
		});   */  
		
		
	</script>
	
</body>
</html>
