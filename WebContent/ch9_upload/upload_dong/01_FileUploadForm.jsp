<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>01_FileUploadForm.jsp</title>
<style>
  h3{text-align:center}
</style>
</head>
<body>
	<h3>파일 업로드 양식</h3>
	<center>
		<form action="01_FileUpload.jsp" method="post"
			enctype="Multipart/form-data">
			<table border=1 cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2" align="center"><h3>파일 업로드 폼</h3></td>
				</tr>
				<tr>
					<td>올린 사람</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>파일명 1 :</td>
					<td><input type="file" name="fileName1"></td>
				</tr>
				<tr>
					<td>파일명 2 :</td>
					<td><input type="file" name="fileName2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="전송"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>