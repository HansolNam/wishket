<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.main.function.Validator, com.wjm.models.AccountInfo,com.wjm.models.AccountInformationInfo, com.wjm.models.AuthenticationInfo"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");

	String name = accountinfo.getName();
	String id = this_account.getId();
	String email = this_account.getEmail();
	String form = accountinfo.getForm();
	String profile_img = accountinfo.getProfile_img();
	String company_name = accountinfo.getCompany_name();
	String company_representative = accountinfo.getCompany_representative();
	String sex = accountinfo.getSex();
	String birth_date = accountinfo.getBirth_date();
	String regionl = accountinfo.getRegionl();
	String regionm = accountinfo.getRegionm();
	String regionr = accountinfo.getRegionr();
	String cellphone_num = accountinfo.getCellphone_num();
	String telephone_num = accountinfo.getTelephone_num();
	String fax_num = accountinfo.getFax_num();
	int subscription = accountinfo.getSubscription();

	if (!Validator.hasValue(name))
		name = "";
	if (!Validator.hasValue(id))
		id = "";
	if (!Validator.hasValue(email))
		email = "";
	if (!Validator.hasValue(profile_img))
		profile_img = "default_avatar.png";
	if (!Validator.hasValue(company_name))
		company_name = "";
	if (!Validator.hasValue(company_representative))
		company_representative = "";
	if (!Validator.hasValue(regionl))
		regionl = "";
	if (!Validator.hasValue(regionm))
		regionm = "";
	if (!Validator.hasValue(regionr))
		regionr = "";
	if (!Validator.hasValue(cellphone_num))
		cellphone_num = "";
	if (!Validator.hasValue(telephone_num))
		telephone_num = "";
	if (!Validator.hasValue(fax_num))
		fax_num = "";
	
	if (form.equals("individual"))
		form = "개인";
	else if (form.equals("team"))
		form = "팀";
	else if (form.equals("individual_business"))
		form = "개인 사업자";
	else if (form.equals("corporate_business"))
		form = "법인 사업자";
	else
		form = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 기본 정보 수정</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/p5.css" rel="stylesheet" />
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
<body class="logged-in client account-setting profile">
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
							<img alt=" 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile_img %>" />
							<h4 class="username"><%=id %></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a class="active"
								href="/wjm/admin/accounts/profile/<%=this_account.getPk()%>">기본 정보</a></li>
							<li class=""><a href="/wjm/admin/accounts/verify_identity/<%=this_account.getPk()%>">신원
									인증</a></li>
							<li class=""><a href="/wjm/admin/accounts/bank_account/<%=this_account.getPk()%>">계좌
									관리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
				<p class="back">
				<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
					<div class="content-header action">
						<h3 class="header-text">
							기본 정보 <small class="small-text">사용자 기본 정보 입니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_show_form" method="POST"
							style="border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 프로필
									사진</label>
								<div class="control-wrapper" style="padding-top: 7px;">
									<img alt=" 사진" class="partners-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile_img %>"
										style="border-radius: 10%; border: 1px solid #dedede; width: 220px; height: 220px;" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									<%=this_account.getAccount_type() %> 형태</label>
								<div class="control-wrapper">
									<input disabled="" id="get_form_of_business"
										name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=form %>" />
								</div>
							</div>
							<%
							if(form.equals("개인") || form.equals("팀"))
							{
							%>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 이름</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=name %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 성별</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=sex %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									생년월일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=birth_date %>" />
								</div>
							</div>
							<%
							}
							else
							{
							%>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 담당자명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=name %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 회사명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=company_name %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 대표자명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=company_representative %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									설립일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=birth_date %>" />
								</div>
							</div>
							<%
							}
							%>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 지역
									- 시, 도</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=regionl %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 세부
									지역 - 시, 군, 구</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=regionm %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">나머지 주소</label>
								<div class="control-wrapper">
									<input style="border: none; margin-top: 5px;"
										type="text" value="<%=regionr %>" />
								</div>
							</div>
						</form>
						
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="connect_show_form"
							method="POST"
							style="border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 핸드폰
									번호</label>
								<div class="control-wrapper">
									<input disabled="" name="cell_phone_number" id="cell_phone_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=cellphone_num %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">전화번호</label>
								<div class="control-wrapper">
								<input disabled="" name="phone_number" id="phone_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=telephone_num %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">팩스 번호</label>
								<div class="control-wrapper">
									<input disabled="" name="fax_number" id="fax_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=fax_num %>" />
								</div>
							</div>
						</form>
						<h4>이메일 구독 설정</h4>
						<form action="/wjm/accounts/settings/profile/email" class="form-horizontal"
							enctype="multipart/form-data" id="email_edit_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="email" />
							<div class="form-group">
								<label class="control-label">이메일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=email %>" />
								</div>
							</div>
							<div class="form-group ">
								<div class="checkbox-wrapper">
									<div class="checkbox">
										<label class="" for="email_subscription"><input
											<%if(subscription == 1){ %>checked="checked"<%} %> id="email_subscription"
											name="email_subscription" value="true" type="checkbox" />외주몬의 프로젝트 소식을
											구독합니다.</label>
									</div>
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