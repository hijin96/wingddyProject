<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CouponProduct</title>
<style>
	#header{
		margin-bottom : 50px !important;
	}
	#content-top{
		width : 100% !important;
		margin-bottom : 30px !important; 
	}
	#content-top div{
		display : inline-block !important;
	}
	#content-top1{
		width : 85% !important;
	}
	.selectric{
		width : 200px !important;
	}
	.article-cta div{
		display : inline-block !important;
		font-size : 12px !important;
		text-align : left !important;
		width : 50% !important;
	}
	.couponPrice{
		font-size : 12px;
		margin : 0 !important;
	}
	.article-details{
		padding : 13px !important;
	}
	.article-details hr{
		margin-top : 5px !important;
		margin-bottom : 5px !important;
	}
	
	
</style>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
			<div id="header">
				<h1>Coupon Store</h1>
			</div>
			<div id="content-top">
				<div id="content-top1">
					<select class="selectric">
						<option>거래 가능 상품만 보기</option>
						<option>낮은 가격 순으로 보기</option>
					</select>
				</div>
				<div id="content-top2">
					<c:if test="${loginUser.memberType eq  'T'}">
						<button class="btn btn-warning">상품 등록하기</button>
					</c:if>
				</div>
			</div>
			<div id="contents" class="row">
				
				<div class="col-12 col-sm-6 col-md-6 col-lg-3">
               		<article class="article">
                 		<div class="article-header">
                   			<div class="article-image" data-background="assets/img/news/img04.jpg" style="background-image: url(&quot;assets/img/news/img04.jpg&quot;);"></div>
                 		</div>
                		<div class="article-details">
                			<h5>상품이름</h5>
                			<p class="couponPrice">쿠폰 2개</p>
                			<hr>
                   			<p>Duis aute irure dolor in reprehenderit in voluptate velit esse
                   			cillum dolore eu fugiat nulla pariatur. </p>
                   			<div class="article-cta">                           
                    			<div>수량 : 10개</div>
                    			<button class="btn btn-primary">교환하기</button>
                   			</div>
                 		</div>
               		</article>
             	</div>
             	
             	
             	
			</div>
		
		
		
		
		</div>
	</div>
</div>

<script>
	var memberNo = ${loginUser.memberNo};
	var memberType = '${loginUser.memberType}';
	//var classNo = ${reqeustScope.classroom.classNo};
	//console.log(classNo);

	console.log(${cpList});



</script>






</body>
</html>