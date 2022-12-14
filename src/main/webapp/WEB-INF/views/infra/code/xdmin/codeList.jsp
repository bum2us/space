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
	
	<title>πΈμ½λκ΄λ¦¬πΈ</title>
	
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
                    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg"
                            alt="logo" /></a>
                </div>
                <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link">
                                <div class="navbar-profile">
                                    <img class="img-xs rounded-circle" src="../images/empty.png" alt="">
                                    <p class="mb-0 d-none d-sm-block navbar-profile-name">μ λ²μ</p>
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

            <!-- λ©μΈ ν¨λ μμ -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <form id="mainForm" method="POST">
                    <input type="hidden" id="seq" name="ccSeq"> 
                    
                        <!-- μλ¨ λ° λ°λ‘ μλ νμ€ -->
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card corona-gradient-card">
                                    <div class="card-body py-0 px-0 px-sm-3">
                                        <div class="row align-items-center">
                                            <div class="col p-4">
                                                <h4 class="mb-1 mb-sm-0" style="font-weight: bold;">μ½λ κ΄λ¦¬</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- κ²μ -->
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">κ²μ</h4>

                                        <div class="row my-3">
                                            <div class="col">
                                            	<selector:selectorCode functionType="shDelNy" op="${vo.shDelNy}"></selector:selectorCode>
                                            </div>
                                            <div class="col">
                                            	<selector:selectorCode functionType="shDateOption" op="${vo.shDateOption}"></selector:selectorCode>

                                            </div>
                                            <div class="col">
                                                <input class="form-control" type="text" id="startDate" name="shDateStart" placeholder="μμμΌ" value="${vo.shDateStart }">
                                            </div>
                                            <div class="col">
                                                <input class="form-control" type="text" id="endDate" name="shDateEnd" placeholder="μ’λ£μΌ" value="${vo.shDateEnd }">
                                            </div>
                                        </div>
										
                                        <div class="row my-3">
                                            <div class="col-3">
                                                <selector:selectorCode functionType="shOption" op="${vo.shOption}"></selector:selectorCode>
                                            </div>
                                            <div class="col-3">
                                                <input class="form-control" type="text" name="shValue" value="${vo.shValue }" placeholder="κ²μμ΄"> 
                                            </div>
                                            <div class="col-1 justify-content-start" style="display:flex;">
                                                <button style="height:100%; width:40px; margin-right:10px;" class="btn btn-outline-success" type="button" onclick="goForm(0)">
                                                	<i class="fa-solid fa-magnifying-glass"></i>
                                               	</button>
                                                <button style="height:100%; width:40px;" class="btn btn-outline-warning"  type="button" onclick="location.href='/code/codeList'">
                                                	<i class="fa-solid fa-rotate-left"></i>
                                               	</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <!-- νμ΄λΈ -->
                        <div class="row ">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">μ½λ λ¦¬μ€νΈ</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr> 
                                                        <th> <input type="checkbox"> </th>
                                                        <th> # </th>
                                                        <th> seq </th>
                                                        <th> μ½λκ·Έλ£Ή μνμ€ </th>
                                                        <th> μ½λκ·Έλ£Ή</th>
                                                        <th> μ½λ </th>
                                                        <th> μμ </th>
                                                        <th> μ­μ μ¬λΆ </th>
                                                        <th> μ¬μ©μ¬λΆ </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:choose>
                                                		<c:when test="${fn:length(list) eq 0}">
                                                			<tr>
																<td class="text-center" colspan="9">There is no data!</td>
															</tr>
                                                		</c:when>
                                                		<c:otherwise>
		                                                	<c:forEach items="${list}" var="list" varStatus="status">
			                                                    <tr style="cursor:pointer;" onclick="goForm(${list.ccSeq})">
			                                                        <td><input type="checkbox" onclick="event.stopPropagation()"></td>
			                                                        <td><c:out value="${status.count}"/></td>
			                                                        <td><c:out value="${list.ccSeq}"/></td>
			                                                        <td><c:out value="${list.cgSeq}"/></td>
			                                                        <td><c:out value="${list.cgName}"/></td>
			                                                        <td><c:out value="${list.ccName}"/></td>
			                                                        <td><c:out value="${list.ccOrder}"/></td>
			                                                        <td><c:out value="${list.ccDelNy == 0? 'N' : 'Y'}"/></td>
			                                                        <td><c:out value="${list.ccUseNy == 0? 'N' : 'Y'}"/></td>
			                                                    </tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>		
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card-footer">
					                     <div class="demo-inline-spacing">
											<button type="button" class="btn btn-outline-primary" id="btnExcel">
												<i class="fa-solid fa-file-arrow-down"></i>
											</button>
											<button type="button" class="btn btn-outline-success" id="btnForm">
												<i class="fa-solid fa-plus"></i>
											</button>
											<button type="button" class="btn btn-outline-danger" id="btnUelete">
												<i class="fa-solid fa-minus"></i>
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
                        <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Β©
                            μ°μ£Όλ§μΌ
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
	
	<!--  μ€ν¬λ¦½νΈ  -->		
	<%@include file="/resources/include/script.jsp"%> 
	<script>
        $(function () {
            $("#startDate").datepicker({
                changeMonth: true, // μμ λ°κΏμ μλ μλ νΈ λ°μ€λ₯Ό νμνλ€.
                changeYear: true, // λμ λ°κΏ μ μλ μλ νΈ λ°μ€λ₯Ό νμνλ€.
                dayNamesMin: ['μ', 'ν', 'μ', 'λͺ©', 'κΈ', 'ν ', 'μΌ'],
                yearRange: "1900:2023",
                dateFormat: "yy-mm-dd"
            }); 
        });
        $(function () {
            $("#endDate").datepicker({
                changeMonth: true, // μμ λ°κΏμ μλ μλ νΈ λ°μ€λ₯Ό νμνλ€. 
                changeYear: true, // λμ λ°κΏ μ μλ μλ νΈ λ°μ€λ₯Ό νμνλ€.
                dayNamesMin: ['μ', 'ν', 'μ', 'λͺ©', 'κΈ', 'ν ', 'μΌ'],
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
		var goUrlForm = "/code/codeForm"; 

		
		$("#btnForm").on("click", function(){
			goForm(0);
		});
		
		goForm = function(keyValue){
		
			if (keyValue != 0)
				$("#seq").val(keyValue);
			$("#mainForm").attr("action", goUrlForm).submit();
		}
	</script>	
</body>
</html>
