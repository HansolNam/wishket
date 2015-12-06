<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">

<title>외주몬(WJM) · 요금 안내</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/p5.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/static/css/layout_nav.css" rel="stylesheet" />
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
<body class=" partners-setting">
	<div id="wrap">
		
		<jsp:include page="header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul class="how_to_sidebar">
							<li class=""><a href="/wjm/service-intro/">서비스 소개</a></li>
							<li class=""><a href="/wjm/client-use/">클라이언트 이용방법</a></li>
							<li class=""><a href="/wjm/partners-use/">파트너스 이용방법</a></li>
							<li class="active"><a href="/wjm/service-fee/">이용요금</a></li>
							<li class=" "><a href="/wjm/faq/">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px">
						<section>
							<h3 class="p5-header-title">이용요금</h3>
						</section>
						<section class="p5-chargeIntroduction-partition p5-faq-partition">
							<h4 class="p5-chargeIntroduction-title">
								<img class="p5-serviceIntroduction-title-img"
									src="${pageContext.request.contextPath}/resources/static/img/intro/bookmark.png" />이용요금 안내
							</h4>
							<table class="p5-chargeIntroduction-table">
								<tbody>
									<tr>
										<td class="p5-chargeIntroduction-header">클라이언트 이용요금</td>
										<td colspan="2">무료 (VAT 별도, 프로젝트 비용만 부담)</td>
									</tr>
									<tr>
										<td class="p5-chargeIntroduction-header" rowspan="2">파트너스
											이용요금</td>
										<td class="p5-chargeIntroduction-category">기업</td>
										<td>프로젝트 대금의 10%</td>
									</tr>
									<tr>
										<td class="p5-chargeIntroduction-category">개인</td>
										<td>프로젝트 대금의 10% (원천징수 3.3% 공제)</td>
									</tr>
								</tbody>
							</table>
							<div class="p5-clientUsage-step-info-charge">
								<div class="p5-clientUsage-step-info-line">- 위시켓 이용료는 실제로
									프로젝트를 진행하는 경우에만 발생합니다.</div>
								<div class="p5-clientUsage-step-info-line">- 프로젝트 등록 및 지원
									단계에서는 이용료가 발생하지 않습니다.</div>
								<div class="p5-clientUsage-step-info-line">- 사업자 등록증이 있는
									파트너와 개인 파트너 간에 세금으로 인한 수령금액 차이가 발생할 수 있습니다.</div>
								<div class="p5-clientUsage-step-info-line">- 위 이용요금은 추후에
									변경될 수 있습니다.</div>
							</div>
							<h5 class="p5-chargeIntroduction-example-title">
								<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_plus_sm.png"
									style="margin-right: 5px" />[예시] 프로젝트 금액이 100만원일 때
							</h5>
							<table class="p5-chargeIntroduction-table">
								<tbody>
									<tr>
										<td class="p5-chargeIntroduction-header">클라이언트의 결제금액</td>
										<td colspan="2">110만원 (100만원 + VAT 10%)</td>
									</tr>
									<tr>
										<td class="p5-chargeIntroduction-header" rowspan="2">파트너스의
											수령금액</td>
										<td class="p5-chargeIntroduction-category">기업</td>
										<td>99만원 (위시켓 수수료를 제한 프로젝트 금액 90만원 + VAT 10%)</td>
									</tr>
									<tr>
										<td class="p5-chargeIntroduction-category">개인</td>
										<td>87만원 (위시켓 수수료를 제한 프로젝트 금액 90만원 - 원천징수 3.3% 공제)</td>
									</tr>
								</tbody>
							</table>
						</section>
						<section>
							<h4 class="p5-chargeIntroduction-title">
								<img class="p5-serviceIntroduction-title-img"
									src="${pageContext.request.contextPath}/resources/static/img/intro/bookmark.png" />대금지급 관련 안내
							</h4>
							<h4 class="p5-chargeIntroduction-subinfo"
								style="margin-left: 22px">프로젝트가 완료되면 등록하신 은행계좌로 위시켓 이용료를
								제외한 대금이 지급됩니다.</h4>
							<div class="p5-chargeIntroduction-chargeinfo"
								style="margin-left: 22px">
								<div class="p5-chargeIntroduction-chargeinfo-wrapper">
									<h5 class="p5-chargeIntroduction-subcategory-title">1.
										개인사업자/법인사업자 파트너스</h5>
									<div class="p5-chargeIntroduction-subcategory-info">·
										지급받을 금액에 대한 세금계산서 발행이 필요합니다.</div>
									<div class="p5-chargeIntroduction-subcategory-info">·
										프로젝트 완료 승인 후, 24시간 이내에 지급됩니다.</div>
								</div>
								<div class="p5-chargeIntroduction-chargeinfo-wrapper">
									<h5 class="p5-chargeIntroduction-subcategory-title">2. 개인
										파트너스</h5>
									<div class="p5-chargeIntroduction-subcategory-info">·
										원천징수 3.3%를 제한 금액이 지급되며, 위시켓에서 세금신고를 대행해드립니다.</div>
									<div class="p5-chargeIntroduction-subcategory-info">·
										프로젝트 완료 승인 후, 24시간 이내에 지급됩니다.</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="footer.jsp" flush="false" />
	</body>
</html>