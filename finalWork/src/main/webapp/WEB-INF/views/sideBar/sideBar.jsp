<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

  <title>사이드바</title>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="resources/assets/modules/jqvmap/dist/jqvmap.min.css">
  <link rel="stylesheet" href="resources/assets/modules/summernote/summernote-bs4.css">
  <link rel="stylesheet" href="resources/assets/modules/owlcarousel2/dist/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="resources/assets/modules/owlcarousel2/dist/assets/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/assets/modules/prism/prism.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="resources/assets/css/style.css">
  <link rel="stylesheet" href="resources/assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA -->

<style>
  .className{
    text-align: center !important;
    color: #6777ef !important;
    font-size: large !important;
    line-height: 60px !important;
  }

  .changeButton{
    border : 0px;
    background-color: #ffffff;
    padding-left: 0px;
    color: gray;
  }
  .changeButton:focus{
  	border : 0 !important;
  	outlint : 0 !important;
  }
  .submit:hover{
  	cursor: pointer;
  }

  .moveToLetter{
    cursor: pointer;
    color : #6777ef !important;
    font-weight: bold !important;
  }

  .footer{
    height: 150px !important;
    position: relative !important;

  }

  .letterClass{
    z-index: 99999999  !important;
    position: relative !important;
  }

  .unReadMessages:hover{
    cursor: pointer;
    background-color: rgb(208, 208, 208) !important;
  }

  #markAll:hover{
    cursor: pointer;
    color : #6777ef !important;
  }



</style>
</head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
          </ul>
          
        </form>
        <ul class="navbar-nav navbar-right">
          <c:if test="${not empty loginUser}">
            <li class="dropdown dropdown-list-toggle"><a href="" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle" id="messageBeep"><i class="far fa-envelope"></i></a>
              <div class="dropdown-menu dropdown-list dropdown-menu-right">
                <div class="dropdown-header">Messages
                  <div class="float-right">
                    <a id="markAll" onclick="markAll();">Mark All As Read</a>
                  </div>
                </div>
                <div class="dropdown-list-content dropdown-list-message" id="messageArea">
                  
                  
                </div>

                
                <div class="dropdown-list-content dropdown-list-message footer">

                  <div class="text-center letterClass">
                  <br>
                  </div>

                  <form action="letterBox" method="post"  id="postLetterSender">
                    <input type="hidden" name="cno" value="" id="form-cno"/>
                  </form>


                  <c:forEach var="cList" items="${classList}">
                    <div class="text-center letterClass">
                      <a class="moveToLetter">${cList.className}<i class="fas fa-chevron-right"></i></a>
                      <input type="hidden" name="cno" value="${cList.classNo}" /> 
                    </div>
                  </c:forEach>
                  
                </div>

                <form action="detail.le" method="post" id="moveToLetterDatail">
                  <input type="hidden" name="cno" value="${requestScope.classroom.classNo}">
                  <input type="hidden" name="letterNo" >
                  <input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo}">
                </form>

                <script>

                  setInterval(() => {messageIcon();
                    
                  }, 1000);

                  $(document).on('click', '.unReadMessages', function(){

                    let cno =  $(this).find('input[name="cno"]').val();

                    let lno = $(this).find('input[name="lno"]').val();
                    
                    $("input[name='letterNo']").val(lno);
                    $("input[name='cno']").val(cno);
              
                    $("#moveToLetterDatail").submit();
                  })


                  function messageIcon(){
                    $.ajax({
                      url : 'unRead.le',
                      data : {
                        memberNo : '${sessionScope.loginUser.memberNo}'
                      },
                      success : function(list){

                        //console.log(list);

                        let value = '';
                        for(let i in list){
                          value += '<a class="dropdown-item dropdown-item-unread unReadMessages"><div>'
                                + '<input type="hidden" name="cno" value="'+ list[i].classNo +'">'
                                + '<input type="hidden" name="lno" value="'+ list[i].letterNo +'">'

                          if(list[i].anonymous == 'Y'){
                            value += '<h6 align="center">Manitto</h6>'
                          }
                          else if(list[i].toManitto == 'Y'){
                            value += '<h6 align="center">Manitti</h6>'
                          }
                          else{
                            value += '<h6 align="center">' + list[i].sender + '</h6>'
                          }
                              
                          value += '<b>' + list[i].className + '</b>'
                                + '<p>' + list[i].letterContent + '</p>'
                                + '<div class="time">' + list[i].sendDate + '</div>'
                                + '</div> </a>'
                        }

                        if(list.length != 0){
                          $('#messageBeep').attr('class','nav-link nav-link-lg message-toggle beep');
                        }
                        else{
                          $('#messageBeep').attr('class','nav-link nav-link-lg message-toggle');
                        }



                        $('#messageArea').html(value);
                      }
                    })
                    
                  }

                  function markAll(){
                    
                    $.ajax({
                      url : 'markAll.le',
                      data : {memberNo : '${sessionScope.loginUser.memberNo}'},
                      success : function(){
                        messageIcon();
                      }
                    })
                  }





                  $('.moveToLetter').click(function(){
                    let cno = $(this).next().val();

                    $('#form-cno').val(cno);
                    $('#postLetterSender').submit();
                  });

                  /*
                  $(function(){
                    $('#kakaoLogout').click(function(){

                      let AuthorizationKey = '%Authorization: KakaoAK 0f4ccb72fe53a170e5cd34928f2e8e78';
                      let contentType = 'Content-Type: application/x-www-form-urlencoded';
                      let targetIdType = '&target_id_type=user_id';
                      let targetId = '&target_id=' + '${loginUser.memberId}';
                      let logoutUrl = 'https://kapi.kakao.com/v1/user/logout' + contentType + AuthorizationKey + targetIdType + targetId;
                      location.href = logoutUrl;
                      console.log(logoutUrl);
                    })
                  })
                  */
                </script>

          


              </div>
            </li>
          </c:if>
          <c:choose>
            <c:when test="${not empty loginUser}">
              <li class="dropdown"><a href="" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <c:choose>
                  <c:when test="${not empty profile and loginUser.loginType eq 'W'}">
                    <img alt="image" src="${contextPath}/${profile.filePath}" class="rounded-circle mr-1">
                  </c:when>
                  <c:when test="${not empty profile and loginUser.loginType eq 'K'}">
                    <img alt="image" src="${profile}" class="rounded-circle mr-1">
                  </c:when>
                  <c:otherwise>
                    <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
                  </c:otherwise>
                </c:choose>
                  <div class="d-sm-none d-lg-inline-block">${loginUser.memberName}</div></a>
                  <div class="dropdown-menu dropdown-menu-right">
                  <a href="features-profile.html" class="dropdown-item has-icon">
                  <i class="far fa-user"></i> 프로필
                  </a>
                  <div class="dropdown-divider"></div>
                  <c:choose>
                    <c:when test="${loginUser.loginType eq 'W'}">
                      <a href="logout.me" class="dropdown-item has-icon text-danger">
                        <i class="fas fa-sign-out-alt"></i> 로그아웃
                      </a>
                    </c:when>
                    <c:when test="${loginUser.loginType eq 'K'}">
                      <form action="logoutKakao.me" method="POST">
                        <button type="submit" class="dropdown-item has-icon text-danger" id="kakaoLogout"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
                      </form>
                    </c:when>
                    <c:when test="${loginUser.loginType eq 'N'}">
                      <a href="logoutNaver.me" class="dropdown-item has-icon text-danger"></a>
                    </c:when>
                  </c:choose>
                  </div>
              </li>
            </c:when>
            <c:otherwise>
              <li class="dropdown"><a href="" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <div class="dropdown-menu dropdown-menu-right">
              </a>
              <a href="#enrollModal" data-toggle="modal" class="dropdown-item has-icon">
                <i class="fas fa-cog"></i> 회원가입
              </a>
              <div class="dropdown-divider"></div>
              <a href="loginForm.me" class="dropdown-item has-icon text-success">
                <i class="fas fa-sign-out-alt"></i> 로그인
              </a>
            	</div>
          	   </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </nav>
     	<div class="col-12 col-md-6 col-lg-6">
      	<div style="height:50px;"></div>
      	</div>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="${contextPath}"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Ft0B9e%2Fbtsh9BI8zya%2FUifPbFfhfWwk7NzrRCW6J0%2Fimg.png" alt="메인페이지로고" width="250px" height="50px"/></a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="${contextPath}">wing</a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">MENU</li>
            <li class="dropdown">
              <a href="" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i> <span>클래스</span></a>
              <ul class="dropdown-menu">
                <c:forEach var="cList" items="${classList}">
                	<li><a class="nav-link" href="classMain.cl?cno=${cList.classNo}">${cList.className}</a></li>
                </c:forEach>
                <c:choose>
                  <c:when test="${loginUser.memberType eq 'T'}">
                    <li><a href="addClassForm.cl">클래스 개설 +</a></li>
                  </c:when>
                  <c:when test="${loginUser.memberType eq 'S'}">
                    <li><a href="enrollClassForm.cl">클래스 입장 +</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="#enrollModal" data-toggle="modal">클래스 입장 +</a></li>
                  </c:otherwise>
                </c:choose>
              </ul>
            </li>
           <!--  <li><a class="nav-link" href="blank.html"><i class="far fa-square"></i> <span>마이페이지</span></a></li> -->
            <li class="dropdown">
              <a href="" class="nav-link has-dropdown"><i class="fas fa-th"></i> <span>스토어</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="storemain">스토어로이동</a></li>
              <c:if test ="${not empty loginUser}">
                <li><a class="nav-link" href="cartDirect">장바구니</a></li>
                <li><a class="nav-link" href="storewish">위시리스트</a></li>
                <li><a class="nav-link" href="storebuy">구매목록</a></li>
               </c:if> 
              </ul>
            </li>
            <c:if test="${not empty loginUser}">
            <li class="menu-header">PRIVATE</li>
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>마이페이지</span></a>
              <ul class="dropdown-menu">
                <li><a href="calendar">캘린더</a></li>
                <li><a href="profile.me">내정보수정</a></li>
              </ul>
            </li>    
            <li><a class="nav-link" href="main.vc"><i class="fas fa-book"></i> <span>단어장</span></a></li>
            </c:if>
            
			<div class="sidebar-brand className">
				${requestScope.classroom.className}
			</div>
			<div class="sidebar-brand sidebar-brand-sm"></div>
			<c:if test="${ not empty classroom }">
        	<!-- ${reqeustScope.classroom.classNo} -->
        		<form action="" method="POST" id="postSender">
        			<input type="hidden" name="cno" value="${requestScope.classroom.classNo}" />
        		</form>
				<li>
					<a class="nav-link submit" ><i class="fas fa-pencil-ruler"></i> <span>내 알파벳</span></a>
					<input type="hidden" name="url" value="myAlphabet.aph" /> 
				</li>	
				<li>
					<a class="nav-link submit" ><i class="fas fa-pencil-ruler"></i> <span>알파벳 마켓</span></a>
					<input type="hidden" name="url" value="main.aph" /> 
				</li>	
        <!--
				<li>
					<a class="nav-link submit"><i class="fas fa-pencil-ruler"></i> <span>쪽지</span></a>
					<input type="hidden" name="url" value="" />
				</li>
        -->
				<li>
					<a class="nav-link submit" ><i class="fas fa-pencil-ruler"></i> <span>마니또 관리</span></a>
					<input type="hidden" name="url" value="main.mani" /> 
				</li>	
				<li>
					<a id="couponHandler" class="nav-link submit"><i class="fas fa-pencil-ruler"></i> <span>쿠폰스토어</span></a>
					<input type="hidden" name="url" value="couponStore" /> 
				</li>	
				<li>
					<a class="nav-link submit"><i class="fas fa-pencil-ruler"></i> <span>과제</span></a>
					<input type="hidden" name="url" value="main.edu" /> 
				</li>	
				<script>
					$('.submit').click(function(){

						let url = $(this).next().val();
						$('#postSender').prop('action', url);
						$('#postSender').submit();
					});
				</script>
	            
      </c:if>
            <c:choose>
              <c:when test="${not empty loginUser}">
                <li class="menu-header">PROFILE</li>
                <li class="dropdown">
                  <a href="" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>${loginUser.memberName}</span></a>
                  <ul class="dropdown-menu">
                    <c:choose>
                      <c:when test="${loginUser.loginType eq 'W'}">
                        <li><a href="logout.me">로그아웃</a></li> 
                      </c:when>
                      <c:when test="${loginUser.loginType eq 'K'}">
                        <form action="logoutKakao.me" method="POST">
                          <li><button type="submit" class="dropdown-item has-icon text-danger" style="margin:auto;">로그아웃</button></li> 
                        </form>
                      </c:when>
                    </c:choose>
                  </ul>
                </li>
              </c:when>
              <c:otherwise>
                <li class="menu-header">프로필</li>
                <li class="dropdown">
                  <a href="#" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>Insert Login</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="loginForm.me">로그인</a></li> 
                    <li><a href="#enrollModal" data-toggle="modal">회원가입</a></li> 
                    <li><a href="forgetId.me">아이디 찾기</a></li> 
                    <li><a href="#forgetPwd" data-toggle="modal">비밀번호 찾기</a></li> 
                  </ul>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
          </aside>
      </div>      
    </div>
  </div>

  <div class="modal fade" tabindex="-1" role="dialog" id="enrollModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">WELCOME WINGDDY!!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>
          	회원가입 후 이용가능 합니다
          </p>
        </div>
        <div class="modal-footer bg-whitesmoke br" style="margin:auto;">
		  <a href="enrollForm.me?teacher" class="btn btn-primary">선생님으로 이용</a>
          <a href="enrollForm.me?student" class="btn btn-primary">학생으로 이용</a>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>


  <div id="forgetPwd" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 찾기 모달창</h5>
            </div>
                <div class="modal-body">
                    <div class="form-group" id="">
                        <label>이메일 입력</label>
                        <div>
                          <input type="text" name="frontEmail" id="frontEmail">
                        </div>
                    </div>
                    <div class="form-group" id="" >
                      <label for="emailBack">Select Email</label>
                      <select class="form-control selectric" id="backEmail">
                          <option selected>@wingddy.com</option>
                          <option>@naver.com</option>
                          <option>@gmail.com</option>
                          <option>@daum.net</option>
                      </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forgetPwdBtn">인증코드 받~기</button>
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


  <c:if test="${ not empty alphabetCno }">
    <form action="makeWords.aph" method="post" id="moveToinsertWords">
      <input type="hidden" name="cno" value="${requestScope.alphabetCno}">
      <input type="hidden" name="mno" value="${sessionScope.loginUser.memberNo}">
    </form>
    
    <script>
      window.onload(movePage());
      
      function movePage (){
        document.getElementById('moveToinsertWords').submit();
      }
    </script>
    <c:remove var="alphabetCno" scope="request" />
  </c:if>
  
  <c:if test="${ not empty letterCno }">
    <form action="letterBox" method="post" id="moveToLetterBox">
      <input type="hidden" name="cno" value="${requestScope.letterCno}">
    </form>
    
    <script>
      window.onload(moveToLetterBox());
      
      function moveToLetterBox (){
        document.getElementById('moveToLetterBox').submit();
      }
    </script>
    <c:remove var="letterCno" scope="request" />
  </c:if>

  <c:if test="${ not empty alphabetBno }">
    <form action="detail.aph" method="post" id="moveToWrtiersDetail">
      <input type="hidden" name="bno" value="${requestScope.alphabetBno}">
      <input type="hidden" name="cno" value="${requestScope.alphabetDetailCno}">
    </form>
    
    <script>
      window.onload(moveToWrtiersDetail());
      
      function moveToWrtiersDetail (){
        document.getElementById('moveToWrtiersDetail').submit();
      }
    </script>
    <c:remove var="alphabetBno" scope="request" />
    <c:remove var="alphabetDetailCno" scope="request" />
  </c:if>
  
  
  <c:if test="${ not empty couponCno }">
    <form action="couponStore" method="post" id="moveToCp">
      <input type="hidden" name="cno" value="${requestScope.couponCno}">
    </form>
    <script>
      	window.onload(moveToCp());
     	 function moveToCp (){
        	document.getElementById('moveToCp').submit();
     	 }
    </script>
    <c:remove var="couponCno" scope="request" />
  </c:if>
  
  
   <c:if test="${ not empty useCpCno }">
    <form action="selectSlist.cp" method="post" id="moveToScplist">
      <input type="hidden" name="cno" value="${requestScope.useCpCno}" />
      <input type="hidden" name="mno" value="${loginUser.memberNo}" />
    </form>
    <script>
      	window.onload(moveToStudentCplist());
     	 function moveToStudentCplist (){
        	document.getElementById('moveToScplist').submit();
     	 }
    </script>
    <c:remove var="useCpCno" scope="request" />
  </c:if>
  

  <script>
    $(function(){

      $('.forgetPwdBtn').click(function(){
        $.ajax({
          url : 'forgetPwd.me',
          type : 'POST',
          data : {
            email : $('#frontEmail').val() + $('#backEmail option:selected').val()
          },
          success : function(result){
            if(result === 'notExist'){
              alert('가입되어있지 않은 이메일입니다!');
            }
            else {
              alert('인증번호 보내드립니다!ㅋ');
            }
          },
          error : function(){
            console.log('asd');
          }
        });
      })
    })
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
  <script src="resources/assets/modules/jquery.sparkline.min.js"></script>
  <script src="resources/assets/modules/chart.min.js"></script>
  <script src="resources/assets/modules/owlcarousel2/dist/owl.carousel.min.js"></script>
  <script src="resources/assets/modules/summernote/summernote-bs4.js"></script>
  <script src="resources/assets/modules/chocolat/dist/js/jquery.chocolat.min.js"></script>

  <!-- Page Specific JS File -->
  <script src="resources/assets/js/page/index.js"></script>
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
  
<!-- Code injected by live-server -->
<!-- 
<script>
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>
 -->
</body>
</html>