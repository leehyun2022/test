<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<decorator:usePage id="thisPage" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><decorator:title/>왼쪽메뉴</title>
<link href="<c:url value='/css/egovframework/com/cmm/main.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
link { color: #666666; text-decoration: none; }
link:hover { color: #000000; text-decoration: none; }

#cs_content{ padding-left:270px; min-height:500px; box-sizing:border-box;}
	.cs_tit{overflow:hidden; margin-bottom:20px; height:80px}
	.cs_tit h2{font:bold 18px/24px "맑은고딕","malgun gothic", dotum, arial; margin-bottom:5px}
	.cs_tit .nav_depth,.cs_tit .nav_depth a {font:normal 11px/24px dotum, arial; color:#999}
	.cs_tit .nav_depth a:hover,.cs_tit .nav_depth a:active,.cs_tit .nav_depth a:focus {color:red}
</style>
</head>
<decorator:head />
<body>
<div id="lnb">
<c:set var="isMai" value="false"/>
<c:set var="isUat" value="false"/>
<c:set var="isSec" value="false"/>
<c:set var="isSts" value="false"/>
<c:set var="isCop" value="false"/>
<c:set var="isUss" value="false"/>
<c:set var="isSym" value="false"/>
<c:set var="isSsi" value="false"/>
<c:set var="isDam" value="false"/>
<c:set var="isCom" value="false"/>
<c:set var="isExt" value="false"/>
<ul class="lnb_title">
	<c:forEach var="result" items="${list_menulist}" varStatus="status">
	
		<c:if test="${result.menuNo eq '1000000' && result.upperMenuId eq '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo eq '2000000' && result.upperMenuId eq '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo eq '3000000' && result.upperMenuId eq '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo eq '4000000' && result.upperMenuId eq '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo == '5000000' && result.upperMenuId == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo == '6000000' && result.upperMenuId == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo == '7000000' && result.upperMenuId == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo == '8000000' && result.upperMenuId == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${result.menuNo == '9000000' && result.upperMenuId == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="top_title_strong"><c:out value="${result.menuNm}"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>

	<c:if test="${result.upperMenuId ne '0'}">	
		<ul class="2depth">
		<li><a href="${pageContext.request.contextPath}<c:out value="${result.chkURL}"/>" target="_content" class="link"> <c:out value="${result.menuNm}"/><!-- <c:out value="${result.name}"/> --></a></li>
		</ul>
	</c:if>
	</c:forEach>
</ul>
</div>
</body>
<div id="cs_content" class="cs_content">
<decorator:body />
</div>
</html>
