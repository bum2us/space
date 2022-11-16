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
		 .card {
            height: 700px;
            border-radius: 15px !important;
            background-color: rgba(0, 0, 0, 0.4) !important;
        }

        .contacts_body {
            padding: 0.75rem 0 !important;
            overflow-y: auto;
            white-space: nowrap;
            background: #1F2122;
        }

        .msg_card_body {
            overflow-y: auto;
            background: #1F2122;
        }

        .card-header {
            border-radius: 15px 15px 0 0 !important;
            border-bottom: 0 !important;
            background: #1F2122;
        }

        .card-footer {
            border-radius: 0 0 15px 15px !important;
            border-top: 0 !important;
            background: #1F2122;
        }

        .container {
            align-content: center;
        }

        .search {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
        }

        .search:focus {
            box-shadow: none !important;
            outline: 0px !important;
        }

        .type_msg {
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            height: 60px !important;
            overflow-y: auto;
        }

        .type_msg:focus {
            box-shadow: none !important;
            outline: 0px !important;
        }

        .attach_btn {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .send_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .search_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .contacts {
            list-style: none;
            padding: 0;
        }

        .contacts li {
            width: 100% !important;
            padding: 5px 10px;
            margin-bottom: 15px !important;
        }

        .active {
            background-color: #27292A;
        }

        .user_img {
            height: 60px;
            width: 60px;
            border: 1.5px solid #f5f6fa;
        }

        .img_cont {
            display: flex;
            align-items: center;
            position: relative;
            height: 70px;
            width: 70px;
        }

        .chat_product_img {
            border-radius: 5px;
            align-items: center;
            position: relative;
            height: 50px;
            width: 50px;
        }

        .online_icon {
            position: absolute;
            height: 15px;
            width: 15px;
            background-color: #4cd137;
            border-radius: 50%;
            bottom: 13px;
            right: 13px;
            border: 1.5px solid white;
        }

        .offline {
            background-color: #c23616 !important;
        }

        .chat_product_info {
            margin-top: 10px;
            margin-bottom: auto;
            margin-left: 0px;
            overflow: hidden;
            white-space: nowrap;
        }

        .chat_product_info .title {
            font-size: 12px;
            color: white;
        }

        .chat_product_info .status {
            font-size: 12px;
            color: white;
            font-weight: bold;
            margin-right: 5px;
        }

        .chat_product_info p {
            font-size: 12px;
            color: rgba(255, 255, 255, 0.6);
        }

        .msg_cotainer {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 10px;
            border-radius: 25px;
            background-color: #27292A;
            color: white;
            padding: 10px;
            position: relative;
        }

        .msg_cotainer_send {
            margin-top: auto;
            margin-bottom: auto;
            margin-right: 10px;
            border-radius: 25px;
            background-color: #E75E8D;
            color: white;
            padding: 10px;
            position: relative;
        }

        .msg_time {
            position: absolute;
            left: 0;
            margin-left: 10px;
            bottom: -15px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
        }

        .msg_time_send {
            position: absolute;
            right: 0;
            margin-right: 10px;
            bottom: -15px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
        }

        .msg_head {
            position: relative;
            background: #1F2122;
        }

        /* width */

        ::-webkit-scrollbar {
            width: 10px;
        }


        /* Track */

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }


        /* Handle */

        ::-webkit-scrollbar-thumb {
            background: #888;
        }


        /* Handle on hover */

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        @media(max-width: 576px) {
            .contacts_card {
                margin-bottom: 15px !important;
            }
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
		        <div class="row justify-content-center h-100">
		            <div class="col-md-4 col-xl-3 chat">
		                <div class="card mb-sm-3 mb-md-0 contacts_card">
		                    <div class="card-header">
		                        <div class="input-group">
		                            <input type="text" placeholder="Search..." name="" class="form-control search">
		                            <span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
		                        </div>
		                    </div>
		                    <div class="card-body contacts_body">
		                        <ui class="contacts">
		                            <li class="active">
		                                <div class="d-flex bd-highlight">
		                                    <div class="img_cont">
		                                        <img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg"
		                                            class="rounded-circle user_img">
		                                        <span class="online_icon"></span>
		                                    </div>
		                                    <div class="chat_product_info">
		                                        <span class="status">정우경</span>
		                                        <p>Online</p>
		                                    </div>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="d-flex bd-highlight">
		                                    <div class="img_cont">
		                                        <img src="https://2.bp.blogspot.com/-8ytYF7cfPkQ/WkPe1-rtrcI/AAAAAAAAGqU/FGfTDVgkcIwmOTtjLka51vineFBExJuSACLcBGAs/s320/31.jpg"
		                                            class="rounded-circle user_img">
		                                        <span class="online_icon offline"></span>
		                                    </div>
		                                    <div class="chat_product_info">
		                                        <span class="status">고명지</span>
		                                        <p>Left 7 mins ago</p>
		                                    </div>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="d-flex bd-highlight">
		                                    <div class="img_cont">
		                                        <img src="https://i.pinimg.com/originals/ac/b9/90/acb990190ca1ddbb9b20db303375bb58.jpg"
		                                            class="rounded-circle user_img">
		                                        <span class="online_icon"></span>
		                                    </div>
		                                    <div class="chat_product_info">
		                                        <span class="status">신범수</span>
		                                        <p>Online</p>
		                                    </div>
		                                </div>
		                            </li>
		                        </ui>
		                    </div>
		                    <div class="card-footer"></div>
		                </div>
		            </div>
		            <div class="col-md-8 col-xl-6 chat">
		                <div class="card">
		                    <div class="card-header msg_head">
		                        <div class="d-flex bd-highlight" style="padding-right:20px">
		                            <div class="img_cont">
		                                <img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg"
		                                    class="chat_product_img">
		                                <span class="online_icon"></span>
		                            </div>
		                            <div class="chat_product_info">
		                                <span class="status">판매중</span><span class="title">프롬비 사일런트 스톰 저소음 휴대용
		                                    선풍기asdasdasdasdasdasdasdasdasdasdasda</span>
		                                <p>16,000원</p>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="card-body msg_card_body">
		                        
		                        <div class="d-flex justify-content-end mb-4">
		                            <div class="msg_cotainer_send">
		                                안녕하세요 선풍기 구매하려는데 팔렸나요?
		                                <span class="msg_time_send">8:50 AM, Today</span>
		                            </div>
		                        </div>
		                        <div class="d-flex justify-content-start mb-4">
		                            <div class="msg_cotainer">
		                                아니요 안팔렸어요~
		                                <span class="msg_time">8:55 AM, Today</span>
		                            </div>
		                        </div>
		                        
		                </div>
		            </div>
		        </div>
	    </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	
	<script>
		sendChat = function() {
			//메세지 받아오기
			var message = $("#message").val();
			
			//메세지 입력창 clear
			$("#message").val(""); 
			
			
		};
	
		selectChatRoom = function (roomNo) {
            
            var roomArray = $("li[name=room]");
            roomArray.each(function (index, item) {
                if (index != roomNo - 1)
                    item.classList.remove("active");
                else
                    item.classList.add("active");
            });


            
        };
    </script>
</body>
</html>
