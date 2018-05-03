<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String inputId = (String)session.getAttribute("id");
	String baseId = "";
	String basePass = "";
	String baseName = "";
	int baseAge = 0;
	String baseGender = "";
	String baseEmail = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from member where id = ?";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, inputId);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			baseId = rs.getString(1);
			basePass = rs.getString(2);
			baseName = rs.getString(3);
			baseAge = rs.getInt(4);
			baseGender = rs.getString(5);
			baseEmail = rs.getString(6);
		}
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
<script src="../../js/jquery-3.3.1.js"></script>

<script>
	$(document).ready(function(){
		var baseGender = '<%=baseGender %>';
		if(baseGender == "남"){
			$('input[value=남]').attr("checked", "checked");
		} else {
			$('input[value=여]').attr("checked", "checked");
		}
		
		$(".cancelbtn").click(function(){
			location.href="main.jsp";	
		});
	});
	
</script>
</head>
<body>
	<form name="joinform" action="updateProcess.jsp"
		method="post">
		<h1>회원 수정 페이지</h1>
		<hr>
		<b>아이디</b>
		<input type="text" name="id" value="<%=baseId %>" required><br>
		<b>비밀번호</b>
		<input type="password" name="pass" value="<%=basePass %>" required><br>
		<b>이름</b>
		<input type="text" name="name" value="<%=baseName %>" required><br>
		<b>나이</b>
		<input type="text" name="age" maxlength=2 value="<%=baseAge %>" required><br>
		<b>성별</b><div>
		<input type="radio" name="gender" value="남"><span>남자</span>
		<input type="radio" name="gender" value="여"><span>여자</span><br></div>
		<b>이메일 주소</b>
		<input type="text" name="email" value="<%=baseEmail %>" required><br>
		<hr>
		<div class="clearfix">
			<button type="submit" class="updatebtn">수정</button>
			<button type="reset" class="cancelbtn">다시작성</button>
		</div>
	</form><br><br>
</body>
</html>