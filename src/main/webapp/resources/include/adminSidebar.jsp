<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <a class="sidebar-brand brand-logo" href="index.html">우주마켓</a>
        <a class="sidebar-brand brand-logo-mini" href="index.html">우</a>
    </div>
    <ul class="nav">
        <li class="nav-item profile">
            <div class="profile-desc">
                <div class="profile-pic">
                    <div class="count-indicator">
                        <img class="img-xs rounded-circle " src="/resources/images/empty.png" alt="">   
                        <span class="count bg-success"></span>
                    </div>
                    <div class="profile-name">
                        <h5 class="mb-0 font-weight-normal">신범수</h5>
                        <span>A등급 관리자</span>
                    </div>
                </div>
            </div>
        </li>
        <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
        </li>
        <!-- 사이드 바 메뉴 정의 시작-->
 

        <li class="nav-item menu-items">
            <a class="nav-link" href="/member/memberList">
                <span class="menu-icon">
                    <i class="fa-solid fa-user"></i>
                    <!-- <i class="mdi mdi-speedometer"></i> -->
                </span>
                <span class="menu-title">멤버 관리</span>
            </a>
        </li>

        <li class="nav-item menu-items">
            <a class="nav-link" href="/post/postList">
                <span class="menu-icon">
                    <i class="fa-solid fa-bookmark"></i>  
                </span>
                <span class="menu-title">게시물 관리</span>
            </a>
        </li>

        <li class="nav-item menu-items">
            <a class="nav-link" href="/product/productList">
                <span class="menu-icon">
                    <i class="fa-solid fa-gift"></i>
                </span>
                <span class="menu-title">상품 관리</span>
            </a>
        </li>

        <li class="nav-item menu-items">
            <a class="nav-link" href="/live/liveList">
                <span class="menu-icon">
                    <i class="fa-solid fa-video"></i>
                </span>
                <span class="menu-title">라이브 관리</span>
            </a>
        </li>

        <li class="nav-item menu-items">
            <a class="nav-link" href="/codeGroup/codeGroupList">
                <span class="menu-icon">
                    <i class="fa-solid fa-layer-group"></i>
                </span>
                <span class="menu-title">코드 그룹 관리</span>
            </a>
        </li>

        <li class="nav-item menu-items">
            <a class="nav-link" href="/code/codeList">
                <span class="menu-icon">
                    <i class="fa-solid fa-copyright"></i>
                </span>
                <span class="menu-title">코드 관리</span>
            </a>
        </li>

        <!-- 사이드 바 메뉴 정의 종료-->
    </ul>
</nav>