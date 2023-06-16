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
												<button type="button" onclick="popup();">주소검색</button>
												<br>도로명주소 전체(포맷)<input type="text" id="roadFullAddr" name="roadFullAddr" /><br>
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
					 function popup(){
				            var url = "address.do";
				            var name = "popup address";
				            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				            window.open(url, name, option);
				        }
					
					
					</script>
					  <a href = "javascript:popup()" target = "_blank">팝업</a>
					<script>
					
					
					
						function getAddr(){
							if (!checkSearchedWord(document.form.keyword)) {
								return ;
							}
							
						}
						
						$.ajax({
							 url : 'checkAddress'  //인터넷망
							,type:"post"
							,data:$("#form").serialize()
							,dataType:"jsonp"
							,crossDomain:true
							,success:function(jsonStr){
								$("#list").html("");
								var errCode = jsonStr.results.common.errorCode;
								var errDesc = jsonStr.results.common.errorMessage;
								if(errCode != "0"){
									alert(errCode+"="+errDesc);
								}else{
									if(jsonStr != null){
										makeListJson(jsonStr);
									}
								}
							}
						    ,error: function(xhr,status, error){
						    	alert("에러발생");
						    }
						});
					}
					function makeListJson(jsonStr){
						var htmlStr = "";
						htmlStr += "<table>";
						$(jsonStr.results.juso).each(function(){
							htmlStr += "<tr>";
							htmlStr += "<td>"+this.roadAddr+"</td>";
							htmlStr += "<td>"+this.roadAddrPart1+"</td>";
							htmlStr += "<td>"+this.roadAddrPart2+"</td>";
							htmlStr += "<td>"+this.jibunAddr+"</td>";
							htmlStr += "<td>"+this.engAddr+"</td>";
							htmlStr += "<td>"+this.zipNo+"</td>";
							htmlStr += "<td>"+this.admCd+"</td>";
							htmlStr += "<td>"+this.rnMgtSn+"</td>";
							htmlStr += "<td>"+this.bdMgtSn+"</td>";
							htmlStr += "<td>"+this.detBdNmList+"</td>";
							/** API 서비스 제공항목 확대 (2017.02) **/
							htmlStr += "<td>"+this.bdNm+"</td>";
							htmlStr += "<td>"+this.bdKdcd+"</td>";
							htmlStr += "<td>"+this.siNm+"</td>";
							htmlStr += "<td>"+this.sggNm+"</td>";
							htmlStr += "<td>"+this.emdNm+"</td>";
							htmlStr += "<td>"+this.liNm+"</td>";
							htmlStr += "<td>"+this.rn+"</td>";
							htmlStr += "<td>"+this.udrtYn+"</td>";
							htmlStr += "<td>"+this.buldMnnm+"</td>";
							htmlStr += "<td>"+this.buldSlno+"</td>";
							htmlStr += "<td>"+this.mtYn+"</td>";
							htmlStr += "<td>"+this.lnbrMnnm+"</td>";
							htmlStr += "<td>"+this.lnbrSlno+"</td>";
							htmlStr += "<td>"+this.emdNo+"</td>";
							htmlStr += "</tr>";
						});
						htmlStr += "</table>";
						$("#list").html(htmlStr);
					}
						
					//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
					function checkSearchedWord(obj){
						if(obj.value.length >0){
							//특수문자 제거
							var expText = /[%=><]/ ;
							if(expText.test(obj.value) == true){
								alert("특수문자를 입력 할수 없습니다.") ;
								obj.value = obj.value.split(expText).join(""); 
								return false;
							}
							
							//특정문자열(sql예약어의 앞뒤공백포함) 제거
							var sqlArray = new Array(
								//sql 예약어
								"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
					             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
							);
							
							var regex;
							for(var i=0; i<sqlArray.length; i++){
								regex = new RegExp( sqlArray[i] ,"gi") ;
								
								if (regex.test(obj.value) ) {
								    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
									obj.value =obj.value.replace(regex, "");
									return false;
								}
							}
						}
						return true ;
					}

					function enterSearch() {
						var evt_code = (window.netscape) ? ev.which : event.keyCode;
						if (evt_code == 13) {    
							event.keyCode = 0;  
							getAddrLoc(); 
						} 
					}
					</script>
					
				</div>	
			       	 	
			       	 	
			       	 
			</div>
	
	</div>


</body>
	


</html>