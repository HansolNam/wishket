<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<meta content="http://www.wishket.com${pageContext.request.contextPath}/resources/static/img/wishket_logo_256.png"
	property="og:image" />
<meta
	content="위시켓은 기업의 프로젝트와 개발자 &amp; 디자이너를 연결해주는 온라인 아웃소싱 서비스 입니다.
더 이상 지인을 수소문하지 마세요, 위시켓에서 3시간이면 충분합니다."
	property="og:description" />
<meta content="k6UITCIVaYG0YtRsN8g4GF2T4qg7Z3M6JD2mLJte_n4"
	name="google-site-verification" />
<meta content="d2c8672ef81fcd9ceb62f51232d13aada8512a64"
	name="naver-site-verification" />
<title>위시켓(Wishket) · 프로젝트 - ㅁㅁㅁ</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
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
<body class="logged-in client project-preview">
	<div id="fb-root"></div>
	<script src="${pageContext.request.contextPath}/resources/static/django_facebook/js/facebook.js"
		type="text/javascript"></script>
	<script>
    facebookAppId = '593258114025512';
    facebookDefaultScope = ["email", "user_about_me", "user_birthday", "user_website"];
    staticUrl = '${pageContext.request.contextPath}/resources/static/';
    function facebookJSLoaded(){
        FB.init({appId: facebookAppId, status: false, cookie: true, xfbml: true, oauth: true});
    }
    window.fbAsyncInit = facebookJSLoaded;
    F = new facebookClass(facebookAppId);
    F.load();
</script>
	<div id="wrap">
		<header class="header">
			<section class="nav-main navbar" role="navigation"
				style="background-color: #2d3a45;">
				<div class="container"
					style="background-color: #2d3a45; color: #fff;">
					<div class="nav-inner"
						style="background-color: #2d3a45; color: #fff;">
						<div class="navbar-header " style="color: #fff">
							<a class="navbar-brand" href="/mywishket/">Wishket</a>
						</div>
						<nav>
							<ul class="nav navbar-nav nav-primary">
								<li class="" style="color: #fff"><a href="/project/add/"
									style="color: #fff">프로젝트 등록</a></li>
								<li class="" style="color: #fff"><a href="/project/"
									style="color: #fff">프로젝트 찾기</a></li>
								<li class="" style="color: #fff"><a href="/partners/"
									style="color: #fff">파트너스 목록</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right nav-secondary">
								<li class="help"><a
									class="nav-help pull-left how_to_use_button"
									href="/client-use/"><i class="fa fa-question-circle fa-lg "></i></a></li>
								<li class="notification"><a
									class="nav-notification how_to_use_button"
									href="/accounts/notifications/"><i
										class="fa fa-bell fa-lg "></i><span
										class="badge badge-notification">1</span></a></li>
								<li class="dropdown"><a
									class="dropdown-toggle how_to_use_button"
									data-toggle="dropdown" href="#">gksthf1611님 <b
										class="fa fa-caret-down"></b></a>
								<ul class="dropdown-menu">
										<li><a href="/client/info/" tabindex="-1">클라이언트 정보 관리</a></li>
										<li><a href="/accounts/settings/profile/" tabindex="-1">계정
												설정</a></li>
										<li class="divider"></li>
										<li class="dropdown_li"><a class="dropdown_li"
											href="/accounts/logout/" tabindex="-1">로그아웃</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
			</section>
			<section class="nav-sub"
				style="box-shadow: 1px 1px #bdc4cc; background-color: #dadee2;">
				<div class="container">
					<div class="nav-inner">
						<nav>
							<ul class="nav navbar-nav">
								<li class=""><a href="/client/manage/project/submitted/"
									style="color: #333; font-weight: 500 !important;">검수 중</a></li>
								<li class=""><a href="/client/manage/recruiting/"
									style="color: #333; font-weight: 500 !important;">지원자 모집 중</a></li>
								<li class=""><a href="/client/manage/contract-in-progress/"
									style="color: #333; font-weight: 500 !important;">진행 중인
										프로젝트</a></li>
								<li class=""><a href="/client/manage/past/review-contract/"
									style="color: #333; font-weight: 500 !important;">종료된 프로젝트</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</section>
		</header>
		<div class="container">
			<div id="messages">
				<div class="alert alert-safe alert-preview alert-warning fade in">
					<p>
						<i class="fa fa-exclamation-circle icon-highlight"></i> <strong
							class="text-highlight">검수 중인 프로젝트</strong> 화면입니다.<br />검수에는 최대
						24시간이 소요됩니다. 검수가 완료되면, 지원자 모집이 시작됩니다. 관련 문의는 고객센터를 이용해 주세요.
					</p>
				</div>
			</div>
		</div>
		<div class="page">
			<div class="content">
				<p class="back">
					<a href="/client/manage/project/submitted/">[검수중]으로 가기 <i
						class="fa fa-arrow-circle-o-right"></i></a>
				</p>
				<div class="content-inner">
					<div class="header-text project-detail-header">
						ㅁㅁㅁ <span class="label label-sm label-reviewing">검수 중</span> <span
							class="applicant-count">총 <span class="applicant-num">0명</span>
							지원
						</span>
					</div>
					<div class="project-detail-category">개발 &gt; 웹</div>
					<div class="summary">
						<div class="project-detail-basic-info">
							<div class="budget">
								<i class="fa fa-krw"></i> <span class="title">예상금액</span> 123원
							</div>
							<div class="term">
								<i class="fa fa-clock-o"></i> <span class="title">예상기간</span>
								123일
							</div>
							<div class="deadline">
								<i class="fa fa-pencil"></i> <span class="title">모집마감</span>
								2015년 9월 16일
							</div>
						</div>
						<div class="project-detail-meta-info">
							<div class="project-data-box">
								<div class="title one">기획 상태</div>
								<div class="data d-one">아이디어 단계</div>
								<div class="title two">매니징 경험</div>
								<div class="data d-two">없음</div>
								<div class="title three">등록 일자</div>
								<div class="data d-three">2015년 9월 15일</div>
							</div>
							<div class="project-data-box bottom-box">
								<div class="title one">예상 시작일</div>
								<div class="data d-one">2015년 9월 16일</div>
								<div class="title two">미팅 방식</div>
								<div class="data d-two">오프라인 미팅</div>
								<div class="title three">진행 지역</div>
								<div class="data d-three">서울특별시 &gt; 강남구</div>
							</div>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 내용</div>
							<p></p>
							<p></p>
							<p>
								&lt;프로젝트 진행 방식&gt; <br />예시) 시작시점에 미팅, 주 1회 미팅 등
							</p>
							<br />
							<p>
								&lt;프로젝트의 현재 상황&gt;<br />예시) 현재 준비상황, 디자인 여부, PM 여부, 진행 계획 등
							</p>
							<br />
							<p>
								&lt;상세한 업무 내용&gt;<br />예시) 사이트의 용도, 주요 기능 List, 작업 분량, 필요한 조건 등
							</p>
							<br />
							<p>
								&lt;참고자료 / 유의사항&gt;<br />예시) 참고사이트, 기타 유의사항 등
							</p>
							<p></p>
							<p></p>
						</div>
						<div class="project-skill-required">
							<div class="skill-required-title">관련 기술</div>
							<span class="project-skill label-skill">ㅁㅁㅁ</span>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<span
						class="btn btn-large btn-warning btn-block btn-disabled btn-project-application"
						disabled="">프로젝트 검수 중</span>
					<div class="client-info-box">
						<h3 class="client-name-tag-heading">클라이언트</h3>
						<div class="client-name-tag-body">
							<img alt="gksthf1611 사진" class="client-img-lg"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<div class="client-company-info">ㅎㅎㅎ</div>
							<div class="client-evaluation-body"
								onclick="expand_rating(this);">
								<div class="rating star-md star-md-0"></div>
								<div class="rating-body">
									<span class="averageScore">0.0</span> <span
										class="averageScore-body">/ 평가 0개</span>
									<div class="rating-expand-arrow">
										<span class="fa fa-sort-asc" id="rating-arrow"></span>
									</div>
								</div>
							</div>
							<div class="expanded-rating" id="expanded-rating"
								style="display: none">
								<div class="rating-row">
									<span class="expanded-rating-title">전문성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score">0.0</span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">일정 준수</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score">0.0</span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">사전 준비</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score">0.0</span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">적극성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score">0.0</span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">의사소통</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score">0.0</span>
								</div>
							</div>
							<div class="client-history-body">
								<div class="project">
									<div class="history-body-title">프로젝트 등록</div>
									<div class="pull-right history-body-data">1 건</div>
								</div>
								<div class="contract">
									<div class="contract-title">
										<div class="history-body-title">계약한 프로젝트</div>
										<div class="pull-right history-body-data">0 건</div>
									</div>
									<div class="contract-data">
										<div class="contract-data-box">
											<div class="history-body-title">계약률</div>
											<div class="pull-right history-body-data">0%</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">진행중인 프로젝트</div>
											<div class="pull-right history-body-data">0 건</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">완료한 프로젝트</div>
											<div class="pull-right history-body-data">0 건</div>
										</div>
									</div>
								</div>
							</div>
							<div class="client-history-budget-body">
								<div class="budget-body-title">누적 완료 금액</div>
								<div class="pull-right budget-body-data">
									0 <span class="budget-body-clo">원</span>
								</div>
							</div>
						</div>
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
						src="${pageContext.request.contextPath}/resources/static/img/wishket_footer_logo.svg" />
				</div>
				<div class="contact">
					<i class="fa fa-phone"></i> <a href="tel:82269254849">02-6925-4849</a><br />
					<i class="fa fa-envelope"></i> <a href="mailto:help@wishket.com">help@wishket.com</a><br />
					<img src="${pageContext.request.contextPath}/resources/static/img/yellow_id.png" style="margin-right: 4px;" /><a
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
        ga('set', '&uid', '28154');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'client',
          'dimension3': '28154',
          'dimension4': dimension4Value
        });
      </script>
	<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
mixpanel.init("c7b742deb9d00b4f1c0e1e9e8c5c3115");</script>
	<script type="text/javascript">
      mixpanel.track("View project")
    </script>
	<script type="text/javascript">
      mixpanel.people.set({
        "$email": "gksthf1611@gmail.com"
      });
      mixpanel.identify("28154");
    </script>
	<script type="text/javascript"> if (!wcs_add) var wcs_add={}; wcs_add["wa"] = "s_3225afd5bb50";if (!_nasa) var _nasa={};wcs.inflow();wcs_do(_nasa);</script>
</body>
</html>