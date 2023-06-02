<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 작성</title>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>쪽지 작성</h1>
		        </div>
		
		        <div class="section-body">
					<div class="card">
						<div class="card-body">
							<form action="enroll.aph">

								<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Title</label>
									<div class="col-sm-12 col-md-7">
										<input type="text" class="form-control">
									</div>
								</div>

								<div align="center">
									<p>'마니띠에게' 클릭 시 익명으로 보낼 수 있어요!</p>
									<input type="radio" name="to">마니또에게
									<input type="radio" name="to">마니띠에게
									<button type="button" onclick="noneCheck();" class="btn btn-outline-primary">선택취소</button>
								</div>

								<script>

									function noneCheck(){
										$("input:radio[name='to']").prop('checked', false);
									}

								</script>
								
									

									


									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">To</label>
									<div class="col-sm-12 col-md-7">
										<select class="form-control selectric">
											<option value="none" id="toNone">-</option>
											<option>wprije5</option>
											<option>spmtl323</option>
											<option>pdptgml88</option>
										</select>
									</div>
									</div>
									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Content</label>
									<div class="col-sm-12 col-md-7">
										<textarea class="summernote-simple"></textarea>
									</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Present</label>
										<div class="col-sm-12 col-md-7">
											<select class="form-control selectric">
												<option value="none">-</option>
												<option>A</option>
												<option>E</option>
												<option>F</option>
											</select>
										</div>
										</div>
									</div>

									<div class="form-group row mb-4">
									<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
									<div class="col-sm-12 col-md-7 text-center">
										<button class="btn btn-primary">Send</button>
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