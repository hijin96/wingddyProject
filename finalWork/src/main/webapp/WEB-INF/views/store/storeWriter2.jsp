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
			<form action="insertstore.do" method="POST" enctype="multipart/form-data">
				<div id="header">
					<label>상품명</label><input type="text" class="form-control" name="spName" value="상품명">
					<span><label>수량</label><input type="number"  class="form-control" value="0" name="amount"></span>
					<span><label>가격</label><input type="number"  class="form-control" value="0" name="spPrice"></span>
				</div>
				<span><input type="text"  class="form-control" value="한줄소개" name="spOnecom"> </span>
				 
				<textarea name="spContent" id="editor"></textarea>
				<input class="note-image-input note-form-control note-input" type="file" name="upfile" accept="image/*" multiple="multiple">
					<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" /> 
					<input type="submit" class="btn btn-primary mt-3 mx-2" value="작성완료" />
			</form> 
		</div>
		</div>
	</div>
	


	<script src="/wingddy/resources/ckeditor/ckeditor.js"></script> 
        


	<%--  <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> --%>


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