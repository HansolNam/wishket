<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 로그인</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="./resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="./resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="icon" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png" rel="apple-touch-icon"
	sizes="76x76" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png" rel="apple-touch-icon"
	sizes="120x120" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152" />
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class=" account login">
	<div id="wrap">
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						로그인 <small class="small-text">외주몬에 오신 것을 환영합니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<section class="login-body">
					<form action="/wjm/accounts/login/" class="form-horizontal"
						id="login-form" method="post">
						<input name="csrfmiddlewaretoken" type="hidden"
							value="6uNyCofkYxLTSsxGWtCuwuZEL7X1bTPR" />
						<div class="form-group " id="id_div">
							<label class="control-label required" for="id"><span>*</span>
								아이디 또는 이메일</label>
							<div class="control-wrapper">
								<input autocomplete="off" class="required form-control"
									id="id" maxlength="75" name="id"
									type="text" />
							</div>
						</div>
						<div class="form-group " id="password_div">
							<label class="control-label required" for="password"><span>*</span>
								비밀번호</label>
							<div class="control-wrapper">
								<input autocomplete="off" class="required form-control"
									id="password" maxlength="32" name="password" type="password" />
							</div>
						</div>
						<div class="form-group">
							<div class="btn-block-wrapper">
								<!-- <input name="next" type="hidden" value="/project/add/" /> -->
								<button class="btn btn-wishket btn-lg btn-block" type="submit">로그인</button>
								
							</div>
						</div>
					</form>
					</section>
					<aside class="login-aside">
					<p class="redirect-signup">
						아직 회원이 아니신가요? <a href="/wjm/accounts/signup/">회원가입 하기</a>
					</p>
					<p class="find-password">
						비밀번호를 잊으셨나요? <a href="/wjm/accounts/password/reset/">비밀번호 찾기</a>
					</p>
					</aside>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../footer.jsp" flush="false" />
	
	<script type="text/javascript">
	$(document).ready(function(){
		var messages = "${messages}";
		var id_msg = "${id_msg}";
		var password_msg = "${password_msg}";

		if(messages != null && messages != "")
			$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
		if(id_msg != null && id_msg != "")
		{
			$("#id_div").addClass('has-error');
			$("#messages").html("<div class='alert alert-warning fade in'>"+id_msg+"</div>");
		}
		if(password_msg != null && password_msg != "")
		{
			$("#password_div").addClass('has-error');
			$("#messages").html("<div class='alert alert-warning fade in'>"+password_msg+"</div>");

		}
	});
	</script>
	
</body>
</html>