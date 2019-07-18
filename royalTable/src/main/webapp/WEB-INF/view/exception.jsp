<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!-- 
	isErrorPage="true" : exception 객체가 전달.
						 exception 객체 : exception.CartEmptyException 객체
-->
<%-- /webapp/WEB-INF/view/exception.jsp --%>
<script>
	alert("${exception.message}"); //RuntimeException에 있는 getMessage()가 호출되어서 불러올 수 있음
	location.href="${exception.url}"; //getUrl() 메서드 호출
</script>