<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>Letter Box</h1>
		        </div>
		
				<div class="section-body">
					<div class="card">
						<div class="card-body">
							<div align="right">
								<a href="#" class="btn btn-primary">write</a>
							</div>

						
						</div>
						
						<div class="card-body">
							<div class="row">
								<div class="col-12">
								  <div class="card">
									<div class="card-header">
									  <h4>받은 쪽지</h4>
									  <div class="card-header-form">
										<form>
										  <div class="input-group">
											<input type="text" class="form-control" placeholder="Search">
											<div class="input-group-btn">
											  <button class="btn btn-primary"><i class="fas fa-search"></i></button>
											</div>
										  </div>
										</form>
									  </div>
									</div>
									<div class="card-body p-0">
									  <div class="table-responsive">
										<table class="table table-striped">
											<tr>
												<td colspan="5">
													<button class="btn btn-primary">삭제</button>
												</td>
											</tr>
											<tr>
												<th class="p-0 text-center">
												<div class="custom-checkbox custom-control">
													<input type="checkbox" data-checkboxes="mygroup" data-checkbox-role="dad" class="custom-control-input" id="checkbox-all">
													<label for="checkbox-all" class="custom-control-label">&nbsp;</label>
												</div>
												</th>
												<th>From</th>
												<th>Detail</th>
												<th>Date</th>
												<th>Status</th>
											</tr>
											<tr>
												<td class="p-0 text-center">
												<div class="custom-checkbox custom-control">
													<input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
													<label for="checkbox-1" class="custom-control-label">&nbsp;</label>
												</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동
												</td>
												<td>내용sfsdfsdfsdfsdfsf!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info"></div></td>
											</tr>
											<tr>
												<td class="p-0 text-center">
												<div class="custom-checkbox custom-control">
													<input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
													<label for="checkbox-1" class="custom-control-label">&nbsp;</label>
												</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동
												</td>
												<td>내용!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											<tr>
												<td class="p-0 text-center">
												<div class="custom-checkbox custom-control">
													<input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
													<label for="checkbox-1" class="custom-control-label">&nbsp;</label>
												</div>
												</td>
												<td>
													<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-vsvOvF2g5-8PhbDK8pbcX8neO2lWMTm0MZYt7tHmw&s" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">
													김길동
												</td>
												<td>내용!</td>
												<td>2018-01-20</td>
												<td><div class="badge badge-info">확인완료</div></td>
											</tr>
											
										</table>
									  </div>
									</div>
								  </div>
								</div>
							  </div>
						</div>
						
					</div>
		      	</div>
		    </section>
	    </div>
</div>
  <!-- Page Specific JS File -->
  <script src="${contextPath}/resources/assets/js/page/components-table.js"></script>
</body>
</html>