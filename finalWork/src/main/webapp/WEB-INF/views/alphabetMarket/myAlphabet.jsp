<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 알파벳</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
		
		    <section class="section">
		        <div class="section-header">
		     		<h1>My Alphabet</h1>
		        </div>

		        <div class="section-body">
					<div class="card">
						<div class="card-body">
							<table class="text-primary mb-2">
								<tr>
									<td>내 뽑기 갯수  :</td>
									<td id="gachaCount"></td>
								
								</tr>
								<tr>
									<td>내 쿠폰 갯수  :</td>
									<td id="couponCount"></td>
									
								</tr>
								<tr>
									<td>누적 쿠폰 갯수  :</td>
									<td id="totalCouponCount">5</td>
									
								</tr>
							</table>
							<div align="right">
								<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">알파벳 뽑기</button>
							
								<form action="makeWords.aph" method="post">
									<input type="hidden" name="cno" value="${requestScope.classroom.classNo}">
									<button type="submit"class="btn btn-primary" onclick="moveMakeWords();">단어 만들기</button>
								</form>
							
							</div>
						</div>
						<hr>
						<div class="card-body">
							<div class="row" id="alphabetList">
								
							</div>
						</div>
					</div>

		      	</div>
		    </section>
	    </div>
</div>


<!-- modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title">Alphabet Gacha</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <p>Do you want to pick it?</p>
		</div>
		<div class="modal-footer bg-whitesmoke br">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  <button type="button" class="btn btn-primary"  id="gachaBtn">Gacha!</button>
		</div>
	  </div>
	</div>
  </div>




<script>



	$('#gachaBtn').click(function(){
		getAlphabet();
	})

	$(function(){
		myAlphabet();
		myCount();
	})

	function myCount(){

		$.ajax({
			url : "myCount.aph",
			data : {
				classNo : '${requestScope.classroom.classNo}',
				memberNo : '${sessionScope.loginUser.memberNo}'		
			},
			success : function(result){

		
				$('#gachaCount').text(result.gachaCount);
				$('#couponCount').text(result.couponCount);
				$('#totalCouponCount').text(result.totalCouponCount);
			}
		})
	}



	function myAlphabet(){

		$.ajax({
			url : "myAlphabetList.aph",
			data : {
				cno : '${requestScope.classroom.classNo}',
				mno : '${sessionScope.loginUser.memberNo}'		
			},
			success : function(list){

				var value = '';

				for(let i in list){

					
					value +='<div class="col-12 col-sm-6 col-md-6 col-lg-3"><article class="article article-style-b"><div class="article-header"><div align="right">'
						   +'<div class="article-badge"><div class="article-badge-item bg-danger">' + list[i].count + '</div></div></div> <div class="article-image">'
						   +'<p style="text-align: center; font-size: 150px; margin-top: 70px;">'+ list[i].alphabet + '</p></div></div></article></div>'

						   
				}
				

				$('#alphabetList').html(value);
			}
		})
	}


	function getAlphabet(){
	

		if($('#gachaCount').text() != '0'){

			

			var alphabetArr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
			var random_index = Math.floor(Math.random() * alphabetArr.length);
			var random_alphabet = alphabetArr[random_index];
			
			$.ajax({
				url : 'gacha.aph',
				data : {
					cno : '${requestScope.classroom.classNo}',
					mno : '${sessionScope.loginUser.memberNo}',
					alphabet : random_alphabet
				},
				success : function(result){
					if(result == 'success'){
						myAlphabet();
						myCount();
					}else{
						alert('실패');
					}
				}

			})

			swal(random_alphabet, '를 뽑았어요!!');
				
				
			

		}
		else{
			swal("You don't have a chance to get an alphabet!!");
		}

		$('#exampleModal').modal('hide')
	}




</script>



  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>