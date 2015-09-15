<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>위시켓(Wishket) · 마이위시켓</title>
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
<body class="logged-in partners mywishket">
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
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						마이위시켓 <small class="small-text"><a href="/partners-use/">처음
								오셨나요? 이용방법을 확인하세요 <i class="fa fa-chevron-right"></i>
						</a></small>
					</h3>
				</div>
				<div class="content-inner">
					<div class="notice">
						<h4 class="notice-heading">공지사항</h4>
						<ul class="notice-list list-unstyled">
							<li><span class="label label-notice">새소식</span> <a
								href="http://goo.gl/1DCKCs" target="_blank">[업데이트] 파트너 프로필
									페이지 리뉴얼 - 평가 및 데이터 차트화</a> <span class="notice-date">2015.
									08. 20</span></li>
							<li><span class="label label-notice">새소식</span> <a
								href="http://bit.ly/1He8Lgm" target="_blank">클라이언트를 사로잡는 지원서
									작성 가이드</a> <span class="notice-date">2015. 06. 24</span></li>
							<li><a
								href="http://blog.wishket.com/프리랜서들이-협상-중에-가장-많이-저지르는-실수-5가/"
								target="_blank">프리랜서들이 협상 중에 많이 저지르는 실수 5가지</a> <span
								class="notice-date">2015. 01. 09</span></li>
						</ul>
					</div>
					<div class="mywishket-project">
						<h4 class="mywishket-project-heading">내 프로젝트</h4>
						<div class="interest-project">
							<h5 class="proposal-project-heading">
								<a href="/partners/manage/interest/">관심 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="interest-project-title">프로젝트 제목</th>
										<th class="interest-project-budget">예상금액</th>
										<th class="interest-project-term">예상기간</th>
										<th class="interest-created-date">마감일자</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-muted" colspan="5">관심 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/partners/manage/interest/">더 자세히 보기 <i
									class="fa fa-chevron-right"></i></a>
							</p>
						</div>
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="/partners/manage/proposal/counselling/">지원한 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="proposal-project-title">프로젝트 제목</th>
										<th class="proposal-project-budget">지원비용</th>
										<th class="proposal-project-term">기간</th>
										<th class="proposal-created-date">제출일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-muted" colspan="4">지원 중인 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/partners/manage/proposal/counselling/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
						<div class="contract-project">
							<h5 class="contract-project-heading">
								<a href="/partners/manage/contract-in-progress/">진행 중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="contract-project-title">프로젝트 제목</th>
										<th class="contract-project-client">클라이언트</th>
										<th class="contract-project-budget">비용</th>
										<th class="contract-project-term">남은기간/기간</th>
										<th class="contract-status">상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-muted" colspan="6">진행 중인 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/partners/manage/contract-in-progress/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">파트너스</h3>
						<div class="user-name-tag-body">
							<img alt="gksthf16112 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<h4 class="username">gksthf16112</h4>
							<a class="profile-setting" href="/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="partners-history">
						<h3 class="partners-history-heading">위시켓 히스토리</h3>
						<div class="partners-history-body">
							<table class="table table-responsive">
								<tbody>
									<tr>
										<th>지원한 프로젝트</th>
										<td>0 <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>계약한 프로젝트</th>
										<td>0 <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>완료한 프로젝트</th>
										<td>0 <span class="append-unit">건</span></td>
									</tr>
								</tbody>
							</table>
							<dl>
								<dt>누적 완료 금액</dt>
								<dd>
									0 <span class="append-unit">원</span>
								</dd>
							</dl>
						</div>
					</div>
					<div class="activity">
						<h3 class="activity-heading">새로운 소식</h3>
						<div id="activity-body">
							<ul class="activity-unit-list">
								<li class="empty-activity activity-unit">새로운 소식이 없습니다.</li>
							</ul>
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
				<li class="category-item"><a href="/client-use/">클라이언트 이용방법</a></li>
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
    $(function () {
      var $activityBody = $('#activity-body');
      $activityBody.slimScroll({
        height: '250px'
      });
    });
  </script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"
		rel="stylesheet" />
	<script>
    $(function() {
        if($(window).width() > 680){
            $( document ).tooltip({
              position: {
                my: "right+14 bottom-10",
                at: "right top",
                using: function( position, feedback ) {
                  $( this ).css( position );
                  $( "<div>" )
                    .addClass( feedback.vertical )
                    .addClass( feedback.horizontal )
                    .appendTo( this );
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
        ga('set', '&uid', '28338');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'partners',
          'dimension3': '28338',
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