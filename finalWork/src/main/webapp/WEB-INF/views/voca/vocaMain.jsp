<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 단어장</title>

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
		<div style="height:50px;"></div>
		<!-- 내 단어장 -->
		<div class="card">
			<div class="card-header">
				<h1>내 단어장</h1>
				<button class="btn btn-primary" id="insertBook-btn">단어장 등록</button>
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
				}
				
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
					location.href='insertBookForm.vc';
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
						<button class="btn btn-outline-primary">단어장 추가</button>
					</div>
					<div class="card-body">
						<div id="accordion">
							<c:forEach var="j" begin="0" end="${ classBookList.size() - 1 }">
								<c:if test="${ classBookList[i].classNo eq classBookList[j].classNo }">
									<div class="accordion">
										<div class="accordion-header select-voca" id="class-${i}-book-head-${j}" role="button" data-toggle="collapse" data-target="#class-${i}voca-book-${j}">
											<input type="hidden" value="${ classBookList[j].bookNo }"/>
											<h4>${ classBookList[j].bookName }</h4>
										</div>
										<div class="accordion-body collapse" id="class-${i}voca-book-${j}" data-parent="#accordion">
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
		
	</div>
</body>
</html>