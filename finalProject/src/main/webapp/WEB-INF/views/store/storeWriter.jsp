<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰게시글쓰기</title>
	<style>
		.ck.ck-editor {
			width: 80%;
			max-width: 800px;
			margin: 0 auto;
		}
		
		.ck-editor__editable {
			height: 80vh;
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
				<div class="card">
				<div class="card-body">
				<form action="insertstore.do" method="POST" >
					<div id="editor">
					
					</div>
					<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" />
					<input type="submit" class="btn btn-primary mt-3 mx-2" value="작성완료" />
				</form>
				</div>
				</div>
			</div>
	</div>
	

	<script src="/resources/ckeditor/ckeditor.js"></script>
   	
    <script>
      ClassicEditor.create(document.querySelector( '#editor' ),{
    	  ckfinder:{
    		  uploadUrl : '/resources/uploadFiles'
    	  }
      } );
    </script>
</body>

</body>
</html>