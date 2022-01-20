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
    <!-- 외부 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/correct_auth.css" />
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap-test.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 제이쿼리  -->
    <script src="${path}/resources/js/jquery.js"></script>
    <script>
    $(document).ready(function(){
	
		// 검색을 했을 때 ajax
		$('#searchDeptBtn').click(function(){
			
			var dept_name = $('#search_dept_name').val();
	
					$.ajax({
						type : 'POST',
						url : './searchDeptAction',
						data : {
							dept_name : dept_name
						},
						dataType : "JSON",
						success : function(data) {
							$('#deptListTable').empty();
							var str = '';
							str += '<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"class="table table-hover">';
							for(var i = 0; i < data.length; i++) {
								str += '<tr>';
									str += '<td style="width: 20%; text-align: center">';
									str += '<input type ="radio" name = "table_dept_num" value = "' + data[i].dept_num + '" /></td>';
									str += '<input type = "hidden" id = "' + data[i].dept_num + '" value="' + data[i].dept_name + '"/></td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_name +'</td>';
									str += '<td style="width: 20%; text-align: center">' + data[i].dept_num +'</td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_tel +'</td>';
								str += '</tr>';
							}
							str += '</table>';
		 					$('#deptListTable').append(str); 
							
						}
					});
				
			});
		// 선택 부서의 권한 값 불러 오기
    	$('#auth_select_btn').click(function(){
    		
    		var dept_num = $('input[name="table_dept_num"]:checked').val();
    		
    		$.ajax({
    			type: 'POST',
    			url : './getDepartment',
    			data : {
    				dept_num : dept_num
    			},
    			dataType : 'JSON',
    			success : function(data) {
    				$('#dept_name').val(data.dept_name);
    				$('#dept_num').val(data.dept_num);
    				$('#dept_name').prop('readonly', true);
    				// 권한 -- 0 : 접근불가, 1 : 검색만 가능, 2 : 수정만 가능, 3 : 검색 수정 가능
    				
    				// 영업 권한
    				if(data.auth_sales == 3) {
    					$('#salesSearch').prop('checked', true);
    					$('#salesUpdate').prop('checked', true);
    				}
    				else if(data.auth_sales == 2) {
    					$('#salesSearch').prop('checked', false);
    					$('#salesUpdate').prop('checked', true);
    				}
    				else if(data.auth_sales == 1) {
    					$('#salesSearch').prop('checked', true);
    					$('#salesUpdate').prop('checked', false);
    				}
    				else {
    					$('#salesSearch').prop('checked', false);
    					$('#salesUpdate').prop('checked', false);
    				}
    				
    				// 영업 내역 권한
    				if(data.auth_salesList == 3) {
    					$('#salesListSearch').prop('checked', true);
    					$('#salesListUpdate').prop('checked', true);
    				}
    				else if(data.auth_salesList == 2) {
    					$('#salesListSearch').prop('checked', false);
    					$('#salesListUpdate').prop('checked', true);
    				}
    				else if(data.auth_salesList == 1) {
    					$('#salesListSearch').prop('checked', true);
    					$('#salesListUpdate').prop('checked', false);
    				}
    				else {
    					$('#salesListSearch').prop('checked', false);
    					$('#salesListUpdate').prop('checked', false);
    				}
    				
    				// 고객 권한
    				if(data.auth_clients == 3) {
    					$('#clientsSearch').prop('checked', true);
    					$('#clientsUpdate').prop('checked', true);
    				}
    				else if(data.auth_clients == 2) {
    					$('#clientsSearch').prop('checked', false);
    					$('#clientsUpdate').prop('checked', true);
    				}
    				else if(data.auth_clients == 1) {
    					$('#clientsSearch').prop('checked', true);
    					$('#clientsUpdate').prop('checked', false);
    				}
    				else {
    					$('#clientsSearch').prop('checked', false);
    					$('#clientsUpdate').prop('checked', false);
    				}
    				
    				// 주문 권한
    				if(data.auth_orders == 3) {
    					$('#ordersSearch').prop('checked', true);
    					$('#ordersUpdate').prop('checked', true);
    				}
    				else if(data.auth_orders == 2) {
    					$('#ordersSearch').prop('checked', false);
    					$('#ordersUpdate').prop('checked', true);
    				}
    				else if(data.auth_orders == 1) {
    					$('#ordersSearch').prop('checked', true);
    					$('#ordersUpdate').prop('checked', false);
    				}
    				else {
    					$('#ordersSearch').prop('checked', false);
    					$('#ordersUpdate').prop('checked', false);
    				}
    				
    				// 공급처 권한
    				if(data.auth_supplier == 3) {
    					$('#supplierSearch').prop('checked', true);
    					$('#supplierUpdate').prop('checked', true);
    				}
    				else if(data.auth_supplier == 2) {
    					$('#supplierSearch').prop('checked', false);
    					$('#supplierUpdate').prop('checked', true);
    				}
    				else if(data.auth_supplier == 1) {
    					$('#supplierSearch').prop('checked', true);
    					$('#supplierUpdate').prop('checked', false);
    				}
    				else {
    					$('#supplierSearch').prop('checked', false);
    					$('#supplierUpdate').prop('checked', false);
    				}
    				
    				// 제품 권한
    				if(data.auth_product == 3) {
    					$('#productSearch').prop('checked', true);
    					$('#productUpdate').prop('checked', true);
    				}
    				else if(data.auth_product == 2) {
    					$('#productSearch').prop('checked', false);
    					$('#productUpdate').prop('checked', true);
    				}
    				else if(data.auth_product == 1) {
    					$('#productSearch').prop('checked', true);
    					$('#productUpdate').prop('checked', false);
    				}
    				else {
    					$('#productSearch').prop('checked', false);
    					$('#productUpdate').prop('checked', false);
    				}
    				
    				// 회계 권한
    				if(data.auth_accounting == 3) {
    					$('#accountingSearch').prop('checked', true);
    					$('#accountingUpdate').prop('checked', true);
    				}
    				else if(data.auth_accounting == 2) {
    					$('#accountingSearch').prop('checked', false);
    					$('#accountingUpdate').prop('checked', true);
    				}
    				else if(data.auth_accounting == 1) {
    					$('#accountingSearch').prop('checked', true);
    					$('#accountingUpdate').prop('checked', false);
    				}
    				else {
    					$('#accountingSearch').prop('checked', false);
    					$('#accountingUpdate').prop('checked', false);
    				}
    				
    			}
    			
    			
    		});
    	});
    });
    
    // 권한 수정 함수(onclick)
    function auth_update() {
    	
    	var dept_num = $('input[name="table_dept_num"]:checked').val(); // radio 버튼을 눌렀을때 체크에 해당하는 name값을 가져온다.	
		var dept_id = '#' + dept_num;
		var dept_name = $(dept_id).val();
		var sales 			= 0;
		var salesList 		= 0;
		var clients 			= 0;
		var orders 			= 0;
		var supplier 		= 0;
		var product 		= 0;
		var accounting 	= 0;
		
		$('input[name="sales"]:checked').each(function() {sales += parseInt($(this).val());});
		$('input[name="salesList"]:checked').each(function() {salesList += parseInt($(this).val());});
		$('input[name="clients"]:checked').each(function() {clients += parseInt($(this).val());});
		$('input[name="orders"]:checked').each(function() {orders += parseInt($(this).val());});
		$('input[name="supplier"]:checked').each(function() {supplier += parseInt($(this).val());});
		$('input[name="product"]:checked').each(function() {product += parseInt($(this).val());});
		$('input[name="accounting"]:checked').each(function() {accounting += parseInt($(this).val());});


		$.ajax({
			type : 'POST',
			url : './auth_update',
			data : {
				dept_num : dept_num,
				auth_sales : String(sales),
				auth_salesList : String(salesList),
				auth_clients : String(clients),
				auth_orders : String(orders),
				auth_supplier : String(supplier),
				auth_product : String(product),
				auth_accounting : String(accounting)
			},
			dataType : 'text',
			success : function(data) {
				if(data == 0) {
    				$('#dept_name').val('');
    	    		$('input[name="sales"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="salesList"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="clients"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="orders"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="supplier"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="product"]').each(function() {$(this).prop('checked',false);});
    	    		$('input[name="accounting"]').each(function() {$(this).prop('checked',false);});
    	    		alert('권한 수정 성공');
				}
				else{
					alert('권한 수정에 실패했습니다.');
				}
			}
		});
    // ajax
    }
    </script>
    
  </head>

<body>
  
<div id="wrap">

    <!-- 상단 bar -->
    <div id="topBar">
      <!-- 상단 제목 -->
      <span>부서 권한 관리</span>
    </div>
    
   	<!-- 유저 네비게이션 -->
    <jsp:include page = "adminNav.jsp" />

	<!-- contents 부분 -->
	<div id="contents" style="float: right; width: 88%; height: 100%;">

		<div class="container" style="margin-top: 5%;">
			<!--  전체 기준 그리드 -->
			<div class="row">
			
			<!-- 테이블 항목(왼쪽) -->
				<div class="form-group col-sm-6 col-md-6 col-lg-6" class="table-responsive"	style="margin-left: 1%;">
					
					<div class="jumbotron" style="background-color: #f7fbfc; border: 2px solid #b9d7ea; height: 80vh">
					
						<!-- 검색 폼, 테이블 -->

						<!-- 검색어 입력 -->
						<div class="row">
						
							<div class="form-group col-sm-6 col-md-6 col-lg-6">
								<input type="text" name="search_dept_name" class="form-control"
									placeholder="부서명 검색" id="search_dept_name" />
							</div>

							<!-- 검색 버튼(이름 기준)	 -->
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button type="button" class="btn btn-info btn-block" style="background-color: #b9d7ea; border: 1px solid #b9d7ea"	id="searchDeptBtn">검색</button>
							</div>
							
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button type ="button" id = "auth_select_btn" class = "btn btn-warning btn-block">권한 수정</button>
							</div>

						</div>
			
			
						<!-- 부서목록 제목 -->
						<h4 style="text-align: center; font-size: 20px; margin: 5% 0">부서 목록</h4>
						
						<!-- 테이블 항목 표시 -->
						<div>
							<table style="width: 100%; height: auto; text-align: center;" class="table borderless">
								<tr>
									<td style="width: 20%; text-align: center">선택</td>
									<td style="width: 30%; text-align: center">부서명</td>
									<td style="width: 20%; text-align: center">부서코드</td>
									<td style="width: 30%; text-align: center">부서전화번호</td>
								</tr>
							</table>
						</div>


						<!-- 부서 목록 -->
						<div class="table-responsive" style="width: 100%; height: 50vh ">
							<div id="deptListTable">
								<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;" class="table table-hover">
									<c:forEach var="dept" items="${dept_list}"> <!--  controller에서 받아옴 -->
															
										<tr>
											<td style="width: 20%; text-align: center">
												<input type ="radio" name = "table_dept_num" value = "${dept.dept_num}" />
											</td>
											<td style="width: 30%; text-align: center">${dept.dept_name }</td>
											<td style="width: 20%; text-align: center">${dept.dept_num }</td>
											<td style="width: 30%; text-align: center">${dept.dept_tel }</td>
										</tr>
										
									</c:forEach>
								</table>
									
							</div>
						</div>
						
					</div>
				</div>


				<!-- 수정 하는 화면(오른쪽) -->
				<div class="form-group col-sm-6 col-md-6 col-lg-6" style="width: 25vw;">
			
					<div class="jumbotron" style="width: 100%; height: 80vh; background-color: #f7fbfc; border: 2px solid #b9d7ea">
												
							<div class="row">
							
								<div class="form-group col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
									<span style="line-height : 200%,; font-size: 20px;">부서명</span>
								</div>
								
								<div class="form-group col-sm-8 col-md-8 col-lg-8">
									<input type="text" class="form-control" name = "dept_name" id = "dept_name" readonly>
									<input type="hidden" class="form-control" name = "dept_num" id = "dept_num" readonly>
								</div	>
								
								
							</div>								<!-- 테이블 항목 -->
							<div class="row" style="margin-top: 11%">
								<table style="width: 100%; height: auto; text-align: center;" class="table borderless">
									<tr>
									<td colspan="3" style="text-align: right; font-size: 0.8em; color: #999; border-top: 0">모두 체크시 모든 권한 부여</td>
									</tr>
									<tr>
										<td style="width: 40%; text-align: center">부서명</td>
										<td style="width: 30%; text-align: center">검색</td>
										<td style="width: 30%; text-align: center">등록</td>
									</tr>
								</table>
							</div>
							
							
							<div class="row">
								<div class="auth_update_table">
									<table style="width: 100%; height: auto; text-align: center;" class="table borderless">
										
											<tr>
												<td style="width: 40%; text-align: center">
													영업
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "sales" id = "salesSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "sales"  id = "salesUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
												<td style="width: 40%; text-align: center">
													영업 내역
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "salesList" id = "salesListSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "salesList" id = "salesListUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
												<td style="width: 40%; text-align: center">
													고객
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "clients" id = "clientsSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "clients" id = "clientsUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
												<td style="width: 40%; text-align: center">
													주문
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "orders" id = "ordersSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "orders" id = "ordersUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
												<td style="width: 40%; text-align: center">
													공급처
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "supplier" id = "supplierSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "supplier" id = "supplierUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
												<td style="width: 40%; text-align: center">
													제품
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "product" id = "productSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "product" id = "productUpdate" value ="2">
												</td>
											</tr>
											
											<tr>
											
												<td style="width: 40%; text-align: center">
													회계
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "accounting" id = "accountingSearch" value ="1">
												</td>
												<td style="width: 30%; text-align: center">
													<input type = "checkbox" name = "accounting" id = "accountingUpdate" value ="2">
												</td>
											</tr>
											
									</table>
								</div>
							</div>
							
							
							<!-- 등록, 수정 버튼 -->
							<div class="row" style="margin-top: 10%">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<button type="button" class="btn btn-info form-control" id = "auth_update_btn" style="background-color: #769fcd; border: 1px solid #769fcd" onclick="auth_update()">등록</button>
								</div>
							</div>
							
						
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>    
</body>
</html>
