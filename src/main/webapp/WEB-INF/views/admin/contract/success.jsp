<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.ContractInfo, com.wjm.main.function.Validator"%>
<%
	ContractInfo contract = (ContractInfo) request.getAttribute("contract");
	
	String name, client_id, partners_id;
	
	if(Validator.hasValue(contract.getName()))
		name = contract.getName();
	else
		name = "";

	if(Validator.hasValue(contract.getClient_id()))
		client_id = contract.getClient_id();
	else
		client_id = "";
	
	if(Validator.hasValue(contract.getPartners_id()))
		partners_id = contract.getPartners_id();
	else
		partners_id = "";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 기본 정보 수정</title>
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
<body class="logged-in client account-setting profile">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />

		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="content">
					<p class="back">
						<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i
							class='fa fa-arrow-circle-o-right'></i></a>

					</p>
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">계약 정보 등록</h3>
						</section>
						<section>
						<form action="/wjm/admin/contract/success/<%=contract.getProject_pk()%>/<%=contract.getClient_pk()%>/<%=contract.getPartners_pk()%>" id="contract_form" method="POST"
							class="has-validation-callback">
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>프로젝트명</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="project-name-input"
										name="name" required="required" type="text" value="<%=name %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>클라이언트 아이디</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="client-id-input"
										name="client_id" required="required" type="text" value="<%=client_id %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>파트너스 아이디</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="partners-id-input"
										name="partners_id" required="required" type="text" value="<%=partners_id %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>비용(원)</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="budget-input"
										name="budget" required="required" type="text">
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>기간(일)</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="term-input"
										name="term" required="required" type="text">
								</div>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-btn-left"
								href="/wjm/admin/home" type="button">취소</a>
							<button class="btn btn-partners btn-submit" type="submit">등록</button></span>
						</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
		$(function() {
			wishket.init();

			svgeezy.init(false, 'png');
		});
	</script>
	<script>
		$(document).ready(
				function($) {
					var p5TotalSubNavigationFlag = 0;
					if ($(window).width() >= 1200) {
						$('.p5-side-nav-deactive').css('display', 'none');
					} else {
						$('.p5-side-nav-active').css('display', 'none');
						$('.p5-side-nav-deactive').css('display', 'block');
					}
					$('.content-inner')
							.on(
									'click',
									'.p5-side-nav-active-btn',
									function() {
										$('.p5-side-nav-active').css('display',
												'none');
										$('.p5-side-nav-deactive').css(
												'display', 'block');
									});
					$('.content-inner').on(
							'click',
							'.p5-side-nav-deactive-btn',
							function() {
								$('.p5-side-nav-active')
										.css('display', 'block');
								$('.p5-side-nav-deactive').css('display',
										'none');
							});
					$(window).scroll(
							function() {
								if ($(window).scrollTop() > 87
										&& p5TotalSubNavigationFlag === 0) {
									setTimeout(function() {
										$('#p5-total-sub-navigation-wrapper')
												.removeClass('hide fadeOut');
										$('#p5-total-sub-navigation-wrapper')
												.addClass('fadeInDown');
									}, 200);
									flag = 1;
								} else if ($(window).scrollTop() <= 87) {
									p5TotalSubNavigationFlag = 0;
									$('#p5-total-sub-navigation-wrapper')
											.removeClass('fadeInDown');
									$('#p5-total-sub-navigation-wrapper')
											.addClass('fadeOut');
									setTimeout(function() {
										$('#p5-total-sub-navigation-wrapper')
												.addClass('hide');
									}, 200);
								}
							});
				});
	</script>
</body>
</html>