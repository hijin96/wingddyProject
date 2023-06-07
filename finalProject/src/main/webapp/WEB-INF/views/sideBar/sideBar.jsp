<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

  <title>사이드바</title>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/jqvmap/dist/jqvmap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/summernote/summernote-bs4.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/owlcarousel2/dist/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/owlcarousel2/dist/assets/owl.theme.default.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/assets/modules/prism/prism.css">

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
<!-- /END GA -->
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
            <div class="search-backdrop"></div>
            <div class="search-result">
              <div class="search-header">
                Histories
              </div>
              <div class="search-item">
                <a href="#">How to hack NASA using CSS</a>
                <a href="#" class="search-close"><i class="fas fa-times"></i></a>
              </div>
              <div class="search-item">
                <a href="#">Kodinger.com</a>
                <a href="#" class="search-close"><i class="fas fa-times"></i></a>
              </div>
              <div class="search-item">
                <a href="#">#Stisla</a>
                <a href="#" class="search-close"><i class="fas fa-times"></i></a>
              </div>
              <div class="search-header">
                Result
              </div>
              <div class="search-item">
                <a href="#">
                  <img class="mr-3 rounded" width="30" src="resources/assets/img/products/product-3-50.png" alt="product">
                  oPhone S9 Limited Edition
                </a>
              </div>
              <div class="search-item">
                <a href="#">
                  <img class="mr-3 rounded" width="30" src="resources/assets/img/products/product-2-50.png" alt="product">
                  Drone X2 New Gen-7
                </a>
              </div>
              <div class="search-item">
                <a href="#">
                  <img class="mr-3 rounded" width="30" src="resources/assets/img/products/product-1-50.png" alt="product">
                  Headphone Blitz
                </a>
              </div>
              <div class="search-header">
                Projects
              </div>
              <div class="search-item">
                <a href="#">
                  <div class="search-icon bg-danger text-white mr-3">
                    <i class="fas fa-code"></i>
                  </div>
                  Stisla Admin Template
                </a>
              </div>
              <div class="search-item">
                <a href="#">
                  <div class="search-icon bg-primary text-white mr-3">
                    <i class="fas fa-laptop"></i>
                  </div>
                  Create a new Homepage Design
                </a>
              </div>
            </div>
          </div>
        </form>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle beep"><i class="far fa-envelope"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">Messages
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-message">
                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-avatar">
                    <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle">
                    <div class="is-online"></div>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Kusnaedi</b>
                    <p>Hello, Bro!</p>
                    <div class="time">10 Hours Ago</div>
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
                    <img alt="image" src="resources/assets/img/avatar/avatar-3.png" class="rounded-circle">
                    <div class="is-online"></div>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Agung Ardiansyah</b>
                    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-avatar">
                    <!-- <img alt="image" src="resources/resources/assets/img/avatar/avatar-4.png" class="rounded-circle"> -->
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Ardian Rahardiansyah</b>
                    <p>Duis aute irure dolor in reprehenderit in voluptate velit ess</p>
                    <div class="time">16 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-avatar">
                    <img alt="image" src="resources/assets/img/avatar/avatar-5.png" class="rounded-circle">
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Alfa Zulkarnain</b>
                    <p>Exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                    <div class="time">Yesterday</div>
                  </div>
                </a>
              </div>
              <div class="dropdown-footer text-center">
                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep"><i class="far fa-bell"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">Notifications
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-icons">
                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-icon bg-primary text-white">
                    <i class="fas fa-code"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Template update is available now!
                    <div class="time text-primary">2 Min Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-info text-white">
                    <i class="far fa-user"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>You</b> and <b>Dedik Sugiharto</b> are now friends
                    <div class="time">10 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-success text-white">
                    <i class="fas fa-check"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Kusnaedi</b> has moved task <b>Fix bug header</b> to <b>Done</b>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-danger text-white">
                    <i class="fas fa-exclamation-triangle"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Low disk space. Let's clean it!
                    <div class="time">17 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-info text-white">
                    <i class="fas fa-bell"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Welcome to Stisla template!
                    <div class="time">Yesterday</div>
                  </div>
                </a>
              </div>
              <div class="dropdown-footer text-center">
                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
          <c:choose>
            <c:when test="${not empty loginUser}">
              <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                  <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
                  <div class="d-sm-none d-lg-inline-block">${loginUser.memberName}</div></a>
                  <div class="dropdown-menu dropdown-menu-right">
                  <div class="dropdown-title">Logged in 5 min ago</div>
                  <a href="features-profile.html" class="dropdown-item has-icon">
                  <i class="far fa-user"></i> Profile
                  </a>
                  <a href="features-activities.html" class="dropdown-item has-icon">
                  <i class="fas fa-bolt"></i> Activities
                  </a>
                  <a href="features-settings.html" class="dropdown-item has-icon">
                  <i class="fas fa-cog"></i> Settings
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="logout.me" class="dropdown-item has-icon text-danger">
                  <i class="fas fa-sign-out-alt"></i> Logout
                  </a>
                  </div>
              </li>
            </c:when>
            <c:otherwise>
              <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <div class="dropdown-menu dropdown-menu-right">
              </a>
              <a href="#exampleModal" data-toggle="modal" class="dropdown-item has-icon">
                <i class="fas fa-cog"></i> EnrollForm
              </a>
              <div class="dropdown-divider"></div>
              <a href="loginForm.me" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> Login
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
            <a href="index.html">St</a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Starter</li>
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i> <span>클래스</span></a>
              <ul class="dropdown-menu">
                <c:forEach var="cList" items="${classList}">
                	<li><a class="nav-link" href="classMain.cl?cno=${cList.classNo}">${cList.className}</a></li>
                </c:forEach>
                <c:if test="${loginUser.memberType eq 'T'}">
                  <li><a href="#exampleModal" data-toggle="modal">add Class +</a></li>
                </c:if>
              </ul>
            </li>
           <!--  <li><a class="nav-link" href="blank.html"><i class="far fa-square"></i> <span>마이페이지</span></a></li> -->
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i class="fas fa-th"></i> <span>스토어</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="storemain">스토어로이동</a></li>
                <li><a class="nav-link" href="storecart">장바구니</a></li>
                <li><a class="nav-link" href="storewish">위시리스트</a></li>
                <li><a class="nav-link" href="storebuy">구매목록</a></li>
              </ul>
            </li>
            <li class="menu-header">소제목 넣을지 뺄지</li>
            <c:if test="${not empty loginUser}">
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>마이페이지</span></a>
              <ul class="dropdown-menu">
                <li><a href="calendar">캘린더</a></li>
                <li><a href="profile.me">내정보수정</a></li>
              </ul>
            </li>    
            <li><a class="nav-link" href="main.vc"><i class="fas fa-pencil-ruler"></i> <span>단어장</span></a></li>
            </c:if>
			
			<c:if test="${ not empty classroom }">
	            <li><%--링크?cno=${class.cno}--%>
	              <a href="#" class="nav-link"><i class="fas fa-pencil-ruler"></i> <span>알파벳마켓</span></a>
	            </li>
	
	            <li>
	              <a href="#" class="nav-link"><i class="fas fa-pencil-ruler"></i> <span>내 알파벳</span></a>
	            </li>
	
	
	            <li>
	              <a href="#" class="nav-link"><i class="fas fa-pencil-ruler"></i> <span>쪽지</span></a>
	            </li>
	
	            <li>
	              <a href="#" class="nav-link"><i class="fas fa-pencil-ruler"></i> <span>마니또 관리</span></a>
	            </li>
	
	
	            <li><a class="nav-link" href="credits.html"><i class="fas fa-pencil-ruler"></i> <span>쿠폰스토어</span></a></li>	
            </c:if>
            <c:choose>
              <c:when test="${not empty loginUser}">
                <li class="menu-header">Profile</li>
                <li class="dropdown">
                  <a href="#" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>${loginUser.memberName}</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="logout.me">Logout</a></li> 
                    <li><a href="#">Information</a></li> 
                    <li><a href="#">Reset Password</a></li> 
                  </ul>
                </li>
              </c:when>
              <c:otherwise>
                <li class="menu-header">Profile</li>
                <li class="dropdown">
                  <a href="#" class="nav-link has-dropdown"><i class="far fa-user"></i> <span>Insert Login</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="loginForm.me">Login</a></li> 
                    <li><a href="enrollForm.me">EnrollForm</a></li> 
                    <li><a href="#exampleModal" data-toggle="modal">EnrollForm</a></li> 
                    <li><a href="#">Forgot ID</a></li> 
                    <li><a href="errorPage.me">Forgot Password</a></li> 
                  </ul>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
          <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
            <a href="#" class="btn btn-primary btn-lg btn-block btn-icon-split">
              <i class="fas fa-rocket"></i> 버튼버튼메인으로?
            </a>
          </div>    
          </aside>
      </div>      
    </div>
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
  <!-- <script src="resources/resources/assets/js/page/index.js"></script> -->
  
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

</html>