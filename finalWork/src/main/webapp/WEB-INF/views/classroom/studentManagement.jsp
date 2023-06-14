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
                                        <th>선택</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cm" items="${classMember}">
                                    <tr>
                                        <td>${cm.studentNo}</td>
                                        <td>user07</td>
                                        <td>010-1234-1234</td>
                                        <td>11 / 12</td>
                                        <td>
                                            <input type="checkbox" class="student" name="studentNo" value="${cm.studentNo}">
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

            console.log(chkArr.length);
            
            var studentNoArr = [];  
            for(var i = 0; i <= chkArr.length; i++){
                //console.log(chkArr[i].value);
                if($(chkArr[i]).is(':checked')){
                    studentNoArr.push(chkArr[i].value);
                }
            }
            console.log(studentNoArr);
            
            $.ajax({
                url : 'kickoutStudent.cl',
                type : 'POST',
                data : {
                    studentArr : studentNoArr,
                    classNo : $('input[name=classNo]').val()
                },
                success : function(result){
                    location.href=location.href;
                },
                error : function(){
                    console.log('asdasd');
                }
            });
            


        }
    </script>
    <script src="resources/assets/js/page/features-posts.js"></script>
</body>
</html>