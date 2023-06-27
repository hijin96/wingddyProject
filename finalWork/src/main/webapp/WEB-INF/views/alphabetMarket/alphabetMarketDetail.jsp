<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 디테일</title>

<style>
	.tdStyle{
		width: 0px;
	}
</style>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	<div class="main-content">
		
		<section class="section">
			<div class="section-header">
				<h1>Alphabet Market Detail</h1>
			</div>
	
			<div class="section-body">
				<div class="card">
					<div class="card-header text-center">
						<h3>${requestScope.market.title}</h3>
					</div>
					<div class="card-body">
						<div align="right">
							<h6>${requestScope.market.writer}</h6>
							<p>${requestScope.market.createDate}</p>
						</div>
						<div class="article-image">
							<p style="text-align: center; font-size: 150px; margin-top: 70px;">${requestScope.market.alphabet}</p>
						</div>
						<br><br><br>
						<div align="center">
							<pre style="font-size: larger;">${requestScope.market.content}</pre>
						</div>
					</div>
					<div class="card-header">
					</div>
					<div class="card-body">
						
						<div class="card">	
							<div class="card-body p-0">
								<input type="hidden" class="btn btn-warning" id="modal-aphReply" />
								<div class="table-responsive">
									<table class="table table-striped table-md" id="commentsArea">
									</table>
								</div>
							</div>
							<div class="card-footer text-center">
								<nav class="d-inline-block">
									<ul class="pagination mb-0" id="commentList">
									</ul>
								</nav>
							</div>
						</div>
						<div align="center">
							<form action="main.aph">
								<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" /> 
								<button class="btn btn-primary btn-lg" >목록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<script>

</script>

	<!-- 댓글 모달 창-->
	<form class="modal-part" id="modal-login-part">
		<p>주의! 친구가 바꾸기를 눌렀을 때 해당 알파벳이 있어야만 교환할 수 있어요! </p>
		<div class="form-group">
		<label>알파벳</label>
		<div class="input-group">
			<select class="form-control selectric" id="modalAlphabet" required>
				<c:forEach items="${requestScope.category}" var="r">
					<option value="${r.alphabet}">${r.alphabet} (${r.count})</option>
				</c:forEach>
			</select>
		</div>
		</div>
		<div class="form-group">
		<label>Comments</label>
		<div class="input-group">
			<textarea id="content" class="form-control" required></textarea>
		</div>
		</div>
	</form>


	<!-- 댓글 바꾸기 모달 창
	<div class="modal-dialog m-0" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title">Modal Template</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">×</span>
			</button>
		  </div>
		  <div class="modal-body">
			<p>Modal body text goes here.</p>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-primary">Save changes</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  </div>
		</div>
	</div>
-->


	<script>
		var currentPage = 1;

		$(function(){

			selectPageButton(currentPage);
		})

		$(document).on('click', '#modal-fake', function(){
			$('#modal-aphReply').click();
		})
		


		$(document).on('click', '.pagingBtn', function(){


			
			currentPage = $(this).text().charAt(0);

	   
	   		selectPageButton(currentPage);

			
		});

		$(document).on('click', '.preBtn', function(){

			currentPage--;

			//console.log(currentPage);

	   
	   		selectPageButton(currentPage);
		});

		$(document).on('click', '.nextBtn', function(){

			currentPage++;

			//console.log(currentPage);
				
			selectPageButton(currentPage);
		});

		
		$("#modal-aphReply").fireModal({
			title: '댓글등록',
			body: $("#modal-login-part"),
			footerClass: 'bg-whitesmoke',
			autoFocus: false,
			onFormSubmit: function(modal, e, form) {
			// Form Data
			//let form_data = $(e.target).serialize();
			//console.log(form_data)

		
			// DO AJAX HERE
				/*
			let fake_ajax = setTimeout(function() {
				form.stopProgress();
				modal.find('.modal-body').prepend('<div class="alert alert-info">Please check your browser console</div>')
		
				clearInterval(fake_ajax);
			}, 1500);
			*/

			$.ajax({
				url : 'insertReply.aph',
				data : {
					replyWriter : '${sessionScope.loginUser.memberNo}',
					alphabet : $('#modalAlphabet').val(),
					replyContent : $('#content').val(),
					refMarket : '${requestScope.market.marketBno}'
				},
				success : function(result){

					if(result > 0){
						window.location.reload();
					}
					
				}
			})


			e.preventDefault();
			},
			shown: function(modal, form) {
			//console.log(form)
			},
			buttons: [
			{
				text: '등록',
				submit: true,
				class: 'btn btn-primary btn-shadow',
				handler: function(modal) {
				}
			}
			]
		});
		
		

	</script>


<script>
	


	
	function selectReplyList(currentPage){


	   $.ajax({
		  url : "replyList.aph",
		  data : {
			 rPage : currentPage,
			 bno : '${requestScope.market.marketBno}',
		  },
		  success : function(list){

			let value = '';
			
			if('${requestScope.market.sellingStatus}' === 'Y' && '${sessionScope.loginUser.memberId}' != '${requestScope.market.writer}'){ // 팔고있고 댓글
				
				value += '<tr><td colspan="6"><h3>comments('+ list.length +')</h3></td><td><button class="btn btn-warning" id="modal-fake">댓글작성</button></td></tr>'
			}
			else{


				value = '<tr><td colspan="6"><h3>comments('+ list.length +')</h3></td><td></td></tr>'
			}

			 
			 for(let i in list){

				value += '<tr><td class="tdStyle"><input type="hidden" value="'+ list[i].replyNo +'" name="replyNo"></td>'
						+ '<td class="tdStyle"><input type="hidden" value="'+ list[i].replyMno +'" name="replyMno" ></td>'
				   if(list[i].replySelected == 'Y'){
					  value += '<td><div class="badge badge-success">selected</div></td>'
				   }
				   else{
					  value += '<td><div class="badge badge-success"></div></td>'
				   }
				value += '<td  id="replyAlphabet"><h3>'+ list[i].alphabet +'</h3></td>'
					   + '<td>'+ list[i].replyWriter + '</td>'
					   + '<td>' + list[i].replyContent+'</td>'
					   + '<td>'+ list[i].replyDate + '</td>'
				   
				   if('${requestScope.market.sellingStatus}' === 'Y' && '${sessionScope.loginUser.memberId}' == '${requestScope.market.writer}'){
					  
					  value += '<td><button type="button" class="btn btn-primary btn-sm" onclick="changeAlphabet(this);">바꾸기</button></td></tr>'
				   }
				   else{
					  value += '<td></td></tr>'
				   }
			 }

			 $('#commentsArea').html(value);
		  }
	   })
	}

	
	function selectPageButton(currentPage){

	   $.ajax({
		  url : 'replyPaging.aph',
		  data : {
			 rPage : currentPage,
			 bno : '${requestScope.market.marketBno}',
		  },
		  success : function(list){


			let btnValue = '';

			if(currentPage > 1){
			btnValue += '<li class="page-item">'
				   + '<a class="page-link preBtn" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>'
				   + '</li>';
			}

			for(var i = list.startPage; i <= list.endPage; i++){
				if(i == list.currentPage){

					btnValue += '<li class="page-item active">'
						   + '<a class="page-link pagingBtn" href="#" >' + i + '<span class="sr-only">(current)</span></a>'
						   +'</li>';
						   
				}
				else{
					
					btnValue += '<li class="page-item">'
				   		   + '<a class="page-link pagingBtn" href="#">'+ i +'</a>'
				   		   + '</li>';
						   
				}
			}

			if(currentPage < list.maxPage){
				btnValue += '<li class="page-item">'
						+ '<a class="page-link nextBtn " href="#"><i class="fas fa-chevron-right"></i></a>'
						+ '</li>';

			}

			$('#commentList').html(btnValue);
			selectReplyList(currentPage);
		  }
	   })
	}
	

	function changeAlphabet(btn){

        if (confirm('Do you really want to trade it??')) {
			

			$.ajax({
				url : 'change.aph',
				data : {
					classNo : '${requestScope.market.classNo}',
					marketMno : '${sessionScope.loginUser.memberNo}',
					marketAlphabet : '${requestScope.market.alphabet}',
					replyMno : $(btn).parent().parent().find('input[name="replyMno"]').val(),
					replyAlphabet : $(btn).parent().prev().prev().prev().prev().text(),
					marketNo : '${requestScope.market.marketBno}',
					replyNo : $(btn).parent().parent().find('input[name="replyNo"]').val()
				},
				success : function(result){
					if(result == 'statusSuccess'){
						alert("Exchage complete");
						selectPageButton(1);
					}
					else if(result == 'ReplyAlphabet'){
						alert("The frined must've already used the alphabet!!")
					}
					else if(result == 'MarketAlphabet'){
						alert("You don't have the alphabet!!")
					}
					else{
						alert("오류");
					}


					window.location.reload();


				}

			})

        } else {
			alert("취소(아니오)를 누르셨습니다.");
        }
    }
	
	
 </script>



	 <!-- Page Specific JS File  -->
	<script src="${contextPath}/resources/assets/js/page/bootstrap-modal.js"></script>
</html>