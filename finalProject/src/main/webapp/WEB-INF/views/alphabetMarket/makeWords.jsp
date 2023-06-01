<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단어만들기</title>
<style>
	.alphabet:hover{
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>Make Words</h1>
		        </div>
		
		        <div class="section-body">
					<div class="card">
						<form action="insertWords.aph">
							<div class="card-body">
								<div align="right">
									<button class="btn btn-primary">submit</button>
 								</div>

								<div align="center">
									<div class="text-primary mb-2 display-3">BAG</div>
									<div class="col-sm-12 col-md-7">
										<input type="text" class="form-control" placeholder="writing the meaning" required>
									</div>
								</div>
							</div>
						</form>
						<hr>

						<div class="card-body">
							<div class="card-body">
								<div class="row">
									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>

									<div class="col-12 col-sm-12 col-lg-2 col-md-2 alphabet">
										<article class="article article-style-b">
											<div class="article-header">
												<div align="right">
													<div class="article-badge">
														<div class="article-badge-item bg-danger">9</div>
													</div>
												</div>   
												<div class="article-image">
													<p style="text-align: center; font-size: 100px; margin-top: 70px;">A</p>
												</div>
											</div>
										</article>
									</div>
								</div>
							</div>
						</div>
						
					</div>
		      	</div>
		    </section>
	    </div>
</div>

</body>
</html>