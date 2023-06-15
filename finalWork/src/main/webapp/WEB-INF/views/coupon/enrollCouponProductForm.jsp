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
	input[type=number]{
		width : 200px !important;
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
						<form action="" method="post">
						
							<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">상품명</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control">
	                      		</div>
	                      		
                    		</div>
                    		
                    		<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">상품설명</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control">
	                      		</div>
                    		</div>
                    		
                    		<div class="form-group row mb-4">
                    			<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">수량</label>
                    			<div class="col-sm-12 col-md-7">
	                        		<input type="number" class="form-control number" min="" max="" />
	                      		</div>
                    		</div>
                    		
                    		
                    		
                    		
                  		</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>