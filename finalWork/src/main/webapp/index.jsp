<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wingddy</title>
<style>
    #main{
        margin-top: 50px;
        height: 600px;
        border: 2px solid black;
        border-radius: 50px;
    }

    #mainLetter{
        margin-top: 50px;
        color: rgba(255, 43, 15, 0.846);
    }
</style>
</head>
<body>

    <div id="app">
	
        <jsp:include page="/WEB-INF/views/sideBar/sideBar.jsp" />
            <div class="main-content" align="center">

                <h1 id="mainLetter" src="">
                    Go for it now!
                </h1>
             
               <img src="/wingddy/resources/uploadFiles/KakaoTalk_20230626_142159758.png" id="main">
            </div>
    </div>

</body>
</html>