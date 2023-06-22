<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
			<div id="header">
				<h3>학생 보유 쿠폰</h3>
			</div>
			
			<section class="section">
				<section class="section-body">
					<div class="card">
						<div class="card-body">
		  					<table class="table text-center table-striped table-md">
				        		<thead>
						          	<tr>
						            	<th>이름</th>
						            	<th>쿠폰명</th>
						            	<th>수량</th>
						            	<th><button>사용하기</button></th>
						          	</tr>
				        		</thead>
				        		<tbody>
						        	<c:forEach items="sclist" var="cp" varStatus="status">
						        		<tr>
						        			
						            	</tr>
						            </c:forEach>
					        	</tbody>
		      				</table>
			  			</div>
		  			</div>
		  		</section>
	  		</section>
		
		</div>
	</div>
</div>

</body>
</html>