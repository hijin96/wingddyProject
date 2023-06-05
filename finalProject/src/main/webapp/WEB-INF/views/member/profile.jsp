<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Profile &mdash; Stisla</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap-social/bootstrap-social.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/summernote/summernote-bs4.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/ionicons/css/ionicons.min.css">

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

  <jsp:include page="../sideBar/sideBar.jsp" />

  <div class="main-content">

    <section class="section">
    <div class="col-12 col-md-12 col-lg-5">
          <div class="card profile-widget">
            <div class="profile-widget-header">                     
              <img alt="image" src="${contextPath}/resources/assets/img/avatar/avatar-1.png" class="rounded-circle profile-widget-picture">
              <div class="profile-widget-items">
                <div class="profile-widget-item">
                  <div class="profile-widget-item-label">Posts</div>
                  <div class="profile-widget-item-value">187</div>
                </div>
                <div class="profile-widget-item">
                  <div class="profile-widget-item-label">Followers</div>
                  <div class="profile-widget-item-value">6,8K</div>
              </div>
              <div class="profile-widget-item">
                <div class="profile-widget-item-label">Following</div>
                <div class="profile-widget-item-value">2,1K</div>
              </div>
            </div>
          </div>
          <div class="profile-widget-description">
            <div class="profile-widget-name">${loginUser.memberName} <div class="text-muted d-inline font-weight-normal"><div class="slash"></div> ${loginUser.email}</div></div>
            PHONE : <b>${loginUser.phone}</b><br>
            ENROLLDATE : <b>${loginUser.enrollDate}</b><br>
            기타 프로필에 올려볼 정보(마니또, 캘린더일정, 내클래스, 알파벳마켓, 쪽지)
          </div>
          <div class="card-footer text-center">
            <div class="font-weight-bold mb-2">Wingddy Menu</div>
            <a href="#" class="ion-university" data-pack="default" data-tags="graduate, education, school, tassle" style="font-size:x-large;"></a>
            <a href="#" class="ion-ios-calendar" data-pack="ios" data-tags="date, time, month, year" style="font-size:x-large;"></a>
            <a href="#" class="ion-ios-bookmarks" data-pack="default" data-tags="favorite, tag, save" style="font-size: x-large;"></a>
            <a href="#" id="swal-7" class="ion-android-settings" data-pack="android" data-tags="options" style="font-size:x-large;"></a>
          </div>
        </div>
      </div>

        
      </section>

    </div>

    <!-- General JS Scripts -->
  <script src="resources/assets/modules/jquery.min.js"></script>
  <script src="resources/assets/modules/popper.js"></script>
  <script src="resources/assets/modules/tooltip.js"></script>
  <script src="resources/assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="resources/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="resources/assets/modules/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->
  <script src="resources/assets/modules/sweetalert/sweetalert.min.js"></script>

  <!-- Page Specific JS File -->
  <script src="resources/assets/js/page/modules-sweetalert.js"></script>
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>

  <script>
    $("#swal-7").click(function() {
            swal({
              title: 'What is your Password?',
              content: {
              element: 'input',
              attributes: {
                placeholder: 'Type your Password',
                type: 'text',
              },
              },
            }).then((data) => {
              $.ajax({
                url : 'confirmPass.me',
                data : {memberPwd : data},
                type : 'post',
                success : function(result){
                    //console.log(result);
                    if(result === '1'){
                      swal('Correct password!', 'update profile?', 'success');
                      $('.swal-button--confirm').on('click', function(){
                          //console.log('dd');
                          location.href = 'updateForm.me';
                      })
                      
                    }
                    else{
                      swal('incorrect password!', 'enter agian', 'error');
                    }
                },
                error : function(){
                  swal('incorrect password!', 'enter agian', 'error');
                }
              });
            });
          });
  </script>
</body>
</html>