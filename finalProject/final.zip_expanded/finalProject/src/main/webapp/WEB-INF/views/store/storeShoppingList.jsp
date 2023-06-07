<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="resources/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="resources/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="resources/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/custom.css">
<meta charset="UTF-8">
<title>구매목록</title>
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
								<div class="card-body">
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
												<td class="name-pr"> 20230601랜덤자리5개
												</td>
												<td class="produce-pr">
													<p>자전거 외 3개</p>
												</td>
												<!-- <td class="quantity-box">In Stock</td> -->
												<td class="price-pr">
													<p>결제 금액</p>
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