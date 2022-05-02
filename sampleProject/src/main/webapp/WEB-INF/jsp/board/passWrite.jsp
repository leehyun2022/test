<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    
    
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
		$("#delBtn").click(function(){
		var pass =	$("#pass").val();
		pass = $.trim(pass);
		if(pass == ""){
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var sendData = "unq=${unq}&pass="+pass;
		
		$.ajax({
			type:"POST",
			data:sendData,  //json설정
			url:"boardDelete.do",
			dataType:"text",
			success:function(result){
				if(result== "1"){
					alert("삭제완료");
//					location="boardList.do";
					window.close(); //팝업 닫기	
					$(opener.location).attr("href","javascript:fn_list();"); //부모창의 fn_list() 호출 
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
		
			
		});
	})
</script>

<body>
<table>
	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass"></td>
		<td><button type="button" id="delBtn">삭제하기</button></td>
	
	</tr>

</table>


</body>
</html>