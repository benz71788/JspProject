<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		if(id.equals("admin")){
	%>
		<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
	<%
		}
	%>
</body>
</html>