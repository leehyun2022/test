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
<title>일반게시판 상세 화면</title>
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
	<caption>게시판 상세</caption>
	<tr>
		<th width="20%">제목</th>
		<td width="80%">${boardVO.title}</td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td>${boardVO.name}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${boardVO.content}</td>
	<tr>
	<tr>
		<th>등록일</th>
		<td>${boardVO.rdate}</td>	
	<tr>
		<th colspan="2">
				<button type="button" onclick="location='boardList.do'">목록</button>
				<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
				<button type="button" onclick="location='boardDelete.do?unq=${boardVO.unq}'">삭제</button>
		</th>
		
	</tr>
</table>
</form>
</body>
</html>