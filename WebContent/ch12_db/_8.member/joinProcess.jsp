<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	session.setAttribute("name", name);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?, ?, ?, ?, ?, ?) ";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, Integer.parseInt(age));
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		int result = pstmt.executeUpdate();
		if(result != 0){
			out.println("<script>");
			out.println("alert('회원가입을 축하드립니다.');");
			out.println("location.href='joinProcess2.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입을 실패했습니다.');");
			out.println("location.href='joinForm.jsp'");
			out.println("</script>");
		}
	} catch(Exception e){
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
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
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
</body>
</html>