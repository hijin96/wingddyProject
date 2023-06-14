<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단어장 수정</title>
<style>

	#voca_table{
		text-align: center;
	}
	
	.card .btn{
		height: 40px;
	}
	
	#voca_table tbody>tr:hover, .search-voca-list:hover{
		background-color :  #dee2e6;
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
	<div class="main-content">
		<div class="row">
        	<div class="col-12 col-md-6 col-lg-6">
				<div class="card">
					<div class="card-header">
						<h2>단어장 등록</h2>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label>단어장 이름</label>
							<select class="form-control selectric" id="select-book" onchange="selectVocaList();">
							<option value="" disabled selected></option>
								<c:forEach var="voca" items="${ vcList }">
									<option value="${voca.bookNo}">${voca.bookName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>단어</label>
							<form action="deleteBook.vc" method="POST">
								<input type="hidden" id="deleteBookNo" name="bookNo">
								<button class="btn btn-primary btn-sm">단어장 삭제</button>
							</form>
			                <table class="table" id="voca_table">
								<thead>
									<tr>
										<th>단어</th>
										<th>뜻</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<div class="card-footer text-right">
							<button class="btn btn-primary" id="update-book-btn">수정</button>
		                </div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-6">
				<div class="card">
					<div class="card-header">
						<h2>단어 추가</h2>
					</div>
					<div class="card-body">
						<div class="form-row" id="inject-voca">
							<input type="hidden" value="1" id="voca-index-form"/>
							<div class="form-group col-md-6">
								<label>영어</label>
								<input type="text" class="form-control" id="voca-en-form">
							</div>
							<div class="form-group col-md-6">
								<label>해석</label>
								<input type="text" class="form-control" id="voca-kr-form">
							</div>
						</div>
						<div class="card-footer text-right">
		                      <button class="btn btn-primary" id="inject-voca-btn">추가</button>
		                </div>
		                <h5>단어 검색</h5>
		                <div class="btn-group mb-3" role="group" aria-label="Basic example" id="select-language">
		                	<button type="button" class="btn btn-primary" value="en">영어</button>
		                	<button type="button" class="btn btn-secondary search-language" value="ko">한글</button>
		                </div>
						<div class="form-group">
							<input type="text" class="form-control" id="voca-search-form" placeholder="영어를 입력해주세요.">
							<div class="card voca-list" id="voca-search-result">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		$(() => {
			// 단어 리스트 불러오기(ajax)
			selectVocaList = () => {
				let bookNo = $('#select-book option:selected').val();
				
				$('#deleteBookNo').val(bookNo);
				
				$.ajax({
					url : 'vocaList.vc',
					data : {
						bookNo : bookNo
					},
					success : list => {
						let value = '';
						for(let i in list){
							value += '<tr>'
								  +  '<td>'+ list[i].vocaEnglish +'</td>'
								  +  '<td>'+ list[i].vocaKorean +'</td>'
								  +  '</tr>';
						}
						$('#voca_table tbody').html(value);
					}
				});
			}
			
			// 단어장 수정(ajax)
			let vocaArr = [];
			$('#update-book-btn').click(() => {
				
				$('#voca_table tbody>tr').each((i , e) => {
					let tdArr = $(e).children('td');
					if($(e).html() != ''){
						vocaArr.push({bookNo:0,vocaEnglish:tdArr[0].innerText,vocaKorean:tdArr[1].innerText});
					}
				});
				if(vocaArr != ''){
					updateBook();
				}
				else{
					alert('단어를 입력해주세요');
				}
			});
			
			updateBook = () => {
				let vocaObj = {bookNo : $('#select-book option:selected').val(),value:vocaArr};
				
				$.ajax({
					url:'updateBook.vc',
					type : 'POST',
					contentType : 'application/json',
					data : {
						vcList : JSON.stringify(vocaObj)
						},
					success : result => {
						if(result>0){
							location.href = "http://localhost:8007/wingddy/main.vc";
						} else{
							alert('단어 수정 실패!');
						}
					}
				});
			}
		});
		
		// 단어 추가
		$('#inject-voca-btn').click(() => {
			let en = $('#voca-en-form').val();
			let kr = $('#voca-kr-form').val();
			let value = $('#voca_table tbody').html();
				value += '<tr>'
					  +  '<td>'+ en +'</td>'
					  +  '<td>'+ kr +'</td>'
					  +  '</tr>';
					  
			$('#voca_table tbody').html(value);
			$('#voca-en-form').val('');
			$('#voca-kr-form').val('');
		});
		
		// 추가된 단어 삭제
		$('#voca_table tbody').on('click','tr', e => {
			e.target.parentElement.innerHTML = '';
		});
		
		// 단어 검색 이벤트
		$('#voca-search-form').keyup(() => {
			let text = $.trim($('#voca-search-form').val());
			if(text != ''){
				searchText(text);
			}
			else{
				$('#voca-search-result').html('');
			}
		});
		
		// 언어 선택
		$('#select-language').on('click','.search-language', e => {
			$('#voca-search-form').prop('placeholder',$('.search-language').text() + '를 입력해주세요.');
			$('.search-language').siblings('button').removeClass('btn-primary').addClass('search-language btn-secondary');
			$(e.target).removeClass('search-language btn-secondary').addClass('btn-primary');
		});
		
		// 단어 검색(ajax)
		function searchText(text){
			
			$.ajax({
				url : 'search.vc',
				data : {
					source : $('#select-language .btn-primary').val(),
					target : $('#select-language .btn-secondary').val(),
					text : text
				},
				success : list => {

					let result = '';
					for(let i in list){
						result += '<div class="row search-voca-list">' 
								+	'<div class="group col-md-6 en">'+ list[i].vocaEnglish +'</div>'
								+	'<div class="group col-md-6 kr">'+ list[i].vocaKorean +'</div>'
							    + '</div>';
					}
					$('#voca-search-result').html(result);
				}
			});
		}
		
		// 검색 결과를 input에 넣기
		$('#voca-search-result').on('click','.search-voca-list', e => {
			let en = $(e.target).children('.en').prevObject.text();
			let kr = $(e.target).children('.kr').prevObject.next().text();
			$('#voca-en-form').val(en);
			$('#voca-kr-form').val(kr);
			$('#voca-search-form').val('');
		});
	
	</script>
</body>