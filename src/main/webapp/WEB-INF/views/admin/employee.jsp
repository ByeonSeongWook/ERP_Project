<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 제이쿼리  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <!-- 네비 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 부트스트랩 JS -->
	<script src="${path}/resources/js/bootstrap.js"></script>

<script>
$(document).ready(function(){

	$('#searchNameBtn').click(function(){
		var user_name = $('#user_name').val();
		$.ajax({ // ajax 는 데이터를 받아오는거 url받아오는거 아님 
			
			type : 'GET',
			url    : './searchName',
			data : {
				// 문자열 : 변수값...
				user_name : user_name
			},
			dataType : 'JSON',
			success : function(data) {
					//아이디에 해당하는 태그 자손들이 모두 삭제 
					$('#usersListTable').empty(); 
					var str = '';
					str += '<table style="width: 100%; height: auto; text-align: center" class="table table-hover">';	
					for(var i = 0; i < data.length; i++) {
						str += '<tr>';
							str += '<td style="width: 5%; text-align: center">';
							str += '<input type="checkbox" name = "table_user_num" value = "'+data[i].user_num+'"/></td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_num+'</td>';
							str += '<td style="width: 10%; text-align: center">'+data[i].user_name+'</td>';
							str += '<td style="width: 10%; text-align: center">'+data[i].dept_num+'</td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_tel+'</td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_email+'</td>';
							str += '<td style="width: 25%; text-align: center">'+data[i].user_addr+'</td>';
							str += '<td style="width: 5%; text-align: center">';
							str += '<button type="button" class="btn btn-form btn-info"  id ="updateUserBtn"';
							str += 'onclick="getUserNum(\''+data[i].user_num+'\')" data-toggle="modal" data-target="#updateUserModal">수정</button>';
							str += '</td>';
						str += '</tr>';
					}
					str += '</table>';
					$('#usersListTable').append(str); 
			}
		
		});
		
	});
	
	// 유저 삭제하기
	$('#deleteUserBtn').click(function(){
	var check = confirm('정말 삭제하시겠습니까?');
		
		if(check != true) {
			
			return;
		}
		else {
			var user_num = [];
			
			// 삭제할 값들 배열로 받아오기
			$('input[name="table_user_num"]:checked').each(function(){
				user_num.push($(this).val());
			});
			
			
			$.ajax({
				url:'./deleteEmp',
				type:'POST',
				data : {
					user_num : user_num
				},
				dataType:"JSON",
				success:function(data) {
					
					alert(user_name + ' 삭제완료');

					$('#usersListTable').empty(); 
					var str = '';
					str += '<table style="width: 100%; height: auto; text-align: center" class="table table-hover">';	
					for(var i = 0; i < data.length; i++) {
						str += '<tr>';
							str += '<td style="width: 5%; text-align: center">';
							str += '<input type="checkbox" name = "table_user_num" value = "'+data[i].user_num+'"/></td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_num+'</td>';
							str += '<td style="width: 10%; text-align: center">'+data[i].user_name+'</td>';
							str += '<td style="width: 10%; text-align: center">'+data[i].dept_num+'</td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_tel+'</td>';
							str += '<td style="width: 15%; text-align: center">'+data[i].user_email+'</td>';
							str += '<td style="width: 25%; text-align: center">'+data[i].user_addr+'</td>';
							str += '<td style="width: 5%; text-align: center">';
							str += '<button type="button" class="btn btn-form btn-info"  id ="updateUserBtn"';
							str += 'onclick="getUserNum(\''+data[i].user_num+'\')" data-toggle="modal" data-target="#updateUserModal">수정</button>';
							str += '</td>';
						str += '</tr>';
					}
					str += '</table>';
					$('#usersListTable').append(str); 
					
				}
			
			});
		}
	});// 삭제 끝
	
	
});

</script>
</head>
<body>
<div id="wrap">

    <!-- 상단 bar -->
    <div id="topBar">
      <!-- 상단 제목 -->
      <span>사원 관리</span>
    </div>

   	<!-- 유저 네비게이션 -->
    <jsp:include page = "adminNav.jsp" />

    <!-- contents 부분 -->
    <div id="contents" style="float: right; width: 88%; height: 100%">
      <div>
        <!-- 검색 폼 -->
        <div style="width: 50vw">
          <form style="margin: 5% 0 0 7%">
            <!-- 검색어 입력 -->
            <div class="row">
              <div class="form-group col-sm-6 col-md-6 col-lg-6">
                <input
                  type="text"
                  name="user_name"
                  class="form-control"
                  placeholder="사원검색"
                  id = "user_name"
                />
              </div>

              <!-- 검색버튼 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
                <button
                  type="button"
                  class="btn btn-info btn-block"
                  style="background-color: #b9d7ea; border: 1px solid #b9d7ea"
                  id = "searchNameBtn"
                  
                >
                  검색
                </button>
              </div>

              <!-- 사원등록 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
              <a href ="add_employee">
                <button
                  type="button"
                  class="btn btn-info btn-block"
                  style="background-color: #769fcd; border: 1px solid #769fcd"
                >
                  사원등록
                </button>
                </a>
              </div>
              
              <!-- 사원삭제 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
                <button
                  type="button"
                  class="btn btn-warning btn-block"
                  id = "deleteUserBtn"
                >
                  사원삭제
                </button>
              </div>
              
              
            </div>
          </form>
        </div>

        <!-- 테이블 항목 -->
        <div
          class="table-responsive"
          style="
            width: 80vw;
            height: auto;
            background-color: #f7fbfc;
            margin-left: 3%;
            border-top: 3px ridge #f9f9f9;
            border-bottom: 3px ridge #f9f9f9;
            box-sizing: border-box;
          "
        >
          <table
            style="
              width: 80vw;
              height: auto;
              margin: 0 -2% 0 0;
              text-align: center;
            "
            class="table borderless"
          >
            <tr>
              <td style="width: 20%; text-align: center">사원번호</td>
              <td style="width: 10%; text-align: center">이름</td>
              <td style="width: 10%; text-align: center">부서코드</td>
              <td style="width: 15%; text-align: center">전화번호</td>
              <td style="width: 15%; text-align: center">이메일</td>
              <td style="width: 25%; text-align: center">주소</td>
              <td style="width: 5%; text-align: center">수정</td>
            </tr>
          </table>
        </div>
        <!-- 사원 목록 -->

        <div
          class="table-responsive"
          style="
            width: 80vw;
            height: 600px;
            margin-left: 3%;
            overflow: scroll;
          "
        >
        <div id = "usersListTable">
	          <table style="width: 100%; height: auto; text-align: center"  class="table table-hover" >
	          <c:forEach var = "user" items = "${user_list}" > <!--  controller에서 받아옴 -->
	            <tr>
	            	  <td style="width: 5%; text-align: center">
					  		<input type="checkbox" name = "table_user_num" value = "${user.user_num }"/> 
					  </td>
		              <td style="width: 15%; text-align: center">${user.user_num }</td>
		              <td style="width: 10%; text-align: center">${user.user_name }</td>
		              <td style="width: 10%; text-align: center">${user.dept_num }</td>
		              <td style="width: 15%; text-align: center">${user.user_tel }</td>
		              <td style="width: 15%; text-align: center">${user.user_email }</td>
		              <td style="width: 25%; text-align: center">${user.user_addr }</td>
		              <td style="width: 5%; text-align: center">
		              		<button type="button" class="btn btn-form btn-info"  id ="updateUserBtn" onclick="getUserNum('${user.user_num}')"
		              		 data-toggle="modal" data-target="#updateUserModal">수정</button>
		              </td>
	            </tr>
	            </c:forEach>
	            
	          </table>
          </div>
        </div>
      </div>
    </div>
    <!-- 테이블 끝 -->
</div>


<!-- 사원 수정 모달  -->
<div id="updateUserModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<!-- &times; : 부트스트랩 x 아이콘 만들기 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align: center; font-size: 1.3em">사원 정보 수정</h4>
			</div>
			
			<div class="modal-body">
			
				<!-- 사원 번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">사원 번호</label>
						<input type="text" class = "form-control" name = "user_num_up" id ="user_num_up" readonly>
					</div>
				</div>	
							
				<!-- 부서코드 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">부서코드</label>
						<input type="text" class = "form-control" name = "dept_num_up" id ="dept_num_up" readonly>
					</div>
				</div>	
				
				<!-- 사원 이름 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">사원 이름</label>
						<input type="text" class = "form-control" name = "user_name_up" id ="user_name_up">
					</div>
				</div>	
				
				<!-- 전화번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">전화번호</label>
						<input type="text" class = "form-control" name = "user_tel_up" id ="user_tel_up">
					</div>
				</div>	
				
				<!-- 이메일 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">이메일</label>
						<input type="text" class = "form-control" name = "user_email_up" id ="user_email_up">
					</div>
				</div>	
				
				<!-- 주소 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">주소</label>
						<input type="text" class = "form-control" name = "user_addr_up" id ="user_addr_up">
					</div>
				</div>	
				
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<button type="button" class="btn btn-info btn-block"
							style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"  onclick="updateUser()"> 사원 정보 수정</button>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</div>
</div>
<!-- 사원 수정 모달  종료 -->


<script>
	// 사원정보 불러오기(수정에 사용)
	function getUserNum(user_num) {
			
			var user_num = user_num;
			
			$.ajax({
				type:'POST',
				url:'./getEmployee',
				data: {
					user_num : user_num
				},
				dataType:"JSON",
				success: function(data) {
					$('#user_num_up').val(data.user_num);
					$('#user_name_up').val(data.user_name);
					$('#dept_num_up').val(data.dept_num);
					$('#user_tel_up').val(data.user_tel);
					$('#user_email_up').val(data.user_email);
					$('#user_addr_up').val(data.user_addr);
				}
				
			});
		}
		
	// 사원 정보 수정 ajax
	function updateUser() {
		var user_name 	= $('#user_name_up').val();
		var user_tel 		= $('#user_tel_up').val();
		var user_email	= $('#user_email_up').val();
		var user_addr 	= $('#user_addr_up').val();
		var user_num		= $('#user_num_up').val();

		$.ajax({
			url: './updateEmp',
			type:'POST',
			data: {
				user_name	: user_name,
				user_tel 		: user_tel,
				user_email : user_email,
				user_addr 	: user_addr,
				user_num	:	user_num
			},
			dataType: 'JSON',
			success: function(data) {
				$('#updateUserModal').modal('hide');
				alert(user_name + ' 사원 정보 수정 완료');
				
				$('#usersListTable').empty(); 
				var str = '';
				str += '<table style="width: 100%; height: auto; text-align: center" class="table table-hover">';	
				for(var i = 0; i < data.length; i++) {
					str += '<tr>';
						str += '<td style="width: 5%; text-align: center">';
						str += '<input type="checkbox" name = "table_user_num" value = "'+data[i].user_num+'"/></td>';
						str += '<td style="width: 15%; text-align: center">'+data[i].user_num+'</td>';
						str += '<td style="width: 10%; text-align: center">'+data[i].user_name+'</td>';
						str += '<td style="width: 10%; text-align: center">'+data[i].dept_num+'</td>';
						str += '<td style="width: 15%; text-align: center">'+data[i].user_tel+'</td>';
						str += '<td style="width: 15%; text-align: center">'+data[i].user_email+'</td>';
						str += '<td style="width: 25%; text-align: center">'+data[i].user_addr+'</td>';
						str += '<td style="width: 5%; text-align: center">';
						str += '<button type="button" class="btn btn-form btn-info"  id ="updateUserBtn"';
						str += 'onclick="getUserNum(\''+data[i].user_num+'\')" data-toggle="modal" data-target="#updateUserModal">수정</button>';
						str += '</td>';
					str += '</tr>';
				}
				str += '</table>';
				$('#usersListTable').append(str); 
				
			}
		});
	}

</script>
</body>
</html>
