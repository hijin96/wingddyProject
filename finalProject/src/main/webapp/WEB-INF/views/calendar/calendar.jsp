<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.js'></script>
<style>

	#btn-modal{
		margin : 10px;
	}
	a{
		text-decoration : none;
		color : black;
	}
	a:hover{
		text-decoration : none;
		color : black;
	}
	#calendar{
		margin : 20px;
	}
	#todayTomorrowSchedule{
		margin : auto;
	}
	#todayTomorrowSchedule >div{
		margin-top : 50px;
		padding : 5px;
	}
	#todayTomorrowSchedule .date{
		font-size : 18px;
		font-weight : bolder;
	}
	#todaySchedule{
		float : left;
	}
	.date{
		text-align : center;
	}
	.schedule-tt{
		width : 400px;
		height : 250px;
		background-color : lightgray;
		display : inline-block;
		margin : 5px;
	}
	#alert-endDate{
		color : red;
		font-size : small;
	}
</style>
</head>
<body>
<div id="app">
<div>
	<jsp:include page="/WEB-INF/views/sideBar/sideBar.jsp"/>
	
	<div class="main-content">
    	
    	<div id="todayTomorrowSchedule">
			<div id="todaySchedule" class="schedule-tt">
				<div id="date_today" class="date">hi</div>
				<hr>
				<ul>
					<li>1번</li>
					<li>2번</li>
				</ul>
			</div>
			<div id="tomorrowSchedule" class="schedule-tt">
				<div id="date_tomorrow" class="date">hi</div>
				<hr>
				<ul>
					<li>1번</li>
					<li>2번</li>
				</ul>
			</div>
		
		</div>
	
    	<div id="content-area">
			<!-- Button to Open the Modal -->
			<button id="btn-modal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">일정 추가</button>
		
			<!-- The Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						
					<form action="insertSchedule" method="GET">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">일정 추가하기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						
						<!-- Modal body -->
						<div class="modal-body">
								일정명 <input type="text" name="schedule" /><br>
								시작일 <input id="startDate" type="date" name="startDate" onchange="checkDate();" /><br>
								종료일 <input id="endDate" type="date" name="endDate" onchange="checkDate();"/><br>
								<p id="alert-endDate" style="display:none;">종료일은 시작일보다 빠를 수 없어요!</p>
								배경색 <input type="color" name="color" />
								<input type="hidden" name="memberNo" value="" />
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer">
						
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-warning" >등록</button>
						</div>
					</form>
					
					</div>
				</div>
			</div>
			
		</div> <!-- 일정추가 모달 끝 -->
			  
			<div id="calendar">
				
			</div>
			
			
		<!-- 캘린더 날짜 클릭 시 해당 날짜의 일정 보여주는 모달 -->
		<div id="theDaySchedule-area" >
		
			<!-- The Modal -->
			<div class="modal fade" id="theDaySchedule">
				<div class="modal-dialog">
			    	<div class="modal-content">
			    	
				       <!-- Modal Header -->
						<div class="modal-header">
							<h4 id="modal-date" class="modal-title date">날짜자리</h4>
						</div>
			
						<!-- Modal body -->
						<div class="modal-body">
							<ul id="todaySchedule">
								<li>
									<span>어쩌고</span>
									
									<button class="btn btn-warning btn-sm">수정</button>
									<button class="btn btn-primary btn-sm" >삭제</button>
									
									
								</li>
								<br>
								<li>2번</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>	
</div>	
	<script>
	   
	    
    	document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	        	dateClick : function(info){
	        		//alert('Clicked on : ' + info.dateStr);
	        		console.log(info.dateStr); // 2023-06-02
	        		$('#theDaySchedule').modal();
	        		$('#modal-date').text(info.dateStr);
	        		
	        		
	        	},
	        	selectable : true,
	        	googleCalendarApiKey : 'AIzaSyDFV8dRGYeO2k9b_bAtA6yueCxVEl3FuYU',
	        	events : {
	        			googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
	        			color : 'transparent',
	        			textColor : 'gray'
	        		},
        		eventClick : function(info){
        			info.jsEvent.stopPropagation();
        			info.jsEvent.preventDefault();
        		}
	        	/*
	        	events: {
	        		googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
	        		{
	        	      title: 'Event1',
	        	      start: '2023-04-04'
	        	    },
	        	    {
	        	    	title : 'event',
	        	    	start : '2023-04-04',
	        	    	end : '2023-04-06',
	        	    	color : 'yellow',
	        	    	textColor: 'black'
	        	    },
	        	    {
	        	      title: 'Event2',
	        	      start: '2023-05-05'
	        	    }
	        	}
	        	*/
	        });
	        calendar.render();
      
    	});
    	
    	$(function(){
   			var d = new Date();
   			var month = d.getMonth() + 1;
   			var day = d.getDate();
   			var today = month + '월 ' + day + '일';
   			$('#date_today').html('&lt;today&gt;' + today);
			
   			
   			var t = new Date(d.setDate(d.getDate() + 1));
			var tmonth = t.getMonth() + 1;
			var tday = t.getDate();
			var tomorrow = tmonth + '월 ' + tday + '일';
			
			$('#date_tomorrow').html('&lt;tomorrow&gt;' + tomorrow);
   			
    	});
	    	
    	// 일정 추가시 시작일과 종료일 비교
    	function checkDate(){
    		var endDate = $('#endDate').val();
    		var startDate = $('#startDate').val();
    		
    		if(endDate < startDate){
    			$('#alert-endDate').attr('style', 'display:block');
    		} else{
    			$('#alert-endDate').attr('style', 'display:none');
    		}
    		
    	};
	    	
    		
    </script>


</body>
</html>