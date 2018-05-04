<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String savedName = (String)session.getAttribute("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = "";
	String pass = "";
	String name = "";
	int age = 0;
	String gender = "";
	String email = "";
	
	String sql = "select * from member where name='" + savedName + "'";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			id = rs.getString(1);
			pass = rs.getString(2);
			name = rs.getString(3);
			age = rs.getInt(4);
			gender = rs.getString(5);
			email = rs.getString(6);
		}
	} catch(Exception e){
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
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<td colspan=2>회원정보</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=id %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=pass %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=age %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td colspan=2><a href="loginForm.jsp">로그인 바로 가기</a></td>
		</tr>
		
	</table>
</body>
</html>