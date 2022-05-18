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
<script type="text/javascript">
function fn_search(){
	var unit=$("#unit").val();
	location = "boardListVue.do?unit="+unit;
	
}
function fn_page(num){

	var unit=$("#unit").val();
	location = "boardListVue.do?viewPage="+num+"&unit="+unit;
	
}
function linkPage(pageNo){
	var unit=$("#unit").val();
	location.href = "/boardListVue.do?viewPage="+pageNo+"&unit="+unit;
}	

</script>
<body>
<%@ include file="../include/topmenu.jsp"  %>

<br>
<form:form commandName="boardVO" id="searchForm" name="searchForm" method="post" action="boardList.do">
<div id="it_list">
<div style="width:600px; text-align:right;">
<select path="unit" id="unit" @change="onChange($event)">
<option v-for="(epItem2,idx) in testSet2" :selected="epItem2.flag == '${boardVO.unit}'" :value="epItem2.flag"> {{epItem2.val}} 
</option>
</select>
</div>
    <table>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <tr v-for="item in items" :key="item.COLUMN_NM">
        <td><span v-html="item.INDEX"></span></td>
        <td><span v-html="item.TITLE_NM"></span></td>
        <td><span v-html="item.NAME_NM"></span></td>
        <td><span v-html="item.RDATE_NM"></span></td>
        <td><span v-html="item.HITS_NM"></span></td>
      </tr>
<tr v-for="(item,index) in items" :key="item.index"> 
<td>{{item.INDEX}} 
	<input type="hidden" :name="'list['+index+'].columnSn'" :value="item.INDEX" />
</td> 
<td>{{item.TITLE_NM}}</td>
<td>{{item.NAME_NM}}</td>
<td>{{item.RDATE_NM}}</td>
<td>
<input type="text" id="colNm" :name="'list['+index+'].colNm'" :value="item.HITS_NM" v-on:input="eprssCheck($event, item)"/>
</td>
<td> 
<!-- <select :name="'list['+index+'].eprssAt'"> 
<option v-for="(epItem,index) in testSet" :selected="epItem.FLAG == item.HITS_NM" :value="epItem.FLAG"> {{epItem.VAL}} 
</option> 
</select> --> 
<select :name="'list['+index+'].eprssAt'"> 
<option v-for="(epItem,index) in testSet" :selected="epItem.FLAG == item.HITS_NM" :value="epItem.FLAG"> {{epItem.VAL}} 
</option> 
</select> 
</td> 
</tr>

    </table>
</div>
</form:form>
</body>
<script>
var vueItems = new Vue({
	  el: '#it_list', 
	  data: { items : [],
	  	testSet2 : [{flag : '10', val : '10개씩 보기'},
	  		{flag : '20', val : '20개씩 보기'},
	  		{flag : '50', val : '50개씩 보기'},
	  		{flag : '100', val : '100개씩 보기'}],
	  	testSet : [{FLAG : 'Y', VAL : '미조회'},{FLAG : 'N', VAL : '조회'},{FLAG : 'X', VAL : '해당없음'}],

	  	}, 
	  	mounted: function(){
	  		this.testSet.flag="${boardVO.unit}";
	  	 	<c:forEach items="${resultList}" var="item" varStatus="status"> 
	  			this.items = this.items.concat({ 
	  			INDEX : "${status.count}", 
	  			TITLE_NM : "${item.title}", 
	  			NAME_NM : "${item.name}", 
	  			RDATE_NM : "${item.rdate}", 
	  			HITS_NM : "${item.hits}", 
	  			}); 
	  		</c:forEach> 
	  	}, 
	  	methods : {
	  		eprssCheck : function(event, item){
	  			var atrbValue = event.target.value;
	  			console.log("atrbValue::"+atrbValue);
	  			console.log("item::"+item);
	  			if(atrbValue == '0'){
	  				item.HITS_NM = "Y"; 
	  			}else{ 
	  				item.HITS_NM = "N"; 
	  			}
	  		},
	  		onChange(event){
	  			console.log("dddd");
	  			fn_search();
	  		}
	         } 
	  });
</script>
</html>