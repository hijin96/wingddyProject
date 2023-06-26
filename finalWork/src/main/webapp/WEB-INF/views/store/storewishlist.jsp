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
<title>위시리스트</title>
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
								<div class="table-main table-responsive">
									<span>*이미지 클릭시 상품상세페이지로 이동합니다.</span>
									<table class="table table-striped" >
										<tbody>
											<tr>
												<th class="p-0 text-center">
													<div class="custom-checkbox custom-control" >
														<input type="checkbox" data-checkboxes="mygroup"
															data-checkbox-role="dad" class="custom-control-input"
															id="wishList-all" name="wishList-all"
															onclick="wishListAll();"> 
															<label for="wishList-all" class="custom-control-label"
															name="wishList-all">&nbsp;</label>
													</div>
												</th>
												<th>상품번호</th>
												<th>상품이미지</th>
												<th>상품명</th>
												<th>가격</th>
												
											</tr>
												<c:forEach items="${wish}" var="wish" varStatus="status"> 
												<tr>
													<td class="p-0 text-center">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" name="wishList"
																value="${status.index}" id="checkbox${status.index}">
															<label for="checkbox${status.index}"
																class="custom-control-label">&nbsp;</label>
														</div>
													</td>
													<td id="wishNo${status.index}"> ${wish.spNo }</td>				
													<td class="thumbnail-img")>
														<a href="http://localhost:8007/wingddy/storedetail?spNo=${wish.spNo }" >
														<img class="img-fluid" src="./${wish.filePath}/${wish.changeName}"  alt=""/>
														</a> 
													</td>
													<td class="align-middle"> ${wish.spName}</td>
													<td class="price-pr">${wish.spPrice }</td>
													<input type="hidden" id="spNo${status.index}" name="spNo" value="${wish.spNo }">
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<input type="button" value="삭제하기" name="wishDelete" class="btn btn-info" onclick="wishDelete();" >
								<!-- 	<input type="button" value="장바구니추가" name="updateCart" class="btn btn-primary" onclick="updateCart();" > -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Wishlist -->
				<script>
				
				function wishListAll() {
					if ($('#wishList-all').is(":checked")) {
						$('input[name=wishList]').prop("checked", true);
					} else {
						$('input[name=wishList]').prop("checked", false);
					}
				}

				let checkAll = document.getElementsByName('wishList');

				$(document).on('click',checkAll,function() {
									//체크박스의 길이

									let checkLength = checkAll.length;

									//선택한 체크박스의 길이
									let lengthChecked = $("input:checkbox[name=wishList]:checked").length;

									if (lengthChecked == checkLength) {
										$('#wishList-all').prop("checked", true);
									} else {
										$('#wishList-all')
												.prop("checked", false);
									}

								})
			</script>
			<script>
				
				function wishDelete() {
					let wishNos = [];
					let checkAll = $('input[name=wishList]').filter(':checked');
					  for (var i = 0; i < checkAll.length; i++) {
				             let index = checkAll[i].value;
				           	 let wishNo = $('#wishNo'+ index).text();
				           
				           	 wishNos.push(wishNo);
				             
					  }
					
					  console.log('wishNos: ' + wishNos)
					  $.ajax({
			            	url:'wishCheckDelete'
			            	,data:{spNo : wishNos}
					   		,type: 'POST'
					   		//,dataType:'json'
					   		,traditional: true
			          	,success : function(data){
			          		if(data == "1"){
			          			alert('삭제성공');
			          			
			          		} else {
			          			console.log('에러');
			          			alert('삭제실패');
			          		}
			          		
			          	},error:function(){
			          		console.log('에러');
			          		alert('에러');
			          	}  
					  
					  
					  });
				}
				
				
				
				
				</script>

			</div>
		</div>
	</div>

</body>
</html>