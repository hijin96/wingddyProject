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
                      <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        My Manitto
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
                          <tr>
                            <td>단어풀기~!</td>
                            <td>2023-06-28</td>
                            <td><button type="button" class="btn btn-secondary pass">학습!</button></td>
                          </tr>
                          <tr>
                            <td>OX풀이 ~!</td>
                            <td>2023-06-28</td>
                            <td><button type="button" class="btn btn-secondary pass">학습!</button></td>
                          </tr>
                          <tr>
                            <td>배치풀이~!</td>
                            <td>2023-06-28</td>
                            <td><button type="button" class="btn btn-secondary pass">학습!</button></td>
                          </tr>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-12 col-lg-12">
                  <div class="card card-primary">
                    <div class="card-header">
                      <h4>내 클래스 쿠폰스토어</h4>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-md passStudent">
                        <tr>
                          <th>상품명</th>
                          <th>쿠폰설명</th>
                          <th>수량</th>
                        </tr>
                        <tr>
                          <td>지각면제권!</td>
                          <td>지각을 면제해줌</td>
                          <td>10개!</td>
                        </tr>
                        <tr>
                          <td>숙제면제권!</td>
                          <td>숙제를 면제해줌</td>
                          <td>10개!</td>
                        </tr>
                        <tr>
                          <td>과자꾸러미!</td>
                          <td>많은 과자!</td>
                          <td>10개!</td>
                        </tr>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-md-12 col-lg-6">
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
                <div class="col-6 col-md-12 col-lg-6">
                  <div class="card card-primary">
                    <div class="card-header">
                      <h4>내 보유 알파벳</h4>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-md passStudent">
                        <tr>
                          <th></th>
                          <th></th>
                          <th></th>
                        </tr>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
        </section>
    </div>
    <script>
     
     
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