<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰게시글쓰기</title>
	<style>
	.form-control{
		width: 80%;
		max-width: 800px;
		
		}
	.ck.ck-editor  {
			width: 80%;
			max-width: 800px;
			margin: 0 auto;
		}
		
		.ck-editor__editable {
			min-height: 300px;
		}
		
		form {
			text-align: center;
		
		}
	</style>
</head>
<body>
	<div id="app">
		<jsp:include page="../sideBar/sideBar.jsp" />
		
		<div class="main-content">
			<br><br><br><br><br><br>
 			<div class="ck-body-wrapper">
				<div>
					<form action="update.bo" method="POST" enctype="multipart/form-data">
						<div class="card-body">
							<div class="form-group row mb-4">
								<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" for="spName">상품명</label>
								<div class="col-sm-12 col-md-7">
									<input type="text" class="form-control" name="spName" value="${s.spName }" required>
								</div>					  
								<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" for="amount">수량</label>
								<div class="col-sm-12 col-md-7">
									<input type="number"  class="form-control"  name="amount"  value="${s.amount }" required>
								</div>
								<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" for="spPrice">가격</label>
								<div class="col-sm-12 col-md-7">
									<input type="number"  class="form-control" name="spPrice" value="${s.spPrice }" required>
								</div>
			
								<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" for="spOnecom" >한줄소개</label>
								<div class="col-sm-12 col-md-7">
									<input type="text"  class="form-control" name="spOnecom" value="${s.spOnecom}" required>
									<textarea name="spContent" id="editor" value="${s.spContent }"></textarea>
									<span>
										기존의 썸네일
										<a href="${s.filePath }/${s.changeName}" download="${s.changeName}">${s.changeName}</a>
									</span>
									<span>썸네일 선택
										<input class="note-image-input note-form-control note-input" type="file" name="reUpfile" accept="image/*" multiple="multiple">
									</span> 
									<input type="hidden" value="${s.fileNo }" name="fileNo"/>
									<input type="hidden" value="${s.spNo }" name="spNo"/>
									<div>
										<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" /> 
										<input type="submit" class="btn btn-primary mt-3 mx-2" value="수정하기"  />
									</div>
								</div>
							</div>
						</div>	
					</form> 
				</div>
			</div>
		</div>
	</div>
	

	
	<script src="/wingddy/resources/ckeditor/ckeditor.js"></script> 
	<script>
		ClassicEditor.create(document.querySelector('#editor'), {
			ckfinder : {
				uploadUrl : 'resources/uploadFiles'
			}
		});
		</script>
		
	
</body>

</body>
</html>