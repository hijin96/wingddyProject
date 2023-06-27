<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>Bootstrap Components &rsaquo; Card &mdash; Stisla</title>
        <!-- General CSS Files -->
        <link rel="stylesheet" href="${contextPath}/resources/assets/modules/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${contextPath}/resources/assets/modules/fontawesome/css/all.min.css">
        <!-- CSS Libraries -->
        <link rel="stylesheet" href="${contextPath}/resources/assets/modules/chocolat/dist/css/chocolat.css">
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
            <div class="section-header">
                <h1>${classroom.className}</h1>
                <h4>(${classroom.teacherName})선생님</h4>
                <div class="section-header-breadcrumb">
                  <div class="card-body">
                    <p>
                      <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="manittiBtn">
                        My Manitti
                      </button>
                    </p>
                    <div class="collapse" id="collapseExample">
                      <p>
                        없으면 없다고, 있으면 이름이랑 아이디
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                  <div class="card card-primary">
                    <div class="card-header">
                      <h4>내 클래스 숙제</h4>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-md passStudent">
                        <tr>
                          <th>숙제명</th>
                          <th>숙제마감일</th>
                          <th>학습하기!</th>
                        </tr>
                        <c:forEach var="edu" items="${eList}">
                          <c:if test="${edu.limitTime gt 0 and edu.eduState eq 0}">
                          <tr>
                            <td>${edu.eduName}</td>
                            <td>${Math.round(edu.limitTime)}일</td>
                            <td>
                              <form action="exam.edu" method="POST">
                                <input type="hidden" name=cno value="${ classroom.classNo }"/>
                                <input type="hidden" value="${edu.eduNo}" name="eduNo"/>
                                <input type="hidden" value="${edu.eduType}" name="eduType"/>
                                <button type="submit" class="btn btn-secondary pass">학습!</button>
                              </form>
                            </td>
                          </tr>
                          </c:if>
                        </c:forEach>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-12 col-lg-12">
                  <div class="card card-primary">
                    <div class="card-header">
                      <h4>클래스 내 랭킹</h4>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-md passStudent">
                        <tr>
                          <th>학생이름</th>
                          <th>학생아이디</th>
                          <th>전화번호</th>
                          <th>순위</th>
                          <th>누적쿠폰수</th>
                        </tr>
                        <c:forEach var="mc" items="${myCount}" varStatus="i">
                            <tr>
                              <td>${mc.memberName}</td>
                              <td>${mc.memberId}</td>
                              <td>${mc.phone}</td>
                              <td>${i.count}</td>
                              <td>${mc.totalCouponCount}</td>
                            </tr>
                        </c:forEach>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
        </section>
    </div>
    <script>

      $('#manittiBtn').click(function(){

        $.ajax({
          url : 'myManitti.mani',
          data : {
            classNo : '${requestScope.classroom.classNo}',
            manittoNo : '${sessionScope.loginUser.memberNo}'
          },
          success : function(manitti){
            if(manitti == ''){
              $('#collapseExample').html('지금은 마니또게임을 하고 있지 않아요!');
              
            }
            else{
              $('#collapseExample').html(manitti);
            }
          }
        });
        
      });
     
     
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
  <script src="resources/assets/modules/chocolat/dist/js/jquery.chocolat.min.js"></script>
  <script src="resources/assets/modules/jquery-ui/jquery-ui.min.js"></script>
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
</body>
</html>