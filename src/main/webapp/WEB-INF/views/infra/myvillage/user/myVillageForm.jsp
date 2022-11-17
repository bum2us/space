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
        	<form id="form" name="form">
        		<input type="hidden" name="mvMemberSeq" value="${sessSeq}">
        		
        		<div class="gaming-library">
					<div class="heading-section">
		                <h4>내 동네 설정</h4>
	              	</div>
	              <div class="col-lg-12" style="width: 80%;">
		              <div class="input-group">
						<input type="text" class="form-control" id="sample5_address" name="mvOriginalAddr" placeholder="주소" aria-describedby="btnAddress" readonly>
		              	<button type="button" class="base-border-button"  onclick="sample5_execDaumPostcode()" value="주소 검색">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</div>
				<div class="col-lg-12" style="width: 80%;">
					<input type="text" class="form-control" id="mvName" name="mvName" readonly>
				</div>
				<div class="col-lg-12" style="width: 80%;">	
	               	<div id="map" style="width:500px;height:400px;margin-top:10px;display:none""></div> 
	            </div> 
	            <div class="col-lg-12 text-center" style="justify-content: between;">
		             <button type="button" class="base-border-button" onclick="btnReset()"><i class="fa-solid fa-rotate-left"></i></button>
		             <button type="button" class="base-button" onclick="btnSubmit()">등록</button>
		             <button type="button" class="base-border-button" onclick="location.href='/member/profile'">취소</button>
	            </div>
	       	 </div>
	       </form>
	  </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=263b1f1f8b5b20704d4c80bb266c50c8&libraries=services,clusterer,drawing"></script>
	
	
	<script>
	    var goUrlInst = "/myVillage/inst";
	    var goUrlUpdt = "/myVillage/updt";
	    var goUrlUele = "/myVillage/uele";
	    
	    var seq= $("input:hidden[name=mvMemberSeq]");
		var form = $("form[name=form]");
		
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	                var name = data.bname1;
	                
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                document.getElementById("mvName").value = name;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	    
	    function btnSubmit() {
	    	form.attr("action", goUrlInst).submit();
	    }
	    
	</script>
            
	
</body>
</html>
