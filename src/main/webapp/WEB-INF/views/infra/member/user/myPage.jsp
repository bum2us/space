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
		input { 
			padding: 15px; 
			height: 30px; 
			width: 90%; 
			background: #27292A; 
			border: none; 
			border-radius:5px; 
			color: #E75E8D;  
			font-size: 10pt;   	
		}
		
		input:focus {
			background: #1F2122; 
			border:  1px solid #E75E8D;
		}
		
	</style>
</head>
<body>
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	<div class="container">
	    <div class="page-content">
	    	<form id="mainForm" method="POST">
	    		<input type="hidden" id="pdSeq" name="pdSeq"> 
		        <div class="row">
				    <div class="col-lg-12">
				        <div class="main-profile "> 
				            <div class="row">
				                <div class="col-lg-4">
				                    <img src="${item.upPath }${item.upUuidName }" alt=""  style="width: 300px; height:300px; overflow:hidden; border-radius: 23px; ">
				                </div>
				                <div class="col-lg-4 align-self-center">
				                    <div class="main-info header-text">
				                        <h4><c:out value="${item.mmNickName }"/></h4>
				                        <p>안녕하세요. 질 좋고 값 싼 물건만 연쇄적으로 판매합니다.</p>
				                        <c:if test="${item.mmSeq eq sessSeq}">
					                        <button type="button" class="base-border-button mb-2" style="width: 165px;" onclick="runForm('profile')">프로필 편집</button>
					                        <button type="button" class="base-border-button" style="width: 165px;" id="moneyAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">우주머니 충전</button>
				                        </c:if> 
				                    </div>
				                </div>
				                <div class="col-lg-4 align-self-center">
				                    <ul>
				                        <li>팔로워 <span>3</span></li>
				                        <li>판매상품 <span><c:out value="${saleList.size() }"/> </span></li>
				                        <li>구매상품 <span><c:out value="${buyList.size() }"/></span></li> 
				                    </ul>
				                </div>
				            </div>
				
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="clips">
				                        <div class="row">
				                            <div class="col-lg-12">
				                                <div class="heading-section">
				                                	<div class="d-flex mb-3" style="justify-content:space-between;">
					                                    <h4 style="margin:0px;">판매상품</h4> 
					                                    <c:if test="${item.mmSeq eq sessSeq}">
															<button type="button" class="base-button" onclick="runForm('sale')">판매 등록</button> 
														</c:if> 			                                	
				                                	</div>
				                                </div>
				                            </div>
				                            <c:choose>
				                            	<c:when test="${saleList.size() ne 0}">
				                            		<c:forEach items="${saleList }" var="list" varStatus="status">
						                            	<div class="col-lg-3 col-sm-6" style="cursor:pointer;" onclick="openProduct(${list.pdSeq})"> 
							                                <div class="item">
							                                    <div class="thumb">
							                                        <img src="${list.upPath }${list.upUuidName}" alt="" style="border-radius: 23px;">
							                                    </div>
							                                    <div class="down-content">
							                                        <h4><c:out value="${list.pdTitle }"/></h4>
							                                        <span><i class="fa-solid fa-comments-dollar"></i> <c:out value="${list.pdPrice }"/>원</span>
							                                    </div>
							                                </div> 
							                            </div> 
						                            </c:forEach>	
				                            	</c:when>
				                            	<c:otherwise>
				                            		<div class="text-center" style="margin:100px 0px;">판매상품 없음</div>   
				                            	</c:otherwise>
				                            </c:choose>				                            
				                        </div> 
				                    </div>
				                </div>
				            </div>
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="clips">
				                        <div class="row">
				                            <div class="col-lg-12">
				                                <div class="heading-section">
				                                    <div class="d-flex mb-3" style="justify-content:space-between;">
					                                    <h4 style="margin:0px;">구매상품</h4>
					                                    <c:if test="${item.mmSeq eq sessSeq}">
															<button type="button" class="base-button" onclick="runForm('buy')">구매 등록</button>
														</c:if> 			                                	
				                                	</div>
				                                </div>
				                            </div>
				                             <c:choose>
				                            	<c:when test="${buyList.size() ne 0}"> 
				                            		<c:forEach items="${buyList }" var="list" varStatus="status">
						                            	<div class="col-lg-3 col-sm-6" style="cursor:pointer;" onclick="openProduct(${list.pdSeq})"> 
							                                <div class="item">
							                                    <div class="thumb">
							                                        <img src="${list.upPath }${list.upUuidName}" alt="" style="border-radius: 23px;">
						                                        </div>
							                                    <div class="down-content">
							                                        <h4><c:out value="${list.pdTitle }"/></h4>
							                                        <span><i class="fa-solid fa-comments-dollar"></i> <c:out value="${list.pdPrice }"/>원</span>
							                                    </div>
							                                </div> 
							                            </div> 
						                            </c:forEach>	
				                            	</c:when>
				                            	<c:otherwise>
				                            		<div class="text-center" style="margin:100px 0px;">구매상품 없음</div>   
				                            	</c:otherwise>
				                            </c:choose>		
				                        </div>
				                    </div>
				                </div>
				            </div>
				
				        </div>
				    </div>
				</div>
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <div class="modal-header justify-content-center">
				                <h1 class="modal-title fs-5" id="exampleModalLabel">충전금액 선택</h1>
				            </div>
				            <div class="modal-body">
				                <div class="row justify-content-between mb-2"> 
				                	<div class="col-3 text-center mb-2"><label for="balance">잔액</label></div>
				                	<div class="col-9 text-start mb-2"><input type="text" id="balance" readonly></div>
				                	<div class="col-3 text-center"><label for="chargePrice">충전금액</label></div>
				                	<div class="col-9 text-start"><input type="text" id="chargePrice"></div>
				                </div>	
				                <div class="row justify-content-center mt-3 mb-2">
				                	<button type="button" class="base-button" style="width: 30%;" onclick="kakaopay()">충전하기</button>
				                </div>		            	
				            </div>			            
				        </div>
				    </div>
				</div>
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
		};
		
		runForm = function(key){
			
			var submitUrl = "";
			
			switch (key) 
			{
				case 'profile':
				{
					submitUrl="";			
					break;
				}
				case 'sale':
				{
					submitUrl="/product/productForm";
					break;
				}
				case 'buy':
				{
					submitUrl="";
					break;
				}
	
				default:
					break;
			}
			
			$("#mainForm").attr("action",submitUrl).submit();
		}
		
		kakaopay = function(){
			$.ajax({
				async: true
				,cach: false
				,method: "post"
				,url : "/kakaopay/ready"
				,data : {
					charge : $("#chargePrice").val()
				}
				,success: function(response){
					location.href = response.next_redirect_pc_url
				}
				,error: function(){
					alert("ajax error..");
				}
			});
		}
	</script>	
</body>
</html>
