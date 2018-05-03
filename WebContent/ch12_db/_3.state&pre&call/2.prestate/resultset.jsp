<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<style>
		table{margin: 0 auto;}
		td{width: 200px;
			height: 30px;
			text-align: center;
			font-weight: border;}
		tr:nth-child(1){background-color: green;
						color: white;}
		tr + tr{background-color: orange;}
		tr + tr > td:nth-child(1){background-color: yellow;}
		
	</style>
</head>
<body>
<%
	Connection conn = null;
	String sql = "select * from student order by num";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Context init = new InitialContext();
		
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		//sql문을 실행하여 가져온 레코드들을 ResultSet 객체에 저장합니다.
		rs = pstmt.executeQuery();

		out.println("<table border=1>");
		out.println("<tr><td>번호</td><td>이름</td></tr>");
		while(rs.next()){	//레코드가 존재하지 않을 때까지 반복합니다.
			int num = rs.getInt(1);
			String name = rs.getString(2);
			out.println("<tr>");
			out.println("<td>" + num + "</td>");
			out.println("<td>" + name + "</td></tr>");
		}
		out.println("</table>");
	} catch(Exception e){
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally{
		if(rs != null){
			try{
				rs.close();
			} catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		if(pstmt != null){
			try{
				pstmt.close();	//객체를 사용하고 메모리에 반환합니다.
								//메모리 낭비를 막을 수 있습니다.
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
</table>
</body>
</html>