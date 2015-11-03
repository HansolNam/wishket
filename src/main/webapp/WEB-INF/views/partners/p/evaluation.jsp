<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInformationInfo, com.wjm.models.AccountInfo, com.wjm.models.AssessmentInfo, java.util.*, com.wjm.main.function.*"%>

<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<AssessmentInfo> assessmentlist = (List<AssessmentInfo>) request.getAttribute("assessmentlist");
	String isSame = (String) request.getAttribute("isSame");

	String profile = this_accountinfo.getProfile_img();
	Integer contractnum = (Integer)request.getAttribute("contractnum");
	if(contractnum == null)
		contractnum = 0;
	if (!Validator.hasValue(profile))
		profile = "default_avatar.png";

	int assessmentCnt = 0;
	int total = 0, professionalism = 0, satisfaction = 0, communication = 0, schedule_observance = 0,
			activeness = 0;
	int count[] = {0, 0, 0, 0, 0};
	double total_avg = 0.0;

	if (assessmentlist != null) {
		assessmentCnt = assessmentlist.size();

		for (int i = 0; i < assessmentCnt; i++) {
			int avg = (assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
					+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
					+ assessmentlist.get(i).getActiveness()) / 5;

			count[avg - 1]++;

			professionalism += assessmentlist.get(i).getProfessionalism();
			satisfaction += assessmentlist.get(i).getSatisfaction();
			communication += assessmentlist.get(i).getCommunication();
			schedule_observance += assessmentlist.get(i).getSchedule_observance();
			activeness += assessmentlist.get(i).getActiveness();
		}

	}

	if (assessmentCnt != 0) {
		total = professionalism + satisfaction + communication + schedule_observance + activeness;
		total_avg = (double) total / (double) (assessmentCnt * 5);
		professionalism /= assessmentCnt;
		satisfaction /= assessmentCnt;
		communication /= assessmentCnt;
		schedule_observance /= assessmentCnt;
		activeness /= assessmentCnt;
	}
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

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/Chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/js/excanvas.js"
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
							<li class=""><a
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
							<li class="active" style="border-top: 1px dashed #dedede"><a
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
						<section style="border-bottom:1px dashed #dedede;">
						<h3 class="p5-profile-head">
							<%=this_account.getId()%>의 평가<a
								class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/"
								style="margin-top: -7px;">업데이트 하기</a>
						</h3>
						<div class="evaluation-head">
							<div class="contract-project-table">
								<div class="contract-project-count">
									<div class="title-column">계약한 프로젝트</div>
									<div class="data-column">
										<span class="value"><%=contractnum%></span> 개 / 평가
										<%=assessmentCnt%>개
									</div>
								</div>
								<div class="contract-project-cost">
									<div class="title-column">프로젝트 평균평점</div>
									<div class="data-column" style="padding: 7px 12px;">
										<div class="star-sm star-sm-0"
											style="float: left; width: 78px; height: 14px; margin-top: 5px; margin-right: 11px;"></div>
										<span style="color: #333; font-size: 18px; font-weight: bold"><%=Math.round(total_avg * 10) / 10.0%></span>
									</div>
								</div>
							</div>
							<div class="Chart" style="padding-bottom: 10px;">
								<div class="Chart-radar">
									<div style="margin-bottom: 20px;">
										<p
											style="padding-left: 30px; font-size: 14px; color: #666; font-weight: bold;">세부
											항목 평가</p>
									</div>
									<div style="display: inline-block; float: left;">
										<ul>
											<li><strong>전문성</strong><span><%=professionalism%>점</span></li>
											<li><strong>만족도</strong><span><%=satisfaction%>점</span></li>
											<li><strong>의사소통</strong><span
												style="padding-left: 11px;"><%=communication%>점</span></li>
											<li><strong>일정준수</strong><span
												style="padding-left: 11px;"><%=schedule_observance%>점</span></li>
											<li><strong>적극성</strong><span><%=activeness%>점</span></li>
										</ul>
									</div>
									<div style="display: inline-block; float: right;">
										<canvas id="myChart_radar"></canvas>
									</div>
								</div>
								<div class="Chart-bar">
									<p
										style="margin-left: 30px; font-size: 14px; color: #666; font-weight: bold;">평점
										분포</p>
									<ul>
										<li class="star-5" id="star_5">5점</li>
										<li class="star-4" id="star_4">4점</li>
										<li class="star-3" id="star_3">3점</li>
										<li class="star-2" id="star_2">2점</li>
										<li class="star-1" id="star_1">1점</li>
									</ul>
									<canvas height="137" id="myChart_bar"
										style="float:left; width:150px; height:122px!important;margin-top:11px;"></canvas>
									<ul class="star-point">
										<li id="star_value_1"><%=count[4]%>명</li>
										<li id="star_value_2"><%=count[3]%>명</li>
										<li id="star_value_3"><%=count[2]%>명</li>
										<li id="star_value_4"><%=count[1]%>명</li>
										<li id="star_value_5"><%=count[0]%>명</li>
									</ul>
									<div style="clear: left"></div>
								</div>
								<div style="clear: left"></div>
							</div>
						</div>
						</section>
						<section>
						<h4 style="padding-top: 15px;">클라이언트의 평가</h4>
						</section>
						<section class="p5-evaluation-list"> 
						<%
						 	if (assessmentCnt > 0) {
						 		for (int i = 0; i < assessmentCnt; i++) {

									double d = (double)(assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
											+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
											+ assessmentlist.get(i).getActiveness());
									
									d = (double)d/5.0;
						 %>

						<div class="p5-partners-project-evaluation">
							<div class="p5-partners-project-evaluation-header">
								<div class="p5-partners-project-evaluation-title">
									<h4>
										<a
											href="/wjm/project/<%=assessmentlist.get(i).getProject().getName() %>/<%=assessmentlist.get(i).getProject_pk() %>/"><%=assessmentlist.get(i).getProject().getName() %></a>
									</h4>
								</div>
								<div class="p5-partners-project-evaluation-info">
									<span>클라이언트 <span class="p5-partners-project-info-id"><%=assessmentlist.get(i).getClient().getId() %></span></span>
									<span>카테고리 <span
										class="p5-partners-project-info-category"><%=assessmentlist.get(i).getProject().getCategoryL() %> &gt; <%=assessmentlist.get(i).getProject().getCategoryM() %></span></span>
								</div>
							</div>
							<div class="p5-partners-project-evaluation-body1">
								<span><i class="fa fa-clock-o"></i>계약일<span
									class="p5-partners-project-evaluation-date"><%=Time.toString3(assessmentlist.get(i).getContract().getReg_date())%></span></span>
								<span><i class="fa fa-won"></i>계약금액<span
									class="p5-partners-project-evaluation-cost"><%=assessmentlist.get(i).getContract().getBudget()%> 원</span></span>
								<span><i class="fa fa-clock-o"></i>계약기간<span
									class="p5-partners-project-evaluation-period"><%=assessmentlist.get(i).getContract().getTerm()%> 일</span></span>
							</div>
							<div class="p5-partners-project-evaluation-body2">
								<h5>평균별점</h5>
								<div class="star-lg star-lg-5"></div>
								<span class="p5-partners-project-rating"><%=Math.round(d*10)/10.0 %></span> 
							</div>
							<div class="p5-review-specific-info">
								<div class="p5-review-group1">
									<span class="p5-review-title">전문성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getProfessionalism() %></span></span> <span
										class="p5-review-title">만족도</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getSatisfaction() %></span></span> <span
										class="p5-review-title">의사소통</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getCommunication() %></span></span>
								</div>
								<div class="p5-review-group2">
									<span class="p5-review-title">일정 준수</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getSchedule_observance() %></span></span> <span
										class="p5-review-title">적극성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getActiveness() %></span></span>
								</div>
								<div class="p5-user-comment">
									<span class="p5-user-img-box"><h6>추천 한마디</h6>
										<img alt="<%=assessmentlist.get(i).getClient().getId() %> 사진" class="p5-user-comment-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=assessmentlist.get(i).getProfile() %>"></span>
									<span class="p5-user-comment-box"><div>
											<span class="label label-default label-role"><%=assessmentlist.get(i).getClient().getId() %></span>
										</div>
										<div class="p5-review-comment"><%=assessmentlist.get(i).getRecommendation()%></div></span>
								</div>
							</div>
						</div>
						<%
							}
							}
						 	else
						 	{
						%>

						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<p class="p5-no-partners-info-text">
										등록된 <span class="text-center p5-bold">'평가'</span>가 없습니다.
									</p>
								</div>
							</div>
						</div>
						<%
						 	}
						%>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script>
		window.onload = function() {
			Chart.defaults.global.tooltipFontSize = 10;
			Chart.defaults.global.scaleShowLabels = false;

			var review_star_data = new Array(5);

			for (var i = 0; i < review_star_data.length; i++) {
				review_star_data[i] = Number($('.p5-review-star').children()
						.eq(2 * i + 1).text());
			}

			var star_review = Number($('p5-partners-project-rating').text());

			var options = {
				scaleFontColor : "#666",
				showTooltips : false,
				display : true,
				animation : false,
				showScale : false,
				scaleShowGridLines : false,
				scaleBeginAtZero : false,
				showDatasetLabels : false,
				showVerticalLines : false,
				scaleShowHorizontalLines : false,
				scaleShowVerticalLines : false,
				barShowStroke : false
			};

			var value_set = {
				labels : [ "별 1개", "별 2개", "별 3개", "별 4개", "별 5개" ],
				datasets : [ {
					fillColor : [ "#F7464A" ],
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill : "rgba(220,220,220,0.75)",
					highlightStroke : "rgba(220,220,220,1)",
					data : [ 0.05, 0.05, 0.05, 0.05, 0.05 ]
				} ]
			};

			var ctx = $('#myChart_bar').get(0).getContext('2d');

			var myBarChart = new Chart(ctx).HorizontalBar(value_set, options);
			myBarChart.datasets[0].bars[4].fillColor = "#facd11"; //bar 1
			myBarChart.datasets[0].bars[3].fillColor = "#fbd743"; //bar 2
			myBarChart.datasets[0].bars[2].fillColor = "#fce275"; //bar 3
			myBarChart.datasets[0].bars[1].fillColor = "#fdeca7";
			myBarChart.datasets[0].bars[0].fillColor = "#fef7d9";
			myBarChart.update();

			if ($('#myChart_radar').length) {
				var ctx1 = document.getElementById("myChart_radar").getContext(
						"2d");
				var data = {
					labels : [ "전문성", "만족도", "의사소통", "일정준수", "적극성" ],
					datasets : [ {
						pointColor : "#42ab8c",
						fillColor : "rgba(66,171,140, 0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : [ 0, 0, 0, 0, 0 ]
					} ]
				};

				var option = {
					showTooltips : false,
					datasetStrokeWidth : 1,
					animation : false,
					responsive : false,
					pointDot : true,
					scaleOverride : true,
					scaleSteps : 5,
					scaleStepWidth : 1,
					scaleStartValue : 0,
					pointDotStrokeWidth : 2
				};

				window.RadarChart = new Chart(ctx1).Radar(data, option);
			}

		};
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