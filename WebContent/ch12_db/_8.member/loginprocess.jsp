<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String inputId = request.getParameter("id");
		String inputPass = request.getParameter("pass");
		String baseId = "";
		String basePass = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select id, password from member where id = '" + inputId + "'";
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				baseId = rs.getString(1);
				basePass = rs.getString(2);
			}
		} catch(Exception e){
			out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
			e.printStackTrace();
		} finally {
			if(rs != null){
				try{
					rs.close();
				} catch(SQLException ex){
					ex.printStackTrace();
				}
			}
			if(pstmt != null){
				try{
					pstmt.close();
				} catch(SQLException ex){
					ex.printStackTrace();
				}
			}
			if(conn != null){
				try{
					conn.close();
				} catch(SQLException ex){
					ex.printStackTrace();
				}
			}
		}
	%>
	<%
		
		if(baseId.equals(inputId) && basePass.equals(inputPass)){
			session.setAttribute("id", inputId);
	%>
		<script>
			alert('<%=inputId%>' + '님이 입장하셨습니다.');
		</script>
		<h3><%=inputId %>님 로그인에 성공하셨습니다.</h3>
		<div><a href="loginCheck.jsp">로그인 체크</a></div>
	<%
			String idStore= request.getParameter("idCheck");
			Cookie cookie = new Cookie("id1", request.getParameter("id"));
			if(idStore != null && idStore.equals("store")){
					cookie.setMaxAge(60 * 2);
					response.addCookie(cookie);
					out.println("<a href='login.jsp'>로그인 화면 다시 보기</a>");
			} else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
		} else if(baseId.equals(inputId)){
	%>
		<script>
			alert('패스워드가 다릅니다.');
			location.href = "login.jsp";
		</script>
	<%
		} else {
	%>
		<script>
			alert("로그인 아이디가 다릅니다.");
			location.href = "login.jsp";
		</script>
	<%
		}
	%>
</body>
</html>