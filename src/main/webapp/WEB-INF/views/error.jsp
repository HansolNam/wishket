<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ko" class="no-js modern">
<!--<![endif]-->
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>외주몬(WJM) &middot; 페이지를 찾을 수 없습니다.</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	type="text/css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	type="text/css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	type="text/css" />

<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/floating.css" />


<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>




<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/static/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png">




<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"></script>

<div id="fb-root"></div>
<!--Some facebook code requires the fb-root div -->
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


</head>

<body class="logged-in partners error">


	<div id="wrap">
	<jsp:include page="header.jsp" flush="false" />

		<div class="container">
			<div id="messages"></div>
		</div>


		<div class="page">
			<div class="content">



				<div class="content-header">
					<h3 class="header-text">
						404 에러 <small class="small-text"> 존재하지 않는 페이지입니다. </small>
					</h3>
				</div>


				<div class="content-inner">

					<section class="error-body">
						<div class="error-text">
							<h1>페이지를 찾을 수 없습니다.</h1>

							<p>죄송합니다. 요청하신 주소의 페이지를 찾을 수 없습니다.</p>

							<p>
								<a class="btn btn-primary btn-large"
									onclick="javascript:history.go(-1);">이전 화면으로 돌아가기</a> <a
									class="btn btn-primary btn-large" href="/wjm">초기 화면으로 돌아가기</a>
							</p>
						</div>
					</section>
					<aside class="error-aside">

						<img class="aside-img" src="${pageContext.request.contextPath}/resources/static/img/404.png"
							alt="404 페이지를 찾을 수 없습니다." />

					</aside>

				</div>


			</div>
		</div>

		<div id="push"></div>
	</div>
	<jsp:include page="footer.jsp" flush="false" />


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

</body>
</html>