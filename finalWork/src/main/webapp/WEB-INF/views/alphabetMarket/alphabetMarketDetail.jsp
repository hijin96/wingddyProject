<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 디테일</title>
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
									
									<input type="hidden" class="btn btn-warning" id="modal-aphReply" ></input>
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
		<p>커션! 알파벳 어쩌구 </p>
		<div class="form-group">
		<label>알파벳</label>
		<div class="input-group">
			<select class="form-control selectric" id="modalAlphabet">
				<c:forEach items="${requestScope.category}" var="r">
					<option value="${r.alphabet}">${r.alphabet} (${r.count})</option>
				</c:forEach>
			</select>
		</div>
		</div>
		<div class="form-group">
		<label>Comment</label>
		<div class="input-group">
			<textarea id="content" class="form-control"></textarea>
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

		$(document).on('click', '.clickFilter', function(){

			
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


			console.log()
		
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
					console.log('테스트댓글등록');
					console.log(result);
					window.location.reload();
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
	
	$(function(){

	   var currentPage = 1;

	   
	   selectPageButton(currentPage);
	   

	   $(document).on('click', '#modal-fake', function(){
		 $('#modal-aphReply').click();
	   })

	})

	
	function selectReplyList(currentPage){


	   $.ajax({
		  url : "replyList.aph",
		  data : {
			 rPage : currentPage,
			 bno : '${requestScope.market.marketBno}',
		  },
		  success : function(list){
	   
			 let value = '<tr><td colspan="6"><h3>comments('+ list.length +')</h3></td><td><button class="btn btn-warning" id="modal-fake">댓글작성</button></td></tr>'

			 if('${sessionScope.loginUser.memberId}' == '${requestScope.market.writer}'){
				value = '<tr><td colspan="6"><h3>comments('+ list.length +')</h3></td><td></td></tr>'
			 }
			 
			 for(let i in list){
				value += '<tr><td><input type="hidden" value="'+ list[i].replyNo +'" id="replyMno"></td>'

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
				   
				   if('${sessionScope.loginUser.memberId}' == '${requestScope.market.writer}'){
					  //console.log('똑같음!');
					  value += '<td><button type="button" class="btn btn-primary btn-sm" onclick="changeAlphabet(this);">바꾸기</button></td></tr>'
				   }
				   else{
					  //console.log('다름!');
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

			btnValue += '<li class="page-item">'
				   + '<a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>'
				   + '</li>';

			for(var i = list.startPage; i <= list.endPage; i++){
				if(i == list.currentPage){

					btnValue += '<li class="page-item active">'
						   + '<a class="page-link" href="#">' + i + '<span class="sr-only">(current)</span></a>'
						   +'</li>';
						   
				}
				else{
					
					btnValue += '<li class="page-item">'
				   		   + '<a class="page-link" href="#">'+ i +'</a>'
				   		   + '</li>';
						   
				}
			}

			btnValue += '<li class="page-item">'
				  	  + '<a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>'
				      + '</li>';

			$('#commentList').html(btnValue);
			selectReplyList(currentPage);
		  }
	   })
	}
	

	function changeAlphabet(btn){
	
        if (confirm('Do you really want to change??')) {
			alert("확인(예)을 누르셨습니다.");


			$.ajax({
				url : 'change.aph',
				data : {
					classNo : '${requestScope.market.classNo}',
					marketMno : '${sessionScope.loginUser.memberNo}',
					marketAlphabet : '${requestScope.market.alphabet}',
					replyMno : $('#replyMno').val(),
					replyAlphabet : $(btn).parent().prev().prev().prev().prev().text()
				},
				success : function(){

				}

			})

        } else {
			alert("취소(아니오)를 누르셨습니다.");
        }
    }
	
	
 </script>



	<!-- Page Specific JS File 
	<script src="${contextPath}/resources/assets/js/page/bootstrap-modal.js"></script>
</html>