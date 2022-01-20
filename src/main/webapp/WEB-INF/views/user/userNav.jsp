<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />

    <!-- 네비 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />

    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
	
</head>

  <body>
      <div id="nav">
        <!-- nav 상단부분 -->
        <div class="nav_top">
        	<!-- 로고 이미지 -->
          <div class="logo">
            <img src="${path}/resources/images/logo.png" alt="" />
          </div>
          <!-- 오른쪽 텍스트 영역 -->
          <div class="profile">
            <div class="pofile_user">
       		  <span class="user_num">${users.user_num}</span>
       		  <span class="user_name">${users.user_name}</span>
       		</div>
       		          	
          	<c:if test="${users.user_num eq 'admin'}">
          		<a class="mypage_btn" href="../admin/adminMain">관리자 페이지</a>
          	</c:if>
       		
          	<c:if test="${users.user_num ne 'admin'}">
          		<a class="mypage_btn" href="pw_check">마이페이지</a>
          	</c:if>

          	
          	<a class="logout_btn" href="/logout">로그아웃</a>
          </div>
        </div>

        <!-- nav 하단부분 -->
        <div class="nav_bottom">
          <ul class="nav_list">
            <li><a id="mainNavItem" href="userMain">ERP_Program</a></li>
            <li><a id="productNavItem" href="product">제품관리</a></li>
            <li><a id="salesListNavItem" href="salesList">영업관리</a></li>
            <li><a id="supplierNavItem" href="supplier">공급처관리</a></li>
            <li><a id="clientsNavItem" href="clients">고객관리</a></li>
            <li><a id="ordersNavItem" href="orders">발주관리</a></li>
            <li><a id="accountingNavItem" href="accounting">회계</a></li>
          </ul>
        </div>
      </div>

  </body>
      <script>
      $(document).ready(function () {
    	  	/*** 네비게이션 add class ***/
	      	var url = window.location.pathname;
	      	if(url == '/user/product') $('#productNavItem').addClass('on');
	      	else if(url == '/user/salesList') $('#salesListNavItem').addClass('on');
	      	else if(url == '/user/supplier') $('#supplierNavItem').addClass('on');
	      	else if(url == '/user/clients') $('#clientsNavItem').addClass('on');
	      	else if(url == '/user/orders') $('#ordersNavItem').addClass('on');
	      	else if(url == '/user/accounting') $('#accountingNavItem').addClass('on');
		  	
		    /*** controller 에서 메시지 보내기 ***/
			var msg = '${msg}';
			if(msg != null && msg != '') alert(msg);
      });
      </script>
</html>
