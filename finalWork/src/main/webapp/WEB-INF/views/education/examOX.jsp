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
</style>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>
	
	<div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>${edu.eduType eq 'W' ? '단어퀴즈' : edu.eduType eq 'S' ? '문장배치' : 'OX퀴즈'}</h1>
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
                                <h5>1번문제</h5>
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
				                    	<button class="btn btn-primary" id="prev-btn">이전</button>
				                    </div>
				                    <div class="col-6 text-right">
				                    	<button class="btn btn-primary" id="next-btn">다음</button>
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

		let quizArr;
		let httpRequest;
		const getQuiz = () => {
			httpRequest = new XMLHttpRequest();

			const eduNo = document.getElementById('eduNo').value;
			
			httpRequest.onreadystatechange = () =>{
					if(httpRequest.readyState === XMLHttpRequest.DONE){
						if(httpRequest.status === 200){

							let result = httpRequest.response;
							
							quizArr = result;
							
							document.getElementById('quiz-content').innerText = result[0].quizContent;
							
					}
				}

			}
			httpRequest.open('POST', 'examQuiz.qz?eduNo=' + eduNo);
			httpRequest.responseType = 'json';
			httpRequest.send();
		}

		$('div[name=OX-quiz]').click(e => {
			let target = $(e.target);
			let elseTarget; 
			
			$('div[name=OX-quiz]').each((i, e) => {
				if($(e).text() != target.text()){
					elseTarget = $(e);
				}
			});
			
			target.css('background-color','rgb(220, 220, 220)');
			elseTarget.css('background-color','white');
		});

	</script>
</body>
</html>