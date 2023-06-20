<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<    
      <link rel="stylesheet" href=" /resources/assets/modules/bootstrap/css/bootstrap.min.css">
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
		                              <input type="checkbox" data-checkboxes="mygroup" data-checkbox-role="dad" class="custom-control-input" id="buycheckbox-all" name="buycheckbox-all" >
		                              <label for="buycheckbox-all" class="custom-control-label" name="buycheckbox-all">&nbsp;</label>
		                            </div>
		                          </th>
		                         	<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>수량수정</th>
									<th>소계</th>
									<th>삭제</th>
		                   </tr>
		                   <c:forEach var="cart" items="${cartList }" varStatus="status">
		                   <tr>
												
													<td class="p-0 text-center">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" name="buyCheckBox" id="checkbox${status.index}"> <label
																for="checkbox${status.index}" class="custom-control-label">&nbsp;</label>
														</div>
													</td>
													
													<td class="align-middle">${cart.spName }</td>
													<td class="align-middle">${cart.spPrice}</td>
													<td>${cart.buyCount }</td>
													<td><input type="number" size="4"
														value="${cart.buyCount }" min="0" step="1"
														class="c-input-text qty text"></td>
													<td>${cart.totPrice}</td>
													<input type="hidden" value="${cart.cartNo}"/>
													<td><a href="#" class="btn btn-secondary">삭제</td>
											
											</tr>
	                     	</c:forEach>
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
				 	var buyCheckBoxAll = document.getElementsByName('buyCheckBox');
				 	var chckAll=0;
				 	$('input[name=buycheckbox-all]').click(function(){
							$('input[name=buyCheckBox]').prop("checked", true);
						
						for(var i=0;i<buyCheckBoxAll.length; i++){
							var cbox= buyCheckBoxAll[i];
							
							if(cbox.checked){
								chckAll++; 
								console.log("buyCheckBoxAll:"+buyCheckBoxAll.length);
								console.log("chckAll:"+chckAll);
							}
						}
						
						if(buyCheckBoxAll.length == chckAll){
							console.log('길이 같으면여기로');
							$('input[name=buycheckbox-all]').prop("checked", true);
						}else{
							console.log('달라달라여기로');
							$('input[name=buyCheckBox]').prop("checked",false);
						}
						
					}
					
					)
					
					//체크박스 개별로 전체 선택
					var CheckBoxAllCheck = document.getElementsByName('buyCheckBox').length;
					//전체선택을 클릭했을때
					//체크박스 개별로 전체 선택했을 때
					//전체선택 체크박스를 해제할 때
					
				</script>
				
				<script>
				//클릭펑션 참고해서 다르게 만들어보기 ->https://ivory-room.tistory.com/67
				
				</script>
				
			</div>

		</div>
	</div>
</body>
</html>