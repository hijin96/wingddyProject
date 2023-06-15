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
            		<c:if>
	            		<c:choose>
	            			<c:when test="${edu.eduType eq 'W'}">
		            			<div class="col-12 col-md-6 col-lg-3">
				            		<div class="card card-primary">
				            			<div class="card-header">
				            			</div>
				            			<div class="card-body">
				            			</div>
				            		</div>
				            	</div>
	            			</c:when>
	            			<c:when test="${edu.eduType eq 'S'}">
	            				<div class="col-12 col-md-6 col-lg-3">
				            		<div class="card card-warning">
				            			<div class="card-header">
				            			</div>
				            			<div class="card-body">
				            			</div>
				            		</div>
				            	</div>
	            			</c:when>
	            			<c:otherwise>
	            				<div class="col-12 col-md-6 col-lg-3">
				            		<div class="card card-danger">
				            			<div class="card-header">
				            			</div>
				            			<div class="card-body">
				            			</div>
				            		</div>
				            	</div>
	            			</c:otherwise>
	            		</c:choose>
            		</c:if>
            	</c:forEach>
	            	<div class="col-12">
	            		<h2 class="section-title">완료된 과제</h2>
	            	</div>
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
</body>
</html>