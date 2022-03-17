<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 화면</title>
<script type="text/javascript">
	function checkFun()
	{	
	var f = document.user_info;
	
	if(f.userId.value == "")//아이디란이 공란인지 확인
	{
		alert("아이디를 입력해주세요.")
		f.userId.focus();
		return false;
	}
	else if(f.userPw.value == "")//비밀번호란이 공란인지 확인
	{
		alert("비밀번호를 입력해주세요.")
		f.userPw.focus();
		return false;
	}
	else return true;
	}
</script>
</head>
<body>
	<h3>Home > 관리자 로그인</h3>
	<hr>
	<form action="loginSuccess.jsp" method="post" name="user_info" onsubmit="return checkFun()">
		아이디:<br>
		<input type="text" size = "16" name="userId"><br><br>
		비밀번호:<br>
		<input type="password" size = "16" name="userPw"><br><br>
		<hr>
		<input type="submit" value="관리자 로그인">	
	</form>
</body>
</html>