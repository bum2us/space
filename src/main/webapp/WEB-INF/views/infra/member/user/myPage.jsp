<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>

	<title>๐ธ์ฐ์ฃผ๋ง์ผ๐ธ</title>
	
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
				                    <img src="
			                            <c:if test="${item.upPath eq null }">/resources/images/empty.png</c:if>
			                            <c:if test="${item.upPath ne null }">${item.upPath }${item.upUuidName }</c:if>
			                         " alt=""  style="width: 300px; height:300px; overflow:hidden; border-radius: 23px; ">
				                </div>
				                <div class="col-lg-4 align-self-center">
				                    <div class="main-info header-text">
				                        <h4><c:out value="${item.mmNickName }"/></h4>
				                        <p>์๋ํ์ธ์. ์ง ์ข๊ณ  ๊ฐ ์ผ ๋ฌผ๊ฑด๋ง ์ฐ์์ ์ผ๋ก ํ๋งคํฉ๋๋ค.</p>
				                        <c:if test="${item.mmSeq eq sessSeq}">
					                        <button type="button" class="base-border-button mb-2" style="width: 165px;" onclick="runForm('profile')">ํ๋กํ ํธ์ง</button>
					                        <button type="button" class="base-border-button" style="width: 165px;" id="moneyAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">์ฐ์ฃผ๋จธ๋ ์ถฉ์ </button>
				                        </c:if> 
				                    </div>
				                </div>
				                <div class="col-lg-4 align-self-center">
				                    <ul>
				                        <li>ํ๋ก์ <span>3</span></li>
				                        <li>ํ๋งค์ํ <span><c:out value="${saleList.size() }"/> </span></li>
				                        <li>๊ตฌ๋งค์ํ <span><c:out value="${buyList.size() }"/></span></li> 
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
					                                    <h4 style="margin:0px;">ํ๋งค์ํ</h4> 
					                                    <c:if test="${item.mmSeq eq sessSeq}">
															<button type="button" class="base-button" onclick="runForm('sale')">ํ๋งค ๋ฑ๋ก</button> 
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
							                                        <h4 style="white-space : nowrap;  overflow : hidden; text-overflow: ellipsis;"><c:out value="${list.pdTitle }"/></h4>
							                                        <br><span><i class="fa-solid fa-comments-dollar"></i> <c:out value="${list.pdPrice }"/>์</span>
							                                    </div>
							                                </div> 
							                            </div> 
						                            </c:forEach>	
				                            	</c:when>
				                            	<c:otherwise>
				                            		<div class="text-center" style="margin:100px 0px;">ํ๋งค์ํ ์์</div>   
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
					                                    <h4 style="margin:0px;">๊ตฌ๋งค์ํ</h4>
					                                    <c:if test="${item.mmSeq eq sessSeq}">
															<button type="button" class="base-button" onclick="runForm('buy')">๊ตฌ๋งค ๋ฑ๋ก</button>
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
							                                        <h4 style="white-space : nowrap;  overflow : hidden; text-overflow: ellipsis;"><c:out value="${list.pdTitle }"/></h4>
							                                        <br><span><i class="fa-solid fa-comments-dollar"></i> <c:out value="${list.pdPrice }"/>์</span>
							                                    </div>
							                                </div> 
							                            </div> 
						                            </c:forEach>	
				                            	</c:when>
				                            	<c:otherwise>
				                            		<div class="text-center" style="margin:100px 0px;">๊ตฌ๋งค์ํ ์์</div>   
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
				                <h1 class="modal-title fs-5" id="exampleModalLabel">์ถฉ์ ๊ธ์ก ์ ํ</h1>
				            </div>
				            <div class="modal-body">
				                <div class="row justify-content-between mb-2"> 
				                	<div class="col-3 text-center mb-2"><label for="balance">์์ก</label></div>
				                	<div class="col-9 text-start mb-2"><input type="text" id="balance" readonly></div>
				                	<div class="col-3 text-center"><label for="chargePrice">์ถฉ์ ๊ธ์ก</label></div>
				                	<div class="col-9 text-start"><input type="text" id="chargePrice"></div>
				                </div>	
				                <div class="row justify-content-center mt-3 mb-2">
				                	<button type="button" class="base-button" style="width: 30%;" onclick="kakaopay()">์ถฉ์ ํ๊ธฐ</button>
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
	
	<!--  ์คํฌ๋ฆฝํธ  -->		
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
					submitUrl="/member/editProfile";			
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
