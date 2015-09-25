<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.PortfolioInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<PortfolioInfo> portfolio = (List<PortfolioInfo>) request.getAttribute("portfolio");
	if (portfolio != null)
		if (portfolio.size() == 0)
			portfolio = null;
	String isSame = (String) request.getAttribute("isSame");

	int representative = 0;

	if (portfolio != null) {
		for (int i = 0; i < portfolio.size(); i++) {
			if (portfolio.get(i).getRepresentative() == 1)
				representative++;
		}
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
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
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
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유 기술</a></li>
							<li class=""><a
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
					<div class="content-inner"
						style="padding-top: 15px; padding-bottom: 25px;">
						<section>
						<h3 class="p5-profile-head">
							<%=this_account.getId()%>의 포트폴리오 <%if(isSame != null){%><a
								class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/"
								style="margin-top: -7px;">업데이트 하기</a><%} %>
						</h3>
						</section>
						<section class="p5-partition">
						<h4 class="p5-page-title" style="margin-top: 25px; !important;">
							대표 포트폴리오(<span id="p5-represent-portfolio-num"><%=representative%></span>)
						</h4>
						<div class="p5-represent-portfolio-img-list">
							<%
								if (representative == 0) {
							%>
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png" />
										<div class="p5-no-partners-info-text">
											<span class="p5-bold">'대표 포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
							<%
								} else {
									for(int i=0;i<portfolio.size();i++)
									{
										if(portfolio.get(i).getRepresentative() == 1)
										{
									
							%>
							<span category-id="<%=portfolio.get(i).getCategoryL()%>"
								subcategory-id="<%=portfolio.get(i).getCategoryM()%>"
								style="margin-right: 34px; margin-bottom: 20px;"><img
								src="https://wishket.blob.core.windows.net/thumbnail/gksthf16112_7ef9ce629b0de7c34026.png"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.get(i).getPk()%>/"><span
									class="p5-img-info"><div class="p5-img-brief-info">
											<div class="p5-img-title text-right"><%=portfolio.get(i).getName()%></div>
											<div class="p5-img-category text-right"><%=portfolio.get(i).getCategoryL()%>
												&gt;
												<%=portfolio.get(i).getCategoryM()%></div>
											<div class="p5-img-project-date text-right"><%=portfolio.get(i).getStart_date()%>
												~
												<%=portfolio.get(i).getEnd_date()%></div>
										</div></span></a> <span class="label label-sm label-open">대표 작품</span></span>
							<%			}
									}
								}
							%>
						</div>
						</section>
						<section class="p5-portfolio-nav-section"> <nav
							class="navbar p5-portfolio-nav-bar" role="navigation"> <span
							class="p5-page-title">포트폴리오 (<span id="p5-portfolio-num"><%
									if (portfolio == null)
										out.print(0);
									else
										out.print(portfolio.size());
								%></span>)
						</span>
						<ul class="nav navbar-nav navbar-right p5-portfolio-nav"
							id="p5-develop-subcategory">
							<li><div class="btn-group classification p5-filter">
									<button
										class="btn btn-default dropdown-toggle p5-specific-category-btn"
										data-toggle="dropdown" type="button">
										세부 카테고리 <i class="fa fa-sort"></i>
									</button>
									<ul class="dropdown-menu fob-filter"
										id="p5-develop-subcategory-filter" role="menu">
										<li category="전체보기"><a href="">전체보기</a></li>
									</ul>
								</div></li>
						</ul>
						<ul class="nav navbar-nav navbar-right p5-portfolio-nav"
							id="p5-all-category-nav">
							<li><div class="btn-group classification p5-filter">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" id="p5-category-dropdown-btn"
										type="button">
										카테고리 <i class="fa fa-sort"></i>
									</button>
									<ul class="dropdown-menu fob-filter" id="p5-category-filter"
										role="menu">
										<li category="전체보기"><a href="#">전체보기</a></li>
										<li category="개발"><a href="#">개발</a></li>
										<li category="디자인"><a href="#">디자인</a></li>
									</ul>
								</div></li>
						</ul>
						</nav></section>
						<section>
						<div class="p5-portfolio-list">
							<%
								if (portfolio == null) {
							%>
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png" />
										<div class="p5-no-partners-info-text">
											등록된 <span class="p5-bold">'포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
							<%
								} else {
									int portfolionum = portfolio.size();
									for (int i = 0; i < portfolionum; i++) {
							%>
							<span category-id="<%=portfolio.get(i).getCategoryL()%>"
								subcategory-id="<%=portfolio.get(i).getCategoryM()%>"><img
								src="/resources/upload/portfolio/<%=portfolio.get(i).getImg0()%>"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.get(i).getPk()%>/"><span
									class="p5-img-info"><div class="p5-img-brief-info">
											<div class="p5-img-title text-right"><%=portfolio.get(i).getName()%></div>
											<div class="p5-img-category text-right"><%=portfolio.get(i).getCategoryL()%>
												&gt;
												<%=portfolio.get(i).getCategoryM()%></div>
											<div class="p5-img-project-date text-right"><%=portfolio.get(i).getStart_date()%>
												~
												<%=portfolio.get(i).getEnd_date()%></div>
										</div> </span> </a> <% if(portfolio.get(i).getRepresentative() == 1){ %><span class="label label-sm label-open">대표 작품</span><%} %></span>
							<%
								}

								}
							%>
						</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>

	<jsp:include page="../../footer.jsp" flush="false" />
	<script>
		$(document)
				.ready(
						function() {
							var imgUrl = "";
							var split = location.href.split('/');
							var slug = split[5];
							var currentCategory = 0;
							var currentSubCategory = 0;

							allignComponent('p5-represent-portfolio-img-list');
							allignComponent('p5-portfolio-list');

							//dropdown btn
							$('.content-inner')
									.on(
											'click',
											'#p5-category-filter > li',
											function(event) {
												event.preventDefault();
												$(this)
														.parent()
														.siblings('button')
														.html(
																$(this).text()
																		+ '<i class="fa fa-sort"></i>');
												switch ($(this)
														.attr('category')) {
												case "전체보기":
													$('.p5-portfolio-list')
															.children()
															.css('display',
																	'inline-block')
															.attr(
																	'show-thumbnail');
													$('.p5-filter')
															.children(
																	'.p5-specific-category-btn')
															.html(
																	'세부 카테고리'
																			+ '<i class="fa fa-sort"></i>');
													currentCategory = "전체보기";
													break;
												case "개발"://개발
													$(
															'#p5-develop-subcategory-filter')
															.html(
																	makeNavCategory("개발"));
													$('.p5-portfolio-list')
															.children(
																	'span[category-id!="개발"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[category-id="개발"]')
															.css('display',
																	'inline-block');
													$('.p5-filter')
															.children(
																	'.p5-specific-category-btn')
															.html(
																	'세부 카테고리'
																			+ '<i class="fa fa-sort"></i>');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	"span[category-id='개발']").length);
													currentCategory = "개발";
													break;
												case "디자인"://디자인
													$(
															'#p5-develop-subcategory-filter')
															.html(
																	makeNavCategory("디자인"));
													$('.p5-portfolio-list')
															.children(
																	'span[category-id!="디자인"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[category-id="디자인"]')
															.css('display',
																	'inline-block');
													$('.p5-filter')
															.children(
																	'.p5-specific-category-btn')
															.html(
																	'세부 카테고리'
																			+ '<i class="fa fa-sort"></i>');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[category-id="디자인"]').length);
													currentCategory = "디자인";
													break;
												default:
													$('.p5-portfolio-list')
															.children().css(
																	'display',
																	'none');
													break;
												}
												allignComponent('p5-portfolio-list');
											});

							//develop subcategory dropdown btn 수정중
							$('.content-inner')
									.on(
											'click',
											'#p5-develop-subcategory-filter > li',
											function(event) {
												event.preventDefault();
												$(this)
														.parent()
														.siblings('button')
														.html(
																$(this).text()
																		+ '<i class="fa fa-sort"></i>');
												switch ($(this)
														.attr('category')) {
												case "전체보기"://전체보기
													if (currentCategory == "전체보기") {
														$('.p5-portfolio-list')
																.children()
																.css('display',
																		'inline-block');
													} else if (currentCategory == "개발") {
														$('.p5-portfolio-list')
																.children(
																		'span[category-id!="디자인"]')
																.css('display',
																		'none');
														$('.p5-portfolio-list')
																.children(
																		'span[category-id="디자인"]')
																.css('display',
																		'inline-block');
														makeNoPortfolioComponent($(
																'.p5-portfolio-list')
																.children(
																		'span[category-id='
																				+ '개발'
																				+ ']').length);
													} else if (currentCategory == "디자인") {
														$('.p5-portfolio-list')
																.children(
																		'span[category-id!='
																				+ '개발'
																				+ ']')
																.css('display',
																		'none');
														$('.p5-portfolio-list')
																.children(
																		'span[category-id='
																				+ '개발'
																				+ ']')
																.css('display',
																		'inline-block');
														makeNoPortfolioComponent($(
																'.p5-portfolio-list')
																.children(
																		'span[category-id=1]').length);
													}
													break;
												case "웹"://웹
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="웹"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="웹"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="웹"]').length);
													break;
												case "애플리케이션"://애플리케이션
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="애플리케이션"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="애플리케이션"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="애플리케이션"]').length);
													break;
												case "워드프레스"://워드프레스
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="워드프레스"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="워드프레스"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="워드프레스"]').length);
													break;
												case "퍼블리싱"://퍼블리싱
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="퍼블리싱"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="퍼블리싱"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="퍼블리싱"]').length);
													break;
												case "일반소프트웨어"://일반소프트웨어
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="일반소프트웨어"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="일반소프트웨어"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="일반소프트웨어"]').length);
													break;
												case "커머스_쇼핑몰"://커머스, 쇼핑몰
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="커머스_쇼핑몰"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="커머스_쇼핑몰"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="커머스_쇼핑몰"]').length);
													break;
												case "게임"://게임
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="게임"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="게임"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="게임"]').length);
													break;
												case "임베디드"://임베디드
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="임베디드"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="임베디드"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="임베디드"]').length);
													break;
												case "기타"://기타
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="기타"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="기타"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="기타"]').length);
													break;
												case "웹"://웹
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="웹"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="웹"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="웹"]').length);
													break;
												case "애플리케이션"://애플리케이션
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="애플리케이션"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="애플리케이션"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="애플리케이션"]').length);
													break;
												case "제품"://제품
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="제품"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="제품"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="제품"]').length);
													break;
												case "프레젠테이션"://프레젠테이션
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="프레젠테이션"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="프레젠테이션"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="프레젠테이션"]').length);
													break;
												case "인쇄물"://인쇄물
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="인쇄물"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="인쇄물"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="인쇄물"]').length);
													break;
												case "커머스_쇼핑몰"://커머스_쇼핑몰
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="커머스_쇼핑몰"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="커머스_쇼핑몰"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="커머스_쇼핑몰"]').length);
												case "로고"://로고
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="로고"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="로고"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="로고"]').length);
													break;
												case "그래픽"://그래픽
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="그래픽"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="그래픽"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="그래픽"]').length);
													break;
												case "영상"://영상
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="영상"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="영상"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="영상"]').length);
													break;
												case "게임"://게임
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="게임"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="게임"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="게임"]').length);
													break;
												case "기타"://기타
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id!="기타"]')
															.css('display',
																	'none');
													$('.p5-portfolio-list')
															.children(
																	'span[subcategory-id="기타"]')
															.css('display',
																	'inline-block');
													makeNoPortfolioComponent($(
															'.p5-portfolio-list')
															.children(
																	'span[subcategory-id="기타"]').length);
													break;
												default:
													$('.p5-portfolio-list')
															.children().css(
																	'display',
																	'none');
													break;
												}
												allignComponent('p5-portfolio-list');

											});

							function makeNoPortfolioComponent(length) {
								$('.p5-portfolio-list').children(
										'.p5-portfolio-no-img3').remove();
								if (length == 0) {
									temp = '<span class="p5-portfolio-no-img3">'
											+ '<div>'
											+ '<div>'
											+ "<div class='p5-no-partners-info-text'>등록된 <span class='p5-bold'>'포트폴리오'</span>가 없습니다.</div>"
											+ '</div>' + '</div>' + '</span>';

									$('.p5-portfolio-list').append(temp);

								}
							}

							function makeNavCategory(categoryType) {
								var temp = "";
								if (categoryType == "개발") {//개발
									temp = '<li category="전체보기"><a href="">전체보기</a></li>'
											+ '<li category=""웹""><a href="">웹</a></li>'
											+ '<li category=""애플리케이션""><a href="">애플리케이션</a></li>'
											+ '<li category="애플리케이션"><a href="">워드프레스</a></li>'
											+ '<li category="퍼블리싱"><a href="">퍼블리싱</a></li>'
											+ '<li category="일반소프트웨어"><a href="">일반 소프트웨어</a></li>'
											+ '<li category="커머스_쇼핑몰"><a href="">커머스,쇼핑몰</a></li>'
											+ '<li category="게임"><a href="">게임</a></li>'
											+ '<li category="임베디드"><a href="">임베디드</a></li>'
											+ '<li category="기타"><a href="">기타</a></li>';
								} else if (categoryType == "디자인") {//디자인
									temp = '<li category="전체보기"><a href="">전체보기</a></li>'
											+ '<li category="웹"><a href="">웹</a></li>'
											+ '<li category="애플리케이션"><a href="">애플리케이션</a></li>'
											+ '<li category="제품"><a href="">제품</a></li>'
											+ '<li category="프레젠테이션"><a href="">프레젠테이션</a></li>'
											+ '<li category="인쇄물"><a href="">인쇄물</a></li>'
											+ '<li category="커머스_쇼핑몰"><a href="">커머스, 쇼핑몰</a></li>'
											+ '<li category="로고"><a href="">로고</a></li>'
											+ '<li category="그래픽"><a href="">그래픽</a></li>'
											+ '<li category="영상"><a href="">영상</a></li>'
											+ '<li category="게임"><a href="">게임</a></li>'
											+ '<li category="기타"><a href="">기타</a></li>';
								}
								return temp;
							}

							function allignComponent(wrapperId) {
								var element = $('.' + wrapperId).children();
								var cnt = 1;
								for (var i = 0; i < $('.' + wrapperId)
										.children().length; i++) {

									if (element.eq(i).css('display') == 'inline-block'
											|| element.eq(i).css('display') == 'block') {

										if (cnt % 3 == 0) {
											element.eq(i).css('margin-right',
													'0px');
											element.eq(i).css('margin-bottom',
													'20px');
										} else {
											element.eq(i).css('margin-right',
													'24px');
											element.eq(i).css('margin-bottom',
													'20px');
										}
										cnt++;
									}

								}

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