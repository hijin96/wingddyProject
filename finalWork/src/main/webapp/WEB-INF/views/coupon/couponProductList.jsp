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
		width : 230px !important;
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
	.inputWidth{
		width : 50% !important;
		margin : 0 !important;
	}
	.modal-custom{
		width : 450px !important;
		height : 200px !important;
	}
	.col-form-label{
		width : 200px !important;
	}
	.modal-body div{
		text-align : center !important;
	}
	#noneCp{
		padding : 100px;
	}
	#warningMsg{
		color : red;
		font-size : 12px !important;
	}
	
	
</style>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
			<div id="header">
				<h3>Coupon Store</h3>
			</div>
			<div id="content-top">
				<div id="content-top1">
					<form action="couponStore" method="post" id="submit_option">
						<select id="orderBy" class="selectric" name="orderBy">
							<option value="coupon_price asc">낮은 가격 순으로 보기</option>
							<option value="coupon_price desc">높은 가격 순으로 보기</option>
							<option value="amount">남은 수량 적은 순으로 보기</option>
							<input type="hidden" name="cPage" value="${pi.currentPage}"/>
							<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
						</select>
					</form>	
				</div>
				<div id="content-top2">
					<c:choose>
						<c:when test="${loginUser.memberType eq  'T'}">
							<form id="teacher-form" action="enrollForm.cp" method="post">
								<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
								<input type="hidden" name="mno" value="${loginUser.memberNo}" />
								<button type="button" id="studentCplist" class="btn btn-primary" >학생 보유 쿠폰 조회</button>
								<button type="submit" class="btn btn-warning" >상품 등록하기</button>
							</form>
						</c:when>
						<c:when test="${loginUser.memberType eq 'S' }">
							<form action="myList.cp" method="post">
								<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
								<input type="hidden" name="memberNo" value="${loginUser.memberNo}" />
								<button type="submit" class="btn btn-warning" >내 보유 쿠폰 확인하기</button>
							</form>
						</c:when>
					</c:choose>
				</div>
			</div>
			
			<div id="contents" class="row">
				<c:forEach var="cp" items="${cplist}">
					
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
	               		<article class="article">
	                 		<div class="article-header">
                   				<img alt="img" src="${contextPath}/${cp.filePath}" class="article-image">
	                 		</div>
	                		<div class="article-details">
	                			<h5>${cp.productName}</h5>
	                			<p class="couponPrice">쿠폰 ${cp.couponPrice}개</p>
	                			<hr>
	                   			<p class="productContent">${cp.productContent}</p>
	                   			<div class="article-cta">                           
	                    			<div>수량 : ${cp.amount}개</div>
	                    			<c:if test="${loginUser.memberType eq 'S'}">
	                    				<button class="btn btn-primary" onclick="buyCp(${cp.cpNo}, '${cp.productName}', ${cp.amount}, ${cp.couponPrice })" data-toggle="modal" data-target="#buyModal">교환하기</button>
	                    			</c:if>
	                   			</div>
	                 		</div>
	               		</article>
	             	</div>
             	</c:forEach>
             	
			</div>
			
			<div class="modal fade" id="buyModal">
				<div class="modal-dialog modal-custom">
					<div class="modal-content">
						
						<form action="buy.cp" method="POST">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">쿠폰으로 상품 교환하기</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<hr>
							
							<!-- Modal body -->
							<div class="modal-body">
								<div class="form-group row">
									<div class="col-form-label col-md-3" >교환할 수량</div>
									<input id="buyAmount" type="number" name="amount" class="form-control inputWidth" min="0" />
									<input type="hidden" name="memberNo" value="${loginUser.memberNo}" />
									<input type="hidden" name="cpNo" />
									<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
								</div>
								<div>
									<p id="myCount">현재 보유 쿠폰은 100장입니다.</p>
									<p id="productInfo"></p>
									<p id="warningMsg"></p>
								</div>
							</div>
							
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
								<button type="submit" id="btn-buyCp" class="btn btn-success" disabled="disabled">교환</button>
							</div>
						</form>
					
					</div>
				</div>
			</div>

			
			
			
			
			
			
			
			
			
			<div id="paging">
				<form id="form-movePage" action="couponStore" method="post" >
					<div class="card-body text-center">
	                	<nav class="d-inline-block">
	                    	<ul class="pagination">
                    			<c:choose>
	                    			<c:when test="${pi.currentPage eq 1}">
	                    				<li class="page-item disabled">
			                          		<a class="page-link" >Previous</a>
		                        		</li>
	                          		</c:when>
	                          		<c:otherwise>
		                          		<li class="page-item active">
			                          		<a class="page-link page-pv" >Previous</a>
		                        		</li>
	                          		</c:otherwise>
                          		</c:choose>
                          		<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                          			
                          			<c:choose>
                          				<c:when test="${pi.currentPage eq p}"> 
		                        			<li class="page-item disabled"><a class="page-link page-number" href="#">${p}</a></li>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<li class="page-item active"><a class="page-link page-number" href="#">${p}</a></li>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </c:forEach>
		                       
		                        
		                        <c:choose>
			                        <c:when test="${pi.currentPage eq pi.maxPage}">
				                        <li class="page-item disabled">
				                        	<a class="page-link">Next</a>
				                        </li>
			                        </c:when>
			                        <c:otherwise>
		                        	    <li class="page-item active">
				                        	<a class="page-link page-nt">Next</a>
				                        </li>
			                        </c:otherwise>
		                        </c:choose>
	                      	</ul>
	                    </nav>
	                 </div>
                 </form>
			</div>




		
		</div>
	</div>
</div>

<script>
	var memberNo = ${loginUser.memberNo};
	var memberType = '${loginUser.memberType}';
	var cno = ${requestScope.classroom.classNo};
	var cPage = null;
	//console.log(memberNo, memberType, cno);
	
	$('.page-number').on('click', function(){
		console.log($(this).text());
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + $(this).text() + '"/>')
		$('#form-movePage').submit();
	})
		
	$('.page-pv').on('click', function(){
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + (${pi.currentPage} - 1) + '"/>');
		$('#form-movePage').submit();
	})
		
	$('.page-nt').on('click', function(){
		console.log(${pi.currentPage}+1);
		$(this).append('<input type="hidden" name="cno" value="' + cno + '" /><input type="hidden" name="cPage" value="' + (${pi.currentPage} + 1) + '"/>');
		$('#form-movePage').submit();
	})
	
	$('select[name=orderBy]').on("change", function(){
		$('#submit_option').submit();
	})
	
	// 학생이 상품 구매버튼 눌렀을 때 정보출력 (학생 보유 상품 insert, 상품 목록 수량 update, 학생 보유 쿠폰 update)
	function buyCp(cpNo, cpName, amount, price){
		console.log(cpNo);
		let myCoupon = 0;
		$.ajax({
			url : 'couponCount.cp',
			data : {'memberNo' : memberNo, 'classNo' : cno},
			success : function(result){
				console.log(result);
				myCoupon = result.couponCount;
				$('#myCount').html('현재 보유 쿠폰은 ' + myCoupon + '개입니다.');
			}
		})
		
		// input type=number 최대값 설정
		$('#buyAmount').attr('max', amount);
		
		$('input[name=cpNo]').attr('value', cpNo);
		
		// input 값 바뀔 때마다 '~상품 몇 개 구입할 거냐' 문구 변경
		$('#buyAmount').on('input', function(){
			$('#productInfo').html('[' + cpName + ']' + ' ' + $(this).val() + '개를 구입하시겠습니까?');
			
			if(myCoupon < $(this).val() * price){
				//console.log('못 사');
				$('#warningMsg').html('보유한 쿠폰보다 많은 상품은 교환할 수 없습니다!');
				
			} else {
				$('#warningMsg').html('');
				// 조건 불만족이면 submit 버튼 활성화
				$('#btn-buyCp').prop('disabled', '');
			}
			
		})
	}
	
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  	$(this).find('form')[0].reset();
	  	$('#productInfo').html('');
	  	$('#warningMsg').html('');
	});
	
	$(function(){
		var ob = "${orderBy}";
		//console.log(ob);
		//console.log($('#orderBy').val(ob));
		$('#orderBy').val("${orderBy}").prop("selected", true);
		
	})
	
	// 학생 보유 쿠폰 조회 페이지로
	$('#studentCplist').on('click', function(){
		$('#teacher-form').attr('action', 'selectSlist.cp');
		$('#teacher-form').submit();
		
	})
	


</script>






</body>
</html>