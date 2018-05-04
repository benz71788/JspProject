<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div{background-color: green;
		text-align: right;
		color: white;
		padding: 10px;
		}
	a{text-decoration: none;}
	a:hover{font-weight: border;}
</style>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			out.println("<script>");
			out.println("<a href='loginForm.jsp'>");
			out.println("</script>");
			out.close();
		} else {
			if(id.equals("admin")){
			%>
				<h3>관리자 <%=id %>님 환영합니다.
		<%
			} else {
			%>
				<h3>일반 회원 <%=id %>님 환영합니다.
		<%
			}
		}
	%>
	(<a href="updateForm.jsp">정보수정</a>)
	(<a href="logout.jsp">로그아웃</a>)</h3>
<hr>