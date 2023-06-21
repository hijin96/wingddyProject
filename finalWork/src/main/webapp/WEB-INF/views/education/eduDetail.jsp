<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h1>${classroom.className} 과제</h1>
				<div class="section-header-breadcrumb">
					<form action="deadLine.edu" method="POST">
						<input type="hidden" name="cno" value="${classroom.classNo}"/>
						<input type="hidden" name="eduNo" value="${qList[0].eduNo}"/>
						<button class="btn btn-danger">조기 마감</button>
					</form>
				</div>
	        </div>
	        <div class="section-body">
           		<h2 class="section-title">${qList[0].eduName}</h2>
           		<p class="section-lead">
           			유형 : ${qList[0].eduType} <br>
           			마감일 : ${qList[0].endTime} <br>
           			뽑기 횟수 : ${qList[0].gachaCount}
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
											<th>문제</th>
											<th>정답</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="quiz" items="${qList}" varStatus="i">
										<tr>
											<th scope="row">${i.count}</th>
											<td>${quiz.quizContent}</td>
											<td>${quiz.correctContent}</td>
										</tr>
										</c:forEach>
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
											<th>학생 ID</th>
											<th>학생 이름</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${mList}" varStatus="i">
											<tr>
												<th scope="row">${i.count}</th>
												<td>${member.memberId}</td>
												<td>${member.memberName}</td>
											</tr>
										</c:forEach>
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