<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습페이지</title>

<style>


</style>
</head>
<body>

	<jsp:include page="../sideBar/sideBar.jsp" />
	
	<div class="main-content">
		<section class="section">
	        <div class="section-header">
				<h1>과제 페이지</h1>
				<c:if test="${loginUser.memberType eq  'T'}">
					<div class="section-header-breadcrumb">
						<button class="btn btn-primary">과제 등록</button>
					</div>
				</c:if>
	        </div>
	        <div class="section-body">
            	<div class="col-12">
            		<h2 class="section-title">등록된 과제</h2>
            	</div>
	            <div class="row sortable-card">
	            	<c:forEach var="edu" items="${eList}">
	            		<c:if test="${edu.limitTime gt 0}">
	            			<div class="col-12 col-md-6 col-lg-3">
	            				<input type="hidden" value="${edu.eduNo}" name="eduNo"/>
			            		<div class="card card-primary">
			            			<div class="card-header">
			            				<h5>${edu.eduName}</h5>
			            			</div>
			            			<div class="card-body">
			            				<p>
			            					남은시간 : <div>${edu.limitTime}일</div><br>
			            					유형 : ${edu.eduType} <br>
			            					진행율 : ${edu.progressRate*100}% 
			            				</p>
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
			            		<input type="hidden" value="${edu.eduNo}" name="eduNo"/>
			            		<div class="card card-primary">
			            			<div class="card-header">
			            				<h5>${edu.eduName}</h5>
			            			</div>
			            			<div class="card-body">
			            				<p>
			            					${edu.endTime}<br>
			            					유형 : ${edu.eduType} <br>
			            					진행율 : ${edu.progressRate*100}% 
			            				</p>
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
			console.log('${eList}');
			function checkTime(num){
				console.log(num);
			}
		})
	</script>
</body>
</html>