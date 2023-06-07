<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰게시글쓰기</title>
<style>
.main-content {
	align-content: senter
}

.editor {
	background-color: pink;
	min-width: 800px;
	border: #ccced1 1px solid;
	margin-top: 10px;
	min-height: 30px;
}

#content textarea {
	min-height: 800px;
}

.boxes {
	margin-top: 10px;
	display: flex;
}

.box {
	margin-top: 0px;
	width: 50%;
}

.box .ck-editor__editable {
	height: 100%;
}

.box-left {
	margin-right: 10px;
}

/*
            When toolbar receives this class, it becomes sticky.
            If the toolbar would be scrolled outside of the visible area,
            instead it is kept at the top edge of the window.
         */
#toolbar {
	position: sticky;
	top: 0px;
	z-index: 10;
	height: 20px;
}

form {
	width: 200px
}
</style>

</head>
<body>
	<div id="app">
		<jsp:include page="../sideBar/sideBar.jsp" />
		<div class="main-content">


			<form action="insertstore.do" method="POST">
<div id="editor"></div>
				<div id="toolbar"></div>
				<div contenteditable="true">
					<div contenteditable="false">
					<div id="editor"> </div>
						<div class="editor">
							<div id="header">
								제목
								<p>
									<input type="text" class="form-control" name="spName">
								</p>
							</div>
						</div>


						<div class="boxes">
							<div class="box box-left editor">
								<div id="left-side">
									상품한줄설명 <input type="text" class="form-control" name="spOneCome">
									<div class="box box-right editor">
										<div id="right-side">
											수량 <input type="number" name="amount">
										</div>
									</div>
								</div>

							</div>`
						</div>
						<div class="editor">
							상품설명
							<div id="content">
								<!-- <div id="toolbar" class="ck ck-toolbar__items"></div> -->
								<div id="toolbar" class="ck ck-sticky-panel__content"></div>
								<textarea class="form-control"></textarea>
							</div>
						</div>


					</div>
				</div>

				<input type="button" class="btn btn-secondary mt-3 mx-2"
					value="작성취소" /> <input type="submit"
					class="btn btn-primary mt-3 mx-2" value="작성완료" />
			</form>

		</div>
	</div>



	<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script>
	
var toolbar	= document.getById('toolbar');
	Array.from( inlineInjectElements ).forEach( inlineElement => {
	    const config = {
	        toolbar: {
        items: [
            'undo', 'redo',
            '|', 'heading',
            '|', 'fontfamily', 'fontsize', 'fontColor', 'fontBackgroundColor',
            '|', 'bold', 'italic', 'strikethrough', 'subscript', 'superscript', 'code',
            '-', // break point
            '|', 'alignment',
            'link', 'uploadImage', 'blockQuote', 'codeBlock',
            '|', 'bulletedList', 'numberedList', 'todoList', 'outdent', 'indent'
        ],
        shouldNotGroupWhenFull: true
    }
	    }
	
	</script>

	<script>
		    MultiRootEditor.create( {
		        // Define roots / editable areas:
		        header: document.getElementById( 'header' ),
		        content: document.getElementById( 'content' ),
		        leftSide: document.getElementById( 'left-side' ),
		        rightSide: document.getElementById( 'right-side' )
		    } ).then( editor => {
		        window.editor = editor;
		
		        // Append toolbar to a proper container.
		        const toolbarContainer = document.getElementById( 'toolbar' );
		        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
		
		        // Make toolbar sticky when the editor is focused.
		        editor.ui.focusTracker.on( 'change:isFocused', () => {
		            if ( editor.ui.focusTracker.isFocused ) {
		                toolbarContainer.classList.add( 'sticky' );
		            } else {
		                toolbarContainer.classList.remove( 'sticky' );
		            }
		        } );
		    } )
		    .catch( error => {
		        console.error( 'There was a problem initializing the editor.', error );
		    } );
		    
	
	</script>
</body>

</body>
</html>