<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/user/userEntry.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script>
 $(function(){
  $('#password').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#ckpass').keyup(function(){
   if($('#ckpass').val() == ''){
	   $('font[name=check]').text('');
   } else if ($('#password').val()!=$('#ckpass').val()){
	   $('font[name=check]').text('');
	   $('font[name=check]').html("비밀번호가 다릅니다.");
   } else {
	   $('font[name=check]').text('');
   }
  }); //#chpass.keyup
 });
</script>
</head>
<body>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table border="1" style="width:650px;margin-left:200px;">
		<caption style="font-size:30px;">회원가입</caption>
		<tr height="40px"><td>아이디</td><td><form:input path="userId" />
			<font color="red"><form:errors path="userId" /></font></td></tr>
		<tr height="40px"><td>비밀번호</td><td><form:password path="password" id="password"/>
			<font color="red"><form:errors path="password" /></font></td></tr>
		<tr height="40px"><td>비밀번호 재확인</td><td><input type="password" id="ckpass" />
			<br><font name="check" size="2" color="red"></font></td></tr>
		<tr height="40px"><td>이름</td><td><form:input path="name" />
			<font color="red"><form:errors path="name" /></font></td></tr>
		<tr height="40px"><td>성별</td><td><form:radiobutton path="gender" value="1" label="남자"/>
										<form:radiobutton path="gender" value="2" label="여자"/>
			<font color="red"><form:errors path="gender" /></font></td></tr>
		<tr height="40px"><td>전화번호</td><td><form:input path="phoneNum" />
			<font color="red"><form:errors path="phoneNum" /></font></td></tr>
		<tr height="40px"><td>주소</td><td><form:input path="address" />
			<font color="red"><form:errors path="address" /></font></td></tr>
		<tr height="40px"><td>이메일</td><td><form:input path="email" />
			<font color="red"><form:errors path="email" /></font></td></tr>
		<tr height="40px">
			<td colspan="2" align="center">
				<input type="submit" value="등록">
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>