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
		
		input { 
			background: #1F2122; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 12pt;  
		}
		 
		input:focus { 
			background: #1F2122; 
			border:  1px solid #E75E8D;
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
	              	<div class="row justify-content-center">
		              	<c:choose>
		              		<c:when test = "${fn.length(list) eq 0}">
		              			<button type="button" class="base-button" id="btnForm">설정하기</button>
		              		</c:when>
		              		<c:otherwise>
		              			<c:forEach items="${list}" var="list" varStatus="varStatus">
		              				<input type="hidden" name="mvSeq" value="${list.mvSeq}">
			              			<div class="col-6 text-center">
					              		<div class="input-group">
											<input type="text" class="form-control" name="mvName" value="${list.mvName}" aria-describedby="btnAddress" style="border-top-left-radius:25px; border-bottom-left-radius:25px; height:47px;" >
						              		<button type="button" class="base-border-button mx-2" onclick="goForm('${list.mvSeq}')"><i class="fa-regular fa-pen-to-square"></i>수정하기</button>
										</div>	
				              		</div>
		              			</c:forEach>
		              		</c:otherwise>	
		              	</c:choose>
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
		var goUrlList = "/myVillage/list";
	    var goUrlInst = "/myVillage/inst";
	    var goUrlUpdt = "/myVillage/updt";
	    var goUrlUele = "/myVillage/uele";
	    var goUrlForm = "/myVillage/form";
	    
	    var seq= $("input:hidden[name=mvSeq]");
		var form = $("form[name=form]");
		
		
		$("#btnForm").on("click", function(){
			goForm(0);
		});
		
		goForm = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
	   
	    
	</script>
            
	
</body>
</html>
