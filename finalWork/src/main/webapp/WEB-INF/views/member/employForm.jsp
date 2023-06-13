<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <jsp:include page="../sideBar/sideBar.jsp" />


    <div class="main-content">

        <section class="section">
        <div class="card">
            <div class="card-header">
                <h4>My Employment</h4>
                <div class="card-header-action">
                    <a href="#" class="btn btn-primary">View All</a>
                </div>
            </div>
            <div class="card-body">
                <div class="mb-2 text-muted">현재 저장된 재직증명서!</div>
                <div class="chocolat-parent">
                    <a href="#" class="chocolat-image" title="Just an example">
                        <div data-crop-image="285">
                            <c:choose>
                                <c:when test="${empty profile}">
                                    <img alt="image" src="resources/assets/img/example-image.jpg" class="img-fluid">
                                </c:when>
                                <c:otherwise>
                                    <img alt="image" src="${employ.filePath}" class="img-fluid">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h4>재직증명서 첨부하기</h4>
                </div>
                <div class="card-body">
                  <form action="updateEmploy.me" method="POST" class="dropzone" id="mydropzone">
                    <div class="fallback">
                      <input name="reUpfile" type="file" />
                      <c:choose>
                        <c:when test="${empty employ}">
                          <input type="hidden" name="update" value="firstUpdate">
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="originName" value="${employ.originName}">
                          <input type="hidden" name="filePath" value="${employ.filePath}">
                          <input type="hidden" name="fileNo" value="${employ.fileNo}">
                          <input type="hidden" name="update" value="update">
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

        </section>
    </div>

</body>
</html>