<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!-- 
	isErrorPage="true" : exception ��ü�� ����.
						 exception ��ü : exception.CartEmptyException ��ü
-->
<%-- /webapp/WEB-INF/view/exception.jsp --%>
<script>
	alert("${exception.message}"); //RuntimeException�� �ִ� getMessage()�� ȣ��Ǿ �ҷ��� �� ����
	location.href="${exception.url}"; //getUrl() �޼��� ȣ��
</script>