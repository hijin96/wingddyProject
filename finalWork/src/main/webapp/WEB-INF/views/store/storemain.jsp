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
<link rel="shortcut icon"
	href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon"
	href="${contextPath}/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<%-- <link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css"> --%>
<!-- Site CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/responsive.css">

<meta charset="UTF-8">
<title>스토어 메인페이지</title>
				<script>
					var checkLogin =${empty loginUser || (loginUser.memberType eq ('S'))}
					 	if(checkLogin){
					 		alert("선생님만 이용할 수 있는 페이지 입니다. 로그인 후 이용해주세요");window.history.back();
					 	}
				</script>
</head>
<body>
	<div id="app">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br>
				<br>
				<br>
				<br>
				<br>
				<c:if test="${not empty loginUser&& loginUser.memberType eq ('A')}">
					<div class="input-group-append">
						<form action="storeWriter" method="post">
							<button class="btn btn-theme" id="storeAdd" type="submit"
								onclick="location.href" +storeWriter>상품추가</button>
							<input type="hidden" id="fileNo">${store.fileNo }
						</form>
					</div>
				</c:if>
				<!--검색창  -->
				
				<div class="card-body">
                    <div class="float-left">
                      <select class="form-control selectric">
                        <option>Action For Selected</option>
                        <option>Move to Draft</option>
                        <option>Move to Pending</option>
                        <option>Delete Pemanently</option>
                      </select>
                    </div>
                    <div class="float-right">
                      <form action="search.do" method="get">
                      <input type="hidden" name="currentPage" value="1">
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search" name="keyword" value="${keyword }">
                          <div class="input-group-append">                                            
                            <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>

                    <div class="clearfix mb-3"></div>
                 </div>
				<!-- 검색창 끝  -->
				
				
				<c:if test="${not empty loginUser&& (loginUser.memberType eq ('T')or loginUser.memberType eq ('A'))}">
				<div class="product-categorie-box">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active"
							id="grid-view">
							<div class="row" id="storespNo">
								<c:forEach items="${goodsList}" var="s">
									<!--------------------------------------------------  -->
									<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
										<div class="products-single">
											<div class="box-img-hover">
												<div class="type-lb">
													<%-- <input type="hidden" value="${s.spNo }"> --%>
													<p class="spNo">${s.spNo }</p>
												</div>
												<img src="./${s.filePath}/${s.changeName}" class="img-fluid"
													alt="Image"  style="height:300px">
												<div class="mask-icon">
													<ul>
														<li><a href="#" data-toggle="tooltip"
															data-placement="right" title=""
															data-original-title="View">${s.viewCount }<i
																class="fas fa-eye"></i></a></li>
														<li><a href="#" data-toggle="tooltip"
															data-placement="right" title=""
															data-original-title="Compare"><i
																class="fas fa-sync-alt"></i></a></li>
														<li><a href="#" data-toggle="tooltip"
															data-placement="right" title=""
															data-original-title="Add to Wishlist"><i
																class="far fa-heart"></i></a></li>
													</ul>
													<a class="cart" href="#">장바구니에 담기</a>
												</div>
											</div>
											<div class="why-text">
												<h4>${s.spName }</h4>
												<h5>${s.spPrice }</h5>
											</div>
										</div>
									</div>

									<!--------------------------------------------->
								</c:forEach>

							</div>
						</div>

					</div>
				</div>
				
				<script>
					/* $(function() {
						$('.mask-icon').click(
								function() {
									location.href = 'storedetail?spNo='
											+ $(this).find('.spNo').text();
								})
					}) */

					$(function() {
						$('.products-single').click(
								function() {
									location.href = 'storedetail?spNo='
											+ $(this).find('.spNo').text();
								})
					})
				
					$('#storeAdd').click(function() {
						var fileNo = $('fileNo').val();
					})
					
				</script>


				<div id="pagingArea">
					<ul class="pagination">

						<c:choose>
							<c:when test="${pageInfo.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="storemain?cPage=${pageInfo.currentPage-1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${pageInfo.startPage }"
							end="${pageInfo.endPage}" var="p">
							<li class="page-item"><a class="page-link"
								href="storemain?cPage=${p }">${p }</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
								<li class="page-item disabled"><a class="page-link"
									href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="storemain?cPage=${pageInfo.currentPage+1 }">Next</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

				</c:if>

			</div>
		</div>

	</div>
</body>
</html>