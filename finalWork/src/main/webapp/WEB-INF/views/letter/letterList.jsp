<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
	input[type="checkbox"] {
		border-radius: 4px !important;
		cursor: pointer !important;
		height: 16px !important;
		width: 16px !important;
		padding-bottom: 10px !important;
		border: 0px !important;
	}

	.letterDetailView:hover{
		cursor: pointer;
		background-color: rgb(240, 240, 240) !important;
	}

</style>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>Letter Box</h1>
		        </div>

	
				<div class="card-body">
					<div align="right">
						<form action="enroll.le" method="post">
							<input type="hidden" name="cno" value="${requestScope.classroom.classNo}">
							<input type="hidden" name="classNo" value="${requestScope.classroom.classNo}">
							<input type="hidden" name="sender" value="${sessionScope.loginUser.memberNo}">
							<button class="btn btn-primary">write</button>
						</form>
						
					</div>
				</div>

		
				<div class="section-body">
					<div class="card">
						
						<div class="card-body">
							<div class="row">
								<div class="col-12">
								  <div class="card">
									<div class="card-header">
									  <h4>받은 쪽지</h4>
									  <div class="card-header-form">
										
										  <div class="input-group">
											<input type="text" class="form-control" placeholder="Search" id="receivedKeyword">
											<div class="input-group-btn">
											  <button type="button" class="btn btn-primary" id="receivedKeywordBtn"><i class="fas fa-search"></i></button>
											</div>
										  </div>
										
									  </div>
									</div>
									<div class="card-body p-0">
									  <div class="table-responsive">
										<table class="table table-striped text-center" id="receivedLetterArea">
								
											
										</table>

										<div class="card-footer text-center">
											<nav class="d-inline-block">
												<ul class="pagination mb-0" id="receivedPagingArea">
		
												</ul>
											</nav>
										</div>

									  </div>
									</div>
								  </div>
								</div>
							  </div>
						</div>
						
					</div>
		      	</div>
				<br>
				<br>
				<div class="section-body">
					<div class="card">
						
						<div class="card-body">
							<div class="row">
								<div class="col-12">
								  <div class="card">
									<div class="card-header">
									  <h4>보낸 쪽지</h4>
									  <div class="card-header-form">
										
										<div class="input-group">
										<input type="text" class="form-control" placeholder="Search"  id="sentKeyword">
										<div class="input-group-btn">
											<button class="btn btn-primary" id="sentKeywordBtn" ><i class="fas fa-search"></i></button>
										</div>
										</div>
										
									  </div>
									</div>
									<div class="card-body p-0">
									  <div class="table-responsive">
										<table class="table table-striped text-center" id="sentLetterArea">

										</table>
										<div class="card-footer text-center">
											<nav class="d-inline-block">
												<ul class="pagination mb-0" id="sentPagingArea">
		
												</ul>
											</nav>
										</div>
									  </div>
									</div>
								  </div>
								</div>
							  </div>
						</div>
						
					</div>
		      	</div>
		    </section>
	    </div>
</div>
<form action="detail.le" method="post" id="moveToLetterDatail">
	<input type="hidden" name="cno" value="${requestScope.classroom.classNo}">
	<input type="hidden" name="letterNo">
	<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo}">
</form>







	<script>

		var currentPage = 1;


		$(function(){
			receivedPaging(currentPage);
			sentPaging(currentPage);
		})


		$(document).on('click', '.receivedPagingBtn', function(){

			currentPage = $(this).text().charAt(0);

			receivedPaging(currentPage);
		});

		$(document).on('click', '.sentPagingBtn', function(){

			currentPage = $(this).text().charAt(0);

			sentPaging(currentPage);
		});

		$(document).on('click', '.receivedPreBtn', function(){

			currentPage--;

			receivedPaging(currentPage);
		});

		$(document).on('click', '.receivedNextBtn', function(){

			currentPage++;

			receivedPaging(currentPage);
		});

		$(document).on('click', '.sentPreBtn', function(){

			currentPage--;

			sentPaging(currentPage);
		});

		$(document).on('click', '.sentNextBtn', function(){

			currentPage++;

			sentPaging(currentPage);
		});
		







		function receivedCheckboxAll(){
			if($('#receivedCheckboxAll').is(":checked")){
				$('.receivedCheckbox').prop("checked", true);
			}
			else{
				$('.receivedCheckbox').prop("checked", false);
			}
		}


		$(document).on('click', '.receivedCheckbox', function(){

			var total = $(".receivedCheckbox").length;
			var checkNum = $(".receivedCheckbox:checked").length;


			if(total == checkNum){
				$('#receivedCheckboxAll').prop("checked", true);
			}
			else{
				$('#receivedCheckboxAll').prop("checked", false);
			}
			
			
		})


		function sentCheckboxAll(){
			if($('#sentCheckboxAll').is(":checked")){
				$('.sentCheckbox').prop("checked", true);
			}
			else{
				$('.sentCheckbox').prop("checked", false);
			}
		}


		$(document).on('click', '.sentCheckbox', function(){

			var total = $(".sentCheckbox").length;
			var checkNum = $(".sentCheckbox:checked").length;


			if(total == checkNum){
				$('#sentCheckboxAll').prop("checked", true);
			}
			else{
				$('#sentCheckboxAll').prop("checked", false);
			}
			
			
		})

		$('#receivedKeywordBtn').click(function(){
			receivedPaging(1);
		})

		$('#sentKeywordBtn').click(function(){
			sentPaging(1);
		})



		function receivedPaging(currentPage){

			$.ajax({
				url : 'receivedPaging.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					recipient : '${sessionScope.loginUser.memberNo}',
					keyword : $('#receivedKeyword').val()
				},
				success : function(list){
					//console.log("received페이징");
					//console.log(list);


					let btnValue = '';

					if(currentPage > 1){
					btnValue += '<li class="page-item">'
							  + '<a class="page-link reveivedPreBtn" tabindex="-1"><i class="fas fa-chevron-left"></i></a>'
						      + '</li>';
					}
			
			
					for(var i = list.startPage; i <= list.endPage; i++){
						if(i == list.currentPage){
							btnValue += '<li class="page-item active">'
									  + '<a class="page-link receivedPagingBtn">' + i + '<span class="sr-only">(current)</span></a>'
									  +'</li>';
						}	   
						else{
							btnValue += '<li class="page-item">'
									+ '<a class="page-link receivedPagingBtn">'+ i +'</a>'
									+ '</li>';
						}
					}
				
			
					if(currentPage < list.maxPage){
						btnValue += '<li class="page-item">'
								+ '<a class="page-link receivedNextBtn"><i class="fas fa-chevron-right"></i></a>'
								+ '</li>';
					}


					$('#receivedPagingArea').html(btnValue);
					receivedLetter(currentPage);
				}
			})

		}


		function receivedLetter(currentPage){

			$.ajax({
				url : 'recevied.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					recipient : '${sessionScope.loginUser.memberNo}',
					keyword : $('#receivedKeyword').val()
				},
				success : function(list){

					//console.log('rec');
					//console.log(list);

					var value = '<tr align="left"><td colspan="5"><button class="btn btn-primary" id="deleteLetter">삭제</button></td></tr>'
							  + '<tr><th class="p-0 text-center"><div class="form-check">'
							  + '<input type="checkbox" class="form-check-input" id="receivedCheckboxAll" onClick="receivedCheckboxAll();"></div></th>'
							  + '<th>From</th><th>Detail</th><th>Date</th><th>Status</th></tr>';


					for(let i in list){
						value += '<tr class="letterDetailView"><td class="p-0 text-center"><div class="form-check">'
							   + '<input type="checkbox" class="form-check-input receivedCheckbox" value="'+ list[i].letterNo +'">'
							   + '</div></td>';


						if(list[i].anonymous == 'Y'){
							value += '<td>'+ '<b>Manitto</b>' +'</td>';
						}
						else if(list[i].toManitto  == 'Y'){
							value += '<td>'+ '<b>Manitti</b>' +'</td>';
						}
						else{
							value += '<td>'+ list[i].sender +'</td>';
						}

						value += '<td>' + list[i].letterContent + '</td>'
							   + '<td>' + list[i].sendDate +'</td>';

						if(list[i].readCheck == 'Y'){
							value += '<td><div class="badge badge-info">확인완료</div></td></tr>'
						}
						else{
							value += '<td><div class="badge badge-info"></div></td></tr>'
						}
					}

					$('#receivedLetterArea').html(value);

				}
			})

		}


		function sentPaging(currentPage){

			$.ajax({
				url : 'sentPaging.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					sender : '${sessionScope.loginUser.memberNo}',
					keyword : $('#sentKeyword').val()
				},
				success : function(list){

					//console.log("sent페이징");
					//console.log(list);

					let btnValue = '';

					if(currentPage > 1){
					btnValue += '<li class="page-item">'
							  + '<a class="page-link sentPreBtn" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>'
						      + '</li>';
					}
			
			
					for(var i = list.startPage; i <= list.endPage; i++){
						if(i == list.currentPage){
							btnValue += '<li class="page-item active">'
									  + '<a class="page-link sentPagingBtn" href="#" >' + i + '<span class="sr-only">(current)</span></a>'
									  +'</li>';
						}	   
						else{
							btnValue += '<li class="page-item">'
									+ '<a class="page-link sentPagingBtn" href="#">'+ i +'</a>'
									+ '</li>';
						}
					}
				
			
					if(currentPage < list.maxPage){
						btnValue += '<li class="page-item">'
								+ '<a class="page-link sentNextBtn " href="#"><i class="fas fa-chevron-right"></i></a>'
								+ '</li>';
					}



					
					
					$('#sentPagingArea').html(btnValue);
					sentLetter(currentPage);

				}
			})

		}

		function sentLetter(currentPage){

			$.ajax({
				url : 'sent.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					sender : '${sessionScope.loginUser.memberNo}',
					keyword : $('#sentKeyword').val()
				},
				success : function(list){

					//console.log('sent');
					//console.log(list);
					

					var value = '<tr align="left"><td colspan="5"><button class="btn btn-primary" id="deleteLetter">삭제</button></td></tr>'
							  + '<tr><th class="p-0 text-center"><div class="form-check">'
							  + '<input type="checkbox" class="form-check-input" id="sentCheckboxAll" onClick="sentCheckboxAll();"></div></th>'
							  + '<th>To</th><th>Detail</th><th>Date</th><th>Status</th></tr>';


					for(let i in list){
						value += '<tr class="letterDetailView"><td class="p-0 text-center"><div class="form-check">'
							   + '<input type="checkbox" class="form-check-input sentCheckbox" value="'+ list[i].letterNo +'">'
							   + '</div></td>';


						if(list[i].toManitto == 'Y'){
							value += '<td>'+ '<b>Manitto</b>' +'</td>';
						}
						else if(list[i].anonymous == 'Y'){
							value += '<td>'+ '<b>Manitti</b>' +'</td>';
						}
						else{
							value += '<td>'+ list[i].recipient +'</td>';
						}

						value += '<td>' + list[i].letterContent + '</td>'
							   + '<td>' + list[i].sendDate +'</td>';

						if(list[i].readCheck == 'Y'){
							value += '<td><div class="badge badge-info">확인완료</div></td></tr>'
						}
						else{
							value += '<td><div class="badge badge-info"></div></td></tr>'
						}
					}

					$('#sentLetterArea').html(value);

					
				}
			})
		}

	

		$(document).on('click', '.letterDetailView td:not(:first-child)', function(){


			let lno = $(this).parent().find('input[type="hidden"]').val();

			$("input[name='letterNo']").val(lno);
	
			$("#moveToLetterDatail").submit();
			
		});



		$(document).on('click', '#deleteLetter', function(){

			var hiddenValues = [];
			var sender = '';
			var recipient  = '';

			var tableId = $(this).parents('table').prop('id');

			if(tableId === 'sentLetterArea'){
				sender = '${sessionScope.loginUser.memberNo}';
			}
			else{
				recipient = '${sessionScope.loginUser.memberNo}';
			}


			$(this).parents('table').find('td input[type="checkbox"]:checked').each(function(){
				
				hiddenValues.push($(this).val());
				
			})


			$.ajax({
				url : 'delete.le',
				type : 'post',
				data : {
					sender : sender,
					recipient : recipient,
					letterList : hiddenValues
				},
				success : function(result){

					if(result == 'success'){
						alert(hiddenValues.length + '개의 메세지가 삭제되었습니다.');
					}
					else{
						alert('삭제에 실패하였습니다.');
					}


					if(sender != ''){
						sentPaging(1);
					}
					else{
						receivedPaging(1);
					}

				}
			})
		
	
		})

		
	</script>









  <!-- Page Specific JS File -->
  <script src="${contextPath}/resources/assets/js/page/components-table.js"></script>
</body>
</html>