<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <jsp:include page="../sideBar/sideBar.jsp" />


    <div class="main-content">
        <div class="card" id="sample-login">
            <form action="enrollClass.cl" method="POST">
                <div class="card-header">
                    <h4>Enroll Class</h4>
                </div>
                <div class="card-body pb-0">
                    <p class="text-muted">Join Your Wingddy Class !!</p>
                    <div class="form-group">
                        <label>Class Name</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" placeholder="Enter Code" name="enterCode">
                            <input type="hidden" name="studentNo" value="${loginUser.memberNo}">
                        </div>
                    </div>
                </div>
                <div class="card-footer pt-">
                    <button type="submit" class="btn btn-primary">SEARCH CLASS!!!</button>
                    <a href="#" class="ml-2">Create new Class?</a>
                </div>
            </form>
        </div>

            <div class="col-6 col-md-12 col-lg-6" style="display:hidden;" id="resultClass">
                <div class="card card-primary">
                    <div class="card-header">
                        <h4>Class ${classroom.className}</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-md passStudent">
                            <tr>
                                <th>클래스이름</th>
                                <th>클래스선생님</th>
                            </tr>
                            <tr>
                                <input type="hidden" name="classNo" value="${classroom.classNo}"/>
                                <td>${classroom.className}</td>
                                <td>${classroom.teacherName}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer pt-">
                        <button type="submit" id="join" class="btn btn-primary" onclick="join();">JOIN CLASS!!!</button>
                    </div>
                </div>
            </div>
    </div>

    <script>
        $(function(){
            if('${ not empty classroom }'){
                $('#resultClass').css('display', 'inline');
            }
        })

        function join(){
            console.log($('input[name=classNo]').val());
            $.ajax({
                url : 'insertPass.cl',
                type : 'POST',
                data : { studentNo : '${loginUser.memberNo}',
                         classNo : $('input[name=classNo]').val()
                },
                success : function(result){
                    if(result > 0){
                        alert('신청되었습니닷');
                        location.href = 'sideBar'
                    }
                },
                error : function(){
                    alert('실팻!!');
                }
            });
        }
    </script>

</body>
</html>