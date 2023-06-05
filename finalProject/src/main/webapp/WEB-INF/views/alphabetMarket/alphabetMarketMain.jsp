<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alphabet Market</title>
</head>
<body>
<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
	    <section class="section">
	        <div class="section-header">
	     		<h1>Alphabet Market</h1>
	        </div>
	
	        <div class="section-body">
	            <div style="text-align: center;" id="filterButton">
					<!--
	                <input type="button" value="A" class="btn btn-warning btn-lg">
	                <input type="button" value="B" class="btn btn-primary btn-lg">
	                <input type="button" value="C" class="btn btn-primary btn-lg">
	                <input type="button" value="D" class="btn btn-primary btn-lg">
	                <input type="button" value="E" class="btn btn-primary btn-lg">
	                <input type="button" value="F" class="btn btn-primary btn-lg">
	                <input type="button" value="G" class="btn btn-primary btn-lg">
	                <input type="button" value="H" class="btn btn-primary btn-lg">
	                <input type="button" value="I" class="btn btn-primary btn-lg">
	                <input type="button" value="J" class="btn btn-primary btn-lg">
	                <input type="button" value="K" class="btn btn-primary btn-lg">
	                <input type="button" value="L" class="btn btn-primary btn-lg">
	                <input type="button" value="M" class="btn btn-primary btn-lg"><br><br>
	                <input type="button" value="N" class="btn btn-primary btn-lg">
	                <input type="button" value="O" class="btn btn-primary btn-lg">
	                <input type="button" value="P" class="btn btn-primary btn-lg">
	                <input type="button" value="Q" class="btn btn-primary btn-lg">
	                <input type="button" value="R" class="btn btn-primary btn-lg">
	                <input type="button" value="S" class="btn btn-primary btn-lg">
	                <input type="button" value="T" class="btn btn-primary btn-lg">
	                <input type="button" value="U" class="btn btn-primary btn-lg">
	                <input type="button" value="V" class="btn btn-primary btn-lg">
	                <input type="button" value="W" class="btn btn-primary btn-lg">
	                <input type="button" value="X" class="btn btn-primary btn-lg">
	                <input type="button" value="Y" class="btn btn-primary btn-lg">
	                <input type="button" value="Z" class="btn btn-primary btn-lg">
					-->
	            </div>
	             
	            <br><br>
	
	            <div>
	                <div class="row">
	                    <div class="col-12 col-md-4 col-lg-4">
	                        <article class="article article-style-c">
	                          <div class="article-header">
	                            <div class="article-image">
	                                <p style="text-align: center; font-size: 150px; margin-top: 100px;">A</p>
	                            </div>
	                          </div>
	                          <div class="article-details">
	                            <div class="article-category"><a href="#">닉네임</a> <div class="bullet"></div> <a href="#">2023-05-04</a></div>
	                          
	                            <div class="article-user">
	                              <div class="article-user-details">
	                                <div class="user-detail-name">
	                                  <a href="#">제목</a>
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                        </article>
	                    </div>
	                    <div class="col-12 col-md-4 col-lg-4">
	                        <article class="article article-style-c">
	                          <div class="article-header">
	                            <div class="article-image">
	                                <p style="text-align: center; font-size: 150px; margin-top: 100px;">A</p>
	                            </div>
	                          </div>
	                          <div class="article-details">
	                            <div class="article-category"><a href="#">닉네임</a> <div class="bullet"></div> <a href="#">2023-05-04</a></div>
	                          
	                            <div class="article-user">
	                              <div class="article-user-details">
	                                <div class="user-detail-name">
	                                  <a href="#">제목</a>
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                        </article>
	                    </div>
	                    <div class="col-12 col-md-4 col-lg-4">
	                        <article class="article article-style-c">
	                          <div class="article-header">
	                            <div class="article-image">
	                                <p style="text-align: center; font-size: 150px; margin-top: 100px;">A</p>
	                            </div>
	                          </div>
	                          <div class="article-details">
	                            <div class="article-category"><a href="#">닉네임</a> <div class="bullet"></div> <a href="#">2023-05-04</a></div>
	                          
	                            <div class="article-user">
	                              <div class="article-user-details">
	                                <div class="user-detail-name">
	                                  <a href="#">제목</a>
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                        </article>
	                    </div>
	                    <div class="col-12 col-md-4 col-lg-4">
	                        <article class="article article-style-c">
	                          <div class="article-header">
	                            <div class="article-image">
	                                <p style="text-align: center; font-size: 150px; margin-top: 100px;">A</p>
	                            </div>
	                          </div>
	                          <div class="article-details">
	                            <div class="article-category"><a href="#">닉네임</a> <div class="bullet"></div> <a href="#">2023-05-04</a></div>
	                          
	                            <div class="article-user">
	                              <div class="article-user-details">
	                                <div class="user-detail-name">
	                                  <a href="#">제목</a>
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                        </article>
	                    </div>
	                  </div>
	            </div>
	
		        
	            
	        </div>
	    </section>
	    
	</div>

</div>







<script>
	
	$(function(){
		
		var alphabetArr = ['A', 'B', 'C'];

		let value = '';
		for(let i in alphabetArr){
			value += '<input type="button" value="'+ alphabetArr[i] +'" class="btn btn-primary btn-lg clickFilter">'
		}

		$('#filterButton').html(value);



		$('.clickFilter').click(function(){

			//selectAlphabetListFilter(this.value);

		})


	})


	/*
	$(function(){
		selectReplyList();
    });

	function selectAlphabetList(){

		$.ajax({
			url : 'main.aph',
			data  : {
				classNo : '${sessionScope.classNo}',
			},
			success : function(list){
				
				let value = '';
				for(let i in list){
					value += '<div class="col-12 col-md-4 col-lg-4">'
						   + '<article class="article article-style-c">'
						   + '<div class="article-header">'
						   + '<div class="article-image">'
						   + '<p style="text-align: center; font-size: 150px; margin-top: 100px;">'+ ${requestScope.AlphabetMarket.alphabet} + '</p>'
						   + '</div></div><div class="article-details">'
						   + '<div class="article-category"><a href="#">' + ${requestScope.AlphabetMarket.writer} + '</a> <div class="bullet"></div> <a href="#">' 
						   + ${requestScope.AlphabetMarket.createDate} + '</a></div>'
						   + '<div class="article-user"><div class="article-user-details"><div class="user-detail-name">'
						   + '<a href="' + 링크 +  '">' + ${requestScope.AlphabetMarket.createDate} + '</a>'
	                       + '</div></div></div></div></article></div>'
				}

				//$('#replyArea tbody').html(value);

			}
		})
	};

	/*
	function selectAlphabetListFilter(){

		$.ajax({
			url : 'main.aph',
			data  : {
				classNo : '${sessionScope.classNo}',
			},
			success : function(result){
				
				let value = '';
				for(let i in list){
					value += '<div class="col-12 col-md-4 col-lg-4">'
						   + '<article class="article article-style-c">'
						   + '<div class="article-header">'
						   + '<div class="article-image">'
						   + '<p style="text-align: center; font-size: 150px; margin-top: 100px;">'+ ${requestScope.AlphabetMarket.alphabet} + '</p>'
						   + '</div></div><div class="article-details">'
						   + '<div class="article-category"><a href="#">' + ${requestScope.AlphabetMarket.writer} + '</a> <div class="bullet"></div> <a href="#">' 
						   + ${requestScope.AlphabetMarket.createDate} + '</a></div>'
						   + '<div class="article-user"><div class="article-user-details"><div class="user-detail-name">'
						   + '<a href="' + 링크 +  '">' + ${requestScope.AlphabetMarket.createDate} + '</a>'
	                       + '</div></div></div></div></article></div>'
				}
			}
		})
	}
	*/


</script>






</body>
</html>