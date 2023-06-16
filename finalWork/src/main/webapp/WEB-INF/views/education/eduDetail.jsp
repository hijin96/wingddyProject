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
					<form action="deadLine.edu" method="POST">
						<input type="hidden" name="cno" value="${classroom.classNo}"/>
						<input type="hidden" name="eduNo" value="${qList[0].eduNo}"/>
						<button class="btn btn-danger">조기 마감</button>
					</form>
				</div>
	        </div>
	        <div class="section-body">
           		<h2 class="section-title">${qList[0].eduName}과제이름</h2>
           		<p class="section-lead">
           		</p>
	            <div class="row">
					<div class="col-12 col-md-8 col-lg-8">
						<div class="card card-primary">
							<div class="card-header">
	            				<h4>내용</h4>
	            			</div>
	            			<div class="card-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
										</tr>
										<tr>
											<th scope="row">2</th>
										</tr>
										<tr>
											<th scope="row">3</th>
										</tr>
									</tbody>
								</table>
	            			</div>
						</div>
	            	</div>
					<div class="col-12 col-md-4 col-lg-4">
						<div class="card card-primary">
							<div class="card-header">
	            				<h4>완료한 학생</h4>
	            			</div>
	            			<div class="card-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
										</tr>
										<tr>
											<th scope="row">2</th>
										</tr>
										<tr>
											<th scope="row">3</th>
										</tr>
									</tbody>
								</table>
	            			</div>
						</div>
	            	</div>
	            </div>
	        </div>
	    </section>
	</div>
</body>
</html>