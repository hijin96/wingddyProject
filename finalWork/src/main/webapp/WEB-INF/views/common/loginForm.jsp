<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Login &mdash; Wingddy</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="resources/assets/modules/bootstrap-social/bootstrap-social.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="resources/assets/css/style.css">
  <link rel="stylesheet" href="resources/assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>

  <style>
    #kakao{
      background-color : #FEE500;
      color : #000000;
    }
  </style>
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
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Ft0B9e%2Fbtsh9BI8zya%2FUifPbFfhfWwk7NzrRCW6J0%2Fimg.png" alt="logo" width="350">
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Wingddy Login</h4></div>

              <div class="card-body">
                <form method="POST" action="login.me" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="email">ID</label>
                    <c:choose>
                      <c:when test="${not empty cookie.saveId}">
                        <input id="email" type="text" class="form-control" name="memberId" tabindex="1" value="${cookie.saveId.value}" autofocus>
                      </c:when>
                      <c:otherwise>
                        <input id="email" type="text" class="form-control" name="memberId" tabindex="1" required autofocus>
                      </c:otherwise>
                    </c:choose>
                    <div class="invalid-feedback">
                      Please fill in your ID!
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                    	<label for="password" class="control-label">Password</label>
                      <div class="float-right">
                        <a href="auth-forgot-password.html" class="text-small">
                          Forgot Password?
                        </a>
                      </div>
                    </div>
                    <input id="password" type="password" class="form-control" name="memberPwd" tabindex="2" required>
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <c:choose>
                        <c:when test="${not empty cookie.saveId}">
                          <input type="checkbox" name="remember" class="custom-control-input" onclick="deleteCookie();" tabindex="3" id="remember-me" value="remember" checked>
                        </c:when>
                        <c:otherwise>
                          <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me" value="nope">
                        </c:otherwise>
                      </c:choose>
                      <label class="custom-control-label" for="remember-me">Remember Me</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                </form>
                <div class="text-center mt-4 mb-3">
                  <div class="text-job text-muted">Login With Social</div>
                </div>
                <div class="row sm-gutters">
                  <div class="col-6">
                      <a href="#" id="kakao">
                        <img src="resources/images/kakao_login_medium_narrow.png" alt="kakaoLogin">
                      </a>                                
                  </div>
                </div>

              </div>
            </div>
            <div class="mt-5 text-muted text-center">
              Don't have an account? <a href="#exampleModal" data-toggle="modal">Create One</a>
            </div>
            <div class="simple-footer">
              Copyright &copy; Wingddy 2023
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">JOIN WINNGDDY!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>What are the types of customers to sign up for?</p>
        </div>
        <div class="modal-footer bg-whitesmoke br" style="margin:auto;">
          <a href="enrollForm.me?teacher" class="btn btn-primary">Teacher</a>
          <a href="enrollForm.me?student" class="btn btn-primary">Student</a>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
 
  <!-- General JS Scripts -->
  <script src="resources/assets/modules/jquery.min.js"></script>
  <script src="resources/assets/modules/popper.js"></script>
  <script src="resources/assets/modules/tooltip.js"></script>
  <script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="resources/assets/modules/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->
  <script>
    /*
    $(function(){
      //console.log($('#remember-me').is(':checked'));
      if($('#remember-me').is(':checked') === false){
        $.ajax({
          url : 'deleteCookie.me',
          type : 'POST',
          data : {cookie : '${cookie.saveId.value}'},
          success : function(result){
            console.log('asd');
              if(result == 'success'){
                $('#remember-me').prop('checked', false);
                $('input[name=memberId]').val('');
              }
          },
          error : function(){
              console.log('실패실패실패실패실패실패!!!!!!!!');
          }
        });
      }
    })
    */
    function deleteCookie(){
      if($('remember-me').is(':checked') === false){
        $.ajax({
          url : 'deleteCookie.me',
          type : 'POST',
          data : {cookie : '${cookie.saveId.value}'},
          success : function(result){
              if(result === 'success'){
                $('#remember-me').one('checked', false);
                $('input[name=memberId]').val('');
              }
              
          },
          error : function(){
              console.log('실패실패실패실패실패실패!!!!!!!!');
          }
        });
      }
    }

    $(function(){
      $('#kakao').click(function(){
        let responseType = '&response_type=code';
        let clientId = '&client_id=af6d74bf8700ecc5864ca816dbce8bee';
        let redirectUri = '&redirect_uri=http://localhost:8007/wingddy/kakaoLogin.me';
        let scope = '&scope=account_email,profile_image';
        let loginUrl = 'https://kauth.kakao.com/oauth/authorize?' + responseType + clientId + redirectUri + scope;
        location.href = loginUrl;
      })
    })
  </script>
  <!-- Page Specific JS File -->
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
</body>
</html>