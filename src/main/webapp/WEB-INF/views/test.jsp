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
<title>위시켓(Wishket) · 회원가입</title>
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
<body class=" account signup">
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
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						회원가입 <small class="small-text">위시켓에 오신 것을 환영합니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<section class="signup-body">
						<form action="/accounts/signup/" autocomplete="off"
							class="form-horizontal" id="signup-form" method="post">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" />
							<div class="form-group signup-usage ">
								<label class="control-label required" for="id_usage"><span>*</span>이용목적</label>
								<div class="control-wrapper">
									<ul>
										<li><label for="id_usage_1"><div
													class="radio-no-selected one" id="radio-one"
													onclick="check_usage();">
													<input id="id_usage_1" name="usage" type="radio"
														value="client" /><label class="radio-inline"
														for="id_usage_1"><strong>클라이언트</strong><br />프로젝트를
														의뢰하고 싶습니다.</label>
												</div></label></li>
										<li><label for="id_usage_2"><div
													class="radio-no-selected two" id="radio-two"
													onclick="check_usage();">
													<input id="id_usage_2" name="usage" type="radio"
														value="partners" /><label class="radio-inline"
														for="id_usage_2"><strong>파트너스</strong><br />일거리를
														찾고 있습니다.</label>
												</div></label></li>
									</ul>
								</div>
							</div>
							<div class="form-group has-error">
								<label class="control-label required" for="id_email"><span>*</span>이메일</label>
								<div class="email-control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="id_email" maxlength="75" name="email" required="required"
										type="text" value="aaa" /><span class="help-block"><i
										class="fa fa-exclamation-circle"></i> 올바른 형식의 이메일을 입력해 주세요.</span>
								</div>
							</div>
							<div class="form-group has-error">
								<label class="control-label required" for="id_username"><span>*</span>아이디</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="id_username" name="username" required="required"
										type="text" value="aaa" /><span class="help-block"><i
										class="fa fa-exclamation-circle"></i> 6글자 이상 입력해 주세요. (입력하신
										내용은 3글자입니다.</span>
								</div>
							</div>
							<div class="form-group has-error">
								<label class="control-label required" for="id_password1"><span>*</span>비밀번호</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="id_password1" name="password1" required="required"
										type="password" /><span class="help-block"><i
										class="fa fa-exclamation-circle"></i> 8글자 이상 입력해 주세요. (입력하신
										내용은 1글자입니다.</span> <span class="help-block">비밀번호는 8자 이상 32자
										이하로 입력해 주세요.</span>
								</div>
							</div>
							<div class="form-group has-error">
								<label class="control-label required" for="id_password2"><span>*</span>비밀번호
									재입력</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="id_password2" name="password2" required="required"
										type="password" /><span class="help-block"><i
										class="fa fa-exclamation-circle"></i> 8글자 이상 입력해 주세요. (입력하신
										내용은 1글자입니다.</span> <span class="help-block">동일한 비밀번호를 입력해 주세요.</span>
								</div>
							</div>
							<div class="tos form-group has-error">
								<div class="checkbox-wrapper">
									<div class="checkbox" style="padding-top: 0 !important;">
										<label for="id_tos"><input class="required"
											id="id_tos" name="tos" type="checkbox" /><span><a
												href="/terms-of-service/">이용 약관</a> 및 <a href="/privacy/">개인
													정보 보호 방침</a>에 동의합니다.</span></label>
									</div>
									<span class="help-block"><i
										class="fa fa-exclamation-circle"></i> 이용약관 및 개인정보보호방침에 동의해주세요.</span>
								</div>
							</div>
							<div class="form-group">
								<div class="btn-wrapper">
									<input class="btn btn-block btn-wishket btn-lg account-btn"
										onclick="signup_clicked();" type="submit" value="회원가입" />
								</div>
							</div>
						</form>
					</section>
					<aside class="signup-aside">
						<form action="/facebook/connect/?facebook_login=1"
							class="form-horizontal signup-aside-facebook"
							id="facebook-connect-form" method="post">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
								name="register_next" type="hidden"
								value="/accounts/signup/facebook/" />
							<div class="form-group">
								<div class="btn-block-wrapper">
									<strong>페이스북 계정이 있으신가요?</strong> <a
										class="btn btn-facebook btn-lg btn-block" id="facebook_button"
										onclick="F.connect(this.parentNode.parentNode.parentNode);return false;"><i
										class="fa fa-facebook"></i> 페이스북으로 회원가입</a>
								</div>
							</div>
						</form>
						<p class="redirect-login">
							이미 회원이신가요? <a href="/accounts/login/">로그인</a>
						</p>
						<p class="aside-benefit-text">
							<strong class="strong-value">9,661</strong>개의 <strong>클라이언트
								기업</strong>과<br /> <strong class="strong-value">14,804</strong>개의 <strong>개발회사
								&amp; 프리랜서</strong>가<br /> 함께하는 온라인 아웃소싱 플랫폼 위시켓
						</p>
					</aside>
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
    $(function () {
        var wishketLanguage = {
    errorTitle : 'Form submission failed!',
    requiredFields : '필수 입력 항목입니다.',
    badTime : 'You have not given a correct time',
    badEmail : 'You have not given a correct e-mail address',
    badTelephone : 'You have not given a correct phone number',
    badSecurityAnswer : 'You have not given a correct answer to the security question',
    badDate : 'You have not given a correct date',
    tooLongStart : 'You have given an answer longer than ',
    tooLongEnd : ' characters',
    tooShortStart : 'You have given an answer shorter than ',
    tooShortEnd : ' characters',
    badLength : 'You have to give an answer between ',
    notConfirmed : 'Values could not be confirmed',
    badDomain : 'Incorrect domain value',
    badUrl : 'The answer you gave was not a correct URL',
    badCustomVal : 'You gave an incorrect answer',
    badInt : 'The answer you gave was not a correct number',
    badSecurityNumber : 'Your social security number was incorrect',
    badUKVatAnswer : 'Incorrect UK VAT Number',
    badStrength : 'The password isn\'t strong enough',
    badNumberOfSelectedOptionsStart : 'You have to choose at least ',
    badNumberOfSelectedOptionsEnd : ' answers',
    badAlphaNumeric : 'The answer you gave must contain only alphanumeric characters ',
    badAlphaNumericExtra: ' and ',
    wrongFileSize : 'The file you are trying to upload is too large',
    wrongFileType : 'The file you are trying to upload is of wrong type'
};

        $.validate({
            language: wishketLanguage,
            form: '#signup-form'
        })
    })
</script>
	<script>
    function check_usage(){
        var one_check = document.getElementById('id_usage_1');
        var one = document.getElementById('radio-one');
        var two_check = document.getElementById('id_usage_2');
        var two = document.getElementById('radio-two');

        if (one_check.checked === true){
            one.className = "radio-selected one";
        }
        else {
            one.className = "radio-no-selected one";
        }
        if (two_check.checked === true){
            two.className = "radio-selected two";
        }
        else {
            two.className = "radio-no-selected two";
        }
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