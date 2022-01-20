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
	       <span>My Page</span>
	     </div>
	
		<!-- 유저 네비게이션 -->
		<jsp:include page="userNav.jsp" />


		<!-- contents 부분 -->
		<div id="contents"
			style="float: left; margin-left: 12%; margin-top: 2%">
			<!-- 내용적는 부분 -->
			<div class="container">
				<div class = "col-lg-4"></div>
				
				
				<div class = "col-lg-4">
					<div class="jumbotron" style="background-color: #f7fbfc; border: 2px solid #b9d7ea;">
							<h4 style="text-align: center; margin-bottom: 10%; font-size: 1.5em;">비밀번호 확인</h4>
							
							<form method="POST" action="./pw_check_action">
							<!-- 비밀번호 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="password" class="form-control" name="user_pw" placeholder="비밀번호">
								</div>
							</div>
							
							<!-- 비밀번호 확인 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="submit" class="btn btn-control btn-info form-control" name="pw_check" value="비밀번호 확인"
									style="background-color: #769fcd; border: 1px solid #769fcd; color: #fff">
								</div>
							</div>
						</form>
						
					</div>
					
				</div>
				
				<div class = "col-lg-4"></div>
			</div>
		</div>	
		
	</div>

</body>
</html>
