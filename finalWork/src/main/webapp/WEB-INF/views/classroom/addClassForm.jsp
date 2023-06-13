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
                    <h4>클래스 생성페이지</h4>
                </div>
                <div class="card-body pb-0">
                    <p class="text-muted">선생님만에 클래스 페이지를 만들어보아요!</p>
                    <div class="form-group">
                        <label>클래스 이름을 적어주세요!</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </div>
                            </div>
                            <input type="text" class="form-control" placeholder="ClassName" name="className">
                            <input type="hidden" name="teacherName" value="${loginUser.memberNo}">
                        </div>
                    </div>
                </div>
                <div class="card-footer pt-">
                    <button type="submit" class="btn btn-primary">ADD CLASS!!!</button>
                    <a href="#" class="ml-2">Create new Class?</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>