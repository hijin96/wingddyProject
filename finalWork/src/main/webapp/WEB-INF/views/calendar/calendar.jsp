<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.card1{
		width : 400px !important;
		display : inline-block !important;
		vertical-align : top !important;
	}
	.moreSmall{
		height : 23px !important;
	}
	.myHeader{
		font-size : 20px !important;
		font-weight : bolder !important;
	}

	
</style>
</head>
<body>
<div id="app">
	<div>
		<jsp:include page="../sideBar/sideBar.jsp"/>
		
		<div class="main-content">
	    	
	    	<!-- 오늘, 내일 스케줄 -->
	    	<div id="todayTomorrowSchedule">
		    	<div class="card card1">
		    	
		       		<div id="date_today" class="card-header myHeader">
		       			<h5>today date</h5> 
		       		</div>
		       		
		            <div id="todayScheduleList" class="ttScheduleList">
			            <div id="c_todayList" >
			            	<ul></ul>
		            	</div>
		            	
			            <div id="todayList">
		                    <ul></ul>
			            </div>
		            </div>
		            
		        </div>
		        
		        <div id="card1" class="card card1">
		        
		       		<div id="date_tomorrow" class="card-header myHeader">
		       			<h5>tomorrow date</h5>
		       		</div>
		       		<div id="tomorrowScheduleList" class="ttScheduleList">
			       		<div id="c_tomorrowList">
			            	<ul></ul>
		            	</div>
		            	
			            <div id="tomorrowList" >
			                <ul></ul>
			            </div>
		            </div>
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
								<div id="choiceClass">
									<c:if test="${loginUser.memberType eq 'T'}">
										<input type="color" name="color" value="#ffc34d" style="display : none"/>
										<c:forEach var="c" items="${classList}">
											<input type="radio" name="classNo" value="${c.classNo}"/><label>${c.className}&nbsp;</label>
										</c:forEach>
									</c:if>
								</div><br>
								일정명 <input type="text" name="schedule" required/><br>
								시작일 <input id="startDate" type="date" name="startDate" onchange="checkDate();" /><br>
								종료일 <input id="endDate" type="date" name="endDate" onchange="checkDate();"/><br>
								<p id="alert-endDate" style="display:none;">종료일은 시작일보다 빠를 수 없어요!</p>
								<c:if test="${loginUser.memberType eq 'S'}">
									배경색 <input type="color" name="color" value="#ffc34d" />
								</c:if>
								<input type="hidden" name="memberNo" value="${ loginUser.memberNo }" />
								<input type="hidden" name="memberType" value="${loginUser.memberType }" />
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
		var memberNo = ${loginUser.memberNo};
		var memberType = '${loginUser.memberType}';
		var todayArr = [];
		var tomorrowArr = [];
		
		var d = new Date();
		var t = new Date(new Date().setDate(d.getDate() + 1));
	   
		// full calendar api
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
						classNames : 'A'
					},
					{
						events : function(info, successCallback, failureCallback){
							let value = [];
							
							$.ajax({
		    					url : 'selectClassScheduleList', // 클래스 일정
		    					data : {memberNo : memberNo, memberType : memberType},
		    					type : 'post',
		    					success : function(clist){
		    						let cScheduleList1 = '';
		    						let cScheduleList2 = '';
		    						
		    						//console.log(clist);
		    						for(let i in clist){
			        					//console.log(list[i].schedule + "/" + list[i].endDate);
			        					 value.push({
			        						 title : "<" + clist[i].className + ">" + clist[i].schedule,
			        						 start : clist[i].startDate,
			        						 end : clist[i].endDate,
			        						 borderColor : '#000000',
			        						 color : '#ffffff',
			        						 textColor : '#ff0000',
			        						 classNames : 'B'
			        					})
			        					
			        					
			        					let startDate = new Date(clist[i].startDate);
			        					let endDate = new Date(clist[i].endDate);
			        					
			        					//console.log(clist[i].schedule + " 의 endDate : " + endDate);
			        					
			        					
			        					if(d >= startDate && d <= endDate){
			        						cScheduleList1 +=  "<li><div id='scheduleName' >&lt;" + clist[i].className + "&gt; " + clist[i].schedule + "</div></li>"; 
					        				todayArr.push(clist[i]);
			        					}
			        					$('#c_todayList ul').html(cScheduleList1);
			        					
			        					if(t >= startDate && t <= endDate){
			        						cScheduleList2 += "<li><div id='scheduleName'>&lt;" + clist[i].className + "&gt;" + clist[i].schedule + "</div></li>"; 
			        						tomorrowArr.push(clist[i]);
			        					}
			        					$('#c_tomorrowList ul').html(cScheduleList2);
			        					
			        				}
			        				//console.log(todayArr);
		    						successCallback(value);
		    					}
		    				})
						}
					},
					{
						events : function(info, successCallback, failureCallback){
						let value = [];
	        				
	        				$.ajax({
			        			url : 'selectScheduleList', // 개인 일정
			        			data : {memberNo : memberNo},
			        			type : 'post',
			        			success : function(list){
			        				
									//console.log("list : " + list);
									
									
									let scheduleList1 = '';
									let scheduleList2 = '';
									let mark = '';
									if(memberType == "S"){
										for(let i in list){
											//console.log(list[i].schedule + "/" + list[i].endDate);
											value.push({
												title : list[i].schedule,
												start : list[i].startDate,
												end : list[i].endDate,
												color : list[i].color,
												classNames : 'C'
											})
										
											let startDate = new Date(list[i].startDate);
											let endDate = new Date(list[i].endDate);
											
											//console.log(list[i].schedule + " 의 endDate : " + endDate);
											if(d >= startDate && d <= endDate){
												scheduleList1 +=  "<li><span id='scheduleName' style='background-color:" + list[i].color + "'>" + list[i].schedule + "</span></li>"; 
												todayArr.push(list[i]);
											} 
											$('#todayList ul').html(scheduleList1);
											
											if(t >= startDate && t <= endDate){
												scheduleList2 += "<li><span id='scheduleName' style='background-color:" + list[i].color + "'>" + list[i].schedule + "</span></li>"; 
												tomorrowArr.push(list[i]);
											}
											$('#tomorrowList ul').html(scheduleList2);
										}
									}
									successCallback(value);

									// 캘린더 상단에 오늘, 내일 일정 없을 경우
			        				if(todayArr.length == 0){
			        					//console.log('길이 0');
			        					$('#todayScheduleList').html("----- 오늘 일정이 존재하지 않습니다 -----").css({"color" : "gray", "margin" : "30px", "font-size" : "12px"});
			        				}
									if(tomorrowArr.length == 0){
										$('#tomorrowScheduleList').html("----- 내일 일정이 존재하지 않습니다 -----").css({"color" : "gray", "margin" : "30px", "font-size" : "12px"});
									}
			        				
			        				
			        				
	        					}
							})
		        		}
					}
				],
				eventClick : function(info){
        			info.jsEvent.stopPropagation();
        			info.jsEvent.preventDefault();
        		},
        		eventOrder : ['-title, -start, classNames'] // 정렬 기준
	        	
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
    			data : {memberNo : memberNo, date : date, memberType : memberType},
    			type : 'POST',
    			success : function(list){
    				
    				$('#modal-date').html(date);
    				
    					//console.log(list);
    				for(let i in list){
						arr.push(list[i]);
						
    					value += "<div>✔️";
    					
    					if(list[i].className != null){
    						value += "&lt;" + list[i].className + "&gt;&nbsp;";
    					}
    					
    					// 풀캘린더에 endDate +1로 조회해오기 때문에(화면 출력을 -1로 함) 문자로 보여주기 위해 재정의
    					var endDate = new Date(list[i].endDate);
    					endDate.setDate(endDate.getDate() - 1);
    					
    					var startDate = new Date(list[i].startDate);
    					var endDateFormat = endDate.toISOString().substring(0, 10);
    					
    					value += list[i].schedule + "(" + list[i].startDate + " ~ " + endDateFormat +  ")"
							   + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id='scheduleNo' style='display:none'>" + list[i].scheduleNo + " </div>";
							   
						if(list[i].memberNo == memberNo ){
						    value += "<button type='button' onclick='showUpdateModal(" + i + ");' class='btn btn-warning btn-sm moreSmall'>수정</button>"
								   + "<button type='button' id='btn1' onclick='deleteSchedule(" + i + ");' class='btn btn-primary btn-sm moreSmall'>삭제</button></div><br>";
						}
    				}
    				$('#theDaySchedule-content').html(value);
    			}
    		});
    		$('#theDaySchedule').modal();
    		$('#modal-date').text(date);
    	}
	  
    	
    	// 일정 삭제 버튼 클릭 시
    	function deleteSchedule(i){
    		let s = arr[i];
    		
    		location.href="deleteSchedule?scheduleNo=" + s.scheduleNo; 
    	}
    	
    	// 일정 수정 버튼 클릭 시
 		function showUpdateModal(i){
			
 			let s = arr[i];
 			
 			let value = '';
 			endDate = new Date(s.endDate);
 			endDate.setDate(endDate.getDate() -1);
 			
 			
 			let inputEndDate = endDate.toISOString().substring(0, 10);
 			
 			value += "일정명 <input type='text' name='schedule' value='" + s.schedule + "'/><br>"
				   + "시작일 <input id='re_startDate' type='date' name='startDate' onchange='checkDate();' value='" + s.startDate + "'/><br>"
				   + "종료일 <input id='re_endDate' type='date' name='endDate' onchange='checkDate();' value='" + inputEndDate + "'/><br>"
				   + "<p id='re_alert-endDate' style='display:none'>종료일은 시작일보다 빠를 수 없어요!</p>";
				   
			if(memberType == "S"){	   
				value += "배경색 <input type='color' name='color' value='" + s.color + "'/>";
			} else{
				value += "<input type='color' name='color' value='#ffeecc' style='display : none' />";
			}
			
		   value += "<input type='hidden' name='scheduleNo' value='" + s.scheduleNo + "'/>";
		   		  + "<input type='hidden' name='memberNo' value='" + memberType + "' />";
	
		   $('#updateSchedule-info').html(value);	   
				   
			$('#updateModal').modal();	   
 		}
    	
    	
    	
    	
    	
    	
    	
    		
    </script>


</body>
</html>