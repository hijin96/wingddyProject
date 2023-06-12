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


	#word:hover{
		cursor: pointer;
	}

	#word{
		background-color: white;
		height: 120px;
		width : 60%;
		font-size: 100px;
		text-align: center;
		color: #6777ef;
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
						<form action="insertWords.aph" method="post">
							<div class="card-body">
								
								<input type="hidden" name="classNo" value="${requestScope.classroom.classNo}">
								<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo}">
								<div align="right">
									<button type="submit" class="btn btn-primary">submit</button>
								</div>

								<div align="center">
									Click your alphabet!
									<div class="text-primary mb-2 display-3" ><input type="text" class="form-control" name="word" value="" id="word" required readonly></div>
									<div class="col-sm-12 col-md-7">
										<input type="text" class="form-control" placeholder="writing the meaning"  name="meaning" required>
									</div>
								</div>
								
							</div>
						</form>
						<hr>

						<div class="card-body">
							<div class="card-body">
								<div class="row" id="alphabetList">
								</div>
							</div>
						</div>
						
					</div>
		      	</div>
		    </section>
	    </div>
</div>



<script>

	$(function(){

	myAlphabet();
	})


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

					
					value +='<div class="col-12 col-sm-12 col-md-2 col-lg-2 alphabet"><article class="article article-style-b"><div class="article-header"><div align="right">'
						+'<div class="article-badge"><div class="article-badge-item bg-danger alphabetCount">' + list[i].count + '</div></div></div> <div class="article-image">'
						+'<p style="text-align: center; font-size: 100px; margin-top: 70px;" class="alphabetText">'+ list[i].alphabet + '</p></div></div></article></div>'

						
				}
				

				$('#alphabetList').html(value);
			}
		})
	}


	var result = '';
	var alphabetCount = 0;

	$(document).on('click', '.alphabet', function(){
		
		if($(this).find('.alphabetCount').text() != '0'){

			

			result += $(this).find('.alphabetText').text()

			$('#word').val(result);
			

			alphabetCount = Number($(this).find('.alphabetCount').text());


			$(this).find('.alphabetCount').text(alphabetCount-1);
		}

	});

	$('#word').click(function(){

		
		if($('#word').val().substr(0,$('#word').val().length-1).length == 0){
			console.log($('#word').val().substr($('#word').val().length-1,$('#word').val().length));
			result = '';
			$('#word').val(result);
		}
		else{

			//빠진 알파벳
			console.log($('#word').val().substr($('#word').val().length-1,$('#word').val().length));


			
			var alphabetTextArr =  $('.alphabetText');

			console.log(alphabetTextArr[5]);

			//alphabetTextArr[5].text('55555');

			

			//빠진 결과 출력
			$('#word').val($('#word').val().substr(0,$('#word').val().length-1));

		}
		

	
		

	})
	

</script>
</body>
</html>