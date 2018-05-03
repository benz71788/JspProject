<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");  %>
<html>
 <head>
 <link href="../../../css/send.css" rel="stylesheet" type="text/css">
 <title>send2.jsp</title>
 </head>

 <body>
	<h1> 회원 가입한 데이터</h1>
	<table border='1'>
		<tr>
			<th> ID </th>
			<td>${param.id}</td>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td>${param.pass}</td>
		</tr>
		<tr>
			<th> 주민번호 </th>
			<td>
				${param.jumin1} -
				${param.jumin2}
			</td>
		</tr>
		<tr>
			<th> E-Mail </th>
			<td>
				${param.email} @
				<c:choose>
					<c:when test="${empty param.sel}">
						${param.domain}
					</c:when>
					<c:otherwise>
						${param.sel}
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th> 성별 </th>
			<td>
				<c:choose>
					<c:when test="${param.gender == 'man'}">
						남자
					</c:when>
					<c:otherwise>
						여자
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th> 취미 </th>
			<td>
				<c:forEach var="ho" items="${paramValues.hobby}">
					${ho} 
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th> 우편번호 </th>
			<td>${param.post1} - ${param.post2}</td>
		</tr>
		<tr>
			<th> 주소 </th>
			<td>${param.address }</td>
		</tr>
		<tr>
			<th> 자기소개 </th>
			<td>${param.intro}</td>
		</tr>
	</table>
</body>
</html>