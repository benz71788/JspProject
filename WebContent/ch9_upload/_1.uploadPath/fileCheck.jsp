<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String origfilename1 = request.getParameter("origfilename1");
	String origfilename2 = request.getParameter("origfilename2");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<td colspan=2>파일</td>
		</tr>
		<tr>
			<td>올린사람</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=subject %></td>
		</tr>
		<tr>
			<td>파일명1</td>
			<td><a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a></td>
		</tr>
		<tr>
			<td>파일명2</td>
			<td><a href="file_down.jsp?file_name=<%=filename2 %>"><%=origfilename2 %></a></td>
		</tr>
	</table>
</body>
</html>