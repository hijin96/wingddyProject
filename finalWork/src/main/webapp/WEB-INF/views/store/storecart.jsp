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
<link rel="stylesheet"
	href=" /resources/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/assets/modules/fontawesome/css/all.min.css">


<meta charset="UTF-8">
<style>
</style>
<title>장바구니</title>
</head>
<body>
	<div id="storecart">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content" >
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			<!-- 	<form action="storebuy.do" method="post"> -->
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4>장바구니</h4>
								<div class="card-header-form"></div>
							</div>
							<div class="card-body p-0" >
								<div class="table-responsive">
								
									<table class="table table-striped" >
										<tbody>
											<tr>
												<th class="p-0 text-center">
													<div class="custom-checkbox custom-control" >
														<input type="checkbox" data-checkboxes="mygroup"
															data-checkbox-role="dad" class="custom-control-input"
															id="buycheckbox-all" name="buycheckbox-all"
															onclick="buycheckboxAll();"> <label
															for="buycheckbox-all" class="custom-control-label"
															name="buycheckbox-all">&nbsp;</label>
													</div>
												</th>
												<th>상품명</th>
												<th>가격</th>
												<th>수량</th>
												<th>수량수정</th>
												<th>소계</th>
												<th>수정</th>
												
											</tr>
											<c:forEach var="cart" items="${cartList }" varStatus="status">
												<%--  ${status.index} 0부터의 순서 --%>
												<tr>
													<td class="p-0 text-center">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" name="buyCheckBox"
																value="${status.index}" id="checkbox${status.index}">
															<label for="checkbox${status.index}"
																class="custom-control-label">&nbsp;</label>
														</div>
													</td>

													<td class="align-middle">${cart.spName }</td>
													<td class="align-middle">${cart.spPrice}</td>
													<td>${cart.buyCount }</td>
													<td>
													<input type="number" size="4"  min="0" step="1" class="c-input-text qty text" id="countUpdate${status.index }"></td>
													<td id="totalPrice${status.index}">${cart.totPrice}</td>
													<input type="hidden" id="cartNo${status.index}" name="cartNo" value="${cart.cartNo }">
													<td> <button type="button" id="cartUpdate${status.index }" class="btn btn-secondary"  onclick="cartUpdate();">수정</button></td>
												</tr>
											</c:forEach>
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>


					<div class="row my-5">
					
						<div class="col-lg-8 col-sm-12">
							<div class="update-box ">
								<input type="button" value="구매하기" name="buyCart" id="realBuy"  onclick="buyCartpage()" class="btn btn-primary"> 
								<input type="button" value="삭제하기" name="cartDelete" class="btn btn-secondary" onclick="cartDelete();" >
							<!-- 	<input type="button" value="수량수정" name="cartUpdate" class="btn btn-secondary" onclick="cartUpdate();" > -->
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

								<div class="d-flex">
									<h4>배송비</h4>
									<div class="ml-auto font-weight-bold">무료</div>
								</div>
								<hr>
								<div class="d-flex gr-total">
									<h5>결제 예정금액</h5>
									<div class="ml-auto h5" id="sumPrice" value="sumprice"></div>
								</div>
								<hr>
							</div>
						</div>
						<div class="col-12 d-flex shopping-box">
							<div class="ml-auto btn btn-primary " onclick="buyCartpage()">결제하기</div>
						</div>
					</div>
			</div>
		</div>
	<!-- 	</form> -->
		<!-- End Cart -->


		<script>
			function buycheckboxAll() {
				if ($('#buycheckbox-all').is(":checked")) {
					$('input[name=buyCheckBox]').prop("checked", true);
				} else {
					$('input[name=buyCheckBox]').prop("checked", false);
				}
			}

			let checkAll = document.getElementsByName('buyCheckBox');

			$(document).on('click',checkAll,function() {
								//체크박스의 길이

								let checkLength = checkAll.length;

								//선택한 체크박스의 길이
								let lengthChecked = $("input:checkbox[name=buyCheckBox]:checked").length;

								if (lengthChecked == checkLength) {
									$('#buycheckbox-all').prop("checked", true);
								} else {
									$('#buycheckbox-all')
											.prop("checked", false);
								}

							})
		</script>
		<script>
			$(function() {
				$('input[name=buyCheckBox]').click(
						function() {
							let checkAll = $('input[name=buyCheckBox]').filter(':checked');
							let sumPrice = 0;
							let cartNos=[];
							
							for (var i = 0; i < checkAll.length; i++) {
								let index = checkAll[i].value;
								//console.log("index란?"+index); 0,1,2..
								let totalPrice = $('#totalPrice' + index).text();
								sumPrice += Number(totalPrice);
								//sumPriced += sumPrice;
							}
							//console.log("sumPrice: " + sumPrice);
							$('#sumPrice').text(sumPrice); //클릭할때마다 값 바꿔줌

						});
				
			});
			   function buyCartpage() {
			        // Get the checked checkboxes
			        let checkAll = $('input[name=buyCheckBox]').filter(':checked');
			        let cartNos = [];
			        for (var i = 0; i < checkAll.length; i++) {
			            let index = checkAll[i].value;
			            let cartNo = $('#cartNo' + index).val();
			            cartNos.push(cartNo);
			        }
			        if(checkAll.length==0){
			        	alert('구매할 물품을 선택해주세요');
			        }else{
			        // Redirect to the buyCart page with the cartNo values
			        window.location.href = "storebuy.do?cartNo=" + cartNos.join(",");
			    	}
			   }
			 
		</script>

		<script>
			//장바구니 삭제
			
			function cartDelete() {
				let cartNos = [];
				let checkAll = $('input[name=buyCheckBox]').filter(':checked');
				  for (var i = 0; i < checkAll.length; i++) {
			            let index = checkAll[i].value;
			           	 let cartNo = $('#cartNo' + index).val();
			             cartNos.push(cartNo);
			             console.log('cartNo'+ cartNo); 
				  }
				 
				  console.log('cartNos: ' + cartNos)
				  $.ajax({
		            	url:'CheckBoxCartDelete'
		            	,data:{cartNo : cartNos}
				   		,type: 'post'
				   		//,dataType:'json'
				   		,traditional: true
		          	,success : function(data){
		          		if(data == "1"){
		          			alert('삭제성공');
		          			 location.reload();
		          		} else {
		          			console.log('에러');
		          			alert('삭제실패');
		          		}
		          		
		          	},error:function(){
		          		console.log('에러');
		          		alert('에러');
		          	}  
				  
				  
				  })
			}
			  //장바구니 수정 (cartNo, countUpdate의 수량 같이 가져가기)
			   function cartUpdate(){
				   let index =0;
				  
					let checkAll = $('input[name=buyCheckBox]').filter(':checked');
					  for (var i = 0; i < checkAll.length; i++) {
				                index = checkAll[i].value;
					  }
					  
					  let cartNo = $('#cartNo' + index).val();
					  let countUpdate = $('#countUpdate'+ index).val();
					  Number(countUpdate)
					  console.log('countUpdate: ' + countUpdate)
					   console.log('carNo:cartNo: ' + cartNo)
					  $.ajax({
						url:  'buyCountUpdate'
						,data:{carNo:cartNo,  buyCount:countUpdate }
					  	,type:'post'
					  	 ,success: function(data){
					  		 if(data==1){
					  			 location.reload();
					  		 }else{
					  			 console.log('실패');
					  		 }
					  	 }
 					  	,error:function(){
 					  		console.log('에러');
 					  	
 					  	}
					  })
			   }
		</script>







	</div>

	</div>
	</div>
</body>
</html>