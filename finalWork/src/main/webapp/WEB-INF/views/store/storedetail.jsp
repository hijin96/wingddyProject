<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>상품상세보기</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="resources/images/apple-touch-icon.png">

<style>
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor__editable {
	min-height: 300px;
}
.card-outline-secondary{
	width: 100%;
	
	margin: 0 auto;}
</style>
<meta charset="UTF-8">
<title>상품디테일</title>
</head>
<body>

	<div id="app">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br> <br> <br> <br> <br> <br>
				<script src="/wingddy/resources/ckeditor/ckeditor.js"></script>
				<form  method="POST" id="form">
					<div class="shop-detail-box-main">
						<div class="container">
							<div class="row">
								
								<div class="col-xl-5 col-lg-5 col-md-6">
									<div class="carousel-item active">
										<img class="d-block w-100" src="${contextPath}/${s.filePath}/${s.changeName}" alt="상품썸네일">
									</div>
								</div>
								<div class="col-xl-7 col-lg-7 col-md-6">
									<div class="single-product-details">
										<input type="hidden" name="spName" value="${s.spName}">
										<h2>${s.spName}</h2>
										<h5>
											<span><input type="hidden" value="${s.spPrice}" name="spPrice">${s.spPrice}원<span>
										</h5>
										<p class="available-stock">
											<span><input type="hidden"  id="spNo" name="spNo" value= "${s.spNo }"> ${s.spNo }</span>
											<span> 남은수량 ${s.amount }개</span>
										<p>
										<h6>한줄 소개</h6>
										<p>${s.spOnecom }</p>
										<ul>
											<li>
												<div class="form-group quantity-box">
													<label for="buyCount" class="control-label">수량</label>
													<input class="form-control"  min="1" max="100" type="number" name="buyCount" id="buyCount">
												</div>
											</li>
										</ul>
										<div class="price-box-bar">
											<div class="cart-and-bay-btn">
												<input type="hidden" name="fileNo" value="${s.fileNo }">
												<input type="hidden" name="changeName" value="${s.changeName}">
												<c:if test="${not empty loginUser&& loginUser.memberType eq ('A')}">
													<button type='button' onclick="edit()" class="btn btn-warning" >수정</button>
												</c:if>
												<button type='button' onclick="buyCart()" class="btn btn-info" >구매하기</button>
												<button class="btn btn-primary trigger--fire-modal-6" id="cart" type="button">장바구니!!</button>
													<div class="add-to-btn">
														<div class="add-comp">
															<div class="btn hvr-hover" onclick="wishList();"> 
															<i class="fas fa-heart"></i>위시리스트 </div>
														</div>
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--콘텐츠영역  -->
						<div class="ck-body-wrapper">
							<div id="editor">${s.spContent }</div>
						</div>
					</div>
				</form>	
						<!--장바구니 모달창 -->
						<script>
							let spNo = ${s.spNo};
							let spPrice = ${s.spPrice};
							let emptyloginUser = ${not empty loginUser};
							let amount =${s.amount };
							let buyCount = $('#buyCount');
							$('#cart').click(function(){
								if( buyCount.val()<'0'||buyCount.val()==''||buyCount.val()==null){
									alert("수량을체크해주세요");
									return;
								}
								if(emptyloginUser== true){
									$.ajax({
										url: 'storecart.do',
										data: { spNo: spNo,
											buyCount:buyCount.val(),
											spPrice: spPrice
										},
										type: 'POST',
										success: function(data){
											if(data=="1"){
												$("#cart").fireModal({
													title: '장바구니',
														body: '<p>장바구니담기성공.</p>',
														created: function(modal) {
															modal.find('.modal-footer').prepend('<div class="mr-auto"><a href="cartDirect">장바구니페이지로 이동</a></div>');
														},
														type: 'POST'
														, buttons: [
															{ text: '장바구니 삭제',
															class: 'btn btn-primary btn-shadow', 
															submit: true,
															handler: function(modal) {
																$.ajax({
																		url: 'deletestorecart.do',
																		data: { spNo: spNo},
																		type: 'POST',
																		success: function(data){
																			if(data=='1'){
																				alert('삭제성공');
																				}else{
																					alert('삭제실패');
																				}
																		},error:function(){
																			alert('에러');
																		}
																		}); 
																	}
																}
															]  
												})//model끝
											}
										}//succ끝
										,error: function(){
											alert("장바구니담기 실패");
										}

									});//Ajax끝
								}else{
									alert("로그인 후 이용해주세요");
								}
							});
							
							function buyCart(){
								console.log('amount : '+ amount);
								console.log('buy:  ' + buyCount.val());
								if(emptyloginUser==false){
									alert("구매는 로그인후 이용하세요");
									window.location.href='http://localhost:8007/wingddy/'
									
								}
								if( buyCount.val()<'0'||buyCount.val()==''||buyCount.val()==null){
									alert("수량을체크해주세요");
									return;
								}
								if(amount<Number(buyCount.val())){
									alert("구매수량이 판매수량보다 많습니다. 수량을 수정해주세요");
								}else{
									//document.getElementById('form').submit();
									var form = document.getElementById('form')
									form.action = "storebuybasket"
									form.submit();
									
								}
							}
							function wishList(){
								console.log('위시리스트클릭');
								$.ajax({
									url:'storeWishListInsert'
									,data : {
										spNo:spNo
									}
									,type:'get'
									,success : function(data){
										if(data=="1"){
											alert('위시리스트에 담겼습니다.');
										}else{
											alert("위시리스트 담기 실패, 이미 담겨있는지 확인해보세요");
										}
									
									},error: function(error){
										console.log()
									}
										
								});
							}
							function edit(){
								var form = document.getElementById('form')
								form.action = "editStore.do"
								form.submit();
								
							}
					     </script>
				<!--댓글란-->
				<div class="row my-5">
					<div class="card card-outline-secondary my-4">
						<div class="card-header">
							<h2>상품후기</h2>
						</div>
					
						<div class="card-body">
							<div class="form-group">
		                     	<label>댓글등록</label>
		                     	<textarea class="form-control" id="reviewComment"></textarea>
		                     	<br>
		                     	<button type="button" onclick="review()" class="buttons btn btn-outline-primary">등록</button>
		                     	<button type="reset" class="buttons btn btn-outline-danger">취소</button>
                   			</div>
                   			<hr>
              
							<div class="media col-mb-3">
								<div class="media-body" id="reviewList">
								</div>
							</div>
								<a href="#" class="btn hvr-hover">상품후기더보기</a>
						</div>
					</div>
				</div>
				 <script>
							function review(){
								if($('#reviewComment').val().trim() !=''){
									$.ajax({
										url:'insertReview.bo'
										,data: { spNo: '${s.spNo}'
												,memberNo : '${loginUser.memberNo}'
												,reCom: $('#reviewComment').val()
											  }
										,success : 
											function(reviewInsert){
											if(reviewInsert=="1"){
												alert("작성성공");
												$('#reviewComment').val('')
											}else{
												alert("작성실패,구매자만 작성가능합니다.");
											}
										},error: function(){
											alert("에러");
										}
									});
								}
							}
							$(function(){
								selectReviewList();
								setInterval(selectReviewList, 5000);
							})
							function selectReviewList(){
								$.ajax({
									 url:'rlist.do'
									,data:{
										spNo:'${s.spNo}'
									},success: function(list){
										let value=""
										for (let i in list){
											value+='<p>'+list[i].reCom+'</p>'
													+'<small class="text-muted col-sm-6 col-md-8">'+list[i].reDate+'</small>'
													+'<small class="text-muted col-6 col-md-4">'+list[i].memberName+'</small>'
													+'<hr>'
										};
										$('#reviewList').html(value);
										
									},error: function(){
										console.log('댓글 실패');
									}
								})
								
							}
					</script>





			</div>
</body>
</html>