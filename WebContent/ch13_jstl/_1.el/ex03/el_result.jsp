<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%-- 파라미터 name의 값이 "홍길동"인 경우 '하하' 아닌 경우 '호호' --%>
	<h3>${param.name == "홍길동" ? '하하' : '호호' }</h3>
</body>
</html>