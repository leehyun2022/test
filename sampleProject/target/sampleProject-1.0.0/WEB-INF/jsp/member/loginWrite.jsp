<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui-1.13.1/jquery-ui.js"></script>
</head>
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
	$(function(){
		$("#btn_submit").click(function(){
			var userid = $("#userid").val();
			var pass = $("#pass").val();
			
			if(userid == ""){
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}

			if(pass == ""){
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			var formData = $("#frm").serialize();
			
			$.ajax({
	    		type:"POST",
	    		data:formData,
	    		url:"/loginCheck.do", 
	    		dataType:"text",
	    		success:function(result){
	    			if(result== "ok"){
	    				location="boardList.do";
	    			}else{
	    				alert("로그인실패");
	    			}
	    		},
	    		error:function(){
	    			alert("오류발생");
	    		}
				
			});
			
			
		});
		
		
	})
</script>
<body>
<%@ include file="../include/topmenu.jsp"  %>
<form id="frm" name="frm">
	<table>
		<tr>
			<th><label for="userid">아이디</label></th>
			<td>
				<input type="text" id="userid" name="userid">
			</td>
		</tr>
		<tr>
			<th><label for="pass">암호</label></th>
			<td>
				<input type="password" id="pass" name="pass">
			</td>
		</tr>
	</table>
<div class="div_button">
	<button type="button" id="btn_submit">로그인</button>
	<button type="reset">취소</button>
</div>	
</form>
</body>
</html>