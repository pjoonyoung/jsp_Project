<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String m_id = request.getParameter("userId");
		out.println(m_id);
		
		String sql = "DELETE FROM members2 WHERE id = ?";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/address";
		String user = "root";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);

			pstmt = conn.prepareStatement(sql);//sql을 실행시켜주는 객체 생성(Statement)
			pstmt.setString(1, m_id);

			int flag = pstmt.executeUpdate();//sql문이 성공적으로 실행되면 1을 반환
			if(flag == 1) {
				out.println("회원 탈퇴 성공!!!!");
				response.sendRedirect("drawSuccess.jsp");
				
			} else {
				out.println("회원 탈퇴 실패!!!!");
				response.sendRedirect("drawErr.jsp");
			}			
			//out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				pstmt.close();									
				conn.close();
				
			} catch(Exception e2) {
				e2.printStackTrace();
			}
			
		}
	%>
</body>
</html>