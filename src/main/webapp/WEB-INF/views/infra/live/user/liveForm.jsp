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
		.details {
            position: relative;
            width: 100%;
            padding: 10px;
            display: grid;
            grid-template-columns: 2fr 1fr;
            grid-gap: 30px;
            margin-top: 10px;
        }

        .details .left {
            position: relative;
            display: grid;
            min-height: 500px;
            background: #1F2122;
            border-radius: 20px;
        }

        .settingArea {
            padding-left: 20px; 
            margin-top: 10px;
            width: 100%;
            height: 60px;
            justify-content:space-between;
        }

        .details .right {
            position: relative;
            display: grid;
            min-height: 500px;
            background: #1F2122;
            padding: 5px;
            border-radius: 20px;
        }

        .chatInput {
            display: flex;
            position: relative;
            justify-content: space-between;
            align-items: flex-end;
            min-height: 50px;
        }

        .chatInput textarea {
            position: absolute;
            width: 100%;
            background: transparent;
            border: none;
            border-top: 2px solid #27292A;
            padding: 10px;
            color: #E75E8D;
            font-size: 10pt;
        }

        .chatInput i {
            position: absolute;
            top: 40%;
            right: 4%;
        }

        .chatBox {
            padding: 10px;
            height: 500px;
            overflow-y: auto;
            overflow-x: hidden;
        }

        .user {
            font-weight: bold;
            color: gray;
            margin-right: 10px;
        }

        .message {
            font-size: 10pt;
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

        input {
            padding: 15px;
            height: 50px;
            width: 100%;
            background: #1F2122;
            border: none;
            border-radius: 5px;
            color: #E75E8D;
            font-size: 10pt;
        }

        input:focus {
            background: #1F2122;
            border: 1px solid #E75E8D;
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
	        <form id="mainForm">
	        	<input type="hidden" id="liveCode" name="liveCode" value="${code }">
	        	<input type="hidden" id="liveProductSeq" name="liveProductSeq" value="${product.pdSeq }">
	        	<div class="row settingArea">  
                    <input style="width:65%;" type="text" id="liveTitle" name="liveTitle" placeholder="LIVE 제목">
                    <button class="base-button" style="width:15%; height: 45px; border-radius: 10px; padding: 10px; margin-top: 3px;" type="button" onclick="createLiveRoom()">시작하기</button>
                    <button class="base-button" style="width:15%; height: 45px; border-radius: 10px; padding: 10px; margin-top: 3px;" type="button" onclick="exitRoom()">종료하기</button>
                </div> 
                <div class="details">
                    <div class="left" id="videoView" style="overflow:hidden;">
                    	<div class="productInfo">
                    		<div class="row pt-3" style="width:100%; position:absolute;">
                    			<div class="col-2 text-center pl-4 pt-2">
                                    <img src="${product.pdDefaultImg }" alt="" 
                                        style="width:45px; height: 45px; border-radius: 10px;">
                                </div>
                                <div class="col text-left">
                                    <div class="row pt-1"> 
                                        <h3><c:out value="${product.pdTitle }"/></h3>
                                    </div>
                                    <div class="row">  
                                        <span style="font-weight: bold;"><c:out value="${product.pdPrice }"/>원</span>
                                    </div>
                                </div>   
                    		</div>  
                    	</div>
                        <!-- 영상 출력 화면 -->
                    </div>
                    <div class="right">
                        <div class="chatBox slimscroll">

                            <!-- 
                            <div class="chat">
                                <div class="row">
                                    <div class="col-1">
                                        <img src="../images/empty.png" alt=""
                                            style="width:20px; height:20px; border-radius:50%;">
                                    </div>
                                    <div class="col" style="padding: 2px; margin-left: 10px;">
                                        <span class="message"><span class="user">보리아빠</span>와 이걸 중고로 판매하신다구요???</span>
                                    </div>
                                </div>
                            </div> 
                            -->

                        </div>
                        <div class="chatInput">
                            <textarea name="" id="" cols="27" rows="1" placeholder="type message.."></textarea>
                            <i style="font-size:12pt; cursor:pointer; color:#E75E8D;"
                                class="fa-solid fa-paper-plane"></i>
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
	
	<script src="https://cdn.jsdelivr.net/npm/@connectlive/connectlive-web-sdk/dist/connectlive-web-sdk.min.js"></script>
	<script>
		// 커넥트 라이브 내부 인증
	
	    ConnectLive.signIn({
	
	        serviceId: 'LJJF547WX1HE',
	
	        serviceSecret: 'LJJF547WX1HEYPQ0:mtO4PbZsC1vdiROD'
	
	    }).then(() => {
	
	        console.log('인증에 성공했습니다.');
	
	    }).catch((promise) => {
	
	        console.log('인증에 실패했습니다.');
	        alert("ConnectLive 인증중 오류가 발생하였습니다.");
	        return;
	    });
	
	    var myLocalMedia;
	    var room;  	
	    
	    createLiveRoom = function () {
	    	/*
	        ConnectLive.createLocalMedia({
	
	            audio: true,
	
	            video: true
	
	        }).then((localMedia) => {
	
	            // 방법 1. attach() 메서드 사용하기
	            myLocalMedia = localMedia;
	            var video = localMedia.video.attach();
	            $('#videoView').prepend(video);
	            $('#videoView').children()[0].style.height = "100%";
	            $('#videoView').children()[0].style.width = "auto";
	            $('#videoView').children()[0].style.borderRadius = "20px";
	            $('#videoView').children()[0].style.position = "absolute";
	            
	            room = ConnectLive.createRoom();
	            room.connect($("#liveCode").val()).then(()=>{
	            	room.publish([localMedia]).then(()=>{
		    	    	console.log(room);
		    	    }).catch((err)=>{
		    	    	console.log(err);
		    	    });  
	            }).catch((err)=>{
	            	console.log(err);
	            });
	    	    
	        });
	        */
	        
	        $.ajax({
	        	url: '/live/inst'
	        	,type: 'POST'
	        	,datatype: 'json'
	        	,data: {
	        		liveProductSeq : $("#liveProductSeq").val()
	        		,liveTitle : $("#liveTitle").val()
	        		,liveCode : $("#liveCode").val()
	        	},
	        	success:function(rt){
	        		console.log("라이브 시작");
	        	}, 
	        	error:function(){
	        		alert("ajax error..!");
	        	}
	        });
			
	    };
	
	    exitRoom = function () {
	        myLocalMedia.stop();
	        ConnectLive.signOut();
	    }
	</script>	
</body>
</html>
