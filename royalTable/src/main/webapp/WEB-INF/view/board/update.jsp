<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 수정</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>
<form:form modelAttribute="board" action="update.shop" enctype="multipart/form-data" name="f">
	<form:hidden path="boardNo"/>
	<table>
		<tr><td>글쓴이</td><td><form:input path="userId" /><font color="red"><form:errors path="userId"/></font></td></tr>
		<tr><td>제목</td><td><form:input path="subject" /><font color="red"><form:errors path="subject"/></font></td></tr>
		<tr><td>내용</td>
			<td><form:textarea path="content" rows="15" cols="80" />
				<script>CKEDITOR.replace("content",{
					filebrowserImageUploadUrl : "imgupload.shop?CKEditorFuncNum=1"});
				</script>
				<font color="red"><form:errors path="content"/></font>
			</td>
		</tr>
		<tr><td colspan="2">
				<a href="javascript:document.f.submit()">[게시글 등록]</a>
				<a href="notice.shop?type=1">[게시글 목록]</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>