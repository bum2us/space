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
	<!-- preloader -->
	<%@include file="/resources/include/preloader.jsp"%>
	
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
	    <div class="page-content">
	        <h1><c:out value="${item.pdSeq}"/></h1>
	        <h1><c:out value="${item.pdTitle}"/></h1>
	        <h1><c:out value="${item.pdContent}"/></h1>
	        <h1><c:out value="${item.pdPrice}"/></h1>
	        <h1><c:out value="${item.pdCategory}"/></h1>
	        <h1><c:out value="${item.pdCreateDate}"/>방금전</h1>
	        <h1><c:out value="${item.pdSeller}"/></h1>
	        <h1><c:out value="${item.pdType}"/></h1> 
	        <h1><c:out value="${item.pdState}"/>판매중</h1>
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
