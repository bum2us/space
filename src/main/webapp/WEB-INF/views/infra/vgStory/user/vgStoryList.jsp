<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>

	<title>🛸동네소식🛸</title>
	
	<!-- link -->
	<%@include file="/resources/include/link.jsp"%>
	

	<style>
		div	{
			border: solid 1px orange;
		}
		
		.btn {
        width: 50px; 
        height: 50px; 
        border: 1px solid grey;
        border-radius: 50%; 
        color: black;
        display: flex; 
        margin-left: auto; 
        margin-right: auto;
        background: #fff;
      }

      .btn:hover {
        background: #E75E8D;
        color: white;

      }
      
      #category {
      	color: white;
      }
		
	</style>
</head>
<body>

	<!-- Preloader Start -->
	<%@include file="/resources/include/preloader.jsp"%>
	
	<!-- header  -->
	<%@include file="/resources/include/header.jsp"%>
	
	<div class="container">
	    <div class="row">
	      <div class="col-lg-12">
	        <div class="page-content">
	
	          <!-- ***** Banner Start ***** -->
	          
	          <div class="row">
          	<div class="col-8">
          		<div class="row" style="height: 100%;">
          			<div class="col">
          				<img src="/resources/images/map.jpg" style="height: 100%;" alt="지도 이미지"> 
          			</div>
          		</div>
          	</div>
          	<div class="col-4">
          		<div class="row">
          			<div class="col">
          				<div class="row">
          					<div class="col">
          						<h6>우리 주변 동네 정보</h6>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col">
          						<h4>우주지도</h4>
          					</div>
          				</div>
          			</div>
          		</div>
          		<div class="row">
          			<div class="col">
          				<div class="row">
          					<div class="col-4">
          						<span class="badge" style="background-color: rgba(247, 52, 133, 0.849); border-radius: 3px;">Step 01</span>
          					</div>
          					<div class="col-8">
				                <span style="color: white; font-size: 10pt;">지역을 선택하세요</span> 
          					</div>
          				</div>
          				<div class="row">
          					<div class="col p-2">
          						<select class="form-select">
          							<option value="">시/도 선택</option>
          							<option value="">서울특별시</option>
          							<option value="">경기도</option>
          						</select>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col p-2">
          						<select class="form-select">
          							<option value="">시/군/도 선택</option>
          							<option value="">서울특별시</option>
          							<option value="">경기도</option>
          						</select>
          					</div>
          				</div>
          			</div>
          		</div>
          		<hr>
          		<div class="row">
          			<div class="col">
          				<div class="row">
          					<div class="col-4">
          						<span class="badge" style="background-color: rgba(202, 60, 221, 0.938); border-radius: 3px;">Step 02</span>
          					</div>
          					<div class="col-8">
          						<span style="color: white; font-size: 10pt;">물품 종류를 선택하세요</span>     
          					</div>
          				</div>
          				<div class="row" id="category">
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-shirt"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col" style="font-size: 5pt;">
          								패션의류/잡화
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-wand-magic-sparkles"></i></button> 
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								뷰티
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-baby"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								출산/유아동
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-utensils"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								식품
          							</div>
          						</div>
          					</div>
          				</div>
          				<div class="row" id="category">
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-shirt"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col" style="font-size: 5pt;">
          								패션의류/잡화
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-wand-magic-sparkles"></i></button> 
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								뷰티
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-baby"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								출산/유아동
          							</div>
          						</div>
          					</div>
          					<div class="col">
          						<div class="row">
          							<div class="col">
          								<button type="button" class="btn"><i class="fa-solid fa-utensils"></i></button>
          							</div>
          						</div>
          						<div class="row">
          							<div class="col">
          								식품
          							</div>
          						</div>
          					</div>
          				</div>
          				<div class="row">
          					<div class="col">
          						<button class="base-button" type="button"><i class="fa-solid fa-pen"></i></button> 
          						<button class="base-button" type="button"><i class="fa-solid fa-rotate-left"></i></button>
          					</div>
          				</div>
          			</div>
          		</div>
          	</div>
          </div>
          
          
          
          
          <div class="main-banner" style="background-color: black;">

            우주지도 안에 한 section
            <div class="row p-1" style="text-align: left;">
              <div class="col-lg-4">
                <div class="header-text">
                  <h6>우리 주변 동네 정보</h6> 
                  <h4><em>우주</em>지도</h4>
                </div>
              </div>
            </div>
          한 section 끝

          우주지도 안에 한 section
          <div class="row-3">
            <div class="col-lg-4">
              <div class="header-text">
                <span class="badge" style="background-color: rgba(247, 52, 133, 0.849); border-radius: 3px;">Step 01</span>
                <span style="color: white; margin-left: 10px;">지역을 선택하세요</span>
                <div>
                  <select id="city" class="form-select-sm m-2" style="width: 200px;">
                    <option value="">시/도 선택</option>
                    <option value="경기도">경기도</option>
                    <option value="서울">서울특별시</option>
                    <option value="충청남도">충청남도</option>
                  </select>
                </div>
                <div>
                  <select id="village" class="form-select-sm m-2" style="width: 200px;"> 
                    <option value="">시/군/도 선택</option>
                    <option value="남양주시">남양주시</option>
                    <option value="부천시">부천시</option>
                    <option value="서초구">서초구</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        한 section 끝

          <hr>
          우주지도 안에 한 section
          <div class="row">
            <div class="col-lg-4">
              <div class="header-text">
                <span class="badge" style="background-color: rgba(202, 60, 221, 0.938); border-radius: 3px;">Step 02</span>
                <span style="color: white; margin-left: 10px;">물품 종류를 선택하세요 <i class="fa-solid fa-loveseat"></i></span>
              </div>
              <div class="row">

                카테고리 첫째줄
                <div class="col-3 p-2">
                  <input type="checkbox" class="btn-check" id="categoryCheck1" autocomplete="off">
                  <label class="btn btn-outline-warning" for="categoryCheck1" style="border-color: black; color: black;">그림</label>  
                  <span></span>
                </div>
 
                <div class="col-3 p-2">
                  <input type="checkbox" class="btn-check" id="categoryCheck2" autocomplete="off">
                  <label class="btn btn-outline-warning" for="categoryCheck2" style="border-color: black; color: black;">카테고리</label>
                </div>

                <div class="col-3 p-2">
                  <input type="checkbox" class="btn-check" id="categoryCheck3" autocomplete="off">
                  <label class="btn btn-outline-warning" for="categoryCheck3" style="border-color: black; color: black;">카테고리</label>
                </div>

                <div class="col-3 p-2">
                  <input type="checkbox" class="btn-check" id="categoryCheck4" autocomplete="off">
                  <label class="btn btn-outline-warning" for="categoryCheck4" style="border-color: black; color: black;">카테고리</label>
                </div>
              </div>

              카테고리 둘쨰줄
              <div class="row" style="text-align: center; color: white;">
                <div class="col-3 p-2">
                 aa
                </div>
 
                <div class="col-3 p-2">
                  aa
                </div>

                <div class="col-3 p-2">
                  aa
                </div>

                <div class="col-3 p-2">
                  aa
                </div> 
              </div>
              
            </div>
          </div>
        한 section 끝
          </div>
          
          
          
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>동네소식</h4>
              </div>
              <div class="buy-table">
              	<table class="table text-white">
				  <thead>
				    <tr>
				      <th scope="col">No.</th>
				      <th scope="col">Id</th>
				      <th scope="col">Addr.</th>
				      <th scope="col">Contents</th>
				      <th scope="col">like</th>
				      <th scope="col">comment</th>
				      <th scope="col">RegDate</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>bums0810</td>
				      <td>서초구 서초3동</td>
				      <td>안쓰는 선풍기 있으신분</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 17:00</td>
				    </tr>
				     <tr>
				      <th scope="row">2</th>
				      <td>dnwk203</td>
				      <td>서초구 서초3동</td>
				      <td>러닝머신 삽니다~</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 16:57</td>
				    </tr>
				     <tr>
				      <th scope="row">3</th>
				      <td>MJzzang</td>
				      <td>서초구 서초3동</td>
				      <td>다 푼 토익책구해요</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 16:43</td>
				    </tr>
				     <tr>
				      <th scope="row">4</th>
				      <td>minsookun</td>
				      <td>서초구 서초3동</td>
				      <td>선풍기 삽니다</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 16:42</td>
				    </tr>
				     <tr>
				      <th scope="row">5</th>
				      <td>JINgold</td>
				      <td>서초구 서초3동</td>
				      <td>아이패드 충전기구합니다</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 16:30</td>
				    </tr>
				     <tr>
				      <th scope="row">6</th>
				      <td>UziNs</td>
				      <td>서초구 서초3동</td>
				      <td>뉴진스 포토카드 삽니다~</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 17:00</td>
				    </tr>
				     <tr>
				      <th scope="row">7</th>
				      <td>JAE2</td>
				      <td>서초구 서초3동</td>
				      <td>무선마우스 구해요.</td>
				      <td>356</td>
				      <td>365</td>
				      <td>2022.10.31. 17:00</td>
				    </tr>
				  </tbody>
				</table>
              
              </div>
              
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!--  스크립트  -->		
	<%@include file="/resources/include/script.jsp"%>
	<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	<script>
		
	</script>	
</body>
</html>
