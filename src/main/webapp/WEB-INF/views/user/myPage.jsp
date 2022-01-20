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
<script>
$(document).ready(function(){
	
	$('#submitBtn').hide();
	
	// 비밀 번호 확인창에 검증
	$('#update_user_pw2').change(function(){
		
		$('#ex_txt').hide();
		
		var pw 	= $('#update_user_pw').val();
		var pw2 	= $('#update_user_pw2').val();
		
		if(pw != pw2) {
			$('#diff_pw').show();
			$('#equal_pw').hide();
			$('#submitBtn').hide();
		}
		else {
			$('#diff_pw').hide();
			$('#equal_pw').show();
			$('#submitBtn').show();
		}
		

		});
	
	$('form').submit(function(e){
		
		var pw 	= $('#update_user_pw').val();
		var pw2 	= $('#update_user_pw2').val();
		
		if(pw == "" || pw2 == "") {
		 	alert('변경할 비밀번호를 입력 해주세요!');
		 	e.preventDefault();
		 	return;
		}
		
	});
	
});
</script>
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
				<div class="col-lg-6">
					<div class="jumbotron" style="background-color: #f7fbfc; border: 2px solid #b9d7ea;">
					
					
						<form method="POST" action="./update_userInfo">
							<h3 style="text-align: center; font-size: 30px; font-weight: 600; padding-bottom: 5%;">
								개인정보 수정</h3>

							<!-- 사원번호 입력 -->
							<div class="row">
								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" name="user_num" class="form-control"
										placeholder="사원번호" readonly value="${user.user_num}"/>
								</div>

								<!-- 부서번호 -->

								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" class="form-control" id="dept_num"
										name="dept_num" placeholder="부서코드" readonly value="${user.dept_num}"/>
								</div>

								<!-- 부서명 -->

								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" class="form-control" id="dept_name"
										name="dept_name" placeholder="부서명" readonly value="${dept_name}"/>
								</div>
							</div>

							<!-- 이름 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" name="user_name"
										placeholder="이름" value="${user.user_name}"/>
								</div>
							</div>

							<!-- 전화번호 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" name="user_tel"
										placeholder="전화번호" value="${user.user_tel}"/>
								</div>
							</div>

							<!-- 변경 비밀번호 입력 -->
							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<input type="password" class="form-control" id="update_user_pw"
										name="user_pw" placeholder="변경 할 비밀번호"/>
								</div>
							</div>

							<!-- 변경 비밀번호 확인 -->
							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<input type="password" class="form-control"
										id="update_user_pw2" placeholder="변경 할 비밀번호 확인" />
								</div>
							</div>

							<!-- 비밀번호 체크 -->
							<div class="row">
								<div class="form-group col-sm12 col-md-12 col-lg-12">
									<h6 id="diff_pw" class="text-danger" style="display: none">
										변경 할 비밀번호가 서로 다릅니다.</h6>
									<h6 id="equal_pw" class="text-success" style="display: none">
										확인되었습니다.</h6>
									<h6 id="ex_txt" class="text-info">
										비밀번호 입력시 수정 	버튼 활성화</h6>
								</div>
							</div>

							<!-- 이메일 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="email" class="form-control" name="user_email"
										placeholder="이메일" value="${user.user_email}"/>
								</div>
							</div>

							<!-- 주소 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" id="user_addr" name="user_addr"
										placeholder="주소" value="${user.user_addr}"/>
								</div>
							</div>
							
							<!-- 제출 버튼 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="submit" class="btn btn-control btn-info form-control" id="submitBtn" value="정보 수정">
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
