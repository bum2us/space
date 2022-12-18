<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="kr">
<head>

<title>🛸우주마켓🛸</title>

<!-- link -->
<%@include file="/resources/include/link.jsp"%>


<style>
div {
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
	justify-content: space-between;
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
				<input type="hidden" id="liveChat" value="info">  
				<div class="row settingArea"> 
					<input style="width: 65%;" type="text" id="liveTitle" 
						name="liveTitle" placeholder="LIVE 제목">
					<button id="createLiveBtn" class="base-button"
						style="width: 15%; height: 45px; border-radius: 10px; padding: 10px; margin-top: 3px;"
						type="button" onclick="createLiveRoom()">시작하기</button> 
					<button class="base-button"
						style="width: 15%; height: 45px; border-radius: 10px; padding: 10px; margin-top: 3px;"
						type="button" onclick="exitRoom()">종료하기</button>
				</div>
				<div class="details">
					<div class="left" id="videoView" style="overflow: hidden;">
						<div class="productInfo">
							<div class="row pt-3" style="width: 100%; position: absolute;">
								<div class="col-2 text-center pl-4 pt-2">
									<img src="${product.pdDefaultImg }" alt=""
										style="width: 45px; height: 45px; border-radius: 10px;">
								</div>
								<div class="col text-left">
									<div class="row pt-1">
										<h3>
											<c:out value="${product.pdTitle }" />
										</h3>
									</div>
									<div class="row">
										<span style="font-weight: bold;"><c:out
												value="${product.pdPrice }" />원</span>
									</div>
								</div>
							</div>
						</div>
						<!-- 영상 출력 화면 -->
					</div>
					<div class="right">
						<div id="chatBox" class="chatBox slimscroll">

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
							<textarea name="" id="chatMessage" cols="27" rows="1"
								placeholder="type message.."></textarea>
							<i id="sendBtn"
								style="font-size: 12pt; cursor: pointer; color: #E75E8D;"
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

	<script
		src="https://cdn.jsdelivr.net/npm/@connectlive/connectlive-web-sdk/dist/connectlive-web-sdk.min.js"></script>
	<script>
		// 커넥트 라이브 내부 인증
	 
	    ConnectLive.signIn({
	 
	        serviceId: 'LJJF547WX1HE',
	
	        serviceSecret: 'LJJF547WX1HEEHWS:F7qEAQoMR7b0wanW'
	
	    }).then(() => {
	
	        console.log('인증에 성공했습니다.');
	
	    }).catch((promise) => {
	
	        console.log('인증에 실패했습니다.');
	        console.log(promise); 
	        alert("ConnectLive 인증중 오류가 발생하였습니다.");
	        return;
	    });
	
	    var myLocalMedia;
	    var room;  	
	    
	    createLiveRoom = function () {
	    	
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
	        		$("#liveChat").val(rt.seq);
	        	}, 
	        	error:function(){
	        		alert("ajax error..!");
	        	}
	        });
			
	    };
	
	    exitRoom = function () {
	        myLocalMedia.stop();
	        ConnectLive.signOut();
	    };
	    
		getnow = function() {
					
			var timestamp = new Date().getTime();
			
			var date = new Date(timestamp); //타임스탬프를 인자로 받아 Date 객체 생성
			
			var year = date.getFullYear().toString().slice(-2); //년도 뒤에 두자리
			var month = ("0" + (date.getMonth() + 1)).slice(-2); //월 2자리 (01, 02 ... 12)
			var day = ("0" + date.getDate()).slice(-2); //일 2자리 (01, 02 ... 31)
			var hour = ("0" + date.getHours()).slice(-2); //시 2자리 (00, 01 ... 23)
			var minute = ("0" + date.getMinutes()).slice(-2); //분 2자리 (00, 01 ... 59)
			var second = ("0" + date.getSeconds()).slice(-2); //초 2자리 (00, 01 ... 59)
			
			return year+month+day+hour+minute+second;
		}; 
		
	</script>

	<script type="module">

		import { initializeApp } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js";
		// Initialize Firebase
		const firebaseConfig = {
   	 	apiKey: "AIzaSyCUPJTu3ADXESoGCbQs1QOnXCVvcxE3x5E",
    	authDomain: "my-chat-77e35.firebaseapp.com",
   	 	databaseURL: "https://my-chat-77e35-default-rtdb.firebaseio.com",
    	projectId: "my-chat-77e35",
    	storageBucket: "my-chat-77e35.appspot.com",
    	messagingSenderId: "1052311956304",
    	appId: "1:1052311956304:web:59304bc4496a0db7831a55"
  		};

		const app = initializeApp(firebaseConfig);

		import { getDatabase, ref, set, onValue }	from "https://www.gstatic.com/firebasejs/9.12.1/firebase-database.js";
	
		const db = getDatabase();

		function sendMessage(){

			var room = $("#liveChat").val();

			var message = $("#chatMessage").val();

			var nickName = '<c:out value="${sessNickName}"/>'; 

			//메시지 입력창 초기화
			$("#chatMessage").val("");
		
			//새 메세지 추가하면 채팅방에 이전 기록도 다시 다 불러와서 한번 비워줌
			$("#chatBox").html(""); 	
	 
			//새 메세지를 Firebase / realtime database / live / 채팅방seq / 시간대 / 작성자 / 메세지에 입력합니다.
			set(ref(db,'live/'+room+'/'+getnow()+'/'+ nickName),{
				Masseage: message
			})

			//스크롤을 제일 아래로 유지
			$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
	};

	function readMessage(){

		const room = $("#liveChat").val();
		
		const dbRef = ref(db, 'live/'+room);
		const txt = ""; 
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#liveChat").val()){
				//채팅을 누르면 기존 채팅은 지우고 새로 불러오게
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'live/'+room+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'live/'+room+'/'+timetable+'/'+writer),(snapshot3) => {
                                snapshot3.forEach((childSnapshot3) => {
                                        const message = childSnapshot3.val()
                                        console.log(message);
                                            
                                        var txt = '';

                                        txt+= '<div class="chat"><div class="row"><div class="col-1"><img src="/resources/images/empty.png" alt="" style="width:20px; height:20px; border-radius:50%;"></div><div class="col" style="padding: 2px; margin-left: 10px;">';
                                        txt+= '<span class="message"><span class="user">';
                                        txt+= writer;
                                        txt+= '</span>';
                                        txt+= message;
                                        txt+= '</span></div></div></div>'; 

                                        $("#chatBox").append(txt);
                                        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                                    });
                                }); 
                            });  
                        });
                    });
                 }		
            });	
	}; 
	window.onload = function(){
		readMessage();
	} 
	
	$("#sendBtn").click(function(){
		sendMessage();
	});

	function getTimeFormat(timetable){
		//221105080634 
		return timetable.substring(0,2)+"-"+timetable.substring(2,4)+"-"+timetable.substring(4,6)+" "+timetable.substring(6,8)+":"+timetable.substring(8,10)+":"+timetable.substring(10,12);	
	};

	</script>
</body>
</html>
