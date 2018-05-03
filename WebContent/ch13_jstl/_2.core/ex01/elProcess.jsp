<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>넘어온 이름은 ${param.name}</h3>
	<h3>넘어온 취미는
	<c:forEach var="ho" items="${paramValues.hobby}">
		 <c:out value="${ho}" />
	</c:forEach>
	 </h3>
</body>
</html>