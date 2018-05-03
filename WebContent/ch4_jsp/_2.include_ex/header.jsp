<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div{background-color: green;
		text-align: right;
		color: white;
		padding: 10px;
		}
	a{text-decoration: none;
		color: white;}
	a:hover{font-weight: border;}
</style>
<%
	String id = (String)session.getAttribute("id");
	if(id != null && id.equals("")){
%>
	<div><%=id %>님이 접속 하셨습니다.
		<a href="logout.jsp">(로그아웃)</a></div>
<%
	} else {
%>
	<div><a href="login.jsp">로그인</a></div>
<%
	}
%>
<hr>