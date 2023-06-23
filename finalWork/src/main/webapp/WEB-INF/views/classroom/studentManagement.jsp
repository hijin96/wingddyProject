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
                        <button type="button" style="margin-bottom:5px;" class="btn btn-block btn-warning" data-toggle="modal" data-target="#giftGacha">&nbsp;뽑기횟수</button>
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
                                        <td class="memeberName">${cm.memberName}</td>
                                        <td class="memberId">${cm.memberId}</td>
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
                            <h6></h6>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-md" id="progress">
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
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- 모달 -->
        <div id="giftGacha" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">뽑기 부여 모달창</h5>
                    </div>
                    <!-- 클래스 뽑기 횟수 부여 -->
                    <form action="#" method="POST" id="giftGacha-form">
                        <div class="modal-body">
                            <div class="form-group" id="">
                                <label>학생 선택</label>
                                <input type="number" name="" value="">
                            </div>
                            <div class="form-group" id="" >
                                <label>뽑기횟수 선택</label>
                                <input type="number" name="" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">부~~~~~~~여</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
                $('.management').find('tbody>tr').click(function(){
                    if($(this).find('input[name=studentNo]').is(':checked') == false){
                        $(this).find('input[name=studentNo]').prop('checked', true);
                        //console.log($(this).find('input[name=studentNo]').val());
                        //console.log($(this).find('input[name=classNo]').val());
                        let memberName = $(this).children().first().text();
                        //console.log(memberName);
                        let memberId = $(this).children().first().next().text();
                        $.ajax({
                            url : 'progressStudent.cl',
                            type : 'POST',
                            data : {
                                memberNo : $(this).find('input[name=studentNo]').val(),
                                classNo : $(this).find('input[name=classNo]').val()
                            },
                            success : function(list){
                                //console.log('푸하하하하하하');
                                let progress = '';
                                let eduType = '';
                                for(let i in list){
                                    switch(list[i].eduType){
                                        case 'W' : eduType = '단어풀이'; break;
                                        case 'S' : eduType = '단어배치풀이'; break;
                                        case 'O' : eduType = 'OX퀴즈풀이'; break;
                                    }
                                    if(list[i].incorrectContent != null){
	                                    progress += '<tr>'
	                                           + '<td>' + list[i].eduName + '</td>'                                        
	                                           + '<td>' + eduType + '</td>'                                        
	                                           + '<td>' + list[i].quizContent + '</td>'                                        
	                                           + '<td>' + list[i].incorrectContent + '</td>'                                        
	                                           + '<td>' + list[i].correctContent + '</td>'                                        
	                                           + '</tr>';
                                    }
                                }
                                //console.log(progress);
                                $('#progress tbody').html(progress);
                                $('.card-header>h6').text(memberName + ' / ' + memberId);
                            },
                            error : function(){
                                console.log('ononononononoon');
                            }
                        });
                        
                    }
                    else{
                        $(this).find('input[name=studentNo]').prop('checked', false);
                        $('#progress tbody').html('');
                        $('.card-header>h6').text('');
                    }
                })

            
        })

        function kickout(){

            alert('해당 학생을 추방하시겠습니까?');
            console.log('asd');
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
            console.log(studentNoArr);
            if(studentNoArr != null){
                $.ajax({
                    url : 'kickoutStudent.cl',
                    type : 'POST',
                    data : {
                        studentNoArr : studentNoArr,
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