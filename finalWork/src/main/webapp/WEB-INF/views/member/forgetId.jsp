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

    <div class="card card-primary">
        <div class="card-header">
            <h4>아이디 찾~기~~~~~!</h4>
        </div>
        
        <div class="row">

                <div class="form-group col-3">
                    <label for="email">EMAIL</label>
                    <input id="emailFornt" type="text" class="form-control" name="email" autofocus required placeholder="Please Enter Email">
                </div>
                <div class="form-group col-3">
                    <label for="emailBack">Select Email</label>
                    <select class="form-control selectric" id="emailBack">
                        <option>Enter It YourSelf</option>
                        <option>@wingddy.com</option>
                        <option>@naver.com</option>
                        <option>@gmail.com</option>
                        <option>@daum.net</option>
                    </select>
                </div>
        </div>
            <div class="form-group col-3">
                <label for="email"><button type="submit" id="search" class="btn btn-icon btn-info">버어튼</button></label>
            </div>
    </div>
</div>  

    <script>
        $(function(){
            $('#search').click(function(){

                //console.log($('#emailFornt').val() + $('#emailBack option:selected').val());

                $.ajax({
                    url : 'searchId.me',
                    type : 'post',
                    data : { 
                        email : $('#emailFornt').val() + $('#emailBack option:selected').val()
                    },
                    success : function(member){
                        if(member != null){
                            alert(member.memberId);
                        } 
                        else {

                        }
                    },
                    error : function(){
                        alert('실패했음 ㅅㄱ');
                    }
                });
            })
        })
    </script>
</body>
</html>