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
<title>코드목록</title>
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
<script language="javascript">
	function fn_delete(code){
		
		if(confirm("삭제")){
			location = "codeDelete.do?code="+code;
		}
	}
	function fn_modify(code){
		
		if(confirm("수정")){
			location = "codeModifyWrite.do?code="+code;
		}
	}

</script>

<body>
	<table>
		<div>코드목록</div><br>
		<div style="whdth:100%; text-align:left;">Total:${resultTotal}개 </div>
		<colgroup>
			<col width="14%"/>
			<col width="22%"/>
			<col width="30%"/>
			<col width="34%"/>
		</colgroup>
		
		<tr>
			<th>번호</th>
			<th>그룹명</th>
			<th>코드명</th>
			<th>구분</th>
		</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${result.code}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.gid}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.name}"/>&nbsp;</td>
            				<td>
            					<button type="button" onclick="fn_modify('${result.code}');">수정</button>
            					<button type="button" onclick="fn_delete('${result.code}');">삭제</button>
            				</td>
            			</tr>
        			</c:forEach>			
	</table>
</body>
</html>