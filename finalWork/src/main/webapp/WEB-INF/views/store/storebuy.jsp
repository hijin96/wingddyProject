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
	<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<!-- Site CSS -->
	<link rel="stylesheet" href="resources/css/style.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="resources/css/responsive.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="resources/css/custom.css">
</head>
<body>
	<div id="app">
			<jsp:include page="../sideBar/sideBar.jsp" />
				<div class="main-content">
					<br><br><br><br><br><br><br>
					<div class="cart-box-main">
						<div class="container">
							<div class="row new-account-login">
								
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
													
													<input type="text" class="form-control" id="sendName" placeholder="" name="sendName" required>
													<div class="invalid-feedback"> 보내는이를 작성해주세요</div>
												</div>
												<div class="col-md-6 mb-3">
													<label for="resName">받는이 *</label>
													<input type="text" class="form-control" id="resName" placeholder="" name="resName" required>
													<div class="invalid-feedback">받는이를 작성해주세요</div>
												</div>
											</div>
										
											<div class="mb-3">
												<label for="address">주소*</label>
												<button type="button" onclick="goPopup();">주소검색</button>
												<br>도로명주소<input type="text" id="roadFullAddr" name="roadFullAddr" /><br>
												<input type="text" class="form-control" id="roadAddrPart1" placeholder="" name="roadAddrPart1"  required>
												<div class="invalid-feedback"> 주소를 입력해주세요</div>
											</div>
											<div class="mb-3">
												<label for="address2">상세주소 2 *</label>
												<input type="text" class="form-control" id="addrDetail"  name="addrDetail" placeholder=""> </div>
											

											
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
											</div>
											<hr class="mb-1"> </form>
									</div>
								</div>
								<div class="col-sm-6 col-lg-6 mb-3">
									<div class="row">
										<div class="col-md-12 col-lg-12">
											
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
										<div class="col-12 d-flex shopping-box"> <a href="" class="ml-auto btn hvr-hover">결제하기</a> </div>
									</div>
								</div>
							</div>
				
						</div>
					</div>
					<!-- End Cart -->
					<script>
					 function goPopup(){
				            var url = "address.do";
				            var name = "pop";
				            var option = "width=570,height=420, scrollbars=yes, resizable=yes"
				            window.open(url, name, option);
				        }
					
					
					</script>
					  <a href = "javascript:popup()" target = "_blank">팝업</a>
					<script>
					/* function goPopup(){
						// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
					    var pop = window.open("store/popupAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
					    
						// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
					    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
					} 
					/** API 서비스 제공항목 확대 (2017.02) **/
					function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
											, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
						// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
						document.form.roadAddrPart1.value = roadAddrPart1;
						document.form.roadAddrPart2.value = roadAddrPart2;
						document.form.addrDetail.value = addrDetail;
						document.form.zipNo.value = zipNo;
					}
					
					</script>
					
				</div>	
			       	 	
			       	 	
			       	 
			</div>
	
	</div>


</body>
	


</html>