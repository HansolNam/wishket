<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">

<title>외주몬(WJM) · 클라이언트 이용방법</title>
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
							<li class="active"><a href="/wjm/client-use/">클라이언트 이용방법</a></li>
							<li class=""><a href="/wjm/partners-use/">파트너스 이용방법</a></li>
							<li class=""><a href="/wjm/service-fee/">이용요금</a></li>
							<li class=" "><a href="/wjm/faq/">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px">
						<section>
							<h3 class="p5-header-title">클라이언트 이용방법</h3>
						</section>
						<section>
							<img class="p5-clientUsage-title-img"
								src="${pageContext.request.contextPath}/resources/static/img/intro/intro_client_title.png" />
						</section>
						<section style="background-color: #f7f7f7">
							<div class="p5-clientUsage-nav">
								<a href="#p5-clientUsage-step-1"><div
										class="p5-clientUsage-hover-one"></div></a>
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-2"><div
										class="p5-clientUsage-hover-two"></div></a>
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-3"><div
										class="p5-clientUsage-hover-three"></div></a>
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-4"><div
										class="p5-clientUsage-hover-four"></div></a>
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-5"><div
										class="p5-clientUsage-hover-five"></div></a>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-1">
								<h5 class="p5-clientUsage-step-title">
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_one.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 23px;">프로젝트 등록</span><img
										src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">
										간단하게 프로젝트 내용을 등록하면,<br /> 수많은 지원자들의 견적과 지원 내용을 빠르게 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 등록은 무료입니다.<br /> · 24시간 안에 평균 5개의 견적을 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_client_screenshot_one.png" />
									</div>
									<div class="p5-clientUsage-step-info">
										<div class="p5-clientUsage-step-info-line">- 프로젝트는 내부 검수
											후에 등록되며, 최대 12시간이 소요됩니다. (영업시간 기준)</div>
										<div class="p5-clientUsage-step-info-line">- 작성 중 임시 저장도
											가능합니다.</div>
										<div class="p5-clientUsage-step-info-line">- 검수 중인 프로젝트는
											[검수 중] 탭에서 확인할 수 있습니다.</div>
									</div>
									<div class="p5-clientUsage-step-info-support">
										<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_plus.png" />
										<div class="p5-clientUsage-step-info-line">프로젝트 내용을 작성
											하는 것이 어렵다면, 고객센터(02-6925-4849)로 연락주세요.</div>
										<div class="p5-clientUsage-step-info-line">담당매니저가 친절하게
											상담해드립니다.</div>
									</div>
									<div class="text-center p5-clientUsage-step-btn">
										<a class="btn btn-primary btn-lg" href="/wjm/project/add/detail/">무료로
											프로젝트 등록하기</a>
									</div>
								</div>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-2">
								<h5 class="p5-clientUsage-step-title">
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_two.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">지원자 비교, 선택</span><img
										src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">다양한 지원자들의 견적과
										포트폴리오, 지원 내역 등을 한눈에 비교할 수 있습니다.</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 견적과 지원 내용<br /> · 24시간 안에 평균 5개의 견적을 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_client_screenshot_two.png" />
									</div>
									<div class="p5-clientUsage-step-info">
										<div class="p5-clientUsage-step-info-line">- 각종 필터와 숨기기
											기능을 통해 지원자를 효율적으로 비교할 수 있습니다.</div>
										<div class="p5-clientUsage-step-info-line">- 미팅 신청은 최대
											2명까지 가능합니다.</div>
										<div class="p5-clientUsage-step-info-line">- 마음에 드는 지원자를
											선택하면, 위시켓 팀에서 미팅을 주선해드립니다.</div>
										<div class="p5-clientUsage-step-info-line">- 프로젝트의 지원자는
											[지원자 모집 중] 탭에서 확인할 수 있습니다.</div>
									</div>
								</div>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-3">
								<h5 class="p5-clientUsage-step-title">
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_three.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">미팅 및 계약</span><img
										src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">
										온/오프라인 미팅을 통해 마음에 드는 지원자를 선택할 수 있습니다.<br /> 위시켓 팀에서 미팅 주선에서
										계약까지 전 과정을 도와드립니다.
									</div>
									<div class="p5-clientUsage-step-subText">
										· 미팅을 통한 확실한 지원자 검증<br /> · 에스크로 형태의 대금 보호 시스템을 통한 안전한 계약
									</div>
									<div class="p5-clientUsage-step-info">
										<div class="p5-clientUsage-step-info-line">- 미팅은 온라인
											미팅(skype, 카카오톡 등) / 오프라인 대면 미팅이 가능합니다.</div>
										<div class="p5-clientUsage-step-info-line">- 계약서 작성,
											비용처리 등 부가적인 작업은 위시켓 팀에서 진행합니다.</div>
										<div class="p5-clientUsage-step-info-line">- 에스크로 형태로
											계약하게 되며, 단위에 따라 대금 분할 입금도 가능합니다.</div>
									</div>
								</div>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-4">
								<h5 class="p5-clientUsage-step-title">
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_four.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">프로젝트 진행</span><img
										src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">프로젝트 진행 중에도
										위시켓이 함께합니다.</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 진행 중에도 위시켓 팀이 커뮤니케이션을 함께 합니다.<br /> · 분쟁 발생 시, 1억 원 이하
										내용에 대하여 중재비용을 전액 지원합니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_client_screenshot_four.png" />
									</div>
									<div class="p5-clientUsage-step-info">
										<div class="p5-clientUsage-step-info-line">- 프로젝트 대금을 입금
											해주시면 프로젝트가 시작됩니다.</div>
										<div class="p5-clientUsage-step-info-line">- 선입금한 프로젝트
											대금은 프로젝트의 완료 시점에 클라이언트의 승인 후에 파트너에게 지급됩니다.</div>
										<div class="p5-clientUsage-step-info-line">
											- 위시켓 팀이 프로젝트 진행상에서 발생하는 어려움들을 도와드리며, 분쟁 발생 시, 대한상사중재원을<br />
											<span style="margin-left: 9px;"></span>통해 분쟁을 해결해드립니다.
										</div>
									</div>
								</div>
							</div>
						</section>
						<section>
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-5">
								<h5 class="p5-clientUsage-step-title">
									<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_five.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 11px;">프로젝트 완료</span><img
										src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">클라이언트와 파트너의 승인
										후에 프로젝트가 완료되며, 상호간의 만족도 평가를 합니다.</div>
									<div class="p5-clientUsage-step-img">
										<img src="${pageContext.request.contextPath}/resources/static/img/intro/intro_client_screenshot_five.png" />
									</div>
									<div class="p5-clientUsage-step-info">
										<div class="p5-clientUsage-step-info-line">- 프로젝트 완료 후에,
											프로젝트 대금이 파트너에게 전달됩니다.</div>
										<div class="p5-clientUsage-step-info-line">
											- 프로젝트를 진행했던 파트너를 5가지 항목(전문성, 결과물 만족도, 의사소통, 일정 준수, 적극성)으로<br />
											<span style="margin-left: 9px;"></span> 평가할 수 있습니다.
										</div>
										<div class="p5-clientUsage-step-info-line">- 평가는 다른
											클라이언트들이 파트너를 선택하는데 큰 도움이 됩니다.</div>
										<div class="p5-clientUsage-step-info-line">- 평가는 [종료된
											프로젝트] 탭에서 입력할 수 있습니다.</div>
									</div>
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