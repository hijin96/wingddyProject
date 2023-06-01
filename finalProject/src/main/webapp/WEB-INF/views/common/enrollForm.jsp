<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>EnrollForm &mdash; Wingddy</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/jquery-selectric/selectric.css">

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
              <div class="card-header"><h4>Enroll</h4></div>

              <div class="card-body">
                <form method="POST" action="enrollMember.me">
                  <div class="row">
                    <div class="form-group col-6">
                      <label for="frist_name">Your ID</label>
                      <input id="frist_name" type="text" class="form-control" name="memberId" autofocus required placeholder="Please Enter ID">
                    </div>
                    <div class="form-group col-6">
                      <label for="last_name">Your Name</label>
                      <input id="last_name" type="text" class="form-control" name="memberName" placeholder="Please Enter Name">
                    </div>
                    <!--중복체크-->
                    <div class="form-group col-6">
                      <label for="first_name" id="chkId">asd</label>
                    </div>
                    <div class="form-group col-6">
                      <label for="last_name">sda</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" type="email" class="form-control" name="email" required placeholder="@를 붙혀주세요">
                    <div class="invalid-feedback">
                      인증되었습니다.
                    </div>
                    <select class="form-control selectric">
                      <option>Enter It YourSelf</option>
                      <option>naver.com</option>
                      <option>gmail.com</option>
                      <option>daum.net</option>
                    </select>
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label for="password" class="d-block">Password</label>
                      <input id="password" type="password" class="form-control pwstrength" name="memberPwd" required placeholder="Please Enter Password">
                      <div id="pwindicator" class="pwindicator">
                        <div class="bar"></div>
                        <div class="label"></div>
                      </div>
                    </div>
                    <div class="form-group col-6">
                      <label for="password2" class="d-block">Password Confirmation</label>
                      <input id="password2" type="password" class="form-control" name="password-confirm" required placeholder="Please Enter Password">
                    </div>
                  </div>

                 
                  <div class="row">
                    
                  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <label>Phone</label>
                      <input type="name" class="form-control" name="phone" placeholder="Please Enter Phone" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="agree" class="custom-control-input" id="agree">
                      <label class="custom-control-label" for="agree">I agree with the terms and conditions</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">
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
    /*
    window.onload = function(){
      
      idInput.addEventListener("keyup", ()=> keyupInput());

      
    }
    */
    function keyupInput(){
      const getIdCheck= RegExp(/^[a-zA-Z0-9]{5,13}$/);
      const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
      const getName= RegExp(/^[가-힣]+$/);
      const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      const getPhone = RegExp(/^[0-9]{11}$/);
      const idInput = document.getElementById('frist_name');
      const idValue = idInput.value;
      const idLength = idValue.length;
      /*
      if(idLength >= 5){

        httpRequest = new XMLHttpRequest();

        const textEl = document.getElementById('chkId');
        const text = textEl.value;
        textEl.value = '';
        
        httpRequest.onreadystatechange = () => {

          if(httpRequest.readyState === XMLHttpRequest.DONE){
            if(httpRequest.status === 200){
              
            }
          }
        }
      }
      */
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

  <!-- Page Specific JS File -->
  <script src="resources/assets/js/page/auth-register.js"></script>
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
</body>
</html>