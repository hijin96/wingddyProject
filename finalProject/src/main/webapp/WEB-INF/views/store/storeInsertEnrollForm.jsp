<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="resources/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet"
	href="resources/assets/modules/summernote/summernote-bs4.css">
<link rel="stylesheet"
	href="resources/assets/modules/codemirror/lib/codemirror.css">
<link rel="stylesheet"
	href="resources/assets/modules/codemirror/theme/duotone-dark.css">
<link rel="stylesheet"
	href="resources/assets/modules/jquery-selectric/selectric.css">

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<!-- Start GA -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-94034622-3');
</script>



<meta charset="UTF-8">
<title>게시글 작성하기</title>
</head>
<body>
	<div id="app">
		<div>
			<jsp:include page="../sideBar/sideBar.jsp" />
			<div class="main-content">
				<br><br><br><br><br>

				<div class="row">
=
					<div class="col-12">
						<div class="card">
							<form action="insertstore.do" method="POST" >
								<div class="card-header">
									<h4>제품등록</h4>
								</div>
								<div class="card-body">
									<div class="form-group row mb-4">
										<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">제목</label>
										<div class="col-sm-12 col-md-7">
											<input type="text" class="form-control">
										</div>
									</div>
									
									<div class="form-group row mb-4">
										<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">한줄설명</label>
										<div class="col-sm-12 col-md-7">
											<input type="text" class="form-control">
										</div>
									</div>
									
									
									
									<div class="form-group row mb-4">
										<label
											class="col-form-label text-md-right col-12 col-md-3 col-lg-3">수량</label>
										<div class="col-sm-12 col-md-7">
											<input type="number" class="form-control selectric" value="0"/>
										</div>
									</div>
									
									<div class="form-group row mb-4">
										<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">내용</label>
										<div class="col-sm-12 col-md-7">
											<textarea class="summernote"></textarea>
										</div>
									</div>
										
									<!-- <button type="button" class="note-btn btn btn-light btn-sm" tabindex="-1" title="" data-original-title="Picture">
										<i class="note-icon-picture"></i>
									</button> -->
									<div class="modal-content">
										<div class="modal-header">     
											<h4 class="modal-title">썸네일 이미지 등록</h4>     
											
										</div>    
										<div class="modal-body">
										<div class="form-group note-form-group note-group-select-from-files">
											<label class="note-form-label">Select from files</label>
											 <input class="note-image-input note-form-control note-input" type="file" name="files" accept="image/*" multiple="multiple">
										</div>
									</div>	
										
										

									<div class="form-group row mb-4">
										<label
											class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
										<div class="col-sm-12 col-md-7">
											<button class="btn btn-primary">게시글 등록하기</button>
										</div>
									</div>
								</div>
							</form>


						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>