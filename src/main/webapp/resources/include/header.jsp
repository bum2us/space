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
                  <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- ***** Search End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                  <li><a href="index.html">Live</a></li>
                  <li><a href="browse.html">중고거래</a></li>
                  <li><a href="/post/postList">동네소식</a></li>
                  <li><a href="streams.html">채팅</a></li>
                  <li><a href="profile.html">은평구 <i class="fa-solid fa-user-astronaut"></i></a></li> 
                  <li><a href="/member/profile">프로필</a></li>  
              </ul>   
              <a class='menu-trigger'>
                  <span>Menu</span>
              </a>
              <!-- ***** Menu End ***** -->
          </nav> 
	  </div>
	</header> 
	<br><br>   
	<!-- ***** Header Area End ***** -->