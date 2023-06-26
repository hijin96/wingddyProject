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
	.inject-sentence:hover{
		cursor: pointer;
		background-color: rgb(228, 228, 228);
	}
	.form-row input{
		cursor: pointer;
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
		                        <div class="col-12 card">
		                            <div class="card-body">
										<div class="form-row inputLi">
											<div class="form-group col-md-4">
												<input type="text" class="form-control" id="input1" readonly>
											</div>
											<div class="form-group col-md-4">
												<input type="text" class="form-control" id="input2" readonly>
											</div>
											<div class="form-group col-md-4">
												<input type="text" class="form-control" id="input3" readonly>
											</div>
										</div>
		                            </div>
		                        </div>
		                        <div class="row" id="sentence-box">
									
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
		let contentArr;

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
						value  += '<div class="col-3">'
								+ 	'<div class="card inject-sentence">'
								+ 		'<div class="card-body" align="center">'
								+			contentArr[0][i]
								+		'</div>'
								+	'</div>'
								+ '</div>';
					}
					$('#sentence-box').html(value);
				}
			});
		}

		// 정답 대입
		$('#sentence-box').on('click','.inject-sentence', e => {
			let target = $(e.target).text();
			let inputli = []
			$('.inputLi input').each((i , el) => {
				if($(el).val() == ''){
					inputli.push($(el));
				}
			});
			let checkNum = 1;
			let input = $('.inputLi input');
			for(let i = 1; i <= input.length; i++){
				let inputval = $('#input'+ i)
				if(inputval.val() == target){
					checkNum *= 0;
				}
			}
			if(checkNum != 0){
				$(inputli[0]).val(target);
			}
			checkInput();
		});

		// 대입 값 삭제
		$('.inputLi input').click(e => {
			$(e.target).val('');
			checkInput();
		})

		// 입력값 확인
		checkInput = () => {
			let input = $('.inputLi input');
			for(let i = 1; i <= input.length; i++){
				let inputval = $('#input'+ i)
				let checkNum = 1;
				if(inputval.val() == ''){
					checkNum *= 0;
				}
				if(checkNum != 0){
					$('#next-btn').removeAttr('disabled');
				} 
				else{
					$('#next-btn').attr('disabled', true);
				}
			}
		}

		// 입력답 저장
		const injectAnswer = () => {
			let target = $('.inputLi input');
			let quizIndex = $('#quiz-index').text();
			let targetText = '';
			
			for(let i = 0; i<target.length; i++){
				targetText += $(target[i]).val().trim(' ') + ' ';
			}
			console.log(targetText);

			checkIndex(quizIndex);
			
			answerObj = {'quizNo':$('#quiz-no').val(),'correctContent' : quizArr[quizIndex - 1].correctContent,'incorrectContent' : targetText.trim(' ')};
			target.each((i , e) => {
				$(e).val('');
			})
		};

		// 이전버튼
		$('#prev-btn').click(() => {
			let index = answerArr.length - 1;
			let prevAnswer = answerArr[index];
			let text = prevAnswer.incorrectContent.split(' ');
			let input = $('.inputLi input');
			for(let i = 1; i <= input.length; i++){
				let inputval = $('#input'+ i)
				inputval.val(text[i-1]);
			}
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
			$('#send-btn').attr('disabled', true);
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
			
			let value = '';
					
			for(let j = 0; j < contentArr[i].length; j++){
				value  += '<div class="col-3">'
						+ 	'<div class="card inject-sentence">'
						+ 		'<div class="card-body" align="center">'
						+			contentArr[i][j]
						+		'</div>'
						+	'</div>'
						+ '</div>';
			}
			$('#sentence-box').html(value);
			
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