<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 등록</title>
</head>
<link href="/js/jquery-ui-1.13.1/jquery-ui.css" rel="stylesheet">
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui-1.13.1/jquery-ui.js"></script>
<style>
body {
	font-size:9pt;
}
button {
	font-size:9pt;
}
table {
	width:600px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	padding:3px;
}
.input1 {
	width:98%;
}
.textarea {
	width:98%;
	height:100px;
}
</style>
<script>
	function fn_submit(){
		
		if($.trim($("#title").val()) == ""){
			alert("제목입력 jquery");
			$("#title").focus();
			$("#title").val("");
			return false;
		}
		//alert("전::"+$("#title").val());
		$("#title").val($.trim($("#title").val()))
		
		//alert("후::"+$("#title").val());
		if($.trim($("#pass").val()) == ""){
			alert("암호입력 jquery");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()))
/* 		if(document.frm.title.value == ""){
			alert("제목을 입력하시오");
			document.frm.title.focus();
			return false;
		} */
	
		//document.frm.submit();
	var formData = $("#frm").serialize();
	
	$.ajax({
		type:"POST",
		data:formData,
		url:"/boardWriteSave.do",
		dataType:"text",
		success:function(data){
			if(data="ok"){
				alert("저장");
				location="boardList.do";
			}else{
				alert("실패");
			}
		},
		error:function(){
			alert("오류발생");
		}
		
	});
	}
	
	
	
$(function(){
	$(".button").button();
})
</script>

<body>

<form name="frm" id="frm" method="post" action="boardWriteSave.do">
<table>
	<caption></caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th><label for="name">작성자</label></th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><textarea name="content" id ="content" class="textarea"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" class="button" onclick="fn_submit(); return false;">저장</button>
		<button type="button" class="button">취소</button>
		</th>
		
	</tr>
</table>
</form>
</body>
</html>