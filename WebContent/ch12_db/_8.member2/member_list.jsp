<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.*"%>

<%@ include file="header.jsp" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select id from member";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		out.println("<table border=1>");
		out.println("<tr><td colspan=2>회원 목록</td></tr>");
		while(rs.next()){
			out.println("<tr>");
			out.println("<td><a href='infomember.jsp?id=" + rs.getString(1) + "'>" + rs.getString(1) + "</a></td>");
			out.println("<td><a href='deleteProcess.jsp?id=" + rs.getString(1)+ "'>삭제</a></td>");
			out.println("</tr>");
		}
		out.println("</table>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null){
			try{
				rs.close();
			} catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>