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
<title>부서목록</title>
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
		<caption>부서목록</caption>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${result.deptNo}"/>&nbsp;</td>
            				<td align="center" class="listtd"><a href="deptDetail.do?deptNo=${result.deptNo  }"><c:out value="${result.deptName}"/>&nbsp;</a></td>
            				<td align="center" class="listtd"><c:out value="${result.loc}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>			
	</table>
</body>
</html>