<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 수정</title>
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
	alert("저장");
	if($.trim($("#title").val()) == ""){
		alert("제목입력 jquery");
		$("#title").focus();
		$("#title").val("");
		return false;
	}
	//alert("전::"+$("#title").val());
	$("#title").val($.trim($("#title").val()))
	

var formData = $("#frm").serialize();

$.ajax({
	type:"POST",
	data:formData,
	url:"/boardModifySaveAjax.do",
	dataType:"text",
	success:function(result){
		if(result== "1"){
			alert("저장완료");
			location="boardList.do";
		}else if(result == "-1"){
			alert("암호가 일치하지 않습니다.");
		}
		else{
			alert("실패");
		}
	},
	error:function(){
		alert("오류발생");
	}
	
});
}
</script>
<body>
<form name="frm" id="frm" method="post" action="boardModifySave.do">
<table>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1"  value="${boardVO.title}"></td>
		<td><input type="hidden" name="unq" id="unq" class="input1"  value="${boardVO.unq}"></td>

	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id ="content" class="textarea">${boardVO.content}</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="button" onclick="location='boardList.do'">목록</button>
		<button type="submit">저장</button>
		<button type="submit" onclick="fn_submit(); return false;">Ajax저장</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>