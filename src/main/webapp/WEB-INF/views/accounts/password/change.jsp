<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator,com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	String id = "";
	
	id = account.getId();
	String profile = (String)request.getAttribute("profile");
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<title>외주몬(WJM) · 비밀번호 변경</title>
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
<body class="logged-in client account-setting">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=id %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="username"><%=id %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a class="active"
								href="/accounts/settings/profile/">기본 정보 수정</a></li>
							<li class=""><a href="/wjm/accounts/settings/verify_identity/">신원
									인증</a></li>
							<li class=""><a href="/wjm/accounts/settings/bank_account/">계좌
									관리</a></li>
							<li class="active"><a href="/wjm/accounts/settings/relogin/">비밀번호
									변경</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							비밀번호 변경 <small class="small-text">개인정보 보호를 위해 주기적으로 비밀번호를
								변경해주세요.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-warning.png" />
							<p class="process-guide-title-text">
								<strong>[ 비밀번호 변경 가이드 ]</strong><br /> 다른 사이트에서 사용하지 않는 <strong>고유한
									비밀번호</strong>를 사용하시고, 주기적으로 변경해주세요.
							</p>
						</div>
						<h4>비밀번호 변경</h4>
						<form action="/wjm/accounts/password/change" class="form-horizontal" method="POST"
							style="margin-top: 15px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group ">
								<label class="control-label required" for="id_new_password1"><span>*</span>새
									비밀번호:</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_new_password1"
										name="new_password1" required="required" type="password" /><span
										class="help-block">비밀번호는 8자 이상 32자 이하로 입력해 주세요.</span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="id_new_password2"><span>*</span>새
									비밀번호 확인:</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_new_password2"
										name="new_password2" required="required" type="password" /><span
										class="help-block">동일한 비밀번호를 입력해 주세요.</span>
								</div>
							</div>
							<div class="form-group last-form-group">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										style="margin-right: 10px;" type="submit" value="변경" /><a
										class="btn btn-default account-btn"
										href="/wjm/accounts/settings/relogin/">취소</a>
								</div>
							</div>
						</form>
					</div>
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
	$(document).ready(function(){
		var messages = "${messages}";

		if(messages != null && messages != "")
			$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

		
	});
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