<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Site Metas -->
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${contextPath}/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/custom.css">
<meta charset="UTF-8">
<title>스토어 메인페이지1233</title>
</head>
<body>
	<div id="app">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br><br><br><br><br>
				<c:if test="${not empty loginUser&& loginUser.memberType eq ('A')}">
				<div class="input-group-append">
				<form action="storeWriter" method="post">
                	<button class="btn btn-theme" type="submit" onclick="location.href"+storeWriter>상품추가</button>
              	</form>
                </div>
                 </c:if>
				<div class="product-categorie-box">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active" id="grid-view">
							<div class="row" id="storespNo">
								<c:forEach items="${goodsList}" var="s">
										<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
											<div class="products-single fix">
												<div class="box-img-hover">
													<img src="${contextPath}/resources/images/img-pro-01.jpg" class="img-fluid" alt="Image">
													<div class="mask-icon">
														<ul>
															<li><a href="#" data-toggle="tooltip" data-placement="right" title="View" name="viewCount">
																<i class="fas fa-eye"></i></a></li>
															<li><a href="#" data-toggle="tooltip"
																data-placement="right" title="Compare"><i
																	class="fas fa-sync-alt"></i></a></li>
															<li><a href="#" data-toggle="tooltip"
																data-placement="right" title="Add to Wishlist"><i
																	class="far fa-heart"></i></a></li>
														</ul>
														<a class="cart" href="#">장바구니추가</a>
													</div>
												</div>
												<div class="why-text">
													<h4>${s.spName }</h4>
													<h5>${s.spPrice }</h5>
												</div>
											</div>
										</div>
								
								</c:forEach>

							</div>
						</div>

					</div>
				 </div> 
				 <script>
				 	$(function() {
						$('#storespNo').click(function(){
							location.href='storedetail?'+$(this);
						})
					})
				 </script>
				 
		 	          <div id="pagingArea">
		                <ul class="pagination">
		                
			                <c:choose>
			                	<c:when test="${pageInfo.currentPage eq 1}">
			                		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="page-item"><a class="page-link" href="list.bo?cPage=${pageInfo.currentPage-1 }">Previous</a></li>
			                	</c:otherwise>                	
			      			</c:choose>
								                	
		                	<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage}" var="p">
		                			<li class="page-item"><a class="page-link" href="list.bo?cPage=${p }">${p }</a></li>
		                	</c:forEach>
		                	<c:choose>
		                		<c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
		                			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                		</c:when>
							<c:otherwise>
									<li class="page-item"><a class="page-link" href="list.bo?cPage=${pageInfo.currentPage+1 }">Next</a></li>
							</c:otherwise>                	
		                	</c:choose>
		      			
		                </ul>
		            </div>
						 
				 
				 
				 
			</div>
		</div>

	</div>
</body>
</html>