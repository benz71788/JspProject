<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	String sql = "select * from student";
	PreparedStatement pstmt = null;
	ResultSetMetaData rsmd = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		//sql문을 실행하여 가져온 레코드들을 ResultSet 객체에 저장합니다.
		ResultSet rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		
		out.println("컬럼 순 : " + rsmd.getColumnCount() + "<br>");
		for(int i = 1; i <= rsmd.getColumnCount(); i++){
			out.println(i + "번째 컬럼의 이름 : " 
					+ rsmd.getColumnName(i) + "<br>");
			out.println(i + "번째 컬럼의 타입 이름 : " 
					+ rsmd.getColumnTypeName(i) + "<br>");
		}
	} catch(Exception e){
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