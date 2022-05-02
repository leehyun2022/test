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
<title>Insert title here</title>
</head>
<link href="/js/jquery-ui-1.13.1/jquery-ui.css" rel="stylesheet">
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui-1.13.1/jquery-ui.js"></script>
<script>
$(function(){
	
	$("#btn_send").click(function(){
		
	var addr=$("#address").val();
	var addr_array = addr.split(" ");
	var zipcode = addr_array[0].substring(1,addr_array[0].length-1);
	var address = addr.replace(addr_array[0],"");
	address = $.trim(address);
	alert(zipcode);
	alert(address);
	
	opener.document.frm.zipcode.value = zipcode;
	opener.document.frm.address.value = address;
	
	self.close();
	
	})
	
})

</script>


<body>

<div style="width:100%; text-align:center;">
<select name="address" id="address">

	<c:forEach var ="result" items="${resultList}">
		<option value="${result.addr}">${result.addr}</option>
	</c:forEach>

</select>
	<br><br>
	<button type="button" id="btn_send">적용하기</button>
</div>
</body>
</html>