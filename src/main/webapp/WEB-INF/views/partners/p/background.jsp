<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.LicenseInfo, com.wjm.models.EducationInfo, com.wjm.models.CareerInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<CareerInfo> career = (List<CareerInfo>) request.getAttribute("career");
	List<EducationInfo> education = (List<EducationInfo>) request.getAttribute("education");
	List<LicenseInfo> license = (List<LicenseInfo>) request.getAttribute("license");
	String isSame = (String) request.getAttribute("isSame");
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
<title>위시켓(Wishket) · 파트너스 - <%=this_account.getId()%></title>
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

		<jsp:include page="../../header2.jsp" flush="false" />

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
								src="${pageContext.request.contextPath}/<%=this_accountinfo.getProfile_img() %>" />
							<h4 class="partners-username-bottom"><%=this_account.getId()%></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/">전체보기</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/">자기
									소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유
									기술</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/">클라이언트의
									평가</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/history/">위시켓에서
									진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section>
						<h3 class="p5-profile-head">
							<%=this_account.getId()%>의 경력, 학력, 자격증
							<%
								if (isSame != null) {
							%>
							<a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/"
								style="margin-top: -7px;">업데이트 하기</a>
							<%
								}
							%>
						</h3>
						</section>
						<section>
						<h4 class="p5-page-title" style="margin-top: 25px;">경력</h4>
						<%
							if (career == null) {
						%> <span><div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'경력'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> <%
						 	} 
							else {
							
						%>
						<table class="table table-responsive table-hover p5-career-table">
							<thead>
								<tr>
									<th
										class="p5-head-companyName p5-head-companyName-no-body-tool">회사명</th>
									<th class="p5-head-work p5-head-work-no-body-tool">근무부서 및
										담당업무</th>
									<th class="p5-head-position p5-head-position-no-body-tool">직위</th>
									<th class="p5-head-period p5-head-period-no-body-tool">근무기간</th>
								</tr>
							</thead>
							<tbody>
						<%
						 		for (int i = 0; i < career.size(); i++) {
						 %>
						
								<tr>
									<td
										class="p5-head-companyName p5-head-companyName-no-body-tool"><%=career.get(i).getCompany_name() %></td>
									<td class="p5-head-work p5-head-work-no-body-tool"><%=career.get(i).getDepartment() %></td>
									<td class="p5-head-position p5-head-position-no-body-tool"><%=career.get(i).getPosition() %></td>
									<td class="p5-head-period p5-head-period-no-body-tool"><%=career.get(i).getStart_date() %>~<br><%=career.get(i).getEnd_date() %>
									</td>
								</tr>
						<%
								}
						%>
						
							</tbody>
						</table>
						<%
							}
						%> </section>
						<section>
						<h4 class="p5-page-title">학력</h4>

						<%
							if (education == null) {
						%> <span><div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'학력'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> 
						<%
						 	} else {
						 		
						%>
						<table
							class="table table-responsive table-hover p5-educationalHistory-table">
							<thead>
								<tr>
									<th class="p5-head-schoolName">학교명</th>
									<th class="p5-head-schoolClassification">분류</th>
									<th class="p5-head-major">전공</th>
									<th class="p5-head-status">상태</th>
									<th class="p5-head-entranceDate">입학일</th>
									<th class="p5-head-graduationDate">졸업일</th>
								</tr>
							</thead>
							<tbody>
						<%
						 		for (int i = 0; i < education.size(); i++) {
						 %>
						
								<tr>
									<td class="p5-head-schoolName p5-head-schoolName-no-body-tool"><%=education.get(i).getSchool_name() %></td>
									<td
										class="p5-head-schoolClassification p5-head-schoolClassification-no-body-tool"><%=education.get(i).getLevel()%></td>
									<td class="p5-head-major p5-head-major-no-body-tool"><%=education.get(i).getMajor() %></td>
									<td class="p5-head-status p5-head-status-no-body-tool"><%=education.get(i).getState() %></td>
									<td
										class="p5-head-entranceDate p5-head-entranceDate-no-body-tool"><%=education.get(i).getStart_date() %></td>
									<td
										class="p5-head-graduationDate p5-head-graduationDate-no-body-tool"><%=education.get(i).getEnd_date() %></td>
								</tr>
						<%
								}
						
						%>
							</tbody>
						</table>
						
						<%
							}
						%> </section>
						<section>
						<h4 class="p5-page-title">자격증</h4>

						<%
							if (license == null) {
						%> <span><div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'자격증'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> <%
 							} 
							else {
						%>
						<table
							class="table table-responsive table-hover p5-certificate-table">
							<thead>
								<tr>
									<th class="p5-head-classification">구분</th>
									<th class="p5-head-certificateNumber">자격증번호</th>
									<th class="p5-head-certificateDepartment">발행처</th>
									<th class="p5-head-certificateDate">발행일자</th>
								</tr>
							</thead>
							<tbody>
						<%
						
						 		for (int i = 0; i < license.size(); i++) {
						 %>
						
								<tr>
									<td
										class="p5-head-classification p5-head-classification-no-body-tool"><%=license.get(i).getName() %></td>
									<td
										class="p5-head-certificateNumber p5-head-certificateNumber-no-body-tool"><%=license.get(i).getSerial_num() %></td>
									<td
										class="p5-head-certificateDepartment p5-head-certificateDepartment-no-body-tool"><%=license.get(i).getPublishing_office() %></td>
									<td
										class="p5-head-certificateDate p5-head-certificateDate-no-body-tool"><%=license.get(i).getPublication_date() %></td>
								</tr>

							<%
									}
						
						%>
							</tbody>
						</table>
						
						<%
								}
							%> </section>
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