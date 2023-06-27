<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 디테일</title>
<style>
	.letter{
		background-color: #f9f9ff !important;
	}
</style>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>쪽지 디테일</h1>
		        </div>
		
		        <div class="section-body">
					
					<div class="card">
						
						<div class="card-body">
							<div align="left">
								<c:choose>
									<c:when test="${letter.toManitto eq 'Y'}">
										<h6>To.Manitti</h6>
									</c:when>
									<c:when test="${letter.anonymous eq 'Y'}">
										<h6>To.Manitto</h6>
									</c:when>
									<c:otherwise>
										<h6>To.${letter.recipient}</h6>
									</c:otherwise>
								</c:choose>
								
							</div>
							<div class="card">
								
								<div class="card-body letter">
									<div align="center" style="font-size: larger; font-weight: bolder;">
										${letter.letterContent}
									</div>
								</div>
								
							</div>
							<div align="right">
								<h6>From.${letter.sender}</h6>
								<h6>${letter.sendDate}</h6>
							</div>
							<c:if test="${not empty letter.gift && sessionScope.loginUser.memberNo ne letter.memberNo}">
								<div align="center">
									<c:choose>
										<c:when test="${letter.getGift eq 'N'}">
											<button class="btn btn-primary btn-lg" onclick="getGift();">안 받은 선물이 있어요!!</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-primary btn-lg">이미 선물(${letter.gift})을 받았어요!!</button>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test="${not empty letter.gift && sessionScope.loginUser.memberNo eq letter.memberNo}">
								<div align="center">
									
									<button class="btn btn-primary btn-lg">선물로 (${letter.gift})을(를) 보냈어요!!</button>
										
								</div>
							</c:if>
							<br>
							<div align="center">
								<form action="letterBox">
									<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" /> 
									<button class="btn btn-primary btn-lg" >목록</button>
								</form>
							</div>
						</div>
					</div>
		      	</div>
		    </section>
	    </div>
</div>

<script>
	function getGift(){

		$.ajax({
			url : 'getGift.le',
			data : {
				letterNo : '${letter.letterNo}',
				gift : '${letter.gift}',
				memberNo : '${sessionScope.loginUser.memberNo}',
				classNo : '${requestScope.classroom.classNo}'
			},
			success : function(result){
				if(result > 0){
					window.location.reload();
					alert('선물로 ${letter.gift}을 받았어요.');
				}
			}
		})
	}
</script>

</body>
</html>