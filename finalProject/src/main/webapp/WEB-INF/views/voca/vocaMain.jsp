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
			var httpRequest;
			
			const selectVoca = e => {
				
				httpRequest = new XMLHttpRequest();

				const target = e.target;
				
				const bookNo = e.target.firstElementChild.value;
				
				httpRequest.onreadystatechange = () =>{
					if(httpRequest.readyState === XMLHttpRequest.DONE){
						if(httpRequest.status === 200){

							let result = httpRequest.response;
							
							for(let i in result){
								
								let tr = document.createElement('tr');
								
								let td1 = document.createElement('td');
								let td2 = document.createElement('td');
								let td3 = document.createElement('td');
								td1.textContent = i + 1;
								td2.textContent = result[i].vocaEnglish;
								td3.textContent = result[i].vocaKorean;
								
								tr.appendChild(td1)
								  .appendChild(td2)
								  .appendChild(td3);
								
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
					voca[i].addEventListener('click', e => selectVoca(e));
				}
				
			}
		</script>
		
		<!-- 클래스 단어장 
		<div class="card">
			<div class="card-header">
				<h1>단어장</h1>
			</div>
			<div class="card-body">
				<div id="accordion">
					<c:if test="${empty bookList}">
						<h1>단어장이 존재하지 않습니다.</h1>
					</c:if>
					<c:forEach var="bList" items="${ bookList }" varStatus="status">
						<div class="accordion">
							<div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-${ status.count }">
								<h4>${ bList.bookName }</h4>
							</div>
							<div class="accordion-body collapse" id="voca-book-${ status.count }" data-parent="#accordion">
								<input type="hidden" value="${ bList.bookNo }"/>
								<table class="table" id="voca_table">
									<thead>
										<tr>
											<th>#</th>
											<th>단어</th>
											<th>뜻</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>en</td>
											<td>kr</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		-->
	</div>
</body>
</html>