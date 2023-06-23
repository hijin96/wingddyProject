<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h3>내 쿠폰</h3>
			</div>
			
			<section class="section">
				<section class="section-body">
					<div class="card">
						<div class="card-body">
		  					<table class="table text-center table-striped table-md">
				        		<thead>
						          	<tr>
						            	<th>#</th>
						            	<th>쿠폰명</th>
						            	<th>내용</th>
						            	<th>수량</th>
						          	</tr>
				        		</thead>
				        		<tbody>
						        	<c:forEach items="${myCplist}" var="cp" varStatus="status">
						        		<tr>
						        			<td><c:out value="${status.count}"></c:out></td>
						        			<td>${cp.productName}</td>
						        			<td>${cp.productContent}</td>
						        			<td>${cp.amount}</td>
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

<script>
</script>

</body>
</html>