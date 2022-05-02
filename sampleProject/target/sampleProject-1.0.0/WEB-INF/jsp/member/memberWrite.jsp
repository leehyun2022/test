<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
</head>
<link href="/js/jquery-ui-1.13.1/jquery-ui.css" rel="stylesheet">
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui-1.13.1/jquery-ui.js"></script>
<style>
body {
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}

a	{
	text-decoration:none;
}

table {
	width:600px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	pdding:3px;
	line-height:2.0;
}
caption {
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	margin-bottom:5px;
}
.div_button {
	width:600px;
	text-align : center;
	margin-top:5px;
}

</style>
<script>
//달력 한국어설정 및 데이터 입력 타입 변경
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd', //데이터 입력타입
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
    
    
    $("#btn_zipcode").click(function(){
    	var w =500;
    	var h = 100;
    	var url = "post1.do";
    	window.open(url,'zipcode','width='+w+",height="+h);
    	
    });
    
    
    $("#btn_idcheck").click(function(){
    	
    	var userid = $.trim($("#userid").val());
    	if( userid == ""){
    		alert("아이디를 입력해주세요");
    		$("#userid").focus();
    		return false;
    	}
    	$("#userid").val(userid);
    	
    	//idcheck.do로 데이터전송 - 비동기 전송 방식
    	
    	$.ajax({
    		type:"POST",
    		data:"userid="+userid,  //json
    		url:"/idcheck.do", 
    		dataType:"text",
    		success:function(result){
    			if(result== "ok"){
    				alert("사용가능한 id 입니다.");
    			}else{
    				alert("이미 사용중인 id 입니다.");
    				$("#userid").val("");
    				$("#userid").focus();
    			}
    		},
    		error:function(){
    			alert("오류발생");
    		}
    		
    	});    	
    	
    	
    });
    
    $("#btn_submit").click(function(){
    	var userid = $("#userid").val();
    	var pass = $("#pass").val();
    	var name = $("#name").val();
    	
    	userid = $.trim(userid);
    	pass = $.trim(pass);
    	name = $.trim(name);
    	
    	if( userid == ""){
    		alert("아이디를 입력해주세요");
    		$("#userid").focus();
    		return false;
    	}
    	if( pass == ""){
    		alert("암호를 입력해주세요");
    		$("#pass").focus();
    		return false;
    	}
    	if( name == ""){
    		alert("이름을 입력해주세요");
    		$("#name").focus();
    		return false;
    	}
    	
    	$("#userid").val(userid);
    	$("#pass").val(pass);
    	$("#name").val(name);
    	
    	var formData = $("#frm").serialize();
    	
    	$.ajax({
    		type:"POST",
    		data:formData,
    		url:"/memberWriteSave.do", 
    		dataType:"text",
    		success:function(result){
    			if(result== "ok"){
    				alert("저장완료");
    				location="loginWrite.do";
    			}else{
    				alert("저장실패");
    			}
    		},
    		error:function(){
    			alert("오류발생");
    		}
    		
    	});
    	
    });
    
    
  } );
  </script>

<body>

<%@ include file="../include/topmenu.jsp"  %>

<form id="frm" name="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="아이디입력">
		<button type="button" id="btn_idcheck">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>
		<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">남
		<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
		<input type="text" name="birth" id="birth" readonly>
		</td>
	</tr>	
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
		<input type="text" name="phone" id="phone">
		</td>
	</tr>	
	<tr>
		<th><label for="zipcode">주소</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode">
		<button type="button" id="btn_zipcode">우편번호 찾기</button>
		<br>
		<input type="text" name="address" id ="address" style="width:300px;">
		</td>
	</tr>	

</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>