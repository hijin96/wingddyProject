<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마니또관릴</title>
</head>
<body>

<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
		    <section class="section">
		        <div class="section-header">
		     		<h1>Manitto Matching</h1>
		        </div>
		
		        <div class="section-body">
					<div class="card">
						<div align="right">
							<div class="card-body" id="createBtn">
								
							</div>
						</div>

						<table class="table text-center">
							<thead>
							  <tr>
								<th scope="col">#</th>
								<th scope="col">마니또</th>
								<th scope="col">마니띠</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
								<td>1</td>
								<td>Otto</td>
								<td>Thornton</td>
							  </tr>
							  <tr>
								<td>2</td>
								<td>Thornton</td>
								<td>fat</td>
							  </tr>
							  <tr>
								<td>3</td>
								<td>Bird</td>
								<td>twitter</td>
							  </tr>
							</tbody>
						  </table>
					</div>
		      	</div>
		    </section>
	    </div>
</div>

<script>

	$(document).on('click', '#matching', function(){

		$.ajax({
			url : 'matching.mani',
			data : {
				classNo : '${requestScope.classroom.classNo}'
			},
			success : function(result){
				setManittoList();
			}
			
		})

	});






	$(function(){
		setManittoList();
	})


	function setManittoList(){

		$.ajax({
			url : 'manittoList.mani',
			data : {
				classNo : '${requestScope.classroom.classNo}'
			}, 
			success : function(list){

				var result = '';

				for(var i in list){
					result += '<tr><td>' + i + '</td><td>' + list[i].manittoId + '</td><td>' + list[i].manittiId + '</td></tr>'
				}

				$('tbody').html(result);

				if(list.length == 0){
					$('#createBtn').html('<button type="button" class="btn btn-primary" id="matching">마니또 매칭</button>')
				}
				else{
					$('#createBtn').html('<button type="button" class="btn btn-primary">마니또 종료</button>');
				}
			}
		})
	}

	
</script>

</body>
</html>