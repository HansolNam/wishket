<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!DOCTYPE html>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<meta content="Wishket Inc,." name="author" />
<meta
	content="위시켓은 기업의 프로젝트와 개발자 &amp; 디자이너를 연결해주는 온라인 아웃소싱 서비스 입니다.
더 이상 지인을 수소문하지 마세요, 위시켓에서 3시간이면 충분합니다."
	name="description" />
<meta content="593258114025512" property="fb:app_id" />
<meta content="website" property="og:type" />
<meta content="http://www.wishket.com" property="og:url" />
<meta content="Wishket" property="og:title" />
<meta content="http://www.wishket.com/static/img/wishket_logo_256.png"
	property="og:image" />
<meta
	content="위시켓은 기업의 프로젝트와 개발자 &amp; 디자이너를 연결해주는 온라인 아웃소싱 서비스 입니다.
더 이상 지인을 수소문하지 마세요, 위시켓에서 3시간이면 충분합니다."
	property="og:description" />
<meta content="k6UITCIVaYG0YtRsN8g4GF2T4qg7Z3M6JD2mLJte_n4"
	name="google-site-verification" />
<meta content="d2c8672ef81fcd9ceb62f51232d13aada8512a64"
	name="naver-site-verification" />
<title>위시켓(Wishket) · 클라이언트 이용방법</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
<link href="/static/css/p5.css" rel="stylesheet" />
<link href="/static/css/layout_nav.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="/static/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/static/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/static/touch-icon-ipad.png" rel="apple-touch-icon"
	sizes="76x76" />
<link href="/static/touch-icon-iphone-retina.png" rel="apple-touch-icon"
	sizes="120x120" />
<link href="/static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152" />
<script src="/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class=" partners-setting">
	<div id="fb-root"></div>
	<script src="/static/django_facebook/js/facebook.js"
		type="text/javascript"></script>
	<script>
    facebookAppId = '593258114025512';
    facebookDefaultScope = ["email", "user_about_me", "user_birthday", "user_website"];
    staticUrl = '/static/';
    function facebookJSLoaded(){
        FB.init({appId: facebookAppId, status: false, cookie: true, xfbml: true, oauth: true});
    }
    window.fbAsyncInit = facebookJSLoaded;
    F = new facebookClass(facebookAppId);
    F.load();
</script>
	<div id="wrap">
		<header class="header">
			<section class="nav-main nav-main-mini navbar" role="navigation"
				style="background-color: #2d3a45">
				<div class="container" style="background-color: #2d3a45">
					<div class="nav-inner" style="background-color: #2d3a45">
						<div class="navbar-header navbar-not-login"
							style="background-color: #2d3a45">
							<a class="navbar-brand" href="/">Wishket</a>
						</div>
						<nav>
							<ul class="nav navbar-nav nav-primary">
								<li><a href="/project/add/">프로젝트 등록</a></li>
								<li class=""><a href="/project/">프로젝트 찾기</a></li>
								<li class=""><a href="/partners/">파트너스 목록</a></li>
								<li><a href="/service-intro/">이용방법</a></li>
							</ul>
							<span class="navbar-nav navbar-right"><span class="w-help"><a
									href="/service-intro/"><i
										class="fa fa-question-circle fa-lg" style="color: #fff"></i></a></span> <span
								class="w-login"><a class="btn btn-login"
									href="/accounts/login/" style="color: #fff">로그인</a></span> <span
								class="w-signup"><a class="btn btn-signup"
									href="/accounts/signup/" style="color: #fff">회원가입</a></span></span>
						</nav>
					</div>
				</div>
			</section>
		</header>
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul class="how_to_sidebar">
							<li class=""><a href="/service-intro/">서비스 소개</a></li>
							<li class="active"><a href="/client-use/">클라이언트 이용방법</a></li>
							<li class=""><a href="/partners-use/">파트너스 이용방법</a></li>
							<li class=""><a href="/service-fee/">이용요금</a></li>
							<li class=" "><a href="/faq/">자주 묻는 질문</a></li>
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
								src="/static/img/intro/intro_client_title.png" />
						</section>
						<section style="background-color: #f7f7f7">
							<div class="p5-clientUsage-nav">
								<a href="#p5-clientUsage-step-1"><div
										class="p5-clientUsage-hover-one"></div></a>
								<div>
									<img src="/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-2"><div
										class="p5-clientUsage-hover-two"></div></a>
								<div>
									<img src="/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-3"><div
										class="p5-clientUsage-hover-three"></div></a>
								<div>
									<img src="/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-4"><div
										class="p5-clientUsage-hover-four"></div></a>
								<div>
									<img src="/static/img/intro/partners_intro_arrow.png" />
								</div>
								<a href="#p5-clientUsage-step-5"><div
										class="p5-clientUsage-hover-five"></div></a>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-1">
								<h5 class="p5-clientUsage-step-title">
									<img src="/static/img/intro/intro_one.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 23px;">프로젝트 등록</span><img
										src="/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">
										간단하게 프로젝트 내용을 등록하면,<br /> 수많은 지원자들의 견적과 지원 내용을 빠르게 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 등록은 무료입니다.<br /> · 24시간 안에 평균 5개의 견적을 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="/static/img/intro/intro_client_screenshot_one.png" />
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
										<img src="/static/img/intro/intro_plus.png" />
										<div class="p5-clientUsage-step-info-line">프로젝트 내용을 작성
											하는 것이 어렵다면, 고객센터(02-6925-4849)로 연락주세요.</div>
										<div class="p5-clientUsage-step-info-line">담당매니저가 친절하게
											상담해드립니다.</div>
									</div>
									<div class="text-center p5-clientUsage-step-btn">
										<a class="btn btn-primary btn-lg" href="/project/add/detail/">무료로
											프로젝트 등록하기</a>
									</div>
								</div>
							</div>
						</section>
						<section class="p5-clientUsage-partition">
							<div class="p5-clientUsage-step" id="p5-clientUsage-step-2">
								<h5 class="p5-clientUsage-step-title">
									<img src="/static/img/intro/intro_two.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">지원자 비교, 선택</span><img
										src="/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">다양한 지원자들의 견적과
										포트폴리오, 지원 내역 등을 한눈에 비교할 수 있습니다.</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 견적과 지원 내용<br /> · 24시간 안에 평균 5개의 견적을 받아볼 수 있습니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="/static/img/intro/intro_client_screenshot_two.png" />
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
									<img src="/static/img/intro/intro_three.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">미팅 및 계약</span><img
										src="/static/img/intro/slash_blue.png" />
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
									<img src="/static/img/intro/intro_four.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 10px;">프로젝트 진행</span><img
										src="/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">프로젝트 진행 중에도
										위시켓이 함께합니다.</div>
									<div class="p5-clientUsage-step-subText">
										· 프로젝트 진행 중에도 위시켓 팀이 커뮤니케이션을 함께 합니다.<br /> · 분쟁 발생 시, 1억 원 이하
										내용에 대하여 중재비용을 전액 지원합니다.
									</div>
									<div class="p5-clientUsage-step-img">
										<img src="/static/img/intro/intro_client_screenshot_four.png" />
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
									<img src="/static/img/intro/intro_five.png" /><span
										class="p5-clientUsage-step-title-text"
										style="margin-left: 11px;">프로젝트 완료</span><img
										src="/static/img/intro/slash_blue.png" />
								</h5>
								<div class="p5-clientUsage-step-content">
									<div class="p5-clientUsage-step-mainText">클라이언트와 파트너의 승인
										후에 프로젝트가 완료되며, 상호간의 만족도 평가를 합니다.</div>
									<div class="p5-clientUsage-step-img">
										<img src="/static/img/intro/intro_client_screenshot_five.png" />
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
	<footer class="footer">
		<div class="footer-inner">
			<div class="info">
				<div class="footer-logo">
					<img class="footer-logo-img"
						src="/static/img/wishket_footer_logo.svg" />
				</div>
				<div class="contact">
					<i class="fa fa-phone"></i> <a href="tel:82269254849">02-6925-4849</a><br />
					<i class="fa fa-envelope"></i> <a href="mailto:help@wishket.com">help@wishket.com</a><br />
					<img src="/static/img/yellow_id.png" style="margin-right: 4px;" /><a
						href="http://goto.kakao.com/@wishket">Kakao ID 친구추가: @wishket</a><br />
					고객센터 운영시간: 오전 10시부터 오후 6시까지<small>(공휴일 제외)</small>
				</div>
				<address class="address">
					서울특별시 강남구 테헤란로77길 11-18 창애빌딩 4층<br /> 사업자등록번호: 209-81-57303 / 대표이사:
					박우범<br />
				</address>
				<span class="copyright">© 2014 Wishket, inc.</span>
			</div>
			<div class="category">
				<h5 class="category-heading">위시켓</h5>
				<ul class="category-list">
					<li class="category-item"><a href="/service-intro/">서비스 소개</a></li>
					<li class="category-item"><a href="/client-use/">클라이언트
							이용방법</a></li>
					<li class="category-item"><a href="/partners-use/">파트너스
							이용방법</a></li>
					<li class="category-item"><a href="/service-fee/">이용요금</a></li>
					<li class="category-item"><a href="/faq">자주 묻는 질문</a></li>
				</ul>
			</div>
			<div class="category">
				<h5 class="category-heading">관련 정보</h5>
				<ul class="category-list">
					<li class="category-item"><a href="/company-intro/">회사소개</a></li>
					<li class="category-item"><a href="/terms-of-service/">이용약관</a></li>
					<li class="category-item"><a
						href="http://blog.wishket.com/category/media/">보도자료</a></li>
				</ul>
			</div>
			<div class="category">
				<h5 class="category-heading">관련 링크</h5>
				<ul class="category-list">
					<li class="category-item"><a
						href="http://www.facebook.com/wishket">페이스북</a></li>
					<li class="category-item"><a href="http://blog.wishket.com">블로그</a></li>
					<li class="category-item"><a href="http://twitter.com/wishket">트위터</a></li>
				</ul>
				<div class="mixpanel-banner">
					<a href="https://mixpanel.com/f/partner" target="_blank"><img
						alt="Mobile Analytics"
						src="//cdn.mxpnl.com/site_media/images/partner/badge_blue.png" /></a>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
  $(function() {
    wishket.init();
    
    svgeezy.init(false, 'png');
  });
</script>
	<script>

$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;


	if ( $( window ).width() >= 1200 ) {
		$( '.p5-side-nav-deactive' ).css( 'display', 'none' );
	} else  {
		$( '.p5-side-nav-active' ).css( 'display', 'none' );
		$( '.p5-side-nav-deactive' ).css( 'display', 'block');
	}

	$('.content-inner').on('click', '.p5-side-nav-active-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'none' );
		$('.p5-side-nav-deactive').css('display','block');
	});

	$('.content-inner').on('click', '.p5-side-nav-deactive-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'block' );
		$('.p5-side-nav-deactive').css('display','none');
	});


    $( window ).scroll ( function () {
		if ( $(window).scrollTop() > 87 && p5TotalSubNavigationFlag === 0) {
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').removeClass('hide fadeOut');
				$('#p5-total-sub-navigation-wrapper').addClass('fadeInDown');
			}, 200 );
			flag = 1;


		} else if ( $(window).scrollTop() <= 87 ){
			p5TotalSubNavigationFlag = 0;
			$('#p5-total-sub-navigation-wrapper').removeClass('fadeInDown');
			$('#p5-total-sub-navigation-wrapper').addClass('fadeOut');
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').addClass('hide');
			}, 200 );
		}
	});
});

</script>
	<script type="text/javascript">
        var TRS_AIDX = 9287;
        var TRS_PROTOCOL = document.location.protocol;
        document.writeln();
        var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
        document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
        </script>
	<script type="text/javascript">
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-31427125-2', 'wishket.com');
        var ga_now = new Date();
        var dimension4Value = "Y" + ga_now.getFullYear()
                              + "M" + (ga_now.getMonth()+1)
                              + "D" + (ga_now.getDate())
                              + "H" + (ga_now.getHours())
                              + "I" + (ga_now.getMinutes())
                              + "W" + (ga_now.getDay());
        ga('require', 'displayfeatures');
        ga('set', '&uid', 'None');
        ga('send', 'pageview', {
          'dimension1': 'anonymous',
          'dimension2': 'unknown',
          'dimension3': 'None',
          'dimension4': dimension4Value
        });
      </script>
	<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
mixpanel.init("c7b742deb9d00b4f1c0e1e9e8c5c3115");</script>
	<script type="text/javascript"> if (!wcs_add) var wcs_add={}; wcs_add["wa"] = "s_3225afd5bb50";if (!_nasa) var _nasa={};wcs.inflow();wcs_do(_nasa);</script>
</body>
</html>