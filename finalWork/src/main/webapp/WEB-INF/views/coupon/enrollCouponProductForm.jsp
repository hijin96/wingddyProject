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
				                        
				                        <tr>
				                          <td>1</td>
				                          <td>Irwansyah Saputra</td>
				                          <td>2017-01-09</td>
				                        </tr>
				                        
			                      	</tbody>
	                      		</table>
                   			</div>	
                   		</div>
						
						<form id="form-enrollCp" action="" method="post">
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
                    		
                    		<div class="form-group row mb-4">
	                    		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">이미지 첨부</label>
	                    		<div class="col-sm-12 col-md-7">
	                        		<input name="imgFile" type="file" class="form-control">
	                      		</div>
                    		</div>
                    		
                    		<div class="text-center">
	                    		<div class="d-inline-block">
		                    		<button type="submit" class="btn btn-primary">등록하기</button>
		                    		<button type="reset" class="btn btn-warning">초기화</button>
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