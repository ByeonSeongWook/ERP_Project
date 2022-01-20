<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
<!-- 기본 CSS -->
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<!-- 네비 CSS -->
<link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
<link rel="stylesheet" href="${path}/resources/css/admin_main.css" />
<!-- 부트스트랩 CSS -->
<link rel="stylesheet"
	href="${path}/resources/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
<!-- 제이쿼리  -->
<script src="${path}/resources/js/jquery.js"></script>

</head>
<body>
<div id="wrap">

     <!-- 상단 bar -->
     <div id="topBar">
       <!-- 상단 제목 -->
       <span>Admin Main</span>
     </div>

	<!-- 유저 네비게이션 -->
    <jsp:include page = "adminNav.jsp" />
    
   	<!-- contents 부분 -->
	<div id="contents" style="float: right; width: 88%; height: 100%;">
		<div class="page_btn">
	        <div class="box_btn" OnClick="location.href ='employee'"><img src="${path}/resources/images/usermanagement.png" alt=""></div>
	        <span>사원관리</span>
	    </div>
	    <div class="page_btn">
	        <div class="box_btn" OnClick="location.href ='add_employee'"><img src="${path}/resources/images/adduser.png" alt=""></div>
	        <span>사원등록</span>
	    </div>
	    <div class="page_btn">
	         <div class="box_btn" OnClick="location.href ='department'"><img src="${path}/resources/images/departmentmnt.png" alt=""></div>
	         <span>부서관리</span>
	     </div>
	     <div class="page_btn">
	         <div class="box_btn" OnClick="location.href ='correct_auth'"><img src="${path}/resources/images/departmentright.png" alt=""></div>
	         <span>부서권한관리</span>
	     </div>
	</div>
</div>
</body>
</html>
