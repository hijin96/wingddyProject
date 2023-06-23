<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OX퀴즈</title>
</head>
<style>
	.quiz-contain {
		background-color: rgb(240, 240, 240) !important;
	}
	.quiz-contain h5{
		width: 85%;
	}
</style>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
	
	<div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>OX퀴즈</h1>
                <input type="hidden" value="${edu.eduNo}" id="eduNo"/>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <h2 class="section-title">${edu.eduName}</h2>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
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
                                <div class="row">
				                    <div class="col-6">
				                        <div class="card">
				                            <div class="card-body" align="center" name="OX-quiz">
				                                O
				                            </div>
				                        </div>
				                    </div>
				                    <div class="col-6">
				                        <div class="card">
				                            <div class="card-body" align="center" name="OX-quiz">
				                                X
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
	<script>
		
		window.onload = () =>{
			getQuiz();
		}

		let quizArr;		// 퀴즈 리스트 배열
		let answerArr = []; // 입력 배열
		let answerObj;		// 입력 객체
		let httpRequest;	

		// 퀴즈 리스트 불러오기(ajax)
		const getQuiz = () => {
			
			httpRequest = new XMLHttpRequest();

			const eduNo = document.getElementById('eduNo').value;
			
			httpRequest.onreadystatechange = () =>{
				if(httpRequest.readyState === XMLHttpRequest.DONE){
					if(httpRequest.status === 200){

						let result = httpRequest.response;
						
						quizArr = result;
						
						document.getElementById('quiz-index').innerText = 1;
						document.getElementById('quiz-content').innerText = result[0].quizContent;
						document.getElementById('quiz-no').value = result[0].quizNo;
					}
				}
			}
			httpRequest.open('POST', 'examQuiz.qz?eduNo=' + eduNo);
			httpRequest.responseType = 'json';
			httpRequest.send();
		}

		// OX정답 클릭
		$('div[name=OX-quiz]').click(e => {
			let target = $(e.target);
			let elseTarget; 
			let quizIndex = $('#quiz-index').text();
			let targetText = target.text().trim(' ');

			$('div[name=OX-quiz]').each((i, e) => {
				if($(e).text().trim(' ') != targetText){
					elseTarget = $(e);
				}
			});

			checkIndex(quizIndex);

			target.css('background-color','rgb(220, 220, 220)');
			elseTarget.css('background-color','white');
			
			answerObj = {'quizNo':$('#quiz-no').val(),'correctContent' : quizArr[quizIndex - 1].correctContent,'incorrectContent' : targetText};
		});

		// 이전버튼
		$('#prev-btn').click(() => {
			let index = answerArr.length - 1;
			let prevAnswer = answerArr[index];
			changeQuiz(-1);
			$('div[name=OX-quiz]').each((i, e) => {
				if($(e).text().trim(' ') == prevAnswer.incorrectContent){
					$(e).css('background-color','rgb(220, 220, 220)');
				}
			});
			$('#next-btn').removeAttr('disabled');
			answerArr.pop();
			checkLength();
		});

		// 다음 버튼
		$('#next-btn').click(() => {
			answerArr.push(answerObj);
			console.log(answerArr);
			changeQuiz(1);
			checkLength();
		});
		
		// 제출 버튼
		$('#send-btn').click(() => {
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
			$('div[name=OX-quiz]').css('background-color','white');
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