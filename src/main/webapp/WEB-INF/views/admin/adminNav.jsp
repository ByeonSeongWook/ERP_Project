<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
    <!-- 네비 CSS -->
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
       		  <span class="user_name">${users.user_name }</span>
       		</div>
       		<a class="mypage_btn" href="../user/userMain">유저페이지</a>
          	<a class="logout_btn" href="/logout">로그아웃</a>
          </div>
        </div>

		<!-- nav 하단부분 -->
		<div class="nav_bottom">
			<ul class="nav_list">
				<li><a id="adminMainNavItem"  href="adminMain">ERP_Program</a></li>
				<li><a id="employeeNavItem"  href="employee">사원관리</a></li>
				<li><a id="add_employeeNavItem"  href="add_employee">사원등록</a></li>
				<li><a id="departmentNavItem"  href="department">부서관리</a></li>
				<li><a id="correct_authNavItem"  href="correct_auth">부서권한관리</a></li>
			</ul>
		</div>
	</div>
	
  </body>
  <script>
  $(document).ready(function () {
		/*** 네비게이션 add class ***/
	  	var url = window.location.pathname;
	  	if(url == '/admin/employee') $('#employeeNavItem').addClass('on');
	  	else if(url == '/admin/add_employee') $('#add_employeeNavItem').addClass('on');
	  	else if(url == '/admin/department') $('#departmentNavItem').addClass('on');
	  	else if(url == '/admin/correct_auth') $('#correct_authNavItem').addClass('on');
	  	
	    /*** controller 에서 메시지 보내기 ***/
		var msg = '${msg}';
		if(msg != null && msg != '') alert(msg);
  });
  </script>
      

</html>
