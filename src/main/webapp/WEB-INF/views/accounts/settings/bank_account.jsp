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
<title>위시켓(Wishket) · 계좌 관리</title>
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
<link href="/static/css/floating.css" rel="stylesheet" />
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
<body class="logged-in client account-setting">
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
		<section class="nav-main navbar" role="navigation"
			style="background-color: #2d3a45;">
		<div class="container" style="background-color: #2d3a45; color: #fff;">
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
						class="nav-help pull-left how_to_use_button" href="/client-use/"><i
							class="fa fa-question-circle fa-lg "></i></a></li>
					<li class="notification"><a
						class="nav-notification how_to_use_button"
						href="/accounts/notifications/"><i class="fa fa-bell fa-lg "></i></a></li>
					<li class="dropdown"><a
						class="dropdown-toggle how_to_use_button" data-toggle="dropdown"
						href="#">gksthf16111님 <b class="fa fa-caret-down"></b></a>
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
						style="color: #333; font-weight: 500 !important;">진행 중인 프로젝트</a></li>
					<li class=""><a href="/client/manage/past/review-contract/"
						style="color: #333; font-weight: 500 !important;">종료된 프로젝트</a></li>
				</ul>
				</nav>
			</div>
		</div>
		</section></header>
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="gksthf16111 사진" class="img-circle user-img"
								src="/static/img/default_avatar.jpg" />
							<h4 class="username">gksthf16111</h4>
							<a class="profile-setting" href="/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a class="active"
								href="/accounts/settings/profile/">기본 정보 수정</a></li>
							<li class=""><a href="/accounts/settings/verify_identity/">신원
									인증</a></li>
							<li class=" active "><a
								href="/accounts/settings/bank_account/">계좌 관리</a></li>
							<li class=""><a href="/accounts/settings/relogin/">비밀번호
									변경</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							계좌 관리 <small class="small-text">프로젝트 대금을 지급받을 계좌 정보를
								등록해주세요.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="/static/img/process-guide-warning.png" />
							<p class="process-guide-title-text">
								<strong>[ 계좌 관리 가이드 ]</strong><br /> 프로젝트 대금의 안전한 송금을 위해 <strong>정확한
									계좌번호</strong>가 필요합니다.
							</p>
						</div>
						<h4 id="sub_title">계좌 등록</h4>
						<form class="form-horizontal" enctype="multipart/form-data"
							id="edit_bank_form" method="POST" style="margin-top: 25px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><span
								class="help-block"></span>
							<div class="form-group ">
								<label class="control-label required" for="id_bank"><span>*</span>
									은행명</label>
								<div class="control-wrapper">
									<select class="form-control" id="id_bank" name="bank"
										required="required"><option value="">은행 선택</option>
										<option value="1">한국산업은행</option>
										<option value="2">기업은행</option>
										<option value="3">국민은행</option>
										<option value="4">우리은행</option>
										<option value="5">신한은행</option>
										<option value="6">하나은행</option>
										<option value="7">농협</option>
										<option value="8">단위농협</option>
										<option value="9">SC은행</option>
										<option value="10">외환은행</option>
										<option value="11">한국씨티은행</option>
										<option value="12">우체국</option>
										<option value="13">경남은행</option>
										<option value="14">광주은행</option>
										<option value="15">대구은행</option>
										<option value="16">도이치</option>
										<option value="17">부산은행</option>
										<option value="18">산림조합</option>
										<option value="19">산업은행</option>
										<option value="20">상호저축은행</option>
										<option value="21">새마을금고</option>
										<option value="22">수협</option>
										<option value="23">신협중앙회</option>
										<option value="24">전북은행</option>
										<option value="25">제주은행</option>
										<option value="26">BOA</option>
										<option value="27">HSBC</option>
										<option value="28">JP모간</option>
										<option value="29">교보증권</option>
										<option value="30">대신증권</option>
										<option value="31">대우증권</option>
										<option value="32">동부증권</option>
										<option value="33">동양증권</option>
										<option value="34">메리츠증권</option>
										<option value="35">미래에셋</option>
										<option value="36">부국증권</option>
										<option value="37">삼성증권</option>
										<option value="38">솔로몬투자증권</option>
										<option value="39">신영증권</option>
										<option value="40">신한금융투자</option>
										<option value="41">우리투자증권</option>
										<option value="42">유진투자은행</option>
										<option value="43">이트레이드증권</option>
										<option value="44">키움증권</option>
										<option value="45">하나대투</option>
										<option value="46">하이투자</option>
										<option value="47">한국투자</option>
										<option value="48">한화증권</option>
										<option value="49">현대증권</option>
										<option value="50">HMC증권</option>
										<option value="51">LIG투자증권</option>
										<option value="52">NH증권</option>
										<option value="53">SK증권</option>
										<option value="54">비엔비파리바은행</option></select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="id_account_holder"><span>*</span>
									예금주</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_account_holder"
										name="account_holder" required="required" type="text" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="id_account_number"><span>*</span>
									계좌번호</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_account_number"
										name="account_number" required="required" type="text" /><span
										class="help-block">'-'를 제외하고 입력해주세요.</span>
								</div>
							</div>
							<input id="id_owner" name="owner" type="hidden" value="28155" />
							<div class="form-group">
								<div style="float: right; margin-top: 15px; margin-right: 10px;">
									<input class="btn btn-client" id="bank_account_submit_btn"
										type="submit" value="등록하기" />
								</div>
							</div>
						</form>
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
    $(document).ready(function(){
        
    });

    var bank_id = $('#id_bank').val();
    function show_form(){
        $('#edit_bank_form').css('display', 'block');
        $('#show_bank_form').css('display', 'none');
        $('#cancel_edit').css('display', 'block');
        $('#do_edit').css('display', 'none');
        $('#bank_account_submit_btn').val('수정하기');
    }
    function cancel_edit(){
        $('#edit_bank_form').css('display', 'none');
        $('#show_bank_form').css('display', 'block');
        $('#cancel_edit').css('display', 'none');
        $('#do_edit').css('display', 'block');
        $('#id_bank').val(bank_id);
        $('#id_account_holder').val('');
        $('#id_account_number').val('');
    }
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
        ga('set', '&uid', '28155');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'client',
          'dimension3': '28155',
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