<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습페이지</title>

<style>
	.card:hover{
		cursor:pointer;
		background-color: rgb(250, 250, 250) !important;
	}
	
</style>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp" />
	<div class="main-content">
		<section class="section">
	        <div class="section-header">
				<h1>과제 리스트</h1>
				<c:if test="${loginUser.memberType eq 'T'}">
					<div class="section-header-breadcrumb">
						<form action="insert.edu" method="POST">
							<input type="hidden" name="cno" value="${ classroom.classNo }"/>
							<button class="btn btn-primary">과제 등록</button>
						</form>
					</div>
				</c:if>
	        </div>
	        <div class="section-body">
	        	<form action="" method="POST" id="edu-main-form">
	        		<input type="hidden" name=cno value="${ classroom.classNo }"/>
	        		<input type="hidden" name="eduNo"/>
	        		<input type="hidden" name="eduType"/>
	        	</form>
	            <div class="row">
	            	<div class="col-12">
	            		<h2 class="section-title">등록된 과제</h2>
	            	</div>
	            	<c:if test="${ empty eList }">
	            		<h3>등록된 과제가 없습니다.</h3>
	            	</c:if>
	            	<c:forEach var="edu" items="${eList}">
	            		<c:if test="${edu.limitTime gt 0}">
	            			<div class="col-12 col-md-6 col-lg-3">
	            				<div class="card start-edu 
	            				<c:choose>
            						<c:when test="${edu.eduType eq 'W'}">card-primary</c:when>
            						<c:when test="${edu.eduType eq 'S'}">card-warning</c:when>
            						<c:otherwise>card-danger</c:otherwise>
            					</c:choose>
            					">
	            					<input type="hidden" value="${edu.eduNo}" name="eduNo"/>
	            					<input type="hidden" value="${edu.eduType}" name="eduType"/>
			            			<div class="card-header">
			            				<h5>${edu.eduName}</h5>
			            			</div>
			            			<div class="card-body">
			            				<div>남은일 수 : ${Math.round(edu.limitTime)}일</div>
			            				<div>유형 : 
			            					<c:choose>
			            						<c:when test="${edu.eduType eq 'W'}">단어퀴즈</c:when>
			            						<c:when test="${edu.eduType eq 'S'}">문장배열</c:when>
			            						<c:otherwise>OX퀴즈</c:otherwise>
			            					</c:choose>
			            				</div>
			            				<div>현재 진행율 : ${Math.round(edu.progressRate*100)}%</div>
			            			</div>
			            		</div>
			            	</div>
	            		</c:if>
	            	</c:forEach>
	            	<div class="col-12">
	            		<h2 class="section-title">완료된 과제</h2>
	            	</div>
	            	<c:forEach var="edu" items="${eList}">
	            		<c:if test="${edu.limitTime le 0}">
	            			<div class="col-12 col-md-6 col-lg-3">
	            				<div class="card end-edu 
	            				<c:choose>
            						<c:when test="${edu.eduType eq 'W'}">card-primary</c:when>
            						<c:when test="${edu.eduType eq 'S'}">card-warning</c:when>
            						<c:otherwise>card-danger</c:otherwise>
            					</c:choose>
            					">
			            			<input type="hidden" value="${edu.eduNo}" name="eduNo"/>
			            			<input type="hidden" value="'${edu.eduType}'" name="eduType"/>
			            			<div class="card-header">
			            				<h5>${edu.eduName}</h5>
			            			</div>
			            			<div class="card-body">
			            				<div>마감일 : ${edu.endTime}</div>
			            				<div>유형 : 
			            					<c:choose>
			            						<c:when test="${edu.eduType eq 'W'}">단어퀴즈</c:when>
			            						<c:when test="${edu.eduType eq 'S'}">문장배열</c:when>
			            						<c:otherwise>OX퀴즈</c:otherwise>
			            					</c:choose>
			            				</div>
			            				<div>현재 진행율 : ${Math.round(edu.progressRate*100)}%</div>
			            			</div>
			            		</div>
			            	</div>
	            		</c:if>
	            	</c:forEach>
	            </div>
	        </div>
	    </section>
	</div>
	<!-- General JS Scripts -->
	<script src="resources/assets/modules/jquery.min.js"></script>
	<script src="resources/assets/modules/popper.js"></script>
	<script src="resources/assets/modules/tooltip.js"></script>
	<script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="resources/assets/modules/moment.min.js"></script>
	<script src="resources/assets/js/stisla.js"></script>
	
	<!-- JS Libraies -->
	<script src="resources/assets/modules/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/assets/modules/chocolat/dist/js/jquery.chocolat.min.js"></script>
	
	<!-- Template JS File -->
	<script src="resources/assets/js/scripts.js"></script>
	<script src="resources/assets/js/custom.js"></script>
	<script>
		$(function(){
			
		});
		/*
			등록
			선생 : detail.edu  학생 : exam.edu
			
			종료
			선생 : detail.edu  학생 : result.edu
		*/
		// 등록 과제 페이지 지정
		$('.start-edu').click(e => {
			let start = $(e.target).parents('.start-edu');
			let eduNo = (start.length == 0) ? $(e.target).find('input[name=eduNo]').val() : start.find('input[name=eduNo]').val();
			let eduType = (start.length == 0) ? $(e.target).find('input[name=eduType]').val() : start.find('input[name=eduType]').val();
			
			let action = ${loginUser.memberType eq 'T'} ? 'detail':'exam';
			
			sendPage(eduNo, eduType, action);
		});
		
		// 종료 과제 페이지 지정
		$('.end-edu').click(e => {
			let end = $(e.target).parents('.end-edu');
			let eduNo = (end.length == 0) ? $(e.target).find('input[name=eduNo]').val() : end.find('input[name=eduNo]').val();
			let eduType = (end.length == 0) ? $(e.target).find('input[name=eduType]').val() : end.find('input[name=eduType]').val();
			
			let action = ${loginUser.memberType eq 'T'} ? 'detail':'result';
			
			sendPage(eduNo, eduType, action);
		});
		
		// 지정된 페이지 이동
		function sendPage(num, type, action){
			let form = $('#edu-main-form');
			
			form.find('input[name=eduNo]').val(num);
			form.find('input[name=eduType]').val(type);
			form.prop('action', action + '.edu');
			form.submit();
		}
	</script>
</body>
</html>