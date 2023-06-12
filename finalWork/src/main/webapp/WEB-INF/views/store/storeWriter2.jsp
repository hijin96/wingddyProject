<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰게시글쓰기ajax</title>
	<style>
	.form-control{
		width: 80%;
		max-width: 800px;
		
		}
	.ck.ck-editor  {
			width: 80%;
			max-width: 800px;
			margin: 0 auto;
		}
		
		.ck-editor__editable {
			min-height: 300px;
		}
		
		form {
			text-align: center;
		
		}
	</style>
</head>
<body>
	<div id="app">
		<jsp:include page="../sideBar/sideBar.jsp" />
		
		<div class="main-content">
		<br><br><br><br><br><br>
 		<div class="ck-body-wrapper">
			<!-- <form method="POST" enctype="multipart/form-data" id="storeEnrollForm"> -->
				<div id="header">
					<label>상품명</label><input type="text" class="form-control" name="spName" value="상품명" id="spName">
					<span><label>수량</label><input type="number"  class="form-control" value="0" name="amount" id="amount"></span>
					<span><label>가격</label><input type="number"  class="form-control" value="0" name="spPrice" id="spPrice"></span>
				</div>
				<span><input type="text"  class="form-control" value="한줄소개" name="spOnecom" id="spOnecom"> </span>
				 
				<textarea name="spContent" id="editor"></textarea>
			<form method="POST" enctype="multipart/form-data" id="storeThumupfile">	
				<input class="note-image-input note-form-control note-input" type="file" name="thumupfile" accept="image/*" multiple="multiple" id="thumupfile">
			</form> 
					<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" /> 
					<input type="button" id ='submit' class="btn btn-primary mt-3 mx-2" value="작성완료" />
		</div>
		</div>
	</div>
	


	<script src="/wingddy/resources/ckeditor/ckeditor.js"></script> 
        


	<%--  <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> --%>


	<script>
		let editor;
		ClassicEditor.create(document.querySelector('#editor'), {
			ckfinder : {
				uploadUrl : 'resources/uploadFiles'
			}
	
		})
		.then( newEditor => {
	       editor = newEditor;
	   	} )
	
		.then( editor => {
			window.editor = editor;
		
		} )
		.catch( error => {
			console.error( 'Oops, something went wrong!' );
			console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
			console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
			console.error( error );
		} );
	
	</script>
	<script>
	$('#submit').click(function(){
		const spContent = editor.getData();
		//console.log(editorData);
	 	var spName =$('#spName').val();
		var amount =$('#amount').val();
		var spPrice =$('#spPrice').val();
		var spOnecom = $('#spOnecom').val(); 
		const store = {
			spName : spName,
			amount : amount,
			spPrice: spPrice,
			spOnecom: spOnecom,
			spContent:spContent}; //콘텐츠도 같이 넣어서 넘겨볼까 ㅠ
		const jsonstore =  JSON.stringify(store);
		
		console.log(jsonstore);
		console.log(typeof(jsonstore));
		var storeThumupfile =$('#storeThumupfile')[0];
		var formData = new FormData(storeThumupfile);
		//console.log(typeof(formData));
		var jsonData = JSON.stringify(formData);
	
		$.ajax({
			url:'insertstore.do'
			,data: {jsonstore : jsonstore	
					//,formData : formData
					//,jsonData : jsonData
					
					
			}
			 ,type: 'POST'
			  /*      
			        ,contentType : false
			        ,processData : false    */   
		}).done(function(data){
	        callback(data);
	        
	/* 		$.ajax({
				url:'썸네일넘겨보자'
				,data :{formData : formData}
				,type: 'POST'
				,contentType : false
				,processData : false 
			})	       
			 */
		});

	})
	
	</script>

</body>

</body>
</html>