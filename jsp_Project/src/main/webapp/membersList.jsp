<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 관리</title>
</head>
<body>
	<%         
       String driverName = "com.mysql.jdbc.Driver";
       String url = "jdbc:mysql://localhost:3306/address";
       String user = "root";
       String password = "1234";
       Connection conn = null;
       
       String sql = "SELECT * FROM members2";
       
       try{
          Class.forName(driverName);
          conn = DriverManager.getConnection(url, user, password);
          Statement stmt = conn.createStatement();//sql을 실행시켜주는 객체 생성(Statement)
          ResultSet rs = stmt.executeQuery(sql); //select 실행 결과를 ResultSet 으로 받음
          
          String memberList = "";
          
          while(rs.next()){
        	  memberList = memberList + rs.getString("id") + " | " + rs.getString("password") + 
        			  " | " + rs.getString("email") + " | " + rs.getString("signuptime") + "<br>";
          }
          
			out.println("<h2>회원 리스트 관리</h2>");
			out.println(memberList);
			
       } catch(ClassNotFoundException e) {
          out.println("jdbc 드라이버 오류");
       } catch(SQLException e) {
          out.println("SQL 오류");
       } finally {
          try{
          
             
             if(conn != null){
                conn.close();
             }
          } catch(SQLException e) {
             
          }
          
       }
   
   
   %>
   <table border="0">
			<tr>
				<td>
					<form action="withdraw.jsp" method="post">
						<input type="submit" value="회원 탈퇴 화면 실행 ▶">
					</form>
				</td>
			</tr>
		</table>
</body>
</html>