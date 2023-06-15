<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/assets/modules/jquery-selectric/selectric.css">
</head>
<body>

    <jsp:include page="../sideBar/sideBar.jsp" />
    
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>A클래스</h1>
                <h4>(user01)선생님 </h4>
                <div class="section-header-breadcrumb">
                    <div class="card-body">
                        <button type="button" style="margin-bottom:5px;" class="btn btn-block btn-success" onclick="kickout();">&nbsp;학생추방</button>
                        <button type="button" style="margin-bottom:5px;" class="btn btn-block btn-warning">&nbsp;뽑기횟수</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>전체 학생 조회목록</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-md management">
                                <thead>
                                    <tr>
                                        <th>학생이름</th>
                                        <th>학생아이디</th>
                                        <th>전화번호</th>
                                        <th>학습 참여율</th>
                                        <th>학습 참여율</th>
                                        <th>선택</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cm" items="${classProgress}">
                                    <tr>
                                        <td>${cm.memberName}</td>
                                        <td>${cm.memberId}</td>
                                        <td>${cm.phone}</td>
                                        <td>${cm.completeCount} / ${cm.totalCount}</td>
                                        <td>${cm.progressRate} %</td>
                                        <td>
                                            <input type="checkbox" class="student" name="studentNo" value="${cm.memberNo}">
                                            <input type="hidden" name="classNo" value="${cm.classNo}">
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>학생 오답 조회</h4>
                            <h6>학생이름 / 학생아이디</h6>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-md management">
                                <thead>
                                    <tr>
                                        <th>학습 명</th>
                                        <th>학습 유형</th>
                                        <th>퀴즈 내용</th>
                                        <th>오답 내용</th>
                                        <th>퀴즈 정답</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>더미 단어퀴즈</td>
                                        <td>W = 단어, S = 문장배치, O = OX퀴즈</td>
                                        <td>apple = ???</td>
                                        <td>바나나나나</td>
                                        <td>사과</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>

    <script>
        $(function(){
                $('.management').find('tbody>tr').click(function(){
                    if($(this).find('input[name=studentNo]').is(':checked') == false){
                        $(this).find('input[name=studentNo]').prop('checked', true);
                    }
                    else{
                        $(this).find('input[name=studentNo]').prop('checked', false);
                    }
                })
        })

        function kickout(){

            var chkArr = new Array();

            var chkArr = $('input[name=studentNo]:checked');

            //console.log(chkArr.length);
            
            var studentNoArr = [];  
            for(var i = 0; i <= chkArr.length; i++){
                //console.log(chkArr[i].value);
                if($(chkArr[i]).is(':checked')){
                    studentNoArr.push(chkArr[i].value);
                }
            }
            //console.log(studentNoArr);
            if(studentNoArr == null){
                $.ajax({
                    url : 'kickoutStudent.cl',
                    type : 'POST',
                    data : {
                        studentArr : studentNoArr,
                        classNo : $('input[name=classNo]').val()
                    },
                    success : function(result){
                        if(result > 0){
                            console.log(result);
                            alert('추방성공');
                            location.reload();
                        }
                        else{
                            alert('추방실패');
                        }
                    },
                    error : function(){
                        console.log('asdasd');
                    }
                });
            }
            else{
                alert('선택된 학생이 없습니다!');
            }
        }
    </script>
    <script src="resources/assets/js/page/features-posts.js"></script>
</body>
</html>