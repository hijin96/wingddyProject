<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h1>${classList[0].className}</h1>
                <div class="section-header-breadcrumb">
                  <div class="card-body">
                    <p>
                      <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Class Code
                      </button>
                    </p>
                    <div class="collapse" id="collapseExample">
                      <p>
                        Code : 243214
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
                      <table class="table table-striped table-md">
                        <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>Created At</th>
                          <th>Status</th>
                          <th>Action</th>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>Irwansyah Saputra</td>
                          <td>2017-01-09</td>
                          <td><div class="badge badge-success">Active</div></td>
                          <td><a href="#" class="btn btn-secondary">Detail</a></td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Hasan Basri</td>
                          <td>2017-01-09</td>
                          <td><div class="badge badge-success">Active</div></td>
                          <td><a href="#" class="btn btn-secondary">Detail</a></td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>Kusnadi</td>
                          <td>2017-01-11</td>
                          <td><div class="badge badge-danger">Not Active</div></td>
                          <td><a href="#" class="btn btn-secondary">Detail</a></td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>Rizal Fakhri</td>
                          <td>2017-01-11</td>
                          <td><div class="badge badge-success">Active</div></td>
                          <td><a href="#" class="btn btn-secondary">Detail</a></td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>Isnap Kiswandi</td>
                          <td>2017-01-17</td>
                          <td><div class="badge badge-success">Active</div></td>
                          <td><a href="#" class="btn btn-secondary">Detail</a></td>
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
                      <p>Card <code>.card-primary</code></p>
                    </div>
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
  <script src="resources/assets/modules/chocolat/dist/js/jquery.chocolat.min.js"></script>
  <script src="resources/assets/modules/jquery-ui/jquery-ui.min.js"></script>

  <!-- Page Specific JS File -->
  
  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>
</body>
</html>