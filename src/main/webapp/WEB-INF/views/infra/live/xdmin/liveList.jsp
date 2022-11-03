<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="selector" tagdir="/WEB-INF/tags" %> 
<jsp:useBean id="CodeServiceImpl" class="com.space.infra.modules.code.CodeServiceImpl"/> 

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>🛸멤버관리🛸</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	
	<style>
		div	{
			/* border: solid 1px orange; */
		}
		
	</style>
</head>
<body>
	<c:set var = "listLiveState" value = "${CodeServiceImpl.selectListCachedCode('7')}"/>
	<div class="container-scroller">
        
        <%@include file="/resources/include/adminSidebar.jsp" %>
        
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">

            <nav class="navbar p-0 fixed-top d-flex flex-row">
                <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg"
                            alt="logo" /></a>
                </div>
                <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link">
                                <div class="navbar-profile">
                                    <img class="img-xs rounded-circle" src="../images/empty.png" alt="">
                                    <p class="mb-0 d-none d-sm-block navbar-profile-name">신범수</p>
                                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#">
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </a>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                        data-toggle="offcanvas">
                        <span class="mdi mdi-format-line-spacing"></span>
                    </button>
                </div>
            </nav>

            <!-- 메인 패널 시작 -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <form id="mainForm" method="POST">
                        <!-- 상단 바 바로 아래 한줄 -->
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card corona-gradient-card">
                                    <div class="card-body py-0 px-0 px-sm-3">
                                        <div class="row align-items-center">
                                            <div class="col p-4">
                                                <h4 class="mb-1 mb-sm-0" style="font-weight: bold;">LIVE 관리</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 검색 -->
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">검색</h4>

                                        <div class="row my-3">
                                            <div class="col">
                                            	<selector:selectorLive functionType="shState" op="${vo.shState}"></selector:selectorLive>
                                            </div>
                                            <div class="col">
                                            	<selector:selectorLive functionType="shDateOption" op="${vo.shDateOption}"></selector:selectorLive>

                                            </div>
                                            <div class="col">
                                                <input class="form-control" type="text" id="startDate" name="shDateStart" placeholder="시작일" value="${vo.shDateStart }">
                                            </div>
                                            <div class="col">
                                                <input class="form-control" type="text" id="endDate" name="shDateEnd" placeholder="종료일" value="${vo.shDateEnd }">
                                            </div>
                                        </div>
										
                                        <div class="row my-3">
                                            <div class="col-3">
                                                <selector:selectorLive functionType="shOption" op="${vo.shOption}"></selector:selectorLive>
                                            </div>
                                            <div class="col-3">
                                                <input class="form-control" type="text" name="shValue" value="${vo.shValue }" placeholder="검색어"> 
                                            </div>
                                            <div class="col-1 justify-content-start" style="display:flex;">
                                                <button style="height:100%; width:40px; margin-right:10px;" class="btn btn-outline-success" type="button" onclick="goForm(0)"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                <button style="height:100%; width:40px;" class="btn btn-outline-warning"  type="button" onclick="location.href='/live/liveList'"><i class="fa-solid fa-rotate-left"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <!-- 테이블 -->
                        <div class="row ">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">LIVE 리스트</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr> 
                                                        <th> <input type="checkbox"> </th>
                                                        <th> # </th>
                                                        <th> seq </th>
                                                        <th> Title </th>
                                                        <th> 판매상품 </th>
                                                        <th> 판매자 </th>
                                                        <th> 상태 </th>
                                                        <th> 시작날짜</th>
                                                        <th> 등록날짜 </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach items="${list}" var="list" varStatus="status">
	                                                    <tr onclick="">
	                                                        <td><input onclick="event.stopPropagation()" name="listCheckbox" type="checkbox"></td>
	                                                        <td><c:out value="${status.count}"/></td>
	                                                        <td><c:out value="${list.liveSeq}"/></td>
	                                                        <td><c:out value="${list.liveTitle}"/></td>
	                                                        <td><c:out value=""/></td>
	                                                        <td><c:out value=""/></td>
	                                                        <td>
	                                                        	<c:forEach items="${listLiveState }" var="state" varStatus="status">	                                 
	                                                        		<c:if test="${state.ccOrder eq list.liveState}"><c:out value="${state.ccName}"/></c:if>
	                                                        	</c:forEach>
	                                                        </td>
	                                                        <td><c:out value="${list.liveStartDate}"/></td>
	                                                        <td><c:out value="${list.liveCreateDate}"/></td>
	                                                        <!--<td><div class="badge badge-outline-success">Approved</div></td>-->
	                                                    </tr>
													</c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright ©
                            우주마켓
                            2030</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Lil jeju <a
                                href="https://www.youtube.com/watch?v=7aMDCkqg_q8" target="_blank">Would
                                you like
                                hater top one for the chuck
                                wonder like station
                            </a>from town people </span>
                    </div>
                </footer>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
	
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%> 
	<script>
        $(function () {
            $("#startDate").datepicker({
                changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
                changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                yearRange: "1900:2023",
                dateFormat: "yy-mm-dd"
            }); 
        });
        $(function () {
            $("#endDate").datepicker({
                changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
                changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                yearRange: "1900:2023",
                dateFormat: "yy-mm-dd"
            });
        });
    </script>
	<script>
		goForm = function(seq){
			
			if(seq == 0){
				$("#mainForm").attr("action","/live/liveList").submit();
			}
			else{
				
			}
		}
	</script>	
</body>
</html>
