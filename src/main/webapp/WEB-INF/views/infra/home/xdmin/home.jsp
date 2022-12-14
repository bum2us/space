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
	
	<title>πΈκ΄λ¦¬μ νμ΄μ§πΈ</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	
	<style>
		div	{
			/* border: solid 1px orange; */
		}
		
	</style>
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
	          <!-- μλ¨ λ° λ°λ‘ μλ νμ€ -->
	          <div class="row">
	            <div class="col-12 grid-margin stretch-card">
	              <div class="card corona-gradient-card">
	                <div class="card-body py-0 px-0 px-sm-3">
	                  <div class="row align-items-center">
	                    <div class="col p-4">
	                      <h4 class="mb-1 mb-sm-0" style="font-weight: bold;">κ΄λ¦¬μ νμ΄μ§</h4> 
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	
	
	          <div class="row">
	            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <div class="row">
	                    <div class="col-9">
	                      <div class="d-flex align-items-center align-self-start">
	                        <h3 class="mb-0"><c:out value="${memberCount }"/>λͺ</h3>
	                        <p class="text-success ml-2 mb-0 font-weight-medium"></p>
	                      </div>
	                    </div>
	                    <div class="col-3">
	                      <div class="icon icon-box-info ">
	                        <span class="mdi mdi-arrow-top-right icon-item"><i class="fa-solid fa-user"></i></span>
	                      </div>
	                    </div>
	                  </div>
	                  <h6 class="text-muted font-weight-normal">νμ μ</h6>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <div class="row">
	                    <div class="col-9">
	                      <div class="d-flex align-items-center align-self-start">
	                        <h3 class="mb-0">0λͺ</h3>
	                        <p class="text-success ml-2 mb-0 font-weight-medium"></p>
	                      </div>
	                    </div>
	                    <div class="col-3">
	                      <div class="icon icon-box-success">
	                        <span class="mdi mdi-arrow-top-right icon-item"><i class="fa-solid fa-user-plus"></i></span>
	                      </div>
	                    </div>
	                  </div>
	                  <h6 class="text-muted font-weight-normal">μ κ· νμ μ</h6>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <div class="row">
	                    <div class="col-9">
	                      <div class="d-flex align-items-center align-self-start">
	                        <h3 class="mb-0"><c:out value="${productCount }"/>κ°</h3>
	                        <p class="text-danger ml-2 mb-0 font-weight-medium"></p>
	                      </div>
	                    </div>
	                    <div class="col-3">
	                      <div class="icon icon-box-danger">
	                        <span class="mdi mdi-arrow-bottom-left icon-item"><i class="fa-solid fa-gift"></i></span>
	                      </div>
	                    </div>
	                  </div>
	                  <h6 class="text-muted font-weight-normal">μν μ</h6>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <div class="row">
	                    <div class="col-9">
	                      <div class="d-flex align-items-center align-self-start">
	                        <h3 class="mb-0"><c:out value="${postCount }"/>κ°</h3>
	                        <p class="text-success ml-2 mb-0 font-weight-medium"></p>
	                      </div>
	                    </div>
	                    <div class="col-3">
	                      <div class="icon icon-box-light ">
	                        <span class="mdi mdi-arrow-top-right icon-item"><i class="fa-regular fa-clipboard"></i></span>
	                      </div>
	                    </div>
	                  </div>
	                  <h6 class="text-muted font-weight-normal">κ²μλ¬Ό μ</h6>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="row">
	            <div class="col-md-4 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <h4 class="card-title">μν μΉ΄νκ³ λ¦¬ λΉμ¨</h4>  
	                  <canvas id="myChart"></canvas>
	                  
	                </div> 
	              </div>
	            </div>
	            <div class="col-md-8 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <div class="d-flex flex-row justify-content-between">
	                    <h4 class="card-title mb-1">μΈκΈ° μν</h4>
	                    <p class="text-muted mb-1">TOP 7</p>
	                  </div>
	                  <div class="row">
	                    <div class="col-12">
	                      <div class="preview-list">
	                        <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-primary">
	                              <i class="mdi mdi-file-document"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Admin dashboard design</h6>
	                              <p class="text-muted mb-0">Broadcast web app mockup</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">15 minutes ago</p>
	                              <p class="text-muted mb-0">30 tasks, 5 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                        <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-success">
	                              <i class="mdi mdi-cloud-download"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Wordpress Development</h6>
	                              <p class="text-muted mb-0">Upload new design</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">1 hour ago</p>
	                              <p class="text-muted mb-0">23 tasks, 5 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                        <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-info">
	                              <i class="mdi mdi-clock"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Project meeting</h6>
	                              <p class="text-muted mb-0">New project discussion</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">35 minutes ago</p>
	                              <p class="text-muted mb-0">15 tasks, 2 issues</p>
	                            </div>
	                          </div>
	                        </div>
	                        <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-danger">
	                              <i class="mdi mdi-email-open"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Broadcast Mail</h6>
	                              <p class="text-muted mb-0">Sent release details to team</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">55 minutes ago</p>
	                              <p class="text-muted mb-0">35 tasks, 7 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                         <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-danger">
	                              <i class="mdi mdi-email-open"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Broadcast Mail</h6>
	                              <p class="text-muted mb-0">Sent release details to team</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">55 minutes ago</p>
	                              <p class="text-muted mb-0">35 tasks, 7 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                         <div class="preview-item border-bottom">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-danger">
	                              <i class="mdi mdi-email-open"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">Broadcast Mail</h6>
	                              <p class="text-muted mb-0">Sent release details to team</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">55 minutes ago</p>
	                              <p class="text-muted mb-0">35 tasks, 7 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                        <div class="preview-item">
	                          <div class="preview-thumbnail">
	                            <div class="preview-icon bg-warning">
	                              <i class="mdi mdi-chart-pie"></i>
	                            </div>
	                          </div>
	                          <div class="preview-item-content d-sm-flex flex-grow">
	                            <div class="flex-grow">
	                              <h6 class="preview-subject">UI Design</h6>
	                              <p class="text-muted mb-0">New application planning</p>
	                            </div>
	                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
	                              <p class="text-muted">50 minutes ago</p>
	                              <p class="text-muted mb-0">27 tasks, 4 issues </p>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	
	          <!-- content-wrapper ends -->
	          <!-- partial:partials/_footer.html -->
	          <footer class="footer">
	            <div class="d-sm-flex justify-content-center justify-content-sm-between">
	              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Β©
	                μ°μ£Όλ§μΌ
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
        
        //Chart.js μ¬μ©
        const ctx = document.getElementById('myChart');
        <c:set var = "codeList" value = "${CodeServiceImpl.selectListCachedCode('5')}"/>
        new Chart(ctx, {
            type: 'bar',
            data: {
              labels: [
            	  <c:forEach items='${categoryCountList}' var='list' varStatus='status'>
		          	  	'<c:out value="${codeList[status.count].ccName}"/>',
            	  </c:forEach>
            	  ],
              datasets: [{
                label: ' μν μ',
                data: [
                	 <c:forEach items='${categoryCountList}' var='list' varStatus='status'>
             	  		'<c:out value="${list}"/>',
                	 </c:forEach>
                	],
               	barThickness: '1',
              }]
            }
        	,options:{
        		indexAxis: 'y',
        	}
          });
    </script>
	<script>
		goForm = function(seq){
			
			if(seq == 0){
				$("#mainForm").attr("action","/member/memberList").submit();
			}
			else{
				
			}
		}
	</script>	
</body>
</html>
