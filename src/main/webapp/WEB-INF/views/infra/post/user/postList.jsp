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
	<style type="text/css" id="kakaoMapStyle">
		.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap {position:relative;width:100%;height:350px;}
		#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
		#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
		#category li .bank {background-position: -10px 0;}
		#category li .mart {background-position: -10px -36px;}
		#category li .pharmacy {background-position: -10px -72px;}
		#category li .oil {background-position: -10px -108px;}
		#category li .cafe {background-position: -10px -144px;}
		#category li .store {background-position: -10px -180px;}
		#category li.on .category_bg {background-position-x:-46px;}
		.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
		.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
		.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
		.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
		.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.placeinfo .tel {color:#0f7833;}
		.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
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
		          <div class="map_wrap">
					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; border-radius: 25px;"></div>
					    <ul id="category">
					    	<c:forEach items="${poCategoryList}" var="codeList">
					    		<li>
					    			<span>${codeList.ccName }</span>
					    		</li>
					    	</c:forEach>
					    </ul>
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
	
	<script>
	</script>
</body>
</html>
