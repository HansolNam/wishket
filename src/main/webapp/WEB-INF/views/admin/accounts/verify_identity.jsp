<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.main.function.Validator, com.wjm.models.AccountInfo,com.wjm.models.AccountInformationInfo, com.wjm.models.AuthenticationInfo"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo accountinfo = this_account.getAccountinfo();
	AuthenticationInfo authenticationinfo = this_account.getAuthenticationinfo();

	String img_path = accountinfo.getProfile_img();
	if (img_path != null) {
		if (img_path.isEmpty())
			img_path = "default_avatar.png";
	} else
		img_path = "default_avatar.png";

	String user_type = "";
	String identity_doc = "";
	String representer_name = "";
	String address_detail = "";
	String email_for_tax = "";
	String identify_number = "";
	String company_name = "";

	String name = accountinfo.getName();
	String id = this_account.getId();
	String form = accountinfo.getForm();

	if (!Validator.hasValue(name))
		name = "";
	if (!Validator.hasValue(id))
		id = "";
	if (authenticationinfo != null) {
		user_type = authenticationinfo.getUser_type();
		identity_doc = authenticationinfo.getIdentity_doc();
		representer_name = authenticationinfo.getRepresenter_name();
		address_detail = authenticationinfo.getAddress_detail();
		email_for_tax = authenticationinfo.getEmail_for_tax();
		identify_number = authenticationinfo.getIdentify_number();
		company_name = authenticationinfo.getCompany_name();
	}
	if (form.equals("individual"))
		form = "개인";
	else if (form.equals("team"))
		form = "팀";
	else if (form.equals("individual_business"))
		form = "개인 사업자";
	else if (form.equals("corporate_business"))
		form = "법인 사업자";
	else
		form = "";
%>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 신원 인증</title>
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
	href="${pageContext.request.contextPath}/resources/static/css/p5.css"
	rel="stylesheet" />
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
<body class="logged-in client account-setting">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading"><%=this_account.getAccount_type() %></h3>
						<div class="user-name-tag-body">
							<img alt="<%=id %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=img_path %>" />
							<h4 class="username"><%=id %></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a class="active"
								href="/wjm/admin/accounts/profile/<%=this_account.getPk()%>">기본 정보</a></li>
							<li class="active"><a
								href="/wjm/admin/accounts/verify_identity/<%=this_account.getPk()%>">신원 인증</a></li>
							<li class=""><a href="/wjm/admin/accounts/bank_account/<%=this_account.getPk()%>">계좌
									관리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
				<p class="back">
				<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
					<div class="content-header action">
						<h3 class="header-text">
							신원 인증 <small class="small-text">회원의 신원 정보를 검수하고 승인할 수 있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<h4>
							사용자 신원 인증 정보
							<%
								if(accountinfo != null && Validator.hasValue(accountinfo.getIdentity_authentication()) && accountinfo.getIdentity_authentication().equals("검수중") )
								{
							%>
							<a
							class="btn btn-large btn-partners btn-project-application btn-block pull-right"
							href="/wjm/admin/verify_identity/success/<%=this_account.getPk() %>" style="width:150px">검수 완료하기</a>
							
							<a
							class="btn btn-large btn-project-application btn-default btn-block pull-right"
							href="/wjm/admin/verify_identity/fail/<%=this_account.getPk() %>" style="width:150px"><span
							id="interest_action_text">인증 거부하기</span></a>
							<%
								}
							%>
						</h4>
						<form action=""
							class="form-horizontal has-validation-callback"
							enctype="multipart/form-data" id="base_show_form" method="POST"
							style="border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="oBeQVnrQKE7CC6iDRvqQ1w8H9Y9m8v6V">
							<div class="form-group">
								<label class="control-label required"><span>*</span> 인증 서류 이미지</label>
								<div class="control-wrapper" style="padding-top: 7px;">
									<img alt="<%=id %> 사진" class="partners-img"
										src="${pageContext.request.contextPath}/resources/upload/doc/<%=authenticationinfo.getIdentity_doc() %>"
										style="border-radius: 10%; border: 1px solid #dedede; width: 220px; height: 220px;">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									회사 형태</label>
								<div class="control-wrapper">
									<input disabled="" id="get_form_of_business"
										name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=form%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 성명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=representer_name%>">
								</div>
							</div>
							<%
								if(!form.equals("개인")&&!form.equals("팀"))
								{
							%>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 사업자 형태</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=user_type%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 법인명(단체명)</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=company_name%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 사업자 등록 번호</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=identify_number%>">
								</div>
							</div>
							<%
								}%>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									<% if(!form.equals("개인")&&!form.equals("팀")) out.print("사업장 ");%>주소</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=address_detail%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 이메일 주소</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=email_for_tax%>">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	
</body>
</html>