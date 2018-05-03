<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<%-- 
	LOB(Large Object) 타입은 대용량 데이터를 저장하기 위한 데이터 타입
	- BLOB(Binary Large Object), 이진 바이너리 데이터의 저장시 사용됩니다.
	- CLOB(Character Large Object), 문서 데이터의 저장시 사용됩니다.
	- BFILE 외부 파일에 저장된 이진 데이터가 있는 경로의 저장시 사용됩니다.
		최대 4GB까지 저장가능
		
	JAVA에서 ORACLE의 CLOB 타입 사용하기
		INSERT시
		1. CLOB 타입인 필드의 기본값을 empty_clob()로 설정합니다.
		2. setAutoCommit(false)를 선언합니다.
		3. CLOB 타입 필드를 제외한 나머지 필드에 데이터를 저장합니다.
		4. CLOB 타입 필드에 데이터를 넣는 동안 다른 변경 작업을 막기 위해 LOCK을 겁니다.
		5. CLOB 타입 필드에 데이터를 넣습니다.
		6. commit() 합니다.
		7. setAutoCommit(true)를 선언합니다.
 --%>
 <%
	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	StringBuffer sb = null;
 	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
 		
 		//CLOB 데이터를 읽어오기 위해서는 select문으로 ResultSet객체에 담습니다.
 		pstmt = conn.prepareStatement("select * from clobtable where num=1");
 		rs = pstmt.executeQuery();
 		if(rs.next()){
 			BufferedReader rd = 
 					new BufferedReader(rs.getCharacterStream("content"));
 			sb = new StringBuffer();
 			char[] buf = new char[1024];
 			int readcnt;
 			
 			//buf 안에 있는 데이터를 1024만큼 읽어 옵니다.
 			while((readcnt = rd.read(buf, 0, 1024)) != -1){
 				System.out.println("readcon = " + readcnt);
 				sb.append(buf, 0, readcnt);
 			}
 			rd.close();
 		}
 		out.println(sb.toString());
		
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

</body>
</html>