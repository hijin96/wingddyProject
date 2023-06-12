<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 알파벳</title>
</head>
<body>
<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
		
		    <section class="section">
		        <div class="section-header">
		     		<h1>My Alphabet</h1>
		        </div>
				

		        <div class="section-body">
					<div class="card">
						<div class="card-body">
							<div class="text-primary mb-2" id="gachaCount">내 뽑기 갯수 : 5 </div>
							<div class="text-primary mb-2" id="couponCount">내 쿠폰 갯수 : 3</div>
							<div class="text-primary mb-2" id="totalCouponCount">누적 쿠폰 갯수 : 12</div>
							<div align="right">
								<a href="#"class="btn btn-primary" id="gachaBtn">알파벳 뽑기</a>
								<a href="#"class="btn btn-primary">단어 만들기</a>
							</div>
						</div>
						<hr>
						<div class="card-body">
							<div class="row" id="alphabetList">
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<article class="article article-style-b">
										<div class="article-header">
											<div align="right">
											   <div class="article-badge">
												  <div class="article-badge-item bg-danger">9</div>
											   </div>
											</div>   
											<div class="article-image">
											   <p style="text-align: center; font-size: 150px; margin-top: 70px;">A</p>
											</div>
										</div>
									</article>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<article class="article article-style-b">
										<div class="article-header">
											<div align="right">
											   <div class="article-badge">
												  <div class="article-badge-item bg-danger">9</div>
											   </div>
											</div>   
											<div class="article-image">
											   <p style="text-align: center; font-size: 150px; margin-top: 70px;">A</p>
											</div>
										</div>
									</article>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<article class="article article-style-b">
										<div class="article-header">
											<div align="right">
											   <div class="article-badge">
												  <div class="article-badge-item bg-danger">9</div>
											   </div>
											</div>   
											<div class="article-image">
											   <p style="text-align: center; font-size: 150px; margin-top: 70px;">A</p>
											</div>
										</div>
									</article>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<article class="article article-style-b">
										<div class="article-header">
											<div align="right">
											   <div class="article-badge">
												  <div class="article-badge-item bg-danger">9</div>
											   </div>
											</div>   
											<div class="article-image">
											   <p style="text-align: center; font-size: 150px; margin-top: 70px;">A</p>
											</div>
										</div>
									</article>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3">
									<article class="article article-style-b">
										<div class="article-header">
											<div align="right">
											   <div class="article-badge">
												  <div class="article-badge-item bg-danger">9</div>
											   </div>
											</div>   
											<div class="article-image">
											   <p style="text-align: center; font-size: 150px; margin-top: 70px;">A</p>
											</div>
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>

		      	</div>
		    </section>
	    </div>
</div>

<script>



	$('#gachaBtn').click(function(){
		
	})

	$(function(){

		myAlphabet();
		myCount();
	})

	function myCount(){

		$.ajax({
			url : "myCount.aph",
			data : {
				classNo : '${requestScope.classroom.classNo}',
				memberNo : '${sessionScope.loginUser.memberNo}'		
			},
			success : function(result){

				console.log("dfsdfsdf");
				console.log(result);
				$('#gachaCount').text('내 뽑기 갯수 : ' + result.gachaCount);
				$('#couponCount').text('내 쿠폰 갯수 : ' + result.couponCount);
				$('#totalCouponCount').text('누적 쿠폰 갯수 : ' + result.totalCouponCount);
			}
		})
	}



	function myAlphabet(){

		$.ajax({
			url : "myAlphabetList.aph",
			data : {
				cno : '${requestScope.classroom.classNo}',
				mno : '${sessionScope.loginUser.memberNo}'		
			},
			success : function(list){

				var value = '';

				for(let i in list){

					
					value +='<div class="col-12 col-sm-6 col-md-6 col-lg-3"><article class="article article-style-b"><div class="article-header"><div align="right">'
						   +'<div class="article-badge"><div class="article-badge-item bg-danger">' + list[i].count + '</div></div></div> <div class="article-image">'
						   +'<p style="text-align: center; font-size: 150px; margin-top: 70px;">'+ list[i].alphabet + '</p></div></div></article></div>'

						   
				}
				

				$('#alphabetList').html(value);
			}
		})
	}
</script>

</body>
</html>