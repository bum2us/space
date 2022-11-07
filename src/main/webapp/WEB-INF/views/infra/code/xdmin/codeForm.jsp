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
	
	<title>🛸코드관리🛸</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>

</head>
<body>
	<div class="container-scroller">
        
        <%@include file="/resources/include/adminSidebar.jsp" %>
        
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">

            <nav class="navbar p-0 fixed-top d-flex flex-row">
                <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo-mini"><img src="assets/images/logo-mini.svg"
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
                    <input type="hidden" name="ccSeq" id="seq">
                        <!-- 상단 바 바로 아래 한줄 -->
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card corona-gradient-card">
                                    <div class="card-body py-0 px-0 px-sm-3">
                                        <div class="row align-items-center">
                                            <div class="col p-4">
                                                <h4 class="mb-1 mb-sm-0" style="font-weight: bold;">코드 관리</h4>
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
                                        <h4 class="card-title">코드 등록</h4>
                                        <div class="row">
                                        	<div class="col p-2">
                                        		<label class="form-label" for="inputccGroupSeq">코드 그룹 시퀀스</label>
                                        		<input type="text" class="form-control" name="ccGroupSeq" id="inputccGroupSeq" value="${item.ccGroupSeq}" readonly>
                                        	</div>
                                        	<div class="col p-2">
                                        		<label class="form-label" for="inputCgname">코드 그룹 이름</label>
                                        		<select class="form-control" name="cgName" id="inputCgname">
                                        			<c:forEach items="${list}" var="list" varStatus="statusCgName">
                                        				<option value="${list.cgSeq}">${list.cgName}</option>
                                        			</c:forEach>	
                                        		</select>
                                        	</div>
                                        </div>
                                        <div class="row">	
                                       	 	<div class="col p-2">
                                        		<label class="form-label" for="inputccGroupSeq">코드 시퀀스</label>
                                        		<input type="text" class="form-control" name="ccSeq" value="${item.ccSeq}" id="inputccGroupSeq" readonly>
                                        	</div>
                                        	<div class="col p-2">
                                        		<label class="form-label" for="inputCgname">코드 이름</label>
                                        		<input type="text" class="form-control" name="ccName" value="${item.ccName}" id="inputCgname">
                                        	</div>
                                        </div>
                                        <div class="row">	
                                       	 	<div class="col p-2">
                                        		<label class="form-label" for="inputccGroupSeq">순서</label>
                                        		<input type="text" class="form-control" name="ccOrder" value="${item.ccOrder}" id="inputccGroupSeq">
                                        	</div>
                                        	<div class="col p-2">
                                        		<label class="form-label" for="useNy">사용여부</label>
                                        		<select id="useNy" class="form-control" name="ccUseNy" >
                                        			<option value="0" <c:if test="${item.ccUseNy eq 0}">selected</c:if>>N</option>
                                        			<option value="1" <c:if test="${item.ccUseNy eq 1}">selected</c:if>>Y</option>
                                        		</select>
                                        	</div>
                                        </div>
                                        <div class="row">	
                                        	<div class="col p-2">
                                        		<label class="form-label" for="delNy">삭제여부</label>
                                        		<select id="delNy" class="form-control" name="ccDelNy" >
                                        			<option value="0" <c:if test="${item.ccDelNy eq 0}">selected</c:if>>N</option>
                                        			<option value="1" <c:if test="${item.ccDelNy eq 1}">selected</c:if>>Y</option>
                                        		</select>
                                        	</div>
                                        	<div class="col p-2">
                                        		<label class="form-label" for="createDate">등록날짜</label>
                                        		<input type="text" class="form-control" name="ccCreateDate" value="${item.ccCreateDate}" id="createDate" readonly>
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
					                     <div class="demo-inline-spacing">
											<button type="button" class="btn btn-outline-info" id="btnList" onclick="location.href='/code/codeList'">
												<i class="fa-solid fa-bars"></i>
											</button>
											<button type="button" class="btn btn-outline-danger" id="btnUelete">
												<i class="fa-solid fa-minus"></i>
											</button>
											<button type="button" class="btn btn-outline-primary" id="btnSave">
												<i class="fa-solid fa-plus"></i>
											</button>
											<button type="button" class="btn btn-outline-danger" id="btnDelete">
												<i class="fa-solid fa-trash-can"></i>
											</button>
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
                                href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Would
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
	<%@include file="/resources/include/modalBase.jsp"%>
	
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
	var goUrlList = "/code/codeList";
	var goUrlInst = "/code/codeInst";
	var goUrlUpdt = "/code/codeUpdt";
	var goUrlUele = "/code/codeUele";
	var goUrlDele = "/code/codeDele";


	
	$("#btnSave").on("click", function(){
		if(seq.val() == "0" || seq.val() == ""){
			$("#mainForm").attr("action", goUrlInst).submit();
		} else {
			$("#mainForm").attr("action", goUrlUpdt).submit();
		}
	});

</script>	
	</script>	
</body>
</html>
