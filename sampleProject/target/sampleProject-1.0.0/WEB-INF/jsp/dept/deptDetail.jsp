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
<table>
	<tr>
		<th>부서번호</th>
		<td>${deptVO.deptNo}</td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td>${deptVO.deptName}</td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td>${deptVO.loc}</td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="button" onclick="location='deptModifyWrite.do?deptNo=${deptVO.deptNo}'">수정</button>
		<button type="button" onclick="location='deptDelete.do?deptNo=${deptVO.deptNo}'">삭제</button>
		</th>
	</tr>
</table>
</body>
</html>