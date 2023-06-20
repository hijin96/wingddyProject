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
          <div class="search-element">
            <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="250">
            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
          </div>
        </form>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown dropdown-list-toggle"><a href="" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle beep"><i class="far fa-envelope"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">Messages
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-message">
                
                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-avatar">
                    <img alt="image" src="resources/assets/img/avatar/avatar-2.png" class="rounded-circle">
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Dedik Sugiharto</b>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>

                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-avatar">
                    <img alt="image" src="resources/assets/img/avatar/avatar-2.png" class="rounded-circle">
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Dedik Sugiharto</b>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>

                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-avatar">
                    <img alt="image" src="resources/assets/img/avatar/avatar-2.png" class="rounded-circle">
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Dedik Sugiharto</b>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>
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
              

              <script>
                $('.moveToLetter').click(function(){
                  let cno = $(this).next().val();

                  $('#form-cno').val(cno);
                  $('#postLetterSender').submit();
                });
              </script>

         


            </div>
          </li>
          <c:choose>
            <c:when test="${not empty loginUser}">
              <li class="dropdown"><a href="" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <c:choose>
                  <c:when test="${not empty profile}">
                    <img alt="image" src="${contextPath}/${profile.filePath}" class="rounded-circle mr-1">
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
                  <a href="logout.me" class="dropdown-item has-icon text-danger">
                  <i class="fas fa-sign-out-alt"></i> 로그아웃
                  </a>
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
              <a href="loginForm.me" class="dropdown-item has-icon text-danger">
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
				<li>
					<a class="nav-link submit"><i class="fas fa-pencil-ruler"></i> <span>쪽지</span></a>
					<input type="hidden" name="url" value="" />
				</li>
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
                    <li><a href="logout.me">로그아웃</a></li> 
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
                    <li><a href="errorPage.me">비밀번호 찾기</a></li> 
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
      <input type="hidden" name="mno" value="${sessionScope.loginUser.memberNo}">
    </form>
    
    <script>
      window.onload(movePage());
      
      function moveToLetterBox (){
        document.getElementById('moveToLetterBox').submit();
      }
    </script>
    <c:remove var="letterCno" scope="request" />
  </c:if>

   <c:if test="${ not empty alphabetBno }">
    <form action="detail.aph" method="post" id="moveToWrtiersDetail">
      <input type="hidden" name="bno" value="${requestScope.alphabetBno}">
    </form>
    
    <script>
      window.onload(movePage());
      
      function moveToWrtiersDetail (){
        document.getElementById('moveToWrtiersDetail').submit();
      }
    </script>
    <c:remove var="alphabetBno" scope="request" />
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