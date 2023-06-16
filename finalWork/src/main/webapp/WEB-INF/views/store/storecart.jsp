<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon"
	href="resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="resources/css/responsive.css">
<!-- Custom CSS -->
<!--     
      <link rel="stylesheet" href="resources/assets/modules/bootstrap/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="resources/assets/modules/fontawesome/css/all.min.css">


<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<div id="storecart">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br><br><br><br><br><br><br>
				<form action="storebuy.do" method="post">
				<div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>장바구니</h4>
                    <div class="card-header-form">
                    </div>
                  </div>
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <table class="table table-striped">
	                        <tbody>
	                        <tr>
		                          <th>
		                            <div class="custom-checkbox custom-control">
		                              <input type="checkbox" data-checkboxes="mygroup" data-checkbox-role="dad" class="custom-control-input" id="checkbox-all">
		                              <label for="checkbox-all" class="custom-control-label">&nbsp;</label>
		                            </div>
		                          </th>
		                         	<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>수량수정</th>
									<th>소계</th>
									<th>삭제</th>
		                   </tr>
		                   <tr>
		                   		<c:forEach var="cart" items="${cart }">
			                          <td class="p-0 text-center">
			                            <div class="custom-checkbox custom-control">
			                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
			                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
			                            </div>
			                          </td>
			                          <td class="align-middle"> ${s.spName }</td>
			                          <td class="align-middle">${s.spPrice} </td>
			                          <td>${cart.buyCount } </td>
			                          <td><input type="number" size="4" value="${cart.buyCount }" min="0" step="1" class="c-input-text qty text"></td>
			                          <td>${cartsum}</td>
			                          <td><a href="#" class="btn btn-secondary">삭제</td>
		                          </c:forEach>
		                    </tr>
	                      </tbody>
	                     </table>
                    </div>
                  </div>
                </div>
              </div>

							
							<!-- ------------------------------------------------ -->
							<div class="row my-5">
								<div class="col-lg-6 col-sm-6">
						
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="update-box">
									<!-- 	<input value="수정하기" type="button" name="Update Cart">
										<input value="삭제하기" type="button" name="delete Cart"> -->
										<input type="submit" value="구매하기" name="buyCart" id="realBuy" onclick="buyCart();">
									</div>
								</div>
							</div>

							<div class="row my-5">
								<div class="col-lg-8 col-sm-12"></div>
								<div class="col-lg-4 col-sm-12">
									<div class="order-box">
										<h3>주문금액</h3>
										<div class="d-flex">
											<h4>상품합계</h4>
											<div class="ml-auto font-weight-bold">${cartsum}</div>
										</div>
										<hr class="my-1">
									<!-- 	<div class="d-flex">
											<h4>Coupon Discount</h4>
											<div class="ml-auto font-weight-bold">$ 10</div>
										</div> -->
										<!-- <div class="d-flex">
											<h4>Tax</h4>
											<div class="ml-auto font-weight-bold">$ 2</div>
										</div> -->
										<div class="d-flex">
											<h4>배송비</h4>
											<div class="ml-auto font-weight-bold">무료</div>
										</div>
										<hr>
										<div class="d-flex gr-total">
											<h5>결제 예정금액</h5>
											<div class="ml-auto h5">$ 388</div>
										</div>
										<hr>
									</div>
								</div>
								<div class="col-12 d-flex shopping-box">
									<a href="checkout.html" class="ml-auto btn hvr" style= "color:black !important"; >결제하기</a>
								</div>
							</div>

						</div>
					</div>
					</form>
					<!-- End Cart -->

				<script>
					
				</script>
			</div>

		</div>
	</div>
</body>
</html>