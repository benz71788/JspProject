<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%--
		<f:set> 변수에 값을 설정하는 태그입니다.
	--%>
	<f:set var="test" value="Hello JSTL" />
	<h3>
		&lt;c:set&gt; 사용 후 :
		<f:out value="${test}" /><!-- 지정된 값을 출력하는 태그입니다. -->
	</h3>
	
	<f:remove var="test" /><!-- 설정된 속성을 제거하는 태그입니다. -->
	<h3>
		&lt;c:remove&gt; 사용 후 :
		<f:out value="${test}" />
	</h3>
</body>
</html>