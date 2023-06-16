<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 결과</title>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>

    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>과제 결과</h1>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <h2 class="section-title">학습명</h2>
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>(학습명/학습유형)</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-md">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>문제</th>
                                            <th >오답처리</th>
                                            <th>정답</th>
                                            <th>입력한 답</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>apple</td>
                                            <td class="result">false</td>
                                            <td>사과</td>
                                            <td>바난ㄴ나</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>dog</td>
                                            <td class="result">true</td>
                                            <td>개, 강아지</td>
                                            <td>강아지</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>cat</td>
                                            <td class="result">true</td>
                                            <td>고양이</td>
                                            <td>고양이</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            $(function(){
                //console.log(result[0].innerText);
                var result = document.getElementsByClassName('result');
                var boolean = 'false';
                for(var i = 0; i < result.length; i++){
                    if(result[i].innerText == boolean){
                        result[i].style.color = 'red';
                    }
                    else{
                        result[i].style.color = 'green';
                    }
                }
            })
        </script>
    </div>
</body>
</html>