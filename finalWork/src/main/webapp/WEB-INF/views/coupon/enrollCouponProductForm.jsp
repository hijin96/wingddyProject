<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enroll form</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#header h3{
		margin-bottom : 40px !important; 
	}
	input[type=number]{
		width : 200px !important;
	}
	input[type="file"] {
	    position: absolute;
	    padding: 0;
	    overflow: hidden;
	}
	input[name=imgFile]{
		width : 95% !important;
	}
	#form-enrollCp input::file-selector-button{
		display:none !important;
	}
	.table-area{
		width : 57%;
		height : 200px !important;
		overflow : scroll !important;
	}
</style>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
		
			<div id="header">
				<h3>상품 등록</h3>
			</div>
			
			<div>
				<div class="card">
					<div class="card-body">
						<br><br>
						
						<div class="form-group row mb-4">
                   			<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">등록 가능 상품</label>
                   			<div class="table-area" class="col-sm-12 col-md-7">
                   				<table class="table table-striped table-md">
			                        <tbody>
			                        	<tr>
				                          <th>#</th>
				                          <th>상품명</th>
				                          <th>수량</th>
			                        	</tr>
				                        
				                        <c:forEach var="cp" varStatus="status" items="${cplist}" >
					                        <tr class="click-cp">
						                        <input type="hidden" name="cpNo" value="${cp.cpNo}" />
						                        <input type="hidden" name="productContent" value="${cp.productContent}">
						                        <input type="hidden" name="filePath" value="${cp.filePath}" />
						                        <input type="hidden" name="cartNo" value="${cp.cartNo}" />
												<td><c:out value="${status.count}"></c:out></td>
												<td>${cp.productName}</td>
												<td>${cp.amount}</td>
					                        </tr>
				                        </c:forEach>
				                        
			                      	</tbody>
	                      		</table>
                   			</div>	
                   		</div>
						
						<form id="form-enrollCp" action="enroll.cp" method="post" enctype="multipart/form-data">
							<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">상품명</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control readonly" id="updateCpName" name="productName" required>
	                        		<input name="classNo" type="hidden" value="${requestScope.classroom.classNo}" />
	                        		<input name="cartNo" type="hidden" id="updateCartNo" />
	                      		</div>
                    		</div>
                    		
                    		<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">상품설명</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control readonly" id="updateCpContent" name="productContent" required>
	                      		</div>
                    		</div>
                    		
                    		<div class="form-group row mb-4">
                    			<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">수량</label>
                    			<div class="col-sm-12 col-md-7">
	                        		<input type="number" class="form-control number readonly" name="amount" id="updateCpAmount" min="0" required/>
	                      		</div>
                    		</div>
                    		
                    		<div class="form-group row mb-4">
                    			<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">쿠폰가격</label>
                    			<div class="col-sm-12 col-md-7">
	                        		<input type="number" class="form-control number" name="couponPrice" id="updatePrice" min="0" required/>
	                      		</div>
                    		</div>
                    		
                    		<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">현재 썸네일</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<img alt="img">
	                      		</div>
                    		</div>
                    		
                    		<div class="text-center">
	                    		<div class="d-inline-block">
		                    		<button type="submit" class="btn btn-primary">등록하기</button>
		                    		<button type="reset" class="btn btn-warning" id="btn-reset">초기화</button>
	                    		</div>
                    		</div>
                  		</form>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			// 등록가능 상품 목록 누르면 해당 상품 정보 input value값에 들어감
			$('.click-cp').on('click', function(){
				let cpInfo = $(this).children();
				
				$('#updateCpName').attr('value', cpInfo.eq(5).text());
				$('#updateCpContent').attr('value', cpInfo.eq(1).val());
				$('#updateCpAmount').attr('value', cpInfo.eq(6).text());
				$('#updateCartNo').attr('value', cpInfo.eq(3).val());
				console.log(cpInfo.eq(3).val());
				$('.readonly').attr('readonly', true);
				
				console.log(${requestScope.classroom.classNo});
				
				console.log($('#updateCartNo').val());
			})
			
			$('#btn-reset').on('click', function(){
				$('.readonly').attr('readonly', false);
				$('updateCartNo').remove();
				$('#form-enrollCp').find('input').attr('value', '');
			})
		
		</script>
		
		
		
		
		
		
	</div>
</div>
</body>
</html>