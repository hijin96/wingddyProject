<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>KakaoEnrollForm &mdash; Wingddy</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/jquery-selectric/selectric.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/dropzonejs/dropzone.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/style.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA --></head>
<body>
    <div id="app">
        <section class="section">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
                        <div class="login-brand">
                            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Ft0B9e%2Fbtsh9BI8zya%2FUifPbFfhfWwk7NzrRCW6J0%2Fimg.png" alt="logo" width="350">
                        </div>

                        <div class="card card-primary">
                            <div class="card-header"><h4>Kakao Enroll</h4></div>
                            <button class="" onclick="proveTeacher();" id="proveTeacher">Teacher</button>
                            <button calss="" onclick="justStudent();" id="justStudent">Student</button>
                            <div class="card-body">
                                <form method="POST" action="enrollKakao.me" enctype="multipart/form-data" id="enrollWingddy">
                                    <div class="row">
                                        <input id="frist_name" type="hidden" name="memberId" value="${enrollKakao.memberId}">
                                        <input type="hidden" name="loginType" value="${enrollKakao.loginType}">
                                        <input type="hidden" name="email" value="${enrollKakao.email}">
                                        <div class="form-group col-6">
                                            <label for="last_name">Your Name</label>
                                            <input id="last_name" type="text" class="form-control" name="memberName" required placeholder="Please Enter Name">
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="last_name" id="chkName"></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Phone</label>
                                            <input type="text" id="phone" class="form-control" name="phone" placeholder="Please Enter Phone" required>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="phone" id="chkPhone"></label>
                                        </div>
                                    </div>
                                    <div class="row" id="teacher-file" style="display:none;">
                                        <div class="col-12">
                                          <div class="card">
                                            <div class="card-header">
                                              <h4>재직증명서 첨부하기</h4>
                                            </div>
                                            <div class="card-body">
                                                <div class="fallback">
                                                  <input name="upfile" type="file" class="dropzone dz-clickable"/>
                                                </div>
                                            </div>
                                          </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                          <input type="checkbox" name="agree" class="custom-control-input" id="agree" onclick="agreeEnroll();">
                                          <label class="custom-control-label" for="agree">I agree with the terms and conditions</label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" id="enrollBtn" class="btn btn-primary btn-lg btn-block" disabled>
                                            Join Wingddy
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="simple-footer">
                            Copyright &copy; Wingddy 2023
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        window.onload = function(){

            var nameInput = document.getElementById('last_name');
            var phoneInput = document.getElementById('phone');

            nameInput.addEventListener("keyup", ()=> keyupNameCheck());
            phoneInput.addEventListener("keyup", ()=> keyupPhoneCheck());

        }

        function keyupNameCheck(){
            var nameInput = $('#last_name').val();
            const getName= RegExp(/^[가-힣]{2,5}$/);

            if(!getName.test(nameInput)){
            $('#chkName').text('이름은 5자 이내 한글로 적어주세요!');
            }
            else{
            $('#chkName').text('');
            }
        }

        function keyupPhoneCheck(){
            var phoneInput = $('#phone').val();
            const getPhone = RegExp(/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/);
            //const getPhone = RegExp(/^[0-9]{11}$/);
            if(!getPhone.test(phoneInput)){
                $('#chkPhone').text('-를 포함해서 입력해주세요! (11자리)');
            }
            else{
                $('#chkPhone').text('');
            }
        }

        function agreeEnroll(){
            if($('#agree').is(':checked') == true){
                $('#enrollBtn').attr('disabled', false);
            }
            else{
                $('#enrollBtn').attr('disabled', true);
            }
        }

        function proveTeacher(){
            var teacher = document.getElementById('teacher-file');

            teacher.style = 'display:inline-block';
        }

        function justStudent(){
            
            var teacher = document.getElementById('teacher-file');

            teacher.style = 'display:none';
        }
    </script>

    <!-- General JS Scripts -->
    <script src="resources/assets/modules/jquery.min.js"></script>
    <script src="resources/assets/modules/popper.js"></script>
    <script src="resources/assets/modules/tooltip.js"></script>
    <script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
    <script src="resources/assets/modules/moment.min.js"></script>
    <script src="resources/assets/js/stisla.js"></script>
    
    <!-- JS Libraies -->
    <script src="resources/assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
    <script src="resources/assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
    <script src="resources/assets/modules/dropzonejs/min/dropzone.min.js"></script>

    <!-- Page Specific JS File -->
    <script src="resources/assets/js/page/auth-register.js"></script>
    <script src="resources/assets/js/page/components-multiple-upload.js"></script>
    
    <!-- Template JS File -->
    <script src="resources/assets/js/scripts.js"></script>
    <script src="resources/assets/js/custom.js"></script>
</body>
</html>