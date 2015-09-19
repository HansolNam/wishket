<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	if(account == null) response.sendRedirect("/wjm/accounts/login");
	
	String type = account.getAccount_type();
	%>
<html
	class=" modern js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"
	lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">

<title>외주몬(WJM) · 프로젝트 등록 완료</title>
<script async="" src="//connect.facebook.net/en_US/fp.js"></script>
<script type="text/javascript" async=""
	src="http://cdn.mxpnl.com/libs/mixpanel-2.2.min.js"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css">
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet">
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet">
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="icon" type="image/x-icon">
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png" rel="apple-touch-icon"
	sizes="76x76">
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png" rel="apple-touch-icon"
	sizes="120x120">
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152">
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
<style type="text/css"></style>

</head>
<body class="logged-in client project-add-complete">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 완료 <small class="small-text">프로젝트를 등록해 주셔서 감사합니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<section class="project-add-complete-content">
						<div class="project-add-complete-content-inner">
							<h3>프로젝트를 등록해주셔서 감사합니다.</h3>
							<p>내부 검수 후에 지원자 모집이 시작됩니다.</p>
							<p>검수에는 최대 24시간이 소요됩니다.</p>
							<p>
								<a class="btn btn-default btn-lg" href="/wjm/mywjm/<%=type%>">마이위시켓으로
									가기</a>
							</p>
							<hr>
							<p>
								<i class="fa fa-exclamation-circle"></i> 검수 결과는 이메일과 SMS를 통해
								안내드립니다.
							</p>
							<p>
								<i class="fa fa-exclamation-circle"></i> 검수에 대한 문의는 <strong>고객센터
									(02-6925-4849)</strong>를 이용해 주세요.
							</p>
						</div>
					</section>
					<aside class="project-add-complete-aside">
						<img alt="프로젝트를 등록해주셔서 감사합니다" class="aside-img"
							src="${pageContext.request.contextPath}/resources/static/img/project_add_thank_you.png">
					</aside>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
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