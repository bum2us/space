<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="/home" class="logo">
                <img src="/resources/images/space_logo.png" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Search End ***** -->
            <div class="search-input" style="display:flex; align-items:center">
                <form id="search" action="#">
                    <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword"
                        onkeypress="handle" />
                    <i class="fa fa-search"></i>
                </form>
            </div>
            <!-- ***** Search End ***** -->
            <!-- ***** Menu Start ***** --> 
            <ul class="nav">
                <li><a href="">Live</a></li>
                <li><a href="/product/productList">중고거래</a></li>
                <li><a href="/post/postList">동네소식</a></li>
                <li><a href="/chat/">채팅</a></li>
                <li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">프로필</a>
                	<ul class="dropdown-menu">
                		<li><a><c:out value="${sessName}"/> 님<br> 안녕하세요</a></li>
                		<li><a href="/member/profile">마이페이지</a></li>
	            		<li><a id="btnLogout">로그아웃</a></li>
                	</ul>
               	</li>
                <li><a href="/myVillage/list"><c:out value="${sessVillage}"/> <i class="fa-solid fa-user-astronaut"></i></a></li>
            </ul>
          
            
            <!-- ***** Menu End ***** -->
        </nav>
        
    </div>
</header>
<br><br>
<!-- ***** Header Area End ***** -->