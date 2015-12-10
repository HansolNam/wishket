<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.main.function.Validator,com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo"%>
<%
	AccountInfo this_account = (AccountInfo)request.getAttribute("this_account");
AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	String introduction = (String)request.getAttribute("introduction");
	if(introduction == null) introduction = "";
	String isSame = (String)request.getAttribute("isSame");
	
	introduction = introduction.replaceAll("\r\n","<br/>");

	String profile = this_accountinfo.getProfile_img();
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 파트너스 - <%=this_account.getId()%></title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link
	href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="partners-name-tag">
						<h3 class="partners-name-tag-heading">파트너스</h3>
						<div class="partners-name-tag-body">
							<img alt="<%=this_account.getId() %> 사진"
								class="p5-partners-img-lg"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="partners-username-bottom"><%=this_account.getId()%></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/">전체보기</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/">자기
									소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/">클라이언트의
									평가</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/history/">외주몬에서
									진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section>
						
							<h3 class="p5-profile-head"><%=this_account.getId() %>의 자기 소개
							<%if(isSame != null){ %><a class="btn btn-primary pull-right" href="/wjm/partners/p/<%=this_account.getId() %>/introduction/update/" style="margin-top: -7px;">업데이트 하기</a><%} %>
							</h3>
							</section>
						<section class="p5-section"
							style="text-overflow: ellipsis; overflow: hidden; word-wrap: break-word;">
							<h4 class="header-text">자기 소개</h4>
								<% 
									if(Validator.hasValue(introduction))
									{
										out.println(introduction);
									}
									else
									{
								%>
								<div class="p5-empty-component-md">
									<div class="p5-assign-component">
										<div>
											<div>
													입력된 <span class="text-center p5-bold">'자기소개'</span>가 없습니다.
												</p>
											</div>
										</div>
									</div>
								</div>
								<%
									}
								%>
						<p></p>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../../footer.jsp" flush="false" />
	</body>
</html>