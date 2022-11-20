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
	
	<div class="container">
	    <div class="page-content">
			<form id="mainForm" method="POST">
				<input type="hidden" id="pdSeq" name="pdSeq">
		        <!-- ***** Banner Start ***** -->
				<div class="main-banner">
	            	<div class="row">
	                    <div class="col-lg-7">
	                        <div class="header-text">
	                            <h6>우주마켓</h6>
	                            <h4><em>우</em>리<em>주</em>변 근처에서 바로 중고거래</h4>
	                            <div class="main-button">
	                                <a href="/product/productForm">중고 거래하기</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- ***** Banner End ***** -->
	
	            <!-- ***** 판매리스트 Start ***** -->
	            <div class="most-popular">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="heading-section">
	                            <h4>우리동네 <em>팝니다</em></h4>
	                        </div>
	                        <div id="saleList" class="d-flex flex-row slimscroll mx-0" style="overflow:auto;">
	                            <c:forEach items="${saleList}" var="list" varStatus="status">
		                            <div class="col-lg-3 col-sm-6" onclick="openProduct(${list.pdSeq})" style="cursor:pointer;">
		                                <div class="item">
		                                    <img style="height: 180px;" src="${list.upPath }${list.upUuidName}" alt="">
		                                    <h4>${list.pdTitle }<br><span style="color:#E75E8D"><i class="fa-solid fa-dollar-sign"></i> <c:out value="${list.pdPrice}"/></span></h4>
		                                </div>
		                            </div>
	                            </c:forEach>
	                        </div>
	                        <div class="row mt-3 text-center">
	                            <span id="saleListBtn" onclick="extendList('saleList')"
	                                style="font-size:10pt; color: gray; text-decoration: underline; cursor:pointer;">더보기</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- ***** 판매리스트 End ***** -->
	
	            <!-- ***** 구매리스트 Start ***** -->
	            <div class="most-popular">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="heading-section">
	                            <h4>우리동네 <em>삽니다</em></h4>
	                        </div>
	                        <div id="buyList" class="d-flex flex-row slimscroll mx-0" style="overflow:auto;">
								<c:forEach items="${buyList}" var="list" varStatus="status">
		                            <div class="col-lg-3 col-sm-6" onclick="openProduct(${list.pdSeq})" style="cursor:pointer;">
		                                <div class="item">
		                                    <img style="height: 180px;" src="${list.upPath }${list.upUuidName}" alt="">
		                                    <h4>${list.pdTitle }<br><span style="color:#E75E8D"><i class="fa-solid fa-dollar-sign"></i> <c:out value="${list.pdPrice}"/></span></h4>
		                                </div>
		                            </div>
	                        	</c:forEach>
	
	                        </div>
	                        <div class="row mt-3 text-center">
	                            <span id="buyListBtn" onclick="extendList('buyList')"
	                                style="font-size:10pt; color: gray; text-decoration: underline; cursor:pointer;">더보기</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- ***** 구매리스트 End ***** -->
            </form>
	    </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		openProduct = function(productSeq){
			
			$("#pdSeq").val(productSeq);
			$("#mainForm").attr("action","/product/productView").submit();
		}
	
		 extendList = function (id) {
            var myList = $("#" + id);

            if (myList.hasClass('row')) {
                myList.removeClass('row');
                myList.addClass('d-flex flex-row slimscroll');
                $("#" + id + "Btn").html("더보기");
            }
            else {
                myList.removeClass('d-flex flex-row slimscroll');
                myList.addClass('row');
                $("#" + id + "Btn").html("접기");
            }
        }
	</script>	
</body>
</html>
