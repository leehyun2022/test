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

<div id="test">
<tr v-for="(item,index) in items" :key="item.index"> 
<td>{{item.COLUMN_NM}} 
<input type="hidden" :name="'list['+index+'].columnSn'" :value="item.COLUMN_SN" /> 
</td> 
<td>{{item.DATA_TY_NM}}</td> 
<td><input type="text" id="colNm" :name="'list['+index+'].colNm'" :value="item.COLUMN_NM" v-on:input="eprssCheck($event, item)"/></td>
<td> 
<select :name="'list['+index+'].eprssAt'"> 
<option v-for="(epItem,index) in testSet" :selected="epItem.FLAG == item.EPRSS_AT" :value="epItem.FLAG"> {{epItem.VAL}} </option> 
</select> 
</td> 
</tr> 
</div> 
</body>
<script>
var vueItems = new Vue({ 
	  el: '#test', 
	  data: { items : [], 
	  	testSet : [{FLAG : 'Y', VAL : '예'},{FLAG : 'N', VAL : '아니오'},{FLAG : 'X', VAL : '해당없음'}], }, 
	  	mounted: function(){
	  	 	<c:forEach items="${mappingList}" var="item" varStatus="status"> 
	  			this.items = this.items.concat({ 
	  			index : "${status.index}", 
	  			DATA_TY_NM : "${item.DATA_TY_NM}", 
	  			COLUMN_SN : "${item.COLUMN_SN}", 
	  			COLUMN_NM : "${item.COLUMN_NM}", 
	  			}); 
	  		</c:forEach> 
	  	}, 
	  	methods : { 
	  	    eprssCheck : function(event, item){ 
	  		var atrbValue = event.target.value; 
	  		if(atrbValue == ''){ 
	  			item.ATRB_NM = ""; 
	  			item.EPRSS_AT = "X"; 
	  		}else{ 
	  			item.ATRB_NM = atrbValue; 
	  			item.EPRSS_AT = "Y"; 
	  		} 
	  	      } 
	               } 
	  });
</script>
</html>