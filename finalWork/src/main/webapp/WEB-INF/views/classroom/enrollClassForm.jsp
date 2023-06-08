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
            <form action="addClass.cl" method="POST">
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
                    <button type="submit" class="btn btn-primary">ENROLL CLASS!!!</button>
                    <a href="#" class="ml-2">Create new Class?</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>