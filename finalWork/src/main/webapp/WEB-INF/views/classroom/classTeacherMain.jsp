<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
                        Class Code
                      </button>
                    </p>
                    <div class="collapse" id="collapseExample">
                      <p>
                        ${classroom.enterCode}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-12 col-lg-6">
                  <div class="card card-primary">
                    <div class="card-header">
                      <h4>클래스 입장 수락</h4>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-md passStudent">
                        <tr>
                          <th>학생이름</th>
                          <th>학생아이디</th>
                          <th>전화번호</th>
                          <th>입장여부</th>
                          <th>수락/거절</th>
                        </tr>
                        <c:forEach var="cm" items="${passMember}">
                          <tr>
                            <td>${cm.memberName}</td>
                            <input type="hidden" name="studentNo" value="${cm.studentNo}" class="ddd"/>
                            <input type="hidden" name="classNo" value="${cm.classNo}"/>
                            <td>${cm.memberId}</td>
                            <td>${cm.phone}</td>
                            <td><div class="badge badge-success">입장!</div></td>
                            <td><button type="button" class="btn btn-secondary pass">Detail</button></td>
                          </tr>
                        </c:forEach>
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
              </div>
        </section>
    </div>
    <script>
      $(function(){
        $('.pass').on('click', function(){
          $.ajax({
            url : 'passStudent.cl',
            type : 'post',
            data : {
              studentNo : $(event.target).parents().siblings('input[name=studentNo]').val(),
              classNo : $(event.target).parents().siblings('input[name=classNo]').val()
          },
            success : function(result){
             if(result === "pass"){
              location.href = location.href
             }
            },
            error : function(){
            }
          });
        })
      })
      /*
      $(function(){
        console.log($('.passStudent').find('input[name=studentNo]').val());
      })
      */
      /*
      function pass(){
        console.log($(event.target).parents().siblings('input[name=studentNo]').val());
      }
      */
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