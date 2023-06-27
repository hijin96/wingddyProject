<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
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
								<h4>상품구매목록</h4>
									<table class="table">
										<thead>
											<tr>
												<th>이미지</th>
												<th>상품명</th>
												<th>구매일자 </th>
												<th>금액</th>
												<th>수량</th>
												<th>소계</th>												
											</tr>
										</thead>
										<tbody>
											<c:forEach var="order" items="${orderList }" varStatus="status">
													<tr>
														<td class="thumbnail-img" width="15%" height="30px"><img class="img-fluid" src="./${order.filePath}/${order.changeName}"  alt=""/></td>
														<td class="name-pr">${order.spName } </td>
														<td class="name-pr"> ${order.orderDay }</td>
														<td class="produce-pr">${order.spPrice }
															
														</td>
														<!-- <td class="quantity-box">In Stock</td> -->
														<td class="price-pr">${order.buyCount }</td>
														<td class="shoppingdetail">${order.totPrice}</td>
													</tr>
											</c:forEach>
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