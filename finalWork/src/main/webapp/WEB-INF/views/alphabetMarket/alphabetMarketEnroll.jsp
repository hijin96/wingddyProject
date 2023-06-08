<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알파벳 마켓 게시글 작성</title>
</head>
<body>
<div id="app">

    <jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	        <section class="section">
	            <div class="section-header">
	                 <h1>Alphabet Market Enroll</h1>
	            </div>
	
	            <div class="section-body">
					<div class="card">
						<div class="card-body">
							<form action="post.aph" method="post">

								<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Title</label>
									<div class="col-sm-12 col-md-7">
										<input type="text" class="form-control" required>
									</div>
									</div>
									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Alphabet</label>
									<div class="col-sm-12 col-md-7">
										<select class="form-control selectric">
											<option>A</option>
											<option>N</option>
											<option>P</option>
										</select>
									</div>
									</div>
									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Content</label>
									<div class="col-sm-12 col-md-7">
										<textarea class="summernote-simple" name="letter"></textarea>
									</div>
									</div>
									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
									<div class="col-sm-12 col-md-7 text-center">
										<button class="btn btn-primary">Post</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
	        </section>
	    </div>
</div>

</body>
</html>