<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>상품구매하기</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<div id="app">
			<jsp:include page="../sideBar/sideBar.jsp" />
				<div class="main-content">
					<br><br><br><br><br><br><br>
					<div class="cart-box-main">
						<div class="container">
							<div class="row new-account-login">
								<div class="col-sm-6 col-lg-6 mb-3">
									주문번호 input hidden으로 가져오기~~~~~~~~~~!!!!!!!!!!!!!!!!!!
									<!-- <div class="title-left">
										<h3>Account Login</h3>
									</div> -->
									<!-- <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5> -->
									<!-- <form class="mt-3 collapse review-form-box" id="formLogin">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="InputEmail" class="mb-0">Email Address</label>
												<input type="email" class="form-control" id="InputEmail" placeholder="Enter Email"> </div>
											<div class="form-group col-md-6">
												<label for="InputPassword" class="mb-0">Password</label>
												<input type="password" class="form-control" id="InputPassword" placeholder="Password"> </div>
										</div>
										<button type="submit" class="btn hvr-hover">Login</button>
									</form> -->
								</div>
								<div class="col-sm-6 col-lg-6 mb-3">
									<!-- <div class="title-left">
										<h3>Create New Account</h3>
									</div> -->
									<!-- <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
									<form class="mt-3 collapse review-form-box" id="formRegister">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="sendName" class="mb-0">보내는이</label>
												<input type="text" class="form-control" id="sendName" placeholder="보내는이"> </div>
											<div class="form-group col-md-6">
												<label for="resName" class="mb-0">받는이</label>
												<input type="text" class="form-control" id="resName" placeholder="받는이"> </div>
											<div class="form-group col-md-6">
												<label for="InputEmail1" class="mb-0">Email Address</label>
												<input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
											<div class="form-group col-md-6">
												<label for="InputPassword1" class="mb-0">Password</label>
												<input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
										</div>
										<button type="submit" class="btn hvr-hover">Register</button>
									</form> -->
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-lg-6 mb-3">
									<div class="checkout-address">
										<div class="title-left">
											<h3>결제하기</h3>
										</div>
										<form class="needs-validation" novalidate>
											<div class="row">
												<div class="col-md-6 mb-3">
													<label for="sendName">보내는이 *</label>
													<input type="text" class="form-control" id="sendName" placeholder="" value="" required>
													<div class="invalid-feedback"> Valid first name is required. </div>
												</div>
												<div class="col-md-6 mb-3">
													<label for="resName">받는이 *</label>
													<input type="text" class="form-control" id="resName" placeholder="" value="" required>
													<div class="invalid-feedback"> Valid last name is required. </div>
												</div>
											</div>
											<!-- <div class="mb-3">
												<label for="username">Username *</label>
												<div class="input-group">
													<input type="text" class="form-control" id="username" placeholder="" required>
													<div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
												</div>
											</div> -->
											<div class="mb-3">
												<label for="email">이메일*</label>
												<input type="email" class="form-control" id="email" placeholder="">
												<div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
											</div>
											<div class="mb-3">
												<label for="address">주소*</label>
												<input type="text" class="form-control" id="address" placeholder="" required>
												<div class="invalid-feedback"> Please enter your shipping address. </div>
											</div>
											<div class="mb-3">
												<label for="address2">상세주소 2 *</label>
												<input type="text" class="form-control" id="address2" placeholder=""> </div>
											<!-- <div class="row">
												<div class="col-md-5 mb-3">
													<label for="country">Country *</label>
													<select class="wide w-100" id="country">
													<option value="Choose..." data-display="Select">Choose...</option>
													<option value="United States">United States</option>
												</select>
													<div class="invalid-feedback"> Please select a valid country. </div>
												</div>
												<div class="col-md-4 mb-3">
													<label for="state">State *</label>
													<select class="wide w-100" id="state">
													<option data-display="Select">Choose...</option>
													<option>California</option>
												</select>
													<div class="invalid-feedback"> Please provide a valid state. </div>
												</div>
												<div class="col-md-3 mb-3">
													<label for="zip">Zip *</label>
													<input type="text" class="form-control" id="zip" placeholder="" required>
													<div class="invalid-feedback"> Zip code required. </div>
												</div>
											</div>
											<hr class="mb-4">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="same-address">
												<label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="save-info">
												<label class="custom-control-label" for="save-info">Save this information for next time</label>
											</div>
											<hr class="mb-4">
											<div class="title"> <span>Payment</span> </div>
											<div class="d-block my-3">
												<div class="custom-control custom-radio">
													<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
													<label class="custom-control-label" for="credit">Credit card</label>
												</div>
												<div class="custom-control custom-radio">
													<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
													<label class="custom-control-label" for="debit">Debit card</label>
												</div>
												<div class="custom-control custom-radio">
													<input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
													<label class="custom-control-label" for="paypal">Paypal</label>
												</div>
											</div> -->
											<div class="row">
												<div class="col-md-6 mb-3">
													<label for="cc-name">Name on card</label>
													<input type="text" class="form-control" id="cc-name" placeholder="" required> <small class="text-muted">Full name as displayed on card</small>
													<div class="invalid-feedback"> Name on card is required </div>
												</div>
												<div class="col-md-6 mb-3">
													<label for="cc-number">Credit card number</label>
													<input type="text" class="form-control" id="cc-number" placeholder="" required>
													<div class="invalid-feedback"> Credit card number is required </div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3 mb-3">
													<label for="cc-expiration">Expiration</label>
													<input type="text" class="form-control" id="cc-expiration" placeholder="" required>
													<div class="invalid-feedback"> Expiration date required </div>
												</div>
												<div class="col-md-3 mb-3">
													<label for="cc-expiration">CVV</label>
													<input type="text" class="form-control" id="cc-cvv" placeholder="" required>
													<div class="invalid-feedback"> Security code required </div>
												</div>
												<div class="col-md-6 mb-3">
													<div class="payment-icon">
														<ul>
															<li><img class="img-fluid" src="images/payment-icon/1.png" alt=""></li>
															<li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
															<li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
															<li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
															<li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li>
														</ul>
													</div>
												</div>
											</div>
											<hr class="mb-1"> </form>
									</div>
								</div>
								<div class="col-sm-6 col-lg-6 mb-3">
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<!-- <div class="shipping-method-box">
												<div class="title-left">
													<h3>주문상품</h3>
												</div>
												 <div class="mb-4">
													<div class="custom-control custom-radio">
														<input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
														<label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
													<div class="ml-4 mb-2 small">(3-7 business days)</div>
													<div class="custom-control custom-radio">
														<input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
														<label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
													<div class="ml-4 mb-2 small">(2-4 business days)</div>
													<div class="custom-control custom-radio">
														<input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
														<label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
												</div> 
											</div> -->
										</div>
										<div class="col-md-12 col-lg-12">
											<div class="odr-box">
												<div class="title-left">
													<h3>구매예정 목록</h3>
												</div>
												<div class="rounded p-2 bg-light">
													<div class="media mb-2 border-bottom">
														<div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
															<div class="small text-muted">가격: $80.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $80.00</div>
														</div>
													</div>
													
												</div>
											</div>
										</div>
										<br><br><br>
										<div class="col-md-12 col-lg-12">
											
											<div class="order-box">
												<div class="title-left">
													<br><br>
													<h3>결제금액</h3>
												</div>
												<div class="d-flex">
													<div class="font-weight-bold">상품</div>
													<div class="ml-auto font-weight-bold">금액</div>
												</div>
												<hr class="my-1">
												<div class="d-flex">
													<h4>Sub Total</h4>
													<div class="ml-auto font-weight-bold"> $ 440 </div>
												</div>
												<div class="d-flex">
													<h4>Discount</h4>
													<div class="ml-auto font-weight-bold"> $ 40 </div>
												</div>
												<hr class="my-1">
												<div class="d-flex">
													<h4>Coupon Discount</h4>
													<div class="ml-auto font-weight-bold"> $ 10 </div>
												</div>
												<br>
												<div class="d-flex">
													<h4>Shipping Cost</h4>
													<div class="ml-auto font-weight-bold"> Free </div>
												</div>
												<hr>
												<div class="d-flex gr-total">
													<h5>총결제금</h5>
													<div class="ml-auto h5"> $ 388 </div>
												</div>
												<hr> </div>
										</div>
										<div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div>
									</div>
								</div>
							</div>
				
						</div>
					</div>
					<!-- End Cart -->
				</div>	
			       	 	
			       	 	
			       	 
			</div>
	
	</div>


</body>
</html>