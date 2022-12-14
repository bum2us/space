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
		
		select {
            padding: 15px;
            height: 60px;
            width: 100%;
            background: #27292A;
            border: none;
            border-radius: 5px;
            color: #E75E8D;
            font-size: 10pt;
        }

        input {
            padding: 15px;
            height: 60px;
            width: 100%;
            background: #27292A;
            border: none;
            border-radius: 5px;
            color: #E75E8D;
            font-size: 10pt;
        }

        input:focus {
            background: #1F2122;
            border: 1px solid #E75E8D;
        }

        .input_label {
            font-weight: 400;
            font-size: 10pt;
            color: #E75E8D;
        }

        .spaceBtn {
            background: #E75E8D;
            padding: 5px 0px 5px 0px;
            font-size: 10pt;
            color: white;
            border: none;
            border-radius: 10px;
            height: 50px;
            min-width: 70px;
        }

        .spaceBtn:hover {
            background: white;
            color: #E75E8D;
        }

        .spaceBtnInner {
            background: #E75E8D;
            padding: 5px 0px 5px 0px;
            font-size: 10pt;
            color: white;
            border: none;
            border-radius: 10px;
            height: 60%;
            min-width: 70px;
            position: absolute;
            top: 20%;
            right: 5%;
        }

        .spaceBtnInner:hover {
            background: white;
            color: #E75E8D;
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
	        <div class="container-md" style="width:80%">  
                <form method="POST" id="mainForm" enctype="multipart/form-data">
                	<input type="hidden" name="stateKey" id="stateKey"> 
                    <div class="row jutify-content-center">
                        <div class="col text-center" style=" padding: 10px;">
                            <img alt="" src="/resources/images/space_logo.png" style="width: 420px; height:200px;">
                        </div>
                    </div>
                    <div class="page-content" style="margin-top:30px;">
                        <!-- ***** Featured Games Start ***** -->
                        <div class="main-profile p-5">
                            <div class="row justify-content-center mb-2">
                                <div class="col text-center">
                                    <span style="font-weight: bold; font-size: 20pt; color: #E75E8D;">정보 수정</span>
                                </div>
                            </div>  
                            <div class="row my-4 justify-content-center" style="position:relative">
                                <img id="profileImg" alt=""  src="
		                            <c:if test="${item.upPath eq null }">/resources/images/empty.png</c:if> 
		                            <c:if test="${item.upPath ne null }">${item.upPath }${item.upUuidName }</c:if>
			                    " style="border-radius:50%; border:none; width:100px; height:100px; padding:0px;">
                                <input type="file" id="multipartFile" name="multipartFile"
                                    onChange="upload('multipartFile');"
                                    style="position:absolute; opacity:0; cursor:pointer; border-radius:50%; border:none; width:100px; height:100px;">
                            </div>
                            <div class="row my-3"> 
                                <div class="col">
                                    <input type="text" style="color:gray;" disabled placeholder="아이디" value="${item.mmId }">
                                </div> 
                            </div> 
                            <div class="row my-3">
                                <div class="col">
                                    <input type="text" style="color:gray;" disabled placeholder="이름" value="${item.mmName }">
                                </div>
                            </div>
                            <div class="row my-3"> 
                                <div class="col">
                                    <input type="text" name="mmNickName" placeholder="닉네임" value="${item.mmNickName }">
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col">
                                    <input type="text" name="mmEmail" placeholder="이메일" value="${item.mmEmail }">
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col-3">
                                    <select name="mmTelecom">
                                        <option value="1">SKT</option>
                                        <option value="2">KT</option>
                                        <option value="3">LG</option>
                                        <option value="4">기타</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <input type="text" name="mmPhone" placeholder="휴대폰 번호를 (-) 제외하고 입력해주세요">
                                    <button style="right:7%;" class="spaceBtnInner" type="button"
                                        onclick="">인증요청</button>
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col" style="position:relative;">
                                    <input type="text" id="checkCode" placeholder="인증번호 6자리를 입력해주세요">
                                    <button class="spaceBtnInner" type="button" onclick="">인증확인</button>
                                </div>
                            </div>
                            <div class="row justify-content-center my-3">
                                <div class="col text-center">
                                    <button class="spaceBtn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"  
                                        style="width:100%;">비밀번호변경</button>
                                </div>
                            </div>
                            <div class="row justify-content-center mt-4">
                                <div class="col text-center">
                                    <button type="button" style="width:100%" class="spaceBtn"
                                        onclick="location.href='/loginForm'">돌아가기</button>
                                </div>
                                <div class="col text-center">
                                    <button type="button" style="width:100%" class="spaceBtn"
                                        onclick="goForm('update')">수정하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog modal-dialog-centered">
					        <div class="modal-content" style="background-color: #1f2122;">
					            <div class="modal-header justify-content-center">
					                <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
					            </div>
					            <div class="modal-body" style="border-top:solid 1px #27292a; padding:20px;"> 
					            	<div class="row mb-2 justify-content-center">
					            		<div class="col-3" style="display: flex; align-items:center;">
					            			<span>기존 비밀번호</span>
					            		</div>
					            		<div class="col" style="display:relative;"> 
					            			<input type="password" id="originPw">
					            			<button class="spaceBtnInner" type="button" onclick="goForm('check')">인증요청</button>
					            		</div>
					            	</div>   
					            	<div class="row justify-content-center">
					            		<div class="col text-center">
					            			<span style="margin-top:20px; color:red;" class="chk_fail" id="id_check_fail">비밀번호가 일치하지 않습니다.</span>   
					            		</div>
					            	</div>
					            	<div name="changePwTag" class="row mb-2 justify-content-center">
					            		<div class="col-3" style="display: flex; align-items:center;">
					            			<span>새 비밀번호</span>
					            		</div>
					            		<div class="col">
					            			<input type="password" id="newPw">
					            		</div>
					            	</div> 
					            	<div name="changePwTag" class="row mb-3 justify-content-center">
					            		<div class="col-3" style="display: flex; align-items:center;">
					            			<span>비밀번호 확인</span>
					            		</div> 
					            		<div class="col">
					            			<input type="password" id="newPwRe">
					            		</div>  
					            	</div>
					            	<input type="hidden" id="mmPassword" name="mmPassword">
					            	<div name="changePwTag" class="row justify-content-center">
					            		<div class="col text-center">
					            			<button class="base-button" type="button" onclick="goForm('change')">변경하기</button>
					            		</div>
					            	</div>
					            </div>			            
					        </div>
					    </div>
					</div>
                </form>
            </div>
	    </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script> 
		window.onload = function(){
			$('div[name=changePwTag]').hide();
			$('#id_check_fail').hide();
		}
	
		upload = function(objName) {
			
			var obj = $("#" + objName +"")[0].files; 
			
			if(obj == null) return false;
			
			var fileReader = new FileReader();
			fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
			
			fileReader.onload = function () {
				 $("#profileImg").attr("src", fileReader.result);
			}	
			
			$("#stateKey").val("1");  
		};
		
		goForm = function(key)
		{ 
			switch (key) {
			case 'update':
			{
				$("#mainForm").attr("action","/member/memberUpdt").submit();	
				break;
			}
			case 'change':
			{
				if($("#newPw").val().length < 4)
				{
					swal("길이가 너무 짧습니다","4자리 이상 입력하세요","error");
					return;
				}
				if(!($("#newPw").val() === $("#newPwRe").val())) 
				{
					swal("비밀번호확인 에러","다시 확인해주세요","error"); 
					return;
				}
				$("#mmPassword").val($("#newPw").val());
				swal("변경되었습니다.","다시 로그인 하시기 바랍니다.","success").then((value) =>{
					$("#mainForm").attr("action","/member/changePw").submit();		 	 	
				});
				break;
			}
			case 'check':
			{
				$.ajax({
					url:'/member/checkPw'
					,type:'POST'
					,datatype:'json'
					,data:{
						mmPassword : $("#originPw").val()
					}
					,success:function(result){
						if(result.rt == "success")
						{
		  					$('div[name=changePwTag]').show();
		  					$('#id_check_fail').hide();
						}
						else
						{
		  					$('div[name=changePwTag]').hide();
		  					$('#id_check_fail').show();
						}
					}
					,error:function(){
						alert("ajax error...!");
					}
				});
				break;
			}
			case 'other':
			{
			
				break;
			}
			default:
				break;
			}
			
		};
		
	</script>	
</body>
</html>
