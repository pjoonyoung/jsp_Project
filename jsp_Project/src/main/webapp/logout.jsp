<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그아웃</title>
</head>
<body>
	<h3>Home > 관리자 로그아웃</h3>
	<hr>

	<%
      //session.invalidate();//모든 세션 내용 삭제
      Enumeration enumer = session.getAttributeNames();
      while(enumer.hasMoreElements())
      {
         String sName = enumer.nextElement().toString();
         String sValue = session.getAttribute(sName).toString();
         
         if(sValue.equals("admin"))
         {            
            session.removeAttribute(sName);
            out.println("로그아웃에 성공하셨습니다.");
         }
         else
         {
        	 out.println("로그아웃 실패! 다시 확인해 주세요.");
         }
      }
   %>
   <table border="0">
			<tr>
				<td>
					<form action="main.jsp" method="post">
						<input type="submit" value="메인화면 이동 ▶">
					</form>
				</td>
			</tr>
		</table>
</body>
</html>