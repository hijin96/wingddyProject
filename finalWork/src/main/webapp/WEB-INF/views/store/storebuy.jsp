<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<!-- 	<link rel="stylesheet" href="resources/css/custom.css"> -->
</head>
<body>
	<div id="app">
			<jsp:include page="../sideBar/sideBar.jsp" />
				<div class="main-content">
					<br><br><br><br><br><br><br>
					<div class="cart-box-main">
						<div class="container row new-account-logi">
							
							<div class="row">
										<div class="col-sm-6 col-lg-6 mb-3">
								<form class="needs-validation" action="storeBuySuccess" method="post" >
											<div class="checkout-address">
														<div class="title-left">
															<h3>결제하기</h3>
														</div>
													
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
														<input type="hidden" id="confmKey" name="confmKey" value=""  >
														<label for="address">주소*</label>
														<div class="invalid-feedback"> 주소를 입력해주세요</div> <br>
														<button type="button" class="btn btn-info" onclick="goPopup();">주소검색</button>
														<br><label for="zipNo"> 우편번호 *</label> <input name="zipNo" id="zipNo" class="form-control" type="text" placeholder="우편번호" />
														<br>도로명주소<br><br>
														<input type="text" class="form-control" id="roadAddrPart1"  placeholder="도로명주소" name="roadAddrPart1"  required><br>
														<input type="text" class="form-control" id="roadAddrPart2"  placeholder="" name="roadAddrPart2"  required>
													</div>
													<div class="mb-3">
														<label for="addrDetail">상세주소 2 *</label>
														<input type="text" class="form-control" id="addrDetail"  name="addrDetail" placeholder="고객입력 상세주소"> 
													</div>
														<div class="mb-3">
														<label for="addrDetail"> 받는이 핸드폰번호 *</label>
														<input type="text" class="form-control" id="resPhone"  name="resPhone" placeholder="받는이 핸드폰 번호"> 
													</div>
												</div>				
													
													<div class="row">
														<div class="col-md-6 mb-3">
															<img id="kakaoPay"  src="resources/images/payment-icon/payment_icon.png" href="#"> 
														 </div>
													</div>
													<div class="row">
														<div class="col-md-3 mb-3 form-control invalid-feedback">
														
														</div>
													</div>
													<hr class="mb-1">  
													</div>
											<div class="row">
												<div class="col-md-6 mb-3">
													
												</div>
											</div>
											
											<div class="col-sm-6 col-lg-6 mb-3">
													<div class="row">
																	<div class="col-md-12 col-lg-12">
																		<div class="odr-box">
																			<div class="title-left">
																				<h3>구매예정 목록</h3>
																			</div>
																			<c:forEach var="cart" items="${cartList }" varStatus="status">
																			<input type="hidden" name ="cartNo" value=${cart.cartNo }>
																			<div class="rounded p-2 bg-light">
																				<div class="media mb-2 border-bottom">
																					<div class="media-body"> 
																						<a href="#"><input type="hidden" name="spName"> ${cart.spName }</a>
																						
																						<div class="small text-muted">${cart.spPrice }원 <span class="mx-2">|</span> 구매수량 ${cart.buyCount } 개<span class="mx-2">|</span> ${cart.totPrice} 원</div>
																					</div>
																					
																				</div>
																				
																			</div>
																			</c:forEach>
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
															<h4>총결제금</h4>
															<div class="ml-auto font-weight-bold" > ${sumPrice}  </div>
															<input type="hidden" name="sumPrice" value="${sumPrice}">
														</div>
														<div class="d-flex">
															
														</div>
														<br>
														<hr>
														<div class="d-flex gr-total">
															<h5>총결제금</h5>
														<div class="ml-auto h5"> ${sumPrice} </div>
														</div>
														<hr> </div>
												</div>
												<div class="col-12 d-flex shopping-box"> <button type="submit" class="btn btn-primary btn-lg btn-block">결제하기</button> </div>
											</div>
								</form>
									</div>
								
							</div>
				
						</div>
					</div>
					<!-- End Cart -->
					<script>

						//document.domain =  "http://localhost:8007/wingddy/address.do";
						function goPopup(){
				            var url = "address.do";
				            var name = "pop";
				            var option = "width=570,height=420, scrollbars=yes, resizable=yes"
				            window.open(url, name, option);
				        }
						function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
									, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
							// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
							document.getElementById("roadAddrPart1").value = roadAddrPart1;
							document.getElementById("roadAddrPart2").value = roadAddrPart2;
							document.getElementById("addrDetail").value = addrDetail;
							document.getElementById("zipNo").value = zipNo;
						}
					
					</script>
					<script>
					$(function(){
						$('#kakaoPay').click(function(){
						   $.ajax({
							   
							 url:'payment/ready',
							 data :{
								 odr_name : $("input[name='spName']").val(),
								 odr_total_price : $("input[name='sumPrice']").val()
								 
							 },type: 'post',
						    	 success: function(response){
								 alert(response.next_redirect_po_url);
								 location.href=response_redirect_pc_url;
							 }
							
						   })
						})
					})
					
					</script>
					 
					<script>
					


					</script>
				</div>	
			</div>
	</div>


</body>
	


</html>