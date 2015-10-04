<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 문자메세지 테스트</title>
</head>
<body class="logged-in partners partners-management proposal-management">
	<form method="POST" name="send" target="hedfrm"
	action="http://www.munjanara.co.kr/MSG/send/web_admin_send.htm">
		<input type="hidden" name="userid" value="gksthf1611">
		<input type="hidden" name="passwd" value="quswlgns1234">
		<input type="hidden" name="sender" value="01073813352">
		<input type="hidden" name="receiver" value="01073813352">
		<input type="hidden" name="message" value="test입니댜 룰루"> <!-- 80 byte 제한, 넘는 부분은 잘림 -->
		<input type="hidden" name="receiver_name" value="남한솔"> <!-- 한글 4자 제한, 넘는 부분은 짤림 -->
		<input type="hidden" name="end_alert" value="0">
		<input type="hidden" name="encode" value="1">
	</form>
	
<script language="javascript"> 
	document.send.submit();
</script>
</body>
</html>