<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="app">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br><br><br><br><br><br><br>
				<!-- Start Wishlist  -->
				<div class="wishlist-box-main">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="table-main table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>구매일자</th>
												<th>주문번호</th>
												<th>구매상품 </th>
												<th>결제금액</th>
												<th>주문상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2023-06-01 </td>
											</a>
												</td>
												<td class="name-pr">
													<a href="#">20230601랜덤자리5개 </a>
												</td>
												<td class="produce-pr">
													<p>자전거 외 3개</p>
												</td>
												<!-- <td class="quantity-box">In Stock</td> -->
												<td class="price-pr">
													<a class="btn hvr-hover" href="#">결제 금액</a>
												</td>
												<td class="shoppingdetail">
													<a href="#"> <i class="btn btn-light">주문상세보기페이지로 이동</i></a>
												</td>
											</tr>
		
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Wishlist -->

			</div>
		</div>
	</div>

</body>
</html>