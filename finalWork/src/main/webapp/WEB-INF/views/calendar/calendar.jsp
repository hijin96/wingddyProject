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
		
		<!-- 일정 추가 모달  -->
    	<div id="content-area">
			<!-- Button to Open the Modal -->
			<button id="btn-modal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">일정 추가</button>
		
			<!-- The Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						
					<form action="insertSchedule" method="POST">
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
								배경색 <input type="color" name="color" value="#ffc34d" />
								<input type="hidden" name="memberNo" value="${ loginUser.memberNo }" />
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer">
						
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-warning" >등록</button>
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
						<div id="theDaySchedule-content" class="modal-body">
							내용자리
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 일정 수정 모달  -->
    	<div id="content-area">
		
			<!-- The Modal -->
			<div class="modal fade" id="updateModal">
				<div class="modal-dialog">
					<div class="modal-content">
						
					<form action="updateSchedule" method="POST">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">일정 수정하기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						
						<!-- Modal body -->
						<div id="updateSchedule-info" class="modal-body">
								
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer">
						
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-warning" >수정</button>
						</div>
					</form>
					
					</div>
				</div>
			</div>
			
		</div> <!-- 일정수정 모달 끝 -->
		
		
		
		
		
		
		
		
	</div>
</div>	
</div>	



	<script>
		let memberNo = ${loginUser.memberNo};
	   
	
	    
    	document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	        	dateClick : function(info){
	        		//console.log(info.dateStr); // 2023-06-02
	        		showModal(info.dateStr);
	        	},
	        	selectable : true,
	        	googleCalendarApiKey : 'AIzaSyDFV8dRGYeO2k9b_bAtA6yueCxVEl3FuYU',
	        	
	        	eventSources : [
	        		{
						googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
						color : 'transparent',
						textColor : 'gray',
						classNames : 1
					},
					{
						events : function(info, successCallback, failureCallback){
							console.log('클래스 일정');
							
							$.ajax({
		    					url : 'selectClassScheduleList', // 클래스 일정
		    					data : {memberNo : memberNo, memberType : '${loginUser.memberType}'},
		    					type : 'post',
		    					success : function(clist){
		    						
		    						let value = [];
		    						let cScheduleList1 = '';
		    						let cScheduleList2 = '';
		    						
		    						//console.log(clist);
		    						
		    						for(let i in clist){
			        					 value.push({
			        						 title : "<" + clist[i].className + ">" + clist[i].schedule,
			        						 start : clist[i].startDate,
			        						 end : clist[i].endDate,
			        						 borderColor : '#000000',
			        						 color : '#ffffff',
			        						 textColor : '#ff0000',
			        						 classNames : 2
			        					})
			        					
			        					
			        					let startDate = new Date(clist[i].startDate);
			        					let endDate = new Date(clist[i].endDate);
			        					
			        					//console.log(clist[i].schedule + " 의 endDate : " + endDate);
			        					if(d >= startDate && d <= endDate){
			        						cScheduleList1 +=  "<li><div id='scheduleName' >&lt;" + clist[i].className + "&gt; " + clist[i].schedule + "</div></li>"; 
			        						
			        					} 
			        					
			        					$('#c_todayList ul').html(cScheduleList1);
			        					
			        					if(t >= startDate && t <= endDate){
			        						cScheduleList2 += "<li><div id='scheduleName'>&lt;" + clist[i].className + "&gt;" + clist[i].schedule + "</div></li>"; 
							
			        					}
			        					$('#c_tomorrowList ul').html(cScheduleList2);
			        					
			        					
			        				}
		    						console.log(value);
		    						successCallback(value);
		    					}
		    				})
						}
					},
					{
						events : function(info, successCallback, failureCallback){
							console.log('개인일정');
							
	        				let value = [];
	        				if(${loginUser.memberType eq "S"}){
		        				$.ajax({
				        			url : 'selectScheduleList', // 개인 일정
				        			data : {memberNo : memberNo, memberType : '${loginUser.memberType}'},
				        			type : 'post',
				        			success : function(list){
				        				
				        				console.log('개인일정 조회해옴');
				        				console.log(list);
				        				
				        				
				        				let scheduleList1 = '';
				        				let scheduleList2 = '';
				        				let mark = '';
				        				
				        					for(let i in list){
				        					//console.log(list[i].schedule + "/" + list[i].endDate);
				        					 value.push({
				        						 title : list[i].schedule,
				        						 start : list[i].startDate,
				        						 end : list[i].endDate,
				        						 color : list[i].color,
				        						 classNames : 3
				        					})
				        					
				        					let startDate = new Date(list[i].startDate);
				        					let endDate = new Date(list[i].endDate);
				        					
				        					//console.log(list[i].schedule + " 의 endDate : " + endDate);
				        					
				        					if(d >= startDate && d <= endDate){
				        						scheduleList1 +=  "<li><span id='scheduleName' style='background-color:" + list[i].color + "'>" + list[i].schedule + "</span></li>"; 
				        						
				        					} 
				        					$('#todayList ul').html(scheduleList1);
				        					
				        					if(t >= startDate && t <= endDate){
				        						scheduleList2 += "<li><span id='scheduleName' style='background-color:" + list[i].color + "'>" + list[i].schedule + "</span></li>"; 
								
				        					}
				        					$('#tomorrowList ul').html(scheduleList2);
				        					
				        					
				        				}
				        					successCallback(value);
		        					}
	        				
							} else {
								successCallback('');
							}
		        		}
					}
					
				],
        		eventClick : function(info){
        			info.jsEvent.stopPropagation();
        			info.jsEvent.preventDefault();
        		},
        		eventOrder : ['-title', 'classNames']
	        	
	        });
	        calendar.render();
      
    	});
    	
    	$(function(){
    		
    		//console.log(typeof(${loginUser.memberNo}));
    		
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
    	
   		let arr = []; // 전역변수 생성
   		
    	// 캘린더에서 날짜 클릭 시 해당 날짜의 일정 모달로 출력
    	function showModal(date){
    		
    		arr = []; // 초기화
    		let value = '';
    		$.ajax({
    			url : 'daySchedule',
    			data : {memberNo : memberNo, date : date},
    			type : 'POST',
    			success : function(list){
    				
    				$('#modal-date').html(date);
    				
    				for(let i in list){
						arr.push(list[i]);    					
    					
    					value += "<div>✔️" + list[i].schedule + "(" + list[i].startDate + " ~ " + list[i].endDate +  ")"
							   + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id='scheduleNo' style='display:none'>" + list[i].scheduleNo + " </div>"
							   + "<button type='button' onclick='showUpdateModal(" + i + ");' class='btn btn-warning btn-sm'>수정</button>"
							   + "<button type='button' id='btn1' onclick='deleteSchedule();' class='btn btn-primary btn-sm'>삭제</button></div><br>"; 
    				
    				}
    				$('#theDaySchedule-content').html(value);
    			}
    		});
    			console.log(arr);
    		
    		$('#theDaySchedule').modal();
    		$('#modal-date').text(date);
    	}
	  
    	
    	// 일정 삭제 버튼 클릭 시
    	function deleteSchedule(){
    		let scheduleNo = $('#scheduleNo').text();
    		location.href="deleteSchedule?scheduleNo=" + scheduleNo; 
    	}
 		function showUpdateModal(i){
			
 			let s = arr[i];
 			//console.log(s);
 			
 			let value = '';
 			
 			value += "일정명 <input type='text' name='schedule' value='" + s.schedule + "'/><br>"
				   + "시작일 <input id='re_startDate' type='date' name='startDate' onchange='checkDate();' value='" + s.startDate + "'/><br>"
				   + "종료일 <input id='re_endDate' type='date' name='endDate' onchange='checkDate();' value='" + s.endDate + "'/><br>"
				   + "<p id='re_alert-endDate' style='display:none'>종료일은 시작일보다 빠를 수 없어요!</p>"
				   + "배경색 <input type='color' name='color' value='" + s.color + "'/>"
				   + "<input type='hidden' name='scheduleNo' value='" + s.scheduleNo + "'/>";			
 		
				   $('#updateSchedule-info').html(value);	   
				   
			$('#updateModal').modal();	   
 		}
    	
    	
    	
    	
    	
    	
    	
    		
    </script>


</body>
</html>