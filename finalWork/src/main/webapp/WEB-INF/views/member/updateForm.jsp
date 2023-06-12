<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>updateForm &mdash; Wingddy</title>

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
              <div class="card-header"><h4>Enroll</h4></div>

              <div class="card-body">
                <form method="POST" action="updateMember.me" enctype="multipart/form-data" id="mydropzone">
                  <div class="row">
                    <div class="form-group col-6">
                      <label for="frist_name">Your ID</label>
                      <input type="hidden" name="memberNo" value="${loginUser.memberNo}">
                      <input id="frist_name" type="text" class="form-control" name="memberId" value="${loginUser.memberId}" readonly>
                    </div>
                    <div class="form-group col-6">
                      <label for="last_name">Your Name</label>
                      <input id="last_name" type="text" class="form-control" name="memberName" value="${loginUser.memberName}">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" type="email" class="form-control" name="email" value="${loginUser.email}" readonly>
                  </div>
                 
                  <div class="row">
                    
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label>Phone</label>
                      <input type="name" class="form-control" name="phone" value="${loginUser.phone}" required>
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label>Phone</label>
                      <img src="" alt="">
                    </div>
                  </div>

                  <div class="row" id="teacher-file" style="display:none;">
                    <div class="col-5">
                      <div class="card">
                        <div class="card-header">
                          <h4>재직증명서 첨부하기</h4>
                        </div>
                        <div class="card-body">
                            <div class="fallback">
                              <input name="reUpfile" type="file" class="dropzone"/>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>



                  <div class="row" id="profile">
                    <div class="col-5">
                      <div class="card">
                        <div class="card-header">
                          <h4>프로필 수정하기</h4>
                        </div>
                        <div class="card-body">
                            <div class="fallback">
                              <input name="reUpfile" type="file" class="dropzone dz-clickable"/>
                              <c:choose>
                                <c:when test="${empty profile}">
                                  <input type="hidden" name="update" value="firstUpdate">
                                </c:when>
                                <c:otherwise>
                                  <input type="hidden" name="update" value="update">
                                </c:otherwise>
                              </c:choose>
                            </div>
                        </div>
                      </div>
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
    
    window.onload = function(){
      
      var idInput = document.getElementById('frist_name');

      idInput.addEventListener("keyup", ()=> keyupInput());
    
      const url = new URL(window.location.href);


      console.log(url.search); // ?teacher

      if(url.search === '?teacher'){
        console.log('ok');
        document.getElementById('teacher-file').style = 'display:show';
      }
      else {
        console.log('no');
      }
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