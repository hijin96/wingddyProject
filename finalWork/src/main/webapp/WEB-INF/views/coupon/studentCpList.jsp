<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Coupon</title>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
			<div id="header">
				<h3>학생 보유 쿠폰</h3>
			</div>
			<br><br>
			
			<section class="section">
				<section class="section-body">
					<div class="card">
						<div class="card-body">
				        	<div class="search-element">
								<div class="form-inline mr-auto">
									<select class="selectric" name="searchOption">
										<option value="studentName">학생 이름</option>
										<option value="cpName">쿠폰명</option>
									</select> &nbsp;&nbsp;&nbsp;
									<input id="search-input" class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="250">
						            <button id="btn-search" class="btn" type="button" onclick="searchKeyword()"><i class="fas fa-search"></i></button>
						        </div>
				        	</div>
					        <br><br>
		  					<table id="studentCplist" class="table text-center table-striped table-md">
				        		<thead>
						          	<tr>
						            	<th>이름</th>
						            	<th>쿠폰명</th>
						            	<th>수량</th>
						            	<th>사용하기</th>
						          	</tr>
				        		</thead>
				        		<tbody>
						        	<c:forEach items="${sclist}" var="cp" varStatus="status">
						        		<form action="use.cp" method="post">
							        		<tr>
							        			<input type="hidden" name="cpNo" value="${cp.cpNo}"/>
							        			<input type="hidden" name="memberNo" value="${cp.memberNo}" />
							        			<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
							        			<td>${cp.memberName}</td>
							        			<td>${cp.productName}</td>
							        			<td>${cp.amount}</td>
							        			<td><button type="submit" class="btn btn-warning">사용하기</button></td>
							            	</tr>
					        			</form>
						            </c:forEach>
					        	</tbody>
		      				</table>
			  			</div>
		  			</div>
		  		</section>
	  		</section>
		
		</div>
	</div>
</div>
<form id="form-ajax" action="useSearch.cp" method="post">
	<input type="hidden" name="cpNo" />
	<input type="hidden" name="memberNo" />
	<input type="hidden" name="cno" />
</form>
<script>
	
	
	function searchKeyword(){
		let searchOption = $('select[class=selectric]').val();
		let keyword = $('#search-input').val();
		let cno = ${requestScope.classroom.classNo};
		
		if(!keyword == ''){
			
			$.ajax({
				url : 'searchStudent.cp',
				type : 'post',
				data : {
					searchOption : searchOption,
					keyword : keyword,
					cno : cno
				},
				success : function(searchList){
					//console.log(searchList);
					let result = '';
					
					if(searchList.length != 0){
						for(i in searchList){
							result += '<tr>'
								  		+ '<input type="hidden" name="cpNo" value="' + searchList[i].cpNo + '"/>'
								  		+ '<input type="hidden" name="memberNo" value="' + searchList[i].memberNo + '"/>'
								  		+ '<input type="hidden" name="classNo" value="' + ${requestScope.classroom.classNo} + '"/>'
								  		+ '<td>' + searchList[i].memberName + '</td>'
					        			+ '<td>' + searchList[i].productName + '</td>'
					        			+ '<td>' + searchList[i].amount + '</td>'
					        			+ '<td><button id="btn-ajax" type="submit" class="btn btn-warning">사용하기</button></td>'
								 	+ '</tr>';
							
						}
					} else {
						result = '<tr><td colspan="4">해당 키워드와 일치하는 결과가 없습니다.</td></tr>';
					}
					$('#studentCplist>tbody').html(result);
					
					$(document).on('click', '#btn-ajax', function(){
						let form = $('#form-ajax').children();
						let info = $(this).parents('tr').children();
						
						form.eq(0).val(info.eq(0).val());
						form.eq(1).val(info.eq(1).val());
						form.eq(2).val(info.eq(2).val());
						
						$('#form-ajax').submit();
					})
				}
			}) 
		} else {
			alert('검색어를 입력해주세요');
		}
	}
	
	
	

</script>

</body>
</html>