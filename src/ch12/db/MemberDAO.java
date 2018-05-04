package ch12.db;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

/*
 * DAO(Data Access Object) 클래스
 * - 데이터 베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이
 * 		이루어지는 클래스 입니다.
 * - 어떤 Action 클래스가 호출되더라도 그에 해당하는
 * 		데이터 베이스 연동 처리는 DAO 클래스에서 이루어지게 됩니다.
 */
public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	//생성자에게 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		} catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public int isId(String id, String pass) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select id, password from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pass)) {
					result = 1;		//아이다와 비밀번호가 일치하는 경우
				} else {
					result = 0;		//비밀번호가 일치하지 않은 경우
				}
			} else {
				result = -1;		//아이디가 존재하지 않는 경우
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			
		}
		
		return result;
	}
	
}
