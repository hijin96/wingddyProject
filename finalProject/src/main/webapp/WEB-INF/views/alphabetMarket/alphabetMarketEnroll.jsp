<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알파벳 마켓 게시글 작성</title>
</head>
<body>
<div id="app">

    <jsp:include page="../sideBar/sideBar.jsp" />
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                 <h1>Alphabet Market Enroll</h1>
            </div>

            <div class="section-body">
                <div class="card-body">
                    <form action="enroll.aph">
                        <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title">
                        </div>
                        <div class="form-group">
                        <label>alphabet</label>
                        <select class="form-control">
                            <option>A</option>
                            <option>E</option>
                            <option>T</option>
                        </select>
                        </div>
                        <div class="form-group">
                        <label>content</label>
                        <textarea class="form-control"></textarea>
                        </div>
                        <div align="center">
                            <button class="btn btn-primary btn-lg">submit</button>
                        </div>
                    </form>


                    

                </div>
        </section>
    </div>
</div>

</body>
</html>