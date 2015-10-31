<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.NotificationInfo, java.util.List, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<NotificationInfo> notificationlist = (List<NotificationInfo>)request.getAttribute("notificationlist");
	String profile = (String)request.getAttribute("profile");
%>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 알림</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
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
<body class="logged-in client notification-list">
	<jsp:include page="../header.jsp" flush="false" />
	<div id="wrap">
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						알림 <small class="small-text"><%=account.getId() %>님! 새로운 소식들을 확인하세요.</small>
					</h3>
				</div>
				<div class="content-inner">
				
					<section class="list-wrapper">
					<%
						if(notificationlist != null)
						{
							for(int i=0;i<notificationlist.size();i++)
							{
					%>
					
					<div class="notification-unit">
						<div>
							<div class="notification-object" style="*width: 50px;">
								<img alt="외주몬" class="notification-sender-image" height="50px"
									src="${pageContext.request.contextPath}/resources/static/img/wjm_logo.png?v2" width="50px" />
							</div>
						</div>
						<div class="notification-body">
							<p>
								<%=notificationlist.get(i).getContent() %>
							</p>
							<span><%= Time.toString6(notificationlist.get(i).getReg_date()) %></span>
						</div>
					</div>
					
					<%
							}
				
						}
						else
						{
					%>
					
					<div class="notification-unit">
						<div>
							<div class="notification-object" style="*width: 50px;">
								<img alt="외주몬" class="notification-sender-image" height="50px"
									src="${pageContext.request.contextPath}/resources/static/img/wjm_logo.png?v2" width="50px" />
							</div>
						</div>
						<div class="notification-body">
							<p>
								아직 새로운 소식이 없습니다.
							</p>
						</div>
					</div>
					<%
						}
					%>
					
					</section>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading"><%if(account.getAccount_type().equals("client")) out.print("클라이언트"); else out.print("파트너스"); %></h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../footer.jsp" flush="false" />
	</body>
</html>