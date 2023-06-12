<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <img alt="image" src="resources/assets/img/example-image.jpg" class="img-fluid">
                        </div>
                    </a>
                </div>
            </div>
        </div>
        </section>
    </div>

</body>
</html>