<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	

	<title>▶▶▶우주마켓◀◀◀</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	
	<style>
		div	{
			/* border: solid 1px orange; */
		}
		
	</style>
</head>
<body>

	<!-- header -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
				
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-7">
								<div class="heading-section">
									<h4>회원가입</h4>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<em> 이름</em>
									
									</div>
									<div class="col-lg-8">
										<input type="text">
									</div>
								</div>
							</div>
						</div>
					
					</div>

				</div>
			</div>
		</div>	
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
</body>
</html>
