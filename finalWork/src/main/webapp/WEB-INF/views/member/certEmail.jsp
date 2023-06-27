<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #certCodeBtn{
        margin-left: 85%;
    }
</style>
</head>
<body>

    <jsp:include page="../sideBar/sideBar.jsp" />

    <div class="main-content">
        <section class="section">
            <div class="col-12 col-md-6 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>인증코드 입력</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>인증코드 입력</label>
                            <input type="text" class="form-control form-control-lg" name="certCode">
                            <button id="certCodeBtn" type="button" class="btn btn-icon btn-lg btn-success fas fa-check"></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-6" style="display:none;" id="passwordForm">
                <div class="card">
                    <div class="card-header">
                        <h4>비밀번호 재설정</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>비밀번호 재설정</label>
                            <input type="password" class="form-control" name="memberPwd">
                            <input type="hidden" name="email" value="${requestScope.email}">
                        </div>
                        <div class="form-group">
                            <label>비밀번호 재입력</label>
                            <input type="password" class="form-control" name="memberRePwd">
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-primary" id="updatePwd">재설정</button>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>
    <script>
        $(function(){
            $('#certCodeBtn').click(function(){
                $.ajax({
                    url : 'checkCode.me',
                    type : 'POST',
                    data : {
                        certCode : $('input[name=certCode]').val()
                    },
                    success : function(result){
                        if(result === 'success'){
                            $('#passwordForm').css('display', 'inline-block');
                        }
                        else {
                            alert('인증코드 오류!');
                        }
                    },
                    error : function(){

                    }
                });
            })
        })

        $(function(){
            $('#updatePwd').click(function(){
                $.ajax({
                    url : 'updatePwd.me',
                    type : 'POST',
                    data : {
                        memberPwd : $('input[name=memberPwd]').val(),
                        email : $('input[name=email]').val()
                    },
                    success : function(result){
                        if(result > 0){
                            alert('비밀번호가 변경되었어요~! 다시 로그인해주세요!');
                            location.href = 'loginForm.me';
                        }
                        else{
                            alert('비밀번호변경이 실패했어요~!');
                        }
                    },
                    error : function(){
                        
                    }
                });
            });
        })
    </script>
</body>
</html>