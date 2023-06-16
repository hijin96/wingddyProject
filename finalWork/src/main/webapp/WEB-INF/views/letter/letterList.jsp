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
						<a href="#" class="btn btn-primary">write</a>
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
										<form>
										  <div class="input-group">
											<input type="text" class="form-control" placeholder="Search">
											<div class="input-group-btn">
											  <button class="btn btn-primary"><i class="fas fa-search"></i></button>
											</div>
										  </div>
										</form>
									  </div>
									</div>
									<div class="card-body p-0">
									  <div class="table-responsive">
										<table class="table table-striped text-center" id="receivedLetterArea">
											<tr align="left">
												<td colspan="5">
													<button class="btn btn-primary">삭제</button>
												</td>
											</tr>
											<tr>
												<th class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox" id="test" class="form-check-input" id="receivedCheckbox-all" onclick="test(this)">
													</div>
												</th>
												<th>From</th>
												<th>Detail</th>
												<th>Date</th>
												<th>Status</th>
											</tr>
											<tr>
												<td class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox"  class="form-check-input receivedCheckbox">
													</div>
												</td>
												<td>
													김길동
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											<tr>
												<td class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox"  class="form-check-input receivedCheckbox">
													</div>
												</td>
												<td>
													김길동
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											
											
											
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
									  <h4>받은 쪽지</h4>
									  <div class="card-header-form">
										<form>
										  <div class="input-group">
											<input type="text" class="form-control" placeholder="Search">
											<div class="input-group-btn">
											  <button class="btn btn-primary"><i class="fas fa-search"></i></button>
											</div>
										  </div>
										</form>
									  </div>
									</div>
									<div class="card-body p-0">
									  <div class="table-responsive">
										<table class="table table-striped">
											<tr>
												<td colspan="5">
													<button class="btn btn-primary">삭제123</button>
												</td>
											</tr>
											<tr>
												<th class="p-0 text-center">
												<div class="form-check">
													<input type="checkbox" data-checkboxes="mygroup2" data-checkbox-role="dad" class="form-check-input" id="checkbox-all">
												</div>
												</th>
												<th>From</th>
												<th>Detail</th>
												<th>Date</th>
												<th>Status</th>
											</tr>
										</table>

										<table class="table table-striped">	
											<tr>
												<td class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox" data-checkboxes="mygroup2" class="form-check-input" id="checkbox-1">
													</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동123
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											<tr>
												<td class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox" data-checkboxes="mygroup2" class="form-check-input" id="checkbox-1">
													</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											<tr>
												<td class="p-0 text-center">
													<div class="form-check">
														<input type="checkbox" data-checkboxes="mygroup2" class="form-check-input" id="checkbox-1">
													</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											
											
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







	<script>

		function test(btn){
			console.log(btn);
		}


		
		$('#receivedCheckbox-all').click(function(){
			console.log('fsjhdfldskjfl')
			console.log($(this).is(':checked'));
		})



		
		/*
		$(document).on('click', '#receivedCheckbox-all', function(){

			console.log('fsjhdfldskjfl')
			console.log($(this).is(':checked'));

		});
		*/AnimationEffect

	

		var currentPage = 1;


		$(function(){
			receivedPaging(currentPage);
			sentPaging(currentPage);
		})


		function receivedPaging(currentPage){

			$.ajax({
				url : 'receivedPaging.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					recipient : '${sessionScope.loginUser.memberNo}'
				},
				success : function(list){
					console.log('받은 쪽지 페이징 버튼')
					console.log(list);


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
					recipient : '${sessionScope.loginUser.memberNo}'
				},
				success : function(list){

					var value = '<tr align="left"><td colspan="5"><button class="btn btn-primary">삭제</button></td></tr>'
							  + '<tr><th class="p-0 text-center"><div class="form-check">'
							  + '<input type="checkbox" id="test" data-checkboxes="mygroup" data-checkbox-role="dad" class="form-check-input" id="checkbox-all"></div></th>'
							  + '<th>From</th><th>Detail</th><th>Date</th><th>Status</th></tr>';


					for(let i in list){
						value += '<tr><td class="p-0 text-center"><div class="form-check">'
							   + '<input type="checkbox" data-checkboxes="mygroup" class="form-check-input">'
							   + '<input type="hidden" value="' + list[i].letterNo +'"></div></td>';


						if(list[i].anonymous == 'Y'){
							value += '<td>'+ '<b>Manitto</b>' +'</td>';
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

					//$('#receivedLetterArea').html(value);

				}
			})

		}


		function sentPaging(currentPage){

			$.ajax({
				url : 'sentPaging.le',
				data : {
					rPage : currentPage,
					classNo : '${requestScope.classroom.classNo}',
					sender : '${sessionScope.loginUser.memberNo}'
				},
				success : function(list){


					console.log(list);

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
					sender : '${sessionScope.loginUser.memberNo}'
				},
				success : function(list){

					console.log(list);
				}
			})
		}
	</script>










  <!-- Page Specific JS File -->
  <script src="${contextPath}/resources/assets/js/page/components-table.js"></script>
</body>
</html>