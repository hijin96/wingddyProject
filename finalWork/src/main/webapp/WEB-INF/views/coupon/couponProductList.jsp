<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CouponProduct</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	.productContent{
		font-size : 13px !important;
	}
	.text-center{
		margin : auto !important;
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
				<c:forEach var="cp" items="${cplist}">
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
	               		<article class="article">
	                 		<div class="article-header">
	                   			<div class="article-image" data-background="assets/img/news/img04.jpg" style="background-image: url(&quot;assets/img/news/img04.jpg&quot;);"></div>
	                 		</div>
	                		<div class="article-details">
	                			<h5>${cp.productName}</h5>
	                			<p class="couponPrice">쿠폰 ${cp.couponPrice}개</p>
	                			<hr>
	                   			<p class="productContent">${cp.productContent}</p>
	                   			<div class="article-cta">                           
	                    			<div>수량 : ${cp.amount}개</div>
	                    			<button class="btn btn-primary">교환하기</button>
	                   			</div>
	                 		</div>
	               		</article>
	             	</div>
             	</c:forEach>
             	
             	
             	
			</div>
			<div id="paging">
				<form id="form-movePage" action="couponStore" method="post" class="text-center">
					<div class="card-body">
	                	<nav aria-label="...">
	                    	<ul class="pagination">
                    			<c:choose>
	                    			<c:when test="${pi.currentPage eq 1}">
	                    				<li class="page-item disabled">
			                          		<a class="page-link" >Previous</a>
		                        		</li>
	                          		</c:when>
	                          		<c:otherwise>
		                          		<li class="page-item">
			                          		<a class="page-link page-pv" >Previous</a>
		                        		</li>
	                          		</c:otherwise>
                          		</c:choose>
                          		<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                          			<c:choose>
                          				<c:when test="${pi.currentPage eq p}">
		                        			<li class="page-item active"><a class="page-link page-number" href="#">${p}</a></li>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<li class="page-item"><a class="page-link page-number" href="#">${p}</a></li>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </c:forEach>
		                        <!-- 
		                        <li class="page-item active">
		                        	<a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
		                        </li>
		                        <li class="page-item"><a class="page-link" href="#">3</a></li>
		                        -->
		                        
		                        <c:choose>
			                        <c:when test="${pi.currentPage eq pi.maxPage}">
				                        <li class="page-item disabled">
				                        	<a class="page-link">Next</a>
				                        </li>
			                        </c:when>
			                        <c:otherwise>
		                        	    <li class="page-item">
				                        	<a class="page-link page-nt">Next</a>
				                        </li>
			                        </c:otherwise>
		                        </c:choose>
	                      	</ul>
	                    </nav>
	                 </div>
                 <</form>
			</div>
		
		
		
		</div>
	</div>
</div>

<script>
	var memberNo = ${loginUser.memberNo};
	var memberType = '${loginUser.memberType}';
	var cno = ${requestScope.classroom.classNo};
	var cPage = null;
	console.log(memberNo, memberType, cno);
	
	$('.page-number').on('click', function(){
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + $(this).text() + '"/>')
		$('#form-movePage').submit();
		
	})
		
	$('.page-pv').on('click', function(){
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + (${pi.currentPage} - 1) + '"/>');
		$('#form-movePage').submit();
	})
		
	$('.page-nt').on('click', function(){
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + (${pi.currentPage} + 1) + '"/>');
		$('#form-movePage').submit();
	})
	
	


</script>






</body>
</html>