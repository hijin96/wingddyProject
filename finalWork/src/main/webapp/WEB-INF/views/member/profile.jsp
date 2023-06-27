<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
              <c:choose>
                  <c:when test="${not empty profile and loginUser.loginType eq 'W'}">
                    <img alt="image" src="${contextPath}/${profile.filePath}" class="rounded-circle profile-widget-picture">
                  </c:when>
                  <c:when test="${not empty profile and loginUser.loginType eq 'K'}">
                    <img alt="image" src="${profile}" class="rounded-circle profile-widget-picture">
                  </c:when>
                  <c:otherwise>
                    <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle profile-widget-picture">
                  </c:otherwise>
                </c:choose>                 
              <div class="profile-widget-items">
                <div class="profile-widget-item">
                  <div class="profile-widget-item-label">My Profile</div>
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
            <c:choose>
              <c:when test="${loginUser.loginType eq 'W'}">
                <a href="#" id="swal-7" class="ion-android-settings" data-pack="android" data-tags="options" style="font-size:x-large;"></a>
                <a href="#updatePwd" data-toggle="modal" class="ion-key" data-pack="default" data-tags="access" style="font-size:x-large;"></a>
                <c:if test="${loginUser.memberType eq 'T'}">
                  <a href="#" id="swal-9" class="ion-android-settings" data-pack="android" data-tags="options" style="font-size:x-large;"></a>
                </c:if>
              </c:when>
              <c:otherwise>
                <a href="updateForm.me" class="ion-android-settings" data-pack="android" data-tags="options" style="font-size:x-large;"></a>
              </c:otherwise>
            </c:choose>

          </div>
        </div>
      </div>

    </section>
      
      
    <div id="updatePwd" class="modal fade" role="dialog">
      <div class="modal-dialog modal-md modal-dialog-centered">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">비밀번호 변경 모달창</h5>
              </div>
                  <div class="modal-body">
                      <div class="form-group" id="">
                          <label>이메일 입력</label>
                          <div>
                            <input type="text" name="frontEmail" id="frontEmail2">
                          </div>
                      </div>
                      <div class="form-group" id="" >
                        <label for="emailBack">Select Email</label>
                        <select class="form-control selectric backEmail" id="backEmail2">
                            <option selected>@wingddy.com</option>
                            <option>@naver.com</option>
                            <option>@gmail.com</option>
                            <option>@daum.net</option>
                        </select>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-primary forgetPwdBtn">인증코드 받기</button>
                  </div>
          </div>
      </div>
  </div>

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
    $("#swal-7").click(() => {
            swal({
              title: '너의 비밀번호는 뭐니?',
              content: {
              element: 'input',
              attributes: {
                placeholder: 'Type your Password',
                type: 'text',
              },
              },
            }).then(data => {
              $.ajax({
                url : 'confirmPass.me',
                data : {memberPwd : data},
                type : 'post',
                success : result => {
                    //console.log(result);
                    if(result === '1'){
                      swal('Correct password!', 'update profile?', 'success');
                      $('.swal-button--confirm').on('click', function(){
                          //console.log('dd');
                          if('${loginUser.memberType}' === 'T'){
                            location.href = 'updateForm.me?teacher';
                          }
                          else {
                            location.href = 'updateForm.me?student';
                          }
                      })
                      
                    }
                    else{
                      swal('incorrect password!', 'enter agian', 'error');
                    }
                },
                error : () => {
                  swal('incorrect password!', 'enter agian', 'error');
                }
              });
            });
          });

  $("#swal-9").click(() => {
    swal({
      title: 'What is your Password?',
      content: {
      element: 'input',
      attributes: {
        placeholder: 'Type your Password',
        type: 'text',
      },
      },
    }).then(data => {
      $.ajax({
        url : 'confirmPass.me',
        data : {memberPwd : data},
        type : 'post',
        success : result => {
            //console.log(result);
            if(result === '1'){
              swal('Correct Password!', 'Update Proof Of Employment?', 'success');
              $('.swal-button--confirm').on('click', function(){
                  //console.log('dd');
                  if('${loginUser.memberType}' === 'T'){
                    location.href = 'updateEmploy.me';
                  }
              })
              
            }
            else{
              swal('incorrect password!', 'enter agian', 'error');
            }
        },
        error : () => {
          swal('incorrect password!', 'enter agian', 'error');
        }
      });
    });
  });     
  
  $(() => {
      $('.forgetPwdBtn').click(() => {
        $.ajax({
          url : 'forgetPwd.me',
          type : 'POST',
          data : {
            email : $('#frontEmail2').val() + $('#backEmail2 option:selected').val()
          },
          success : result => {
            if(result === 'notExist'){
              alert('가입되어있지 않은 이메일입니다!');
            }
            else {
              alert('인증번호 보내드립니다!ㅋ');
            }
          },
          error : () => {
            console.log('asd');
          }
        });
      })
    })
  </script>
</body>
</html>