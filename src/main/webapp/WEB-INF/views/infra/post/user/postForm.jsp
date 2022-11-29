<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

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
		
		input:focus { 
			background: #27292A; 
			border:  1px solid #E75E8D;
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
	    
	    textarea:focus { 
			background: #27292A; 
			border:  1px solid #E75E8D;
		}
		
		.slimscroll::-webkit-scrollbar {
		    width: 10px;
		    height: 10px;
		}
		
		.slimscroll::-webkit-scrollbar-thumb {
		    background-color: gray;
		    border-radius: 10px;
		    background-clip: padding-box;
		    border: 2px solid transparent;
		} 
		
		.slimscroll::-webkit-scrollbar-track {
		    background-color: #27292A; 
		}
	</style>
</head>
<body>
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>

	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<c:set var="codeList" value="${CodeServiceImpl.selectListCachedCode('3')}" />
	
	<form id="mainForm" enctype="multipart/form-data" method="post">
	
		<input type="hidden" id="poWriter" name="poWriter" value="${sessSeq }">
		<input type="hidden" id="poCategory" name="poCategory">
		<input type="hidden" id="poLng" name="poLng">
		<input type="hidden" id="poLat" name="poLat">
		<input type="hidden" id="poSeq" name="poSeq">
		
		<div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		        
		          <!-- ***** 등록Form Start ***** -->
		          <div class="gaming-library mt-0">
		            <div class="col-lg-12 text-center mb-5" style="text-align: center; margin: auto; width: 80%;">
		              <div class="heading-section">
		                <h4>동네소식 등록</h4>
		              </div>
		            </div>
		            <center>
		              <div class="col-lg-12" style="width: 80%;"> 
		                <div class="container col-12 mt-3">
			                <div class="d-flex flex-row">  
					    		<div style="margin-right:25px;"> 
					    			<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#27292A; position:relative; ">
					    				<i class="fa-solid fa-camera" style="font-size:40pt; position:absolute; top:30%; right:36%;"></i> 
					    				<br>
					    				<span id="imageCounter" style="font-size:16pt; font-weight:bold; position:absolute; top:60%; right:38%;">0/10</span>
					    				<input type="file" multiple="multiple"  id="multipartFile" name="multipartFile" onChange="upload('multipartFile');" style="position:absolute; opacity:0%; width:100px; height:100px; top:10%; right:20%; cursor:pointer;">    
					    			</div>
					    			<!-- <div style="background:red; width:200px; height:200px;"></div> -->			 
					    		</div> 
					    		<div class="d-flex flex-row slimscroll" style="width: 100%; background: #27292A; border-radius: 10px; overflow:auto;" id="imgContainer">			     		
						    		<!-- 첨부 이미지들 들어오는 곳 -->
					    		</div>  
					    	</div>
		                </div>
		                <div class="container text-center mt-4 mb-2">
		                  <div class="row mb-1">
		                    <div class="col-3">
			    				<button type="button" onclick="searchAddr()" style="background:#27292A; color:#E75E8D; border-radius:5px; border:none; height:60px; width:100%; font-size:12pt; font-weight:600;">주소검색</button>
		                    </div>
		                    <div class="col-9">
		                      <input type="text" id="poAddr" name="poAddr" placeholder="게시물에 관련된 위치를 입력해주세요." readonly value="${one.poAddr }">
		                    </div>
		                  </div>
		                  <div class="row">
		                  	<div cloass="col">
		                  		<div id="map" style="height:300px;margin-top:10px; margin-bottom:10px; display:none"></div>
		                  	</div>
		                  </div>
		                  <div class="row mb-2 mt-1">
		                    <div class="col-3">
				    			<button id="categoryBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" style="background:#27292A; color:#E75E8D; border-radius:5px; border:none; height:60px; width:100%; font-size:12pt; font-weight:600;">카테고리 선택</button>
		                    </div>
		                    <div class="col-9">
		                      <input type="text" id="poTitle" name="poTitle" placeholder="제목을 입력해주세요." value="${one.poTitle }">
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-12">
		                      <textarea id="poContent" name="poContent" placeholder="내용을 입력해주세요." rows="10">${one.poContent}</textarea>
		                    </div>
		                  </div>
		                </div>
		            </center>
		            <div class="col-lg-12 text-center" style="justify-content: space-between;">
		               <button type="button" class="base-button" style="width: 15%;" onclick="location.href='/post/postList'">돌아가기</button>
		               <button type="button" class="base-button" style="width: 15%;" onclick="reg()">등록</button>
		               <button type="button" class="base-border-button"  style="width: 15%;" onclick="regFormClear()"><i class="fa-solid fa-rotate-left"></i></button>
		            </div>
		          </div>
		          <!-- ***** 등록Form End ***** -->
		          
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- 카테고리 선택 modal -->
		  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header justify-content-center">
		                <h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
		            </div>
		            <div class="modal-body">
		            	<c:forEach items="${codeList }" var = "list" varStatus="Status">
			                <div class="row justify-content-center mb-2"  data-bs-dismiss="modal" style="cursor:pointer" onclick="selectCategory('${list.ccOrder}','${ list.ccName}')"> 
			                	<c:out value="${ list.ccName}"/> 	
			                </div>			            	
		            	</c:forEach>
		            </div>			            
		        </div>
		    </div>
		</div>
	</form>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efddea1f7d5df9c3c3197204f57f2cc1&libraries=services"></script>
	<script>
		/* Url 세팅 */
		var goUrlList = "/post/postList";
		var goUrlInst = "/post/postInst";
		var goUrlUpdt = "/post/postUpdt";
		var goUrlDele = "/post/postDele";
		
		var form = $("#mainForm");
		var seq = $("#poSeq");
		
		/* 리셋 버튼 */
		function regFormClear() {
	    	$("#imgContainer").attr("src","");
	    	$("#imgFile").val("");
	    	$("#categoryBtn").text("카테고리 선택");
	    	$("#poTitle").val("");
	    	$("#poContent").val("");
	    	$("#poAddr").val("");
	    	const div = $("map");
	    	div.remove();
	    };
	    
	    /* 카테고리 선택 이벤트 */
	    selectCategory = function(seq,category){
			$("#categoryBtn").text(category);
			$("#poCategory").val(seq);
		};
	    
		/* 게시물 등록 */
		function reg() {
			
			if(seq.val() == 0 || seq.val() == null) {
				form.attr("action", goUrlInst).submit();
			} else {
				form.attr("action", goUrlUpdt).submit();			
			} 
		};
		
		/* 이미지 파일 첨부 */
	    upload = function(objName) {
			
			var files = $("#" + objName +"")[0].files;
			console.log(files);
			
			for(var i = 0; i<files.length; i++){
				
				var file = files[i];
				var picReader = new FileReader();
				
			    picReader.addEventListener("load", addEventListenerCustom (i, file));
			    picReader.readAsDataURL(file);
			}
			
			$("#imageCounter").html(files.length+"/10");
		};
		
		/* 여러개의 첨부파일시 append 되는 div부분 */
	    addEventListenerCustom = function (i, file) { 
			return function(event) {
				var imageFile = event.target;
				var sort = i;
				var txt = "";
				
				txt += '<div style="margin-right:10px; position:relative;" name="img" id="img'+i+'">';
				txt += '<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#1F2122; position:relative; ">';
				txt += '<img alt="" src="'; 
				txt += imageFile.result;
				txt += '" style="width:100%; height:100%; border-radius:10px;"></div>';
				txt += '<i style="font-size: 16pt; color:red; position:absolute; top:3%; right:5%; cursor:pointer;" class="fa-regular fa-circle-xmark" onclick="delImg('+i+')"></i></div>';
				
				$("#imgContainer").append(txt);
		    };
		};
		
		/* 첨부 이미지 제거 */
		delImg = function(seq){
			
			$("#img"+seq).remove();
			
			return;
			var imgs = $("div[name=img]");
			for(var i = 0 ; i < imgs.length; i ++){
				imgs[i].children[1].onclick="delImg(" + i + ")";
				imgs[i].id="img" + i;
			}
			
		};
		
		/* 카카오 주소 검색 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level:2 // 지도의 확대 레벨
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
		
		function searchAddr() {
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("poAddr").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        
	                        // 위도 경도 값 콘솔에 출력 //
	                        console.log("result.y : " + result.y);
	                        console.log("result.x : " + result.x);
	                        
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
		};
	</script>	
</body>
</html>
