<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 목록</title>
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
<script type="text/javascript">
function fn_search(){
	var unit=$("#unit").val();
	location = "boardList.do?unit="+unit;
	
}
function fn_page(num){

	var unit=$("#unit").val();
	location = "boardList.do?viewPage="+num+"&unit="+unit;
	
}
function linkPage(pageNo){
	var unit=$("#unit").val();
	location.href = "/boardList.do?viewPage="+pageNo+"&unit="+unit;
}	

</script>
<body>
<%@ include file="../include/topmenu.jsp"  %>

<br>
<form:form commandName="boardVO" id="searchForm" name="searchForm" method="post" action="boardList.do">
<table>
	<caption>일반게시판 목록</caption>
	<div>Total : ${total}</div>
	<div style="width:600px; text-align:right;">
			<form:select path="unit" id="unit" onchange="fn_search(1);">
				<form:option value="5">5개씩 보기</form:option>
				<form:option value="10">10개씩 보기</form:option>
				<form:option value="20">20개씩 보기</form:option>
			</form:select>
	</div>
	<div>
			<select name="searchGubun" id="searchGubun">
				<option value="title" <c:if test="${boardVO.searchGubun == 'title'}">selected="selected"</c:if>>제목</option>
				<option value="name" <c:if test="${boardVO.searchGubun == 'name'}">selected="selected"</c:if>>글쓴이</option>
				<option value="content" <c:if test="${boardVO.searchGubun == 'content'}">selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="searchText" id="searchText" value="${boardVO.searchText}">
			<button type="submit">검색</button>
	</div>		
	<tr>
		<th width="15%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align="center">
		<td>${paginationInfo.totalRecordCount - ((boardVO.viewPage-1) * paginationInfo.recordCountPerPage + status.count)+1}</td>
		<td align="left">
		<a href="boardDetail.do?unq=${result.unq}&unit=${boardVO.unit}"><c:out value="${result.title}"></c:out></a></td>
		<td><c:out value="${result.name}"></c:out></td>
		<td><c:out value="${result.rdate}"></c:out></td>
		<td><c:out value="${result.hits}"></c:out></td>
	</tr>
	
	</c:forEach>
	
</table>
<div style="width:600px; margin-top:5px; text-align:center;">	
<ui:pagination paginationInfo = "${paginationInfo}"
			type="image"
			jsFunction="linkPage"/>
<%-- <c:forEach var="i" begin="1" end="${totalPage}">
	<a href="#" onclick="fn_page(${i })">${i }</a>
</c:forEach> --%>
</div>
<div style="width:600px; margin-top:50px; text-align:right;">	
	<button type="button" onclick="fn_search()">목록</button>
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>

</div>

</form:form>
</body>
</html>