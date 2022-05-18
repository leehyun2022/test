<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("newline", "\n"); %> 
<!-- java에서 해도 되고 jsp에서 아래 처럼해도 된다. 보통은 java -->
<c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>' ) }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 상세 화면</title>
</head>
<link href="/js/jquery-ui-1.13.1/jquery-ui.css" rel="stylesheet">
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui-1.13.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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

<body>
<div id="selectedMulti">
<select v-model="selected" multiple>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<br>
<span>Selected: {{ selected }}</span>
</div>
</body>
<script>
new Vue({
	  el: '#selectedMulti',
	  data: {
	    selected: ''
	  }
	})
</script>
</html>