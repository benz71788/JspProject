<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<%@ include file="header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String savedId = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sid = "";
	String spass = "";
	String sname = "";
	int sage = 0;
	String sgender = "";
	String semail = "";
	
	String sql = "select * from member where id ='" + savedId + "'";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			sid = rs.getString(1);
			spass = rs.getString(2);
			sname = rs.getString(3);
			sage = rs.getInt(4);
			sgender = rs.getString(5);
			semail = rs.getString(6);
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
	<style>
		table{margin: 0 auto; width: 300px}
		td:nth-child(2n){background: lightgreen}
		td:nth-child(2n+1){background: orange}
		td{text-align:center; height:30px; width:50px}
	</style>
	
</head>
<body>
	<table border=1>
		<tr>
			<td colspan=2>회원정보</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=sid %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=spass %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=sname %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=sage %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=sgender %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=semail %></td>
		</tr>
		<tr>
			<td colspan=2><a href="member_list.jsp">회원목록 가기</a></td>
		</tr>
		
	</table>
</body>
</html>