<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 상세보기</title>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
		<div class="main-content">
		<section class="section">
	        <div class="section-header">
				<h1>과제 상세</h1>
				<div class="section-header-breadcrumb">
					<form action="update.edu" method="POST">
						<input type="hidden" name="cno" value="${classroom.classNo}"/>
						<input type="hidden" name="eduNo" value=""/>
						<button class="btn btn-primary">과제 수정</button>
					</form>
				</div>
	        </div>
	        <div class="section-body">
           		<h2 class="section-title">과제이름</h2>
	            <div class="row">
	            	<div class="col-12">
	            	</div>
	            </div>
	        </div>
	    </section>
	</div>
</body>
</html>