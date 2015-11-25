<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator, com.wjm.models.AccountInfo,com.wjm.models.AccountInformationInfo"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");

	String img_path = this_accountinfo.getProfile_img();
	if (img_path != null) {
		if (img_path.isEmpty())
			img_path = "default_avatar.png";
	} else
		img_path = "default_avatar.png";

	String id = "", bank_name="",account_holder="",account_number="";
	
	if(this_account != null)
	{
		id = this_account.getId();
		bank_name = (String)request.getAttribute("bank_name");
		account_holder = (String)request.getAttribute("account_holder");
		account_number = (String)request.getAttribute("account_number");
		
		if(!Validator.hasValue(bank_name)) bank_name = "";
		if(!Validator.hasValue(account_holder)) account_holder = "";
		if(!Validator.hasValue(account_number)) account_number = "";
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 계좌 관리</title>
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
						<h3 class="user-name-tag-heading"><%=this_account.getAccount_type() %></h3>
						<div class="user-name-tag-body">
							<img alt="<%=id %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=img_path %>" />
							<h4 class="username"><%=id %></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/admin/accounts/profile/<%=this_account.getPk()%>">기본 정보</a></li>
							<li class=""><a href="/wjm/admin/accounts/verify_identity/<%=this_account.getPk()%>">신원
									인증</a></li>
							<li class=" active "><a class="active"
								href="/wjm/wjm/admin/accounts/bank_account/<%=this_account.getPk()%>">계좌 관리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
				<p class="back">
				<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
					<div class="content-header action">
						<h3 class="header-text">
							계좌 관리 <small class="small-text">프로젝트 대금을 지급받을 계좌 정보를
								등록해주세요.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-warning.png" />
							<p class="process-guide-title-text">
								<strong>[ 계좌 관리 가이드 ]</strong><br /> 프로젝트 대금의 안전한 송금을 위해 <strong>정확한
									계좌번호</strong>가 필요합니다.
							</p>
						</div>
						<h4 id="sub_title">
							등록 계좌
						</h4>
						<form action="." class="form-horizontal" id="show_bank_form"
							method="POST" style="margin-top: 25px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="v1CvkzdEylYHMo4IA35c483YZ2vjwmvs" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 은행명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=bank_name %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 예금주</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=account_holder %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									계좌번호</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=account_number %>" />
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