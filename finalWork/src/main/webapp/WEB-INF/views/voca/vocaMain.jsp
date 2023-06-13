<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 단어장</title>

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="resources/assets/modules/bootstrap-daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="resources/assets/modules/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
  <link rel="stylesheet" href="resources/assets/modules/select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="resources/assets/modules/jquery-selectric/selectric.css">
  <link rel="stylesheet" href="resources/assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
  <link rel="stylesheet" href="resources/assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">

<style>
	#voca_table{
		text-align: center;
	}
	
	.card .btn{
		height: 40px;
	}
</style>
</head>
<body>
	
	<jsp:include page="../sideBar/sideBar.jsp"/>
	
	<div class="main-content">
		<!-- 내 단어장 -->
		<div class="card">
			<div class="card-header">
				<h1>내 단어장</h1>
				<button class="btn btn-primary" id="insertBook-btn">단어장 등록</button>
				<c:if test="${not empty bookList}">
					<button class="btn btn-primary" id="updateBook-btn">단어장 수정</button>
				</c:if>
				<c:if test="${loginUser.memberType ne 'S'}">
					<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addClassBook">단어장 추가</button>
				</c:if>
			</div>
			<div class="card-body">
				<div id="accordion">
					<c:if test="${empty bookList}">
						<h1>단어장이 존재하지 않습니다.</h1>
					</c:if>
					<c:forEach var="bList" items="${ bookList }" varStatus="status">
						<div class="accordion">
							<div class="accordion-header select-voca" id="book-head-${ status.count }" role="button" data-toggle="collapse" data-target="#voca-book-${ status.count }">
								<input type="hidden" value="${ bList.bookNo }"/>
								<h4>${ bList.bookName }</h4>
							</div>
							<div class="accordion-body collapse" id="voca-book-${ status.count }" data-parent="#accordion">
								<table class="table" id="voca_table">
									<thead>
										<tr>
											<th>#</th>
											<th>단어</th>
											<th>뜻</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<script>
			// 단어장 내의 단어 리스트 불러오기(ajax)
			var httpRequest;
			const selectVoca = e => {
				
				httpRequest = new XMLHttpRequest();

				const target = e.target.parentElement;
				
				const bookNo = e.target.previousElementSibling.value;
				
				httpRequest.onreadystatechange = () =>{
					if(httpRequest.readyState === XMLHttpRequest.DONE){
						if(httpRequest.status === 200){
							
							target.parentElement.getElementsByTagName('tbody')[0].innerHTML ='';

							let result = httpRequest.response;
							
							for(let i in result){
								
								let tr = document.createElement('tr');
								
								let td1 = document.createElement('td');
								let td2 = document.createElement('td');
								let td3 = document.createElement('td');
								td1.textContent = i*1+1;
								td2.textContent = result[i].vocaEnglish;
								td3.textContent = result[i].vocaKorean;
								
								tr.appendChild(td1);
								tr.append(td2);
								tr.append(td3);
								
								target.parentElement.getElementsByTagName('tbody')[0].appendChild(tr);
							}
						}
					}
				};
				
				httpRequest.open('POST', 'vocaList.vc?bookNo=' + bookNo);
				httpRequest.responseType = 'json';
				httpRequest.send();
			}
			
			window.onload = () => {
				
				let voca = document.getElementsByClassName('select-voca');

				for(let i = 0; i < voca.length; i++){
					voca[i].getElementsByTagName('h4')[0].addEventListener('click', e => selectVoca(e));
					voca[i].addEventListener('click', e => {
						e.target.getElementsByTagName('h4')[0].click();
					});
				}
				
				document.getElementById('insertBook-btn').addEventListener('click', () => {
					location.href='insertBook.vc';
				});
				
				document.getElementById('updateBook-btn').addEventListener('click', () => {
					location.href='updateBook.vc';
				});
			}
		</script>
		
		<!-- 클래스 단어장 -->
		<c:forEach var="i" begin="0" end="${ classBookList.size() - 1 }">
			<c:if test="${i eq 0 or classBookList[i].classNo ne classBookList[i-1].classNo}">
				<div class="card">	
					<div class="card-header">
						<input type="hidden" value="${ classBookList[i].classNo }"/>
						<h1>${ classBookList[i].className }</h1>
					</div>
					<div class="card-body">
						<div id="accordion${i}">
							<c:forEach var="j" begin="0" end="${ classBookList.size() - 1 }">
								<c:if test="${ classBookList[i].classNo eq classBookList[j].classNo }">
									<div class="accordion">
										<div class="accordion-header select-voca" id="class-${i}-book-head-${j}" role="button" data-toggle="collapse" data-target="#class-${i}voca-book-${j}">
											<input type="hidden" value="${ classBookList[j].bookNo }"/>
											<h4>${ classBookList[j].bookName }</h4>
											
										</div>
										<div class="accordion-body collapse" id="class-${i}voca-book-${j}" data-parent="#accordion${i}">
											<table class="table" id="voca_table">
												<thead>
													<tr>
														<th>#</th>
														<th>단어</th>
														<th>뜻</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		
		<!-- 모달 -->
		<div id="addClassBook" class="modal fade" role="dialog">
			<div class="modal-dialog modal-md modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">클래스 단어장 추가</h5>
					</div>
					<!-- 클래스 단어장 추가 -->
					<form action="insertClassBook.vc" method="POST" id="addClassBook-form">
						<div class="modal-body">
							<div class="form-group" id="modal-book-list">
								<label>단어장 선택</label>
								<select class="form-control selectric" name="bookNo" >
									<option value="0" disabled selected >단어장을 선택해주세요</option>
									<c:forEach var="bList" items="${ bookList }">
										<option value="${bList.bookNo}">${bList.bookName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" id="modal-class-list" >
								<label>클래스 선택</label>
								<select class="form-control selectric" multiple="" name="classNoList">
									<option value="0">선택안함</option>
									<c:forEach var="cList" items="${classList}">
										<option value="${cList.classNo}">${cList.className}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">추가</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
		
		
		
		$(function(){
			let li = [];
			
			function emptyClassList(){
				if(li != ''){
					for(let i in li){
						$($('#modal-class-list li')[li[i]]).click();
					}
					li = [];
				}
			}
			// 단어장 클래스 리스트 불러오기(ajax)
			$('#modal-book-list select').on('change', () => {
				console.log($('#modal-class-list').find('li'));
				emptyClassList();
				$.ajax({
					url : 'bookClassList.vc',
					type: 'POST',
					data : {bookNo : $('#modal-book-list option:selected').val()},
					success : list => {
						if(list != ''){
							let optionArr = $('#modal-class-list option');
							
							for(let i in list){
								for(let j = 0; j < optionArr.length; j++){
									if($(optionArr[j]).val() == list[i].classNo){
										$($('#modal-class-list li')[j]).click();
										li.push(j);
									} 
								}
							}
						}
					}
				});
			});
		});
		</script>
		
	</div>
	<!-- General JS Scripts -->
  <script src="resources/assets/modules/jquery.min.js"></script>
  <script src="resources/assets/modules/popper.js"></script>
  <script src="resources/assets/modules/tooltip.js"></script>
  <script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="resources/assets/modules/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->
  <script src="resources/assets/modules/cleave-js/dist/cleave.min.js"></script>
  <script src="resources/assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
  <script src="resources/assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
  <script src="resources/assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script src="resources/assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
  <script src="resources/assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
  <script src="resources/assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
  <script src="resources/assets/modules/select2/dist/js/select2.full.min.js"></script>
  <script src="resources/assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

  <!-- Page Specific JS File -->
  <script src="resources/assets/js/page/forms-advanced-forms.js"></script>
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
</body>
</html>