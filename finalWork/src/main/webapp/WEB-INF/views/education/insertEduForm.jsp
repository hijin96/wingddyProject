<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 등록</title>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
	<div class="main-content">
		<div class="row">
			<div class="col-12 col-md-6 col-lg-6">
				<div class="card">
					<form action="insert.edu" method="POST" id="insertEduForm">
						<div class="card-header">
							<h2>학습 등록</h2>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label>학습 이름</label>
								<input type="text" class="form-control" name="eduName" required>
							</div>
							<div class="form-group">
								<label>마감일</label>
								<input type="date" class="form-control" name="endTime" required>
							</div>
							<div class="form-group">
								<label>부여할 뽑기 횟수</label>
								<input type="number" class="form-control" value="0" min="0" name="gachaCount">
							</div>
							<div class="form-group">
								<input type="hidden" name="cno" value="${classroom.classNo}"/>
								<input type="hidden" name="eduType"/>
								<input type="hidden" name="content"/>
							</div>
							<div class="form-group">
								<label>유형</label>
								<ul class="nav nav-pills" id="eduTypeTab" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="word-tab" data-toggle="tab" href="#word" role="tab" aria-controls="home" aria-selected="true">단어 퀴즈</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="sentence-tab" data-toggle="tab" href="#sentence" role="tab" aria-controls="profile" aria-selected="false">문장 배치</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="OXquiz-tab" data-toggle="tab" href="#OXquiz" role="tab" aria-controls="contact" aria-selected="false">OX 퀴즈</a>
									</li>
								</ul>
								<div class="tab-content" id="eduType-content">
									<div class="tab-pane fade show active" id="word" role="tabpanel" aria-labelledby="word-tab">
										<div class="form-group">
											<label>단어장 이름</label>
											<select class="form-control selectric" id="select-book" required>
												<c:forEach var="voca" items="${ vcList }">
													<option value="${voca.bookNo}">${voca.bookName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="tab-pane fade" id="sentence" role="tabpanel" aria-labelledby="sentence-tab">
										<div class="form-row">
											<c:forEach var="i" begin="1" end="5">
												<div class="form-group col-md-6">
													<label for="sentence-${i}">${i}번 문장</label>
													<input type="text" class="form-control" 
														   id="sentence-${i}" placeholder="영어문장 입력(띄어쓰기 포함)"  
														   disabled <c:if test="${i eq 1}">required</c:if>>
												</div>
												<div class="form-group col-md-6">
													<label for="sentence-kr-${i}">해석</label>
													<input type="text" class="form-control" 
														   id="sentence-kr-${i}" placeholder="해석 내용 입력"  
														   disabled <c:if test="${i eq 1}">required</c:if>>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="tab-pane fade" id="OXquiz" role="tabpanel" aria-labelledby="OXquiz-tab">
										<table class="table table-striped" >
											<thead align="center">
												<tr>
													<th scope="col">No</th>
													<th scope="col">질문</th>
													<th scope="col">정답</th>
												</tr>
											</thead>
											<tbody align="center">
												<c:forEach var="i" begin="1" end="10">
													<tr>
														<th scope="row">${i}</th>
														<td><input type="text" name="OX-content" 
																   placeholder="질문 입력"  disabled
																   <c:if test="${i eq 1}">required</c:if>></td>
														<td>
															<select class="form-control selectric" name="OX-correct"  
																	disabled <c:if test="${i eq 1}">required</c:if>>
																<option value="O">O</option>
																<option value="X">X</option>
															</select>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						 </div>
						<div class="card-footer text-right">
							<button id="submit-btn" type="button" class="btn btn-primary" >등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		
		$('#eduTypeTab a').click(e => {
			let target = $(e.target).attr('href');
			
			// 타겟의 하위 요소 disabled삭제
			$(target+' :disabled').each((i, e) => {
				$(e).removeAttr('disabled');
			});
			// 타겟 뺀 나머지 애들 하위 요소 disabled추가
			$(target).siblings().each((i, e) => {
				$(e).find('input').attr('disabled',true);
				$(e).find('select').attr('disabled',true);
			});
		});
		
		
		$('#submit-btn').click(() => {
			injectQuiz();
			$('#insertEduForm').submit();
		});
		
		function injectQuiz(){
			let target = $('#eduTypeTab .active').attr('href');
			let eduType;
			let quiz = [];
			if(target == '#word'){
				eduType = 'W';
				quiz.push({'bookNo':$('#select-book').val()});
			}
			else if(target == '#sentence'){
				eduType = 'S';
				
				for(let i = 1; i <= 5; i++){
					let content = $('#sentence-kr-'+ i).val().trim(' ');
					let correct = $('#sentence-'+ i).val().trim(' ');
					
					if((content != '') && (correct != '')){
						quiz.push({'content':content, 'correct':correct});
					}
				}
			}
			else{
				eduType = 'O';
				
				for(let i = 0; i < 10; i++){
					let content = $('input[name=OX-content]')[i].value.trim(' ');
					let correct = $('select[name=OX-correct]')[i].value;
					
					if(content != ''){
						quiz.push({'content': content, 'correct':correct});
					}
				}
			}
			$('input[name=eduType]').val(eduType);
			$('input[name=content]').val(JSON.stringify(quiz));
		}
		
	</script>
</body>
</html>