<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	String sql = "insert into student(num, name) values(?, '홍길동')";
	PreparedStatement pstmt = null;
	try{
		//Context.xml에 리소스를 생성해 놓은(JNDI에 설정해 놓은) Oracle
		Context init = new InitialContext();
		
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		
		//가져온 Connection 객체를 사용하여 PreparedStatement객체를 생성
		//미리 사용할 SQL문을 인자로 넘깁니다.
		pstmt = conn.prepareStatement(sql);
		
		for(int i = 1; i <= 11; i++){
			pstmt.setInt(1, i);	//첫번째 인수(num 필드)에 i값을 설정합니다.
			int result = pstmt.executeUpdate();	
			if(result != 0){	//SQL문 실행합니다.
				out.println("<h3>" + i + "레코드가 등록되었습니다.</h3>");
			}
		}

	} catch(Exception e){
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally{
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