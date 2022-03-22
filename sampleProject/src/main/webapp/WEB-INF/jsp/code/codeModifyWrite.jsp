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
<title>부서상세</title>
</head>
<style>
	table {
	width : 400px;
	border-collapse:collapse;
	}
th,td{
	border:1px solid #cccccc;
	padding:5px;
	}
</style>
<body>
<form name="frm" method="post" action="codeModifySave.do">
<table>
	<tr>
		<th>번호</th>
		<td><input type="hidden" name=code value="${codeVO.code}">${codeVO.code}</td>
	</tr>
	<tr>
		<th>그룹명</th>
		<td><input type="text" name="gid" value="${codeVO.gid}"></td>
	</tr>
	<tr>
		<th>코드명</th>
		<td><input type="text" name="name" value="${codeVO.name}"></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit">저장</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>