<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문장배치</title>
<style>
	.quiz-contain {
		background-color: rgb(240, 240, 240) !important;
	}
	.quiz-contain h5{
		width: 85%;
	}
	input[name=word-quiz-answer]{
		width: 80%;
		height : 80%;
	    font-size: 20px;
    	text-align: center;
	}
</style>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
	
	<div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>단어퀴즈</h1>
                <input type="hidden" value="${edu.eduNo}" id="eduNo"/>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <h2 class="section-title">${edu.eduName}</h2>
                    </div>
                    <div class="col-12 col-md-9 col-lg-9">
                        <div class="card quiz-contain">
                            <div class="card-header">
                                <h5><span id="quiz-index"></span>번문제</h5>
								<div class="card-header-action">
									<form action="insertIncorrect.edu" method="POST" id="incorrect-form">
										<input type="hidden" name="cno" value="${classroom.classNo}">
										<input type="hidden" name="incorrectList">
										<button type="button" id="send-btn" class="btn btn-danger" disabled>제출</button>
									</form>
								</div>
								<input type="hidden" id="quiz-no">
                            </div>
							<div class="card-body">
                                <div class="col-12 card" align="center">
                                	<div class="card-body" id="quiz-content"></div>
                                </div>
		                        <div class="col-12 card">
		                            <div class="card-body" align="center">
										<div class="row sortable-card">
												<div class="col-12 col-md-6 col-lg-3">
													<div class="card">
														<div class="card-body">
															
														</div>
													</div>
												</div>
										</div>
		                            </div>
		                        </div>
                            </div>
                            <div class="card-footer">
                            	<div class="row">
				                    <div class="col-6">
				                    	<button class="btn btn-primary" id="prev-btn" disabled>이전</button>
				                    </div>
				                    <div class="col-6 text-right">
				                    	<button class="btn btn-primary" id="next-btn" disabled>다음</button>
				                    </div>
				                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
	</div>
	<!-- General JS Scripts -->
	<script src="resources/assets/modules/jquery.min.js"></script>
	<script src="resources/assets/modules/popper.js"></script>
	<script src="resources/assets/modules/tooltip.js"></script>
	<script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="resources/assets/modules/moment.min.js"></script>
	<script src="resources/assets/js/stisla.js"></script>
	
	<!-- JS Libraies -->
	<script src="resources/assets/modules/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/assets/modules/chocolat/dist/js/jquery.chocolat.min.js"></script>
	
	<!-- Template JS File -->
	<script src="resources/assets/js/scripts.js"></script>
	<script src="resources/assets/js/custom.js"></script>

	<script>
		window.onload = () =>{
			getQuiz();
		}

		let quizArr;		// 퀴즈 리스트 배열
		let answerArr = []; // 입력 배열
		let answerObj;		// 입력 객체
		let contentArr;

		let httpRequest;	

		// 퀴즈 리스트 불러오기(ajax)
		const getQuiz = () => {

			const eduNo = $('#eduNo').val();
			const eduType = 'S';
			$.ajax({
				url:'examQuiz.qz',
				type : 'POST',
				data:{
					eduNo : eduNo,
					eduType : eduType
				},
				success : result => {
					quizArr = result.qList;
					contentArr = result.sList;

					$('#quiz-index').text(1);
					$('#quiz-content').text(result.qList[0].quizContent);
					$('#quiz-no').val(result.qList[0].quizNo);

					let value = '';
					
					for(let i = 0; i < contentArr[0].length; i++){
						value  += '<div class="col-12 col-md-6 col-lg-3">'
								+ 	'<div class="card">'
								+ 		'<div class="card-head">'
								+			contentArr[0][i]
								+		'</div>'
								+	'</div>'
								+ '</div>';
					}
					$('.sortable-card').html(value);
				}
			});
			httpRequest = new XMLHttpRequest();

			
			
			httpRequest.onreadystatechange = () =>{
				if(httpRequest.readyState === XMLHttpRequest.DONE){
					if(httpRequest.status === 200){

						let result = httpRequest.response;
						
						
						
					}
				}
			}
			httpRequest.open('POST', 'examQuiz.qz?eduNo=' + eduNo + '&edyType=' + eduType);
			httpRequest.responseType = 'json';
			httpRequest.send();
		}

		// 입력값 확인
		$('input[name=word-quiz-answer]').keyup(() => {
			let quizIndex = $('#quiz-index').text();
			let length = quizArr.length;
			if(quizIndex < length){
				if($('input[name=word-quiz-answer]').val().trim(' ') != ''){
					$('#next-btn').removeAttr('disabled');
				}else{
					$('#next-btn').attr('disabled', true);
				}
			}
		});

		// 입력답 저장
		const injectAnswer = () => {
			let target = $('input[name=word-quiz-answer]') ;
			let quizIndex = $('#quiz-index').text();
			let targetText = target.val().trim(' ');

			checkIndex(quizIndex);
			
			answerObj = {'quizNo':$('#quiz-no').val(),'correctContent' : quizArr[quizIndex - 1].correctContent,'incorrectContent' : targetText};
			target.val('');
		};

		// 이전버튼
		$('#prev-btn').click(() => {
			let index = answerArr.length - 1;
			let prevAnswer = answerArr[index];
			$('input[name=word-quiz-answer]').val(prevAnswer.incorrectContent);
			changeQuiz(-1);
			$('#next-btn').removeAttr('disabled');
			answerArr.pop();
			checkLength();
		});

		// 다음 버튼
		$('#next-btn').click(() => {
			injectAnswer();
			answerArr.push(answerObj);
			console.log(answerArr);
			changeQuiz(1);
			checkLength();
		});
		
		// 제출 버튼
		$('#send-btn').click(() => {
			injectAnswer();
			answerArr.push(answerObj);
			$('input[name=incorrectList]').val(JSON.stringify(answerArr));
			console.log($('input[name=incorrectList]').val());
			$('#incorrect-form').submit();
		});
		
		// 퀴즈 내용 변경
		const changeQuiz = num => {
			let quizIndex = $('#quiz-index');
			let quizNo = $('#quiz-no');
			let quizContent = $('#quiz-content');
			
			let i = quizIndex.text() - 1 + num;
			
			
			quizNo.val(quizArr[i].quizNo);
			quizContent.text(quizArr[i].quizContent);
			quizIndex.text(i + 1);
			
			checkIndex(quizIndex.text());
			$('#next-btn').attr('disabled', true);
		};

		// 버튼 체크
		const checkIndex = index => {
			let length = quizArr.length - 1;

			if(index == 1){
				$('#prev-btn').attr('disabled', true);
				$('#next-btn').removeAttr('disabled');
			}
			else if(index > length){
				$('#next-btn').attr('disabled', true);
				$('#prev-btn').removeAttr('disabled'); 
			}
			else{
				$('#prev-btn').removeAttr('disabled'); 
				$('#next-btn').removeAttr('disabled');
			}
		}
		
		// 제출 버튼 활성화
		const checkLength = () => {
			if(answerArr.length == quizArr.length - 1){
				$('#send-btn').removeAttr('disabled');
			}
			else{
				$('#send-btn').attr('disabled', true);
			}
		}
	</script>
</body>
</html>