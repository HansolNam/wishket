<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import="java.util.List, com.wjm.models.ProjectInfo, com.wjm.models.AccountInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<ProjectInfo> interest = (List<ProjectInfo>) request.getAttribute("interest");

	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
%>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 관리 - 관심 프로젝트</title>
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
<body class="logged-in partners partners-management proposal-management">
	<div id="wrap">
		<jsp:include page="../../header2.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">파트너스</h3>
						<div class="user-name-tag-body">
							<img alt="<%= account.getId()%> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<h4 class="username"><%=account.getId()%></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a href="/wjm/partners/manage/interest/">관심
									프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							관심 프로젝트 <small class="small-text">관심 프로젝트에 추가한 프로젝트들을 확인할
								수 있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<p class="process-guide-text" style="float: left">
								1. 관심 프로젝트는 <strong>'프로젝트 찾기'</strong>와 <strong>'프로젝트
									상세페이지'</strong>에서 추가, 삭제가 가능합니다.<br /> 2. 프로젝트에 지원하거나 프로젝트 모집이 마감되면, <strong>관심
									프로젝트 목록에서 자동으로 삭제</strong>됩니다.<br /> 3. 프로젝트 <strong>지원은 프로젝트
									상세페이지</strong>에서 가능합니다.
							</p>
							<div style="clear: both;"></div>
						</div>
						<section> 
						<%
						 	if (interest == null) {
						 %> 
						 <section>
								<p class="text-muted">관심 프로젝트가 없습니다.</p>
							</section> 
						<%
							} else {
 								for (int i = 0; i < interest.size(); i++) {
 						%> 
 						<section class="proposal-unit">
							<section class="proposal-unit-heading">
							<h4 class="project-title">
								<a
									href="/wjm/project/<%=interest.get(i).getName() %>/<%=interest.get(i).getPk() %>/"><%=interest.get(i).getName() %></a> <a class="interest-list-action-btn"
									href="/wjm/partners/manage/interest/delete/<%=interest.get(i).getPk() %>/"
									title="'관심 프로젝트'에서 삭제하기"></a>
							</h4>
							</section>
						<section class="proposal-unit-body">
						<ul class="interest-summary-info">
							<li class="lg" style="*width: 280px;"><h5 class="label-item">
									<i class="fa fa-tags"></i> 카테고리
								</h5>
								<span class="project-budget"><%=interest.get(i).getCategoryL() %> &gt; <%=interest.get(i).getCategoryM() %></span></li>
							<li class="sub-lg" style="*width: 235px;"><h5
									class="label-item">
									<i class="fa fa-won"></i> 예상비용
								</h5>
								<span><%=interest.get(i).getBudget() %>원</span></li>
							<li class="sm"><h5 class="label-item">
									<i class="fa fa-clock-o"></i> 예상 기간
								</h5>
								<span class="project-term"><%=interest.get(i).getPeriod() %>일</span></li>
						</ul>
						<ul class="interest-summary-info">
							<li class="lg" style="*width: 280px;"><h5 class="label-item">
									<i class="fa fa-map-marker"></i> 진행지역
								</h5>
								<span><%=interest.get(i).getMeeting_area() %> &gt; <%=interest.get(i).getMeeting_area_detail() %></span></li>
							<li class="sub-lg" style="*width: 235px;"><h5
									class="label-item">
									<i class="fa fa-calendar-o"></i> 마감일자
								</h5>
								<span class="project-date-deadline"><%=Time.toString3(interest.get(i).getDeadline())%></span></li>
							<li class="sm"><h5 class="label-item">
									<i class="fa fa-pencil"></i> 지원자
								</h5>
								<span><%=interest.get(i).getApplicantnum() %>명</span></li>
						</ul>
						</section>
						</section> 
						<%
						 	}
						 	}
						 %> </section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />

	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"
		rel="stylesheet" />
	<script>
		$(function() {
			if ($(window).width() > 680) {
				$(document).tooltip(
						{
							position : {
								my : "right+14 bottom-10",
								at : "right top",
								using : function(position, feedback) {
									$(this).css(position);
									$("<div>").addClass(feedback.vertical)
											.addClass(feedback.horizontal)
											.appendTo(this);
								}
							}
						});
			}
		});
	</script>
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