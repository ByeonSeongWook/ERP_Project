<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <!-- 네비 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
    <!-- 회계 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/user_main.css" />
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 부트스트랩 JS -->
	<script src="${path}/resources/js/bootstrap.js"></script>	
    <!-- 제이쿼리  -->
    <script src="${path}/resources/js/jquery.js"></script>

	<!-- font 링크--------------------------------------------->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>
<body>
<div id="wrap">
    
     <!-- 상단 bar -->
     <div id="topBar">
       <!-- 상단 제목 -->
       <span>메인 페이지</span>
     </div>
     
    <!-- 유저 네비게이션 -->
    <jsp:include page = "userNav.jsp" />
    
	<!-- contents 부분 -->
	<div id="contents"  style="float: right; width: 88vw; height: 88vh;">
	<!-- 내용적는 부분 -->
           <div class="page_btn">
               <div class="box_btn" OnClick="location.href ='pw_check'"><img src="${path}/resources/images/profile_white.png" alt=""></div>
               <span>마이페이지</span>
           </div>
           <div class="page_btn">
               <div class="box_btn" OnClick="location.href ='product'"><img src="${path}/resources/images/product_mng_white.png" alt=""></div>
               <span>제품관리</span>
           </div>
           <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='salesList'"><img src="${path}/resources/images/sales_white.png" alt=""></div>
                <span>영업관리</span>
            </div>
            
            <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='supplier'"><img src="${path}/resources/images/supplier_white.png" alt=""></div>
                <span>공급처관리</span>
            </div>
            <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='clients'"><img src="${path}/resources/images/client_white.png" alt=""></div>
                <span>고객관리</span>
            </div>
            <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='orders'"><img src="${path}/resources/images/order_white.png" alt=""></div>
                <span>발주관리</span>
            </div>
            <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='accounting'"><img src="${path}/resources/images/account_white.png" alt=""></div>
                <span>회계</span>
            </div>
            <div class="page_btn">
                <div class="box_btn" OnClick="location.href ='/logout'"><img src="${path}/resources/images/logout.png" alt=""></div>
                <span>로그아웃</span>
            </div>
	</div>
	
</div>
</body>
</html>