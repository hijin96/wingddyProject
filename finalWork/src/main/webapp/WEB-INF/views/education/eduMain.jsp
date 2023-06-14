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
	            
	        </div>
	    </section>
	</div>
</body>
</html>