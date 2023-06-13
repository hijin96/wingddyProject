<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/assets/modules/jquery-selectric/selectric.css">
</head>
<body>

    <jsp:include page="../sideBar/sideBar.jsp" />
    
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>A클래스</h1>
                <h4>(user01)선생님</h4>
                <div class="section-header-breadcrumb">
                    <div class="card-body">
                        <a href="#" style="margin-bottom:5px;" class="btn btn-block btn-success">&nbsp;학생추방</a>
                        <a href="#" style="margin-bottom:5px;" class="btn btn-block btn-warning">&nbsp;뽑기횟수</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>전체 학생 조회목록</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-md management">
                                <thead>
                                    <tr>
                                        <th>학생이름</th>
                                        <th>학생아이디</th>
                                        <th>전화번호</th>
                                        <th>학습 참여율</th>
                                        <th>선택</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>학생7</td>
                                        <td>user07</td>
                                        <td>010-1234-1234</td>
                                        <td>11 / 12</td>
                                        <td>
                                            <input type="checkbox" name="student">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>학생8</td>
                                        <td>user08</td>
                                        <td>010-1234-1234</td>
                                        <td>10 / 12</td>
                                        <td>
                                            <input type="checkbox" name="student">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>학생6</td>
                                        <td>user06</td>
                                        <td>010-1234-1234</td>
                                        <td>9 / 12</td>
                                        <td>
                                            <input type="checkbox" name="student">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>학생9</td>
                                        <td>user09</td>
                                        <td>010-1234-1234</td>
                                        <td>6 / 12</td>
                                        <td>
                                            <input type="checkbox" name="student">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>학생10</td>
                                        <td>user10</td>
                                        <td>010-1234-1234</td>
                                        <td>3 / 12</td>
                                        <td>
                                            <input type="checkbox" name="student">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        $(function(){
                $('.management').find('tbody>tr').click(function(){
                    if($(this).find('input[name=student]').is(':checked') == false){
                        $(this).find('input[name=student]').prop('checked', true);
                    }
                    else{
                        $(this).find('input[name=student]').prop('checked', false);
                    }
                })
        })
    </script>
    <script src="resources/assets/js/page/features-posts.js"></script>
</body>
</html>