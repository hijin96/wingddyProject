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
					<form action="insert.edu" method="POST">
						<div class="card-header">
							<h2>학습 등록</h2>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label>학습 이름</label>
								<input type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>마감일</label>
								<input type="date" class="form-control" required>
							</div>
							<div class="form-group">
								<label>부여할 뽑기 횟수</label>
								<input type="number" class="form-control" value="0" min="0">
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
											<select class="form-control selectric" id="select-book">
												<option value="" disabled selected></option>
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
													<input type="text" class="form-control" id="sentence-${i}" placeholder="영어문장 입력(띄어쓰기 포함)">
												</div>
												<div class="form-group col-md-6">
													<label for="sentence-kr-${i}">해석</label>
													<input type="text" class="form-control" id="sentence-kr-${i}" placeholder="해석 내용 입력">
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
														<td><input type="text" name="OX-content-${i}" placeholder="질문 입력"></td>
														<td>
															<select class="form-control selectric" name="OX-correct-${i}">
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
							<button class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 유형 클릭하면 타입 히든에 들어가고 각 유형 값들 required하고
		$('#eduTypeTab>li').click(e => {
			console.log($(e.target));
		});
		
		
	</script>
</body>
</html>