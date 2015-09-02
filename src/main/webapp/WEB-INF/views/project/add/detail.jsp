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
<title>위시켓(Wishket) · 프로젝트 생성</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link href="./resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link href="./resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link href="./resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="./resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="./resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link href="./resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="./resources/static/favicon.ico" rel="shortcut icon"
	type="image/x-icon" />
<link href="./resources/static/favicon.ico" rel="icon"
	type="image/x-icon" />
<link href="./resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link href="./resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link href="./resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script src="./resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script src="./resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class="logged-in client project-add-detail">
	<div id="fb-root"></div>
	<script src="./resources/static/django_facebook/js/facebook.js"
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
		<header class="header"> <section class="nav-main navbar"
			role="navigation" style="background-color: #2d3a45;">
		<div class="container" style="background-color: #2d3a45; color: #fff;">
			<div class="nav-inner"
				style="background-color: #2d3a45; color: #fff;">
				<div class="navbar-header " style="color: #fff">
					<a class="navbar-brand" href="/mywishket/">Wishket</a>
				</div>
				<nav>
				<ul class="nav navbar-nav nav-primary">
					<li class=" active " style="color: #fff"><a
						href="/project/add/" style="color: #fff">프로젝트 등록</a></li>
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
		</section> <section class="nav-sub"
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
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를
							만날 수 있습니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<form action="." class="form-horizontal-70" data-behaviours="lock"
						enctype="multipart/form-data" method="POST"
						novalidate="novalidate">
						<input name="csrfmiddlewaretoken" type="hidden"
							value="hztZFkKZKQ6i8BA3jUpaBpQv8pbF0q72" />
						<div class="form-input-rapper">
							<span class="help-block"></span>
							<div class="form-group category-form-group ">
								<label class="control-label required" for="category"><span>*</span>카테고리</label>
								<div class="control-wrapper">
									<div class="category-wrapper">
										<select id="category" name="category" required="required"><option
												value="">카테고리</option>
											<option value="2">개발</option>
											<option value="1">디자인</option></select><select id="sub_category"
											name="sub_category" required="required"><option
												value="">세부 카테고리</option></select>
									</div>
									<span class="help-block">프로젝트 카테고리를 선택해 주세요.</span>
								</div>
							</div>
							<div class="form-group form-siblings">
								<label class="control-label required" for="is_turnkey"><span></span></label>
								<div class="control-wrapper">
									<div class="turnkey-checker turnkey-none" id="turnkey-box">
										<span class="turnkey-none" id="turnkey-dev"><img
											src="/static/img/exclamation-circle.png" /><strong>디자인</strong>도
											함께 필요하신가요?</span> <span class="turnkey-none" id="turnkey-design"><img
											src="/static/img/exclamation-circle.png" /><strong>개발</strong>도
											함께 필요하신가요?</span>
										<div class="turnkey-radio">
											<input id="turnkey_true" name="is_turnkey" type="radio"
												value="turnkey_true" /><label for="turnkey_true">네</label><input
												id="turnkey_false" name="is_turnkey" type="radio"
												value="turnkey_false" /><label for="turnkey_false">아니오</label>
										</div>
									</div>
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="title"><span>*</span>프로젝트
									제목</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control" id="title"
										maxlength="30" name="title" required="required" size="30"
										type="text" /><span class="help-block">프로젝트 제목을 입력해
										주세요. (30자 이내)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>예상
									기간</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="project_term" name="project_term" required="required"
											type="text" /><span class="input-group-addon">일</span>
									</div>
									<span class="help-block">프로젝트를 진행할 기간을 일 단위로 입력해 주세요.
										(최대 3자리)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="budget_maximum"><span>*</span>지출
									가능 예산</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="budget_maximum" name="budget_maximum"
											onclick="check_status()" required="required" type="text" /><span
											class="input-group-addon">원</span>
									</div>
									<span class="help-block">지출 가능한 예산을 입력해 주세요. ( VAT 별도, 예
										: 100,000,000)</span>
								</div>
							</div>
							<div class="form-group description-form-group ">
								<label class="control-label required" for="planning_status"><span>*</span>
									기획 상태</label>
								<div class="control-wrapper">
									<input id="planning_keeper" name="planning_keeper"
										type="hidden" value="" />
									<ul>
										<li><label for="planning_status_1"><div
													class="radio-no-selected one" id="radio-one"
													onclick="check_plan();">
													<input id="planning_status_1" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="idea" /><br /> <label class="radio-inline"
														for="planning_status_1">아이디어만 있습니다.</label>
												</div></label></li>
										<li><label for="planning_status_2"><div
													class="radio-no-selected two" id="radio-two"
													onclick="check_plan();">
													<input id="planning_status_2" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="simple" /><br /> <label class="radio-inline"
														for="planning_status_2">필요한 내용들을 간단히<br />정리해두었습니다.
													</label>
												</div></label></li>
										<li class="last-radio"><label for="planning_status_3"><div
													class="radio-no-selected three" id="radio-three"
													onclick="check_plan();">
													<input id="planning_status_3" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="project_book" /><br /> <label
														class="radio-inline" for="planning_status_3">상세한
														기획 문서가<br />존재합니다.
													</label>
												</div></label></li>
									</ul>
								</div>
							</div>
							<div class="form-group description-form-group ">
								<label class="control-label required" for="description"><span>*</span>프로젝트
									내용</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="description" name="description" onclick="check_status()"
										required="" rows="30"></textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하는
											경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="skill_required">관련
									기술</label>
								<div class="control-wrapper">
									<input id="skill_required" name="skill_required" type="text" /><span
										class="help-block">다수의 관련 기술을 입력 할때에는 쉼표(,)로 구분해 주세요.
										(최대 5개)<br />예) Photoshop, Android, HTML5, Python, Django
									</span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group deadline-form-group ">
								<label class="control-label required" for="deadline"><span>*</span>모집
									마감일자</label>
								<div class="control-wrapper">
									<select id="deadline" name="deadline" onclick="check_status()"
										required="required"><option value="2015-09-02">2015년
											9월 2일 수요일</option>
										<option value="2015-09-03">2015년 9월 3일 목요일</option>
										<option value="2015-09-04">2015년 9월 4일 금요일</option>
										<option value="2015-09-05">2015년 9월 5일 토요일</option>
										<option value="2015-09-06">2015년 9월 6일 일요일</option>
										<option value="2015-09-07">2015년 9월 7일 월요일</option>
										<option value="2015-09-08">2015년 9월 8일 화요일</option>
										<option value="2015-09-09">2015년 9월 9일 수요일</option>
										<option value="2015-09-10">2015년 9월 10일 목요일</option>
										<option value="2015-09-11">2015년 9월 11일 금요일</option>
										<option value="2015-09-12">2015년 9월 12일 토요일</option>
										<option value="2015-09-13">2015년 9월 13일 일요일</option>
										<option value="2015-09-14">2015년 9월 14일 월요일</option>
										<option value="2015-09-15">2015년 9월 15일 화요일</option></select><span
										class="help-block">지원자를 모집하는 기간입니다. 최소 1일에서 최대 14일까지
										가능합니다.</span>
								</div>
							</div>
							<div class="form-group interview-form-group ">
								<label class="control-label required" for="method_pre_interview"><span>*</span>사전
									미팅</label>
								<div class="control-wrapper">
									<select id="method_pre_interview" name="method_pre_interview"
										required="required"><option selected="selected"
											value="OFFLINE">오프라인 미팅</option>
										<option value="ONLINE">온라인 미팅 (카카오톡, skype, 구글 행아웃)</option></select><span
										class="help-block">사전 미팅 방식을 선택해주세요.<br />마음에 드는 지원자와의
										미팅을 위시켓에서 주선해드립니다.
									</span>
								</div>
							</div>
							<div class="form-group address-form-group ">
								<label class="control-label required" for="address_sido"><span>*</span>사전
									미팅 지역</label>
								<div class="control-wrapper">
									<div class="address-wrapper">
										<select id="address_sido" name="address_sido"
											required="required"><option value="">시, 도</option>
											<option value="1">서울특별시</option>
											<option value="2">부산광역시</option>
											<option value="3">대구광역시</option>
											<option value="4">인천광역시</option>
											<option value="5">광주광역시</option>
											<option value="6">대전광역시</option>
											<option value="7">울산광역시</option>
											<option value="8">세종특별자치시</option>
											<option value="9">경기도</option>
											<option value="10">강원도</option>
											<option value="11">충청북도</option>
											<option value="12">충청남도</option>
											<option value="13">전라북도</option>
											<option value="14">전라남도</option>
											<option value="15">경상북도</option>
											<option value="16">경상남도</option>
											<option value="17">제주특별자치도</option></select><select id="sigungu"
											name="sigungu" onclick="check_status()" required="required"><option
												value="">시, 군, 구</option></select>
									</div>
									<span class="help-block">사전 미팅을 진행할 지역을 선택해 주세요</span>
								</div>
							</div>
							<div class="form-group address-form-group new-date-form ">
								<label class="control-label required"
									for="date_expected_kick_off"><span>*</span>프로젝트 예상 시작일</label>
								<div class="control-wrapper">
									<select id="date_expected_kick_off"
										name="date_expected_kick_off" onchange="check_status()"
										required="required"><option value="2015-09-02">2015년
											9월 2일 수요일</option>
										<option value="2015-09-03">2015년 9월 3일 목요일</option>
										<option value="2015-09-04">2015년 9월 4일 금요일</option>
										<option value="2015-09-05">2015년 9월 5일 토요일</option>
										<option value="2015-09-06">2015년 9월 6일 일요일</option>
										<option value="2015-09-07">2015년 9월 7일 월요일</option>
										<option value="2015-09-08">2015년 9월 8일 화요일</option>
										<option value="2015-09-09">2015년 9월 9일 수요일</option>
										<option value="2015-09-10">2015년 9월 10일 목요일</option>
										<option value="2015-09-11">2015년 9월 11일 금요일</option>
										<option value="2015-09-12">2015년 9월 12일 토요일</option>
										<option value="2015-09-13">2015년 9월 13일 일요일</option>
										<option value="2015-09-14">2015년 9월 14일 월요일</option>
										<option value="2015-09-15">2015년 9월 15일 화요일</option>
										<option value="2015-09-16">2015년 9월 16일 수요일</option>
										<option value="2015-09-17">2015년 9월 17일 목요일</option>
										<option value="2015-09-18">2015년 9월 18일 금요일</option>
										<option value="2015-09-19">2015년 9월 19일 토요일</option>
										<option value="2015-09-20">2015년 9월 20일 일요일</option>
										<option value="2015-09-21">2015년 9월 21일 월요일</option>
										<option value="2015-09-22">2015년 9월 22일 화요일</option>
										<option value="2015-09-23">2015년 9월 23일 수요일</option>
										<option value="2015-09-24">2015년 9월 24일 목요일</option>
										<option value="2015-09-25">2015년 9월 25일 금요일</option>
										<option value="2015-09-26">2015년 9월 26일 토요일</option>
										<option value="2015-09-27">2015년 9월 27일 일요일</option>
										<option value="2015-09-28">2015년 9월 28일 월요일</option></select><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group manage-experience-form-group ">
								<label class="control-label required"
									for="has_manage_experience"><span>*</span>프로젝트 매니징 경험</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline"
											for="has_manage_experience_1"><input
												id="has_manage_experience_1" name="has_manage_experience"
												type="radio" value="True" />예, 매니징 경험이 있습니다.</label></li>
										<li><label class="radio-inline"
											for="has_manage_experience_2"><input
												id="has_manage_experience_2" name="has_manage_experience"
												type="radio" value="False" />아니오, 없습니다.</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group ">
								<label class="control-label" for="prefer_partner">선호하는
									파트너 형태</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="prefer_partner_1"><input
												id="prefer_partner_1" name="prefer_partner" type="radio"
												value="whatever" />상관 없음</label></li>
										<li><label class="radio-inline" for="prefer_partner_2"><input
												id="prefer_partner_2" name="prefer_partner" type="radio"
												value="corporate_business" />법인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_3"><input
												id="prefer_partner_3" name="prefer_partner" type="radio"
												value="individual_business" />개인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_4"><input
												id="prefer_partner_4" name="prefer_partner" type="radio"
												value="team" />팀</label></li>
										<li><label class="radio-inline" for="prefer_partner_5"><input
												id="prefer_partner_5" name="prefer_partner" type="radio"
												value="individual" />개인</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group ">
								<label class="control-label" for="submit_purpose">프로젝트
									의뢰 목적</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="submit_purpose_1"><input
												id="submit_purpose_1" name="submit_purpose" type="radio"
												value="False" />프로젝트 의뢰</label></li>
										<li><label class="radio-inline" for="submit_purpose_2"><input
												id="submit_purpose_2" name="submit_purpose" type="radio"
												value="True" />견적 문의</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper project-submit-group">
								<input id="category_keeper" name="category_keeper" type="hidden"
									value="" /><input id="value_keeper" name="value_keeper"
									type="hidden" value="" /><input id="turnkey_keeper"
									name="turnkey_keeper" type="hidden" value="" /><input
									id="sigungu_keeper" name="sigungu_keeper" type="hidden"
									value="" /><input autocomplete="off"
									class="btn btn-lg btn-client js-disable-on-click btn-submit"
									data-loading-text="제출 중" name="post_a_job" type="submit"
									value="프로젝트 등록" /><input autocomplete="off"
									class="btn btn-lg btn-default js-disable-on-click"
									data-loading-text="저장 중" name="save_for_later" type="submit"
									value="임시 저장" />
							</div>
						</div>
					</form>
					<div class="project-add-helper" style="float: left;">
						<div class="expected-time-boxer">
							<div class="expected-time-title">
								작성 완료까지 예상 시간<img class="slash"
									src="/static/img/intro/slash_blue.png" />
							</div>
							<div class="remain-time">
								<i class="fa fa-clock-o"></i> 약 <span id="remain-time-text"
									style="font-weight: bold;">4분</span> 소요 예정
							</div>
							<div id="progressbar"></div>
							<br />
							<div class="maximum-time">최대 10분</div>
						</div>
						<div class="project-add-info">
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="/static/img/project-add-process-one.png" />
								<div class="info-data-letter">
									위시켓은 <strong>클라이언트님께 무료</strong>로 제공 됩니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="/static/img/project-add-process-two.png" />
								<div class="info-data-letter">
									다양한 지원자들의 <strong>견적과 포트폴리오를 한눈에 비교</strong>할 수 있습니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="/static/img/project-add-process-three.png" />
								<div class="info-data-letter">
									<strong>온/오프라인 미팅</strong>을 통해 마음에 드는 지원자를 선택합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="/static/img/project-add-process-four.png" />
								<div class="info-data-letter">
									<strong>대금 보호 시스템</strong>을 통해, 돈 문제 없는 안전한 계약이 가능합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="/static/img/project-add-process-five.png" />
								<div class="info-data-letter">
									클라이언트님의 <strong>승인 후에 파트너에게 대금이 지급</strong>됩니다.
								</div>
							</div>
						</div>
					</div>
					<div aria-hidden="true" aria-labelledby="myModalLabel"
						class="modal fade project-modal" id="myModal2" role="dialog"
						tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header project-modal-header">
									<button aria-hidden="true" class="close" data-dismiss="modal"
										type="button">×</button>
									<h4 class="modal-title meeting-cancel-title">카테고리 변경</h4>
								</div>
								<div class="modal-body project-modal-body">
									<p class="text-center">
										카테고리 변경시 작성해 놓은 프로젝트 내용이 삭제됩니다.<br /> 카테고리를 변경하시겠습니까?
									</p>
									<div class="text-center">
										<button class="btn btn-warning project-category-btn"
											data-dismiss="modal" onclick="changeDescription()"
											type="button">예</button>
										<button class="btn btn-default meeting-no-btn"
											data-dismiss="modal" id="project-modal-cancel" type="button">아니오</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div aria-hidden="true" aria-labelledby="myModalLabel"
						class="modal fade project-modal" id="myModal3" role="dialog"
						tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header project-modal-header">
									<button aria-hidden="true" class="close" data-dismiss="modal"
										type="button">×</button>
									<h4 class="modal-title meeting-cancel-title">카테고리 변경</h4>
								</div>
								<div class="modal-body project-modal-body">
									<p class="text-center">
										카테고리 변경시 작성해 놓은 프로젝트 내용이 삭제됩니다.<br /> 카테고리를 변경하시겠습니까?
									</p>
									<div class="text-center">
										<button class="btn btn-warning project-category-btn"
											data-dismiss="modal" id="category-modal-change" type="button">예</button>
										<button class="btn btn-default meeting-no-btn"
											data-dismiss="modal" id="category-modal-cancel" type="button">아니오</button>
									</div>
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
    function changeDescription() {
        var sub = document.getElementById('sub_category'),
                projectCategoryTemplateURL = '/project/category/' + sub.value + "/",
                description = document.getElementById('description'),
                keeper = document.getElementById('value_keeper');

        $.get(projectCategoryTemplateURL, function(data){
            description.value = data.template_body;
        });
        keeper.value = sub.value;
    }

    function reset_plan(){
        var one = document.getElementById('radio-one');
        var two = document.getElementById('radio-two');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        var one_check = document.getElementById('planning_status_1');
        var two_check = document.getElementById('planning_status_2');
        var three_check = document.getElementById('planning_status_3');
        one_check.checked = false;
        two_check.checked = false;
        three_check.checked = false;
        keeper.value = 0;
        one.className = "radio-no-selected one";
        two.className = "radio-no-selected two";
        three.className = "radio-no-selected three";
    }

    function check_plan(){
        var one_check = document.getElementById('planning_status_1');
        var one = document.getElementById('radio-one');
        var two_check = document.getElementById('planning_status_2');
        var two = document.getElementById('radio-two');
        var three_check = document.getElementById('planning_status_3');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        if (one_check.checked === true){
            one.className = "radio-selected one";
            keeper.value = 1;
        }
        else {
            one.className = "radio-no-selected one";
        }
        if (two_check.checked === true){
            two.className = "radio-selected two";
            keeper.value = 2;
        }
        else {
            two.className = "radio-no-selected two";
        }
        if (three_check.checked === true){
            three.className = "radio-selected three";
            keeper.value = 3;
        }
        else {
            three.className = "radio-no-selected three";
        }
    }

    setInterval(function progress_check(){
        var cnt=0;
        if($('#title').val() != "" || null){
            cnt ++;
        }
        if($('#project_term').val() != "" || null){
            cnt ++;
        }
        if($('#budget_maximum').val() != "" || null){
            cnt ++;
        }
        if($('#description').val() != "" || null){
            cnt ++;
        }
        if($('#value_keeper').val() != "" || null){
            cnt ++;
        }
        if($('#turnkey_keeper').val() != "" || null){
            cnt ++;
        }
        if($('#sigungu_keeper').val() != "" || null){
            cnt ++;
        }
        if(cnt>2){
            $('#remain-time-text').html('3분');
        }
        else if(cnt> 3){
            $('#remain-time-text').html('2분');
        }
        else if(cnt>6){
            $('#remain-time-text').html('1분');
        }
        var cnt = cnt*10;
        $( "#progressbar" ).progressbar({
          value: cnt
        });
    }, 10000);

    $(function() {
        $( "#progressbar" ).progressbar({
          value: 0
        });
      });


    $(function () {
        $('#project-modal-cancel').on('click', function() {
            var options = '<option value="">세부 카테고리</option>';
            var url = "/job/subcategory/s/" + $('#category').val() + "/";
            var keep = $('input[name="value_keeper"]');
            var $selectSubCategory = $('#sub_category');
            var setInitState = function () {
                $selectSubCategory.html(options).selecter('refresh');

            };

            $.getJSON(url, function (j) {
                    var fieldTitle;
                    for (var i=0; i < j.length; i++) {
                        if (j[i].pk === parseInt(keep.val(), 10)) {
                            options += '<option value="' + j[i].pk + '" selected="selected">' + j[i].fields.title_kor + '</option>';
                            fieldTitle = j[i].fields.title_kor;
                        } else {
                            options += '<option value="' + j[i].pk + '">' + j[i].fields.title_kor + '</option>';
                        }
                    }
                    setInitState();
                    $selectSubCategory.find('+ .selecter > .selecter-selected').html(fieldTitle);

                })


        })
    });

    $(function () {
        $('#sub_category').on('change', function() {
            var value_sub = $(this).val();
            var check = document.getElementById('turnkey-box');
            check.className = "turnkey-checker turnkey-none";
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            $('#turnkey_true').prop('checked', false);
            $('#turnkey_false').prop('checked', false);
            reset_plan();
            if (value_sub === '9' || value_sub === '10') {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
            else if (value_sub === '1' || value_sub === '2' || value_sub === '3' || value_sub === '4' || value_sub === '6') {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
        })

        if($('#planning_keeper').val()===''){

        }
        else{
            var t = $('#planning_keeper').val();
            if(t==1){
                $('.one').attr('class', 'radio-selected one');
                $('#planning_status_1').attr('checked', true);
            }
            else if(t==2){
                $('.two').attr('class', 'radio-selected two');
                $('#planning_status_2').attr('checked', true);
            }
            else if(t==3){
                $('.three').attr('class', 'radio-selected three');
                $('#planning_status_3').attr('checked', true);
            }
        }

        if($('#value_keeper').val()===''){

        }
        else{
            var check = document.getElementById('turnkey-box');
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            var value_sub = $('#value_keeper').val(),
                    value_cat = $('#turnkey_keeper').val();
            if(value_cat == '1'){
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
            else if(value_cat == '2'){
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
            if (value_sub === '9' || value_sub === '10') {
                check.className = "turnkey-checker turnkey-show";

            }
            else if (value_sub === '1' || value_sub === '2' || value_sub === '3' || value_sub === '4' || value_sub === '6') {
                check.className = "turnkey-checker turnkey-show";

            }
        }
    });

    $(function () {
        var getSubcategory, $categoryVal, setSubcategory;

        getSubcategory = function(value) {
            var url, options, setInitState;
            var $selectSubCategory = $('#sub_category');

            options = '<option value="">세부 카테고리</option>';
            url = "/job/subcategory/s/" + value + "/";
            setInitState = function () {
                $selectSubCategory.html(options).selecter('refresh');
            };

            if (value === '') {
                setInitState();
                $selectSubCategory.find('+ .selecter > .selecter-selected').html("세부 카테고리");
            } else {
                $.getJSON(url, function (j) {
                    var $subcategory = $('input[name="value_keeper"]'),
                            subcategoryVal = $subcategory.val(),
                            fieldTitle;
                    for (var i=0; i < j.length; i++) {

                        if (j[i].pk === parseInt(subcategoryVal, 10)) {
                            options += '<option value="' + j[i].pk + '" selected="selected">' + j[i].fields.title_kor + '</option>';
                            fieldTitle = j[i].fields.title_kor;
                        } else {
                            options += '<option value="' + j[i].pk + '">' + j[i].fields.title_kor + '</option>';
                        }
                    }
                    setInitState();
                    $selectSubCategory.find('+ .selecter > .selecter-selected').html(fieldTitle);

                })
            }
        };


        $('#category').on('change', function() {
            var value;
            value = $(this).val();

            if($('#value_keeper').val() != '' && $('#description').val() !== ''){
                $('#myModal3').modal('show');
            }
            else {
                $('input[name="category_keeper"]').val(value);
                $('input[name="value_keeper"]').val('');
                $('#turnkey-box').prop('class', 'turnkey-none');
                $('#sub_category').find('+ .selecter > .selecter-selected').html("세부 카테고리");
                getSubcategory(value);
            }
        });

        $('#category-modal-cancel').on('click', function() {
            var before_value = parseInt($('#category_keeper').val(), 10);
            var $category = $('#category');
            var options = '<option value="">카테고리</option><option value="2">개발</option><option value="1">디자인</option>';

            $category.html(options).selecter('refresh');
            if(before_value === 2){
                $category.find('+ .selecter > .selecter-selected').html("개발");
            }
            else if(before_value === 1) {
                $category.find('+ .selecter > .selecter-selected').html("디자인");
            }
            $category.val(before_value);
        });

        $('#category-modal-change').on('click', function() {
            var value = $('#category').val();
            $('input[name="category_keeper"]').val(value);
            $('input[name="value_keeper"]').val('');
            $('#turnkey-box').prop('class', 'turnkey-none');
            $('#description').val('');
            $('#sub_category').find('+ .selecter > .selecter-selected').html("세부 카테고리");
            getSubcategory(value);
        });


        $categoryVal = $('#category').val();
        if ($categoryVal !== undefined) {
            getSubcategory($categoryVal);
        }

        getSubcategory();

    });


    $(function () {
        var getSigungu, $sigunguVal;

        getSigungu = function(value) {
            var url, options, setInitState;
            var $selectSigungu = $('#sigungu');

            options = '<option value="">시, 군, 구</option>';
            url = "/address/sigungu/s/" + value + "/";
            setInitState = function() {
                $selectSigungu.html(options).selecter('refresh');
            };

            if (value === '') {
                setInitState();
                $selectSigungu.find('+ .selecter > .selecter-selected').html("세부 카테고리");
            } else {
                $.getJSON(url, function(j){
                    var $addressSigungu = $('input[name="sigungu_keeper"]'),
                            addressSigunguVal = $addressSigungu.val(),
                            fieldTitle;

                    for (var i=0; i < j.length; i++) {
                        if (j[i].pk === parseInt(addressSigunguVal, 10)) {
                            options += '<option value="' + j[i].pk + '" selected="selected">' + j[i].fields.name + '</option>';
                            fieldTitle = j[i].fields.name;
                        } else {
                            options += '<option value="' + j[i].pk + '">' + j[i].fields.name + '</option>';
                        }
                    }
                    setInitState();
                    $selectSigungu.find('+ .selecter > .selecter-selected').html(fieldTitle);
                })
            }
        }
        $('#address_sido').on('change', function() {
            var value;
            value = $(this).val();
            getSigungu(value);
        });
        $sigunguVal = $('#address_sido').val();
        if ($sigunguVal !== undefined) {
            getSigungu($sigunguVal);
        }
        getSigungu();
    });
    $(function() {
        $('#skill_required').tagit({
            tagLimit: 5,
            caseSensitive: false,
            preprocessTag: function(val) {
                var valueLen = val.length;
                if(valueLen > 25){
                    $('#skill_required').next().css('border-color', '#f33d12');
                    setTimeout( function() {
                        $('#skill_required').next().css('border-color', '#cccccc');
                    }, 1500);
                    return '';
                }
                if (!val) {
                    return '';
                } else if (val[valueLen-1] === ',') {
                    return val.slice(0, valueLen-1);
                } else {
                    return val;
                }
            }
        });

        $('#budget_maximum').priceFormat({
            prefix: "",
            thousandsSeparator: ",",
            centsLimit: ""
        });
    });
    $(function () {
        $('#address_sigungu').change(function(){
            var $thisVal = $(this).val(),
                    keeper = $('#sigungu_keeper');
            keeper.val($thisVal);
        })
    });
    $(function () {
        $('#sub_category').change(function () {
            var $thisVal = $(this).val(),
                    projectCategoryTemplateURL = '/project/category/' + $thisVal + "/",
                    projectDescription = $('#description'),
                    keeper = $('#value_keeper');
            if (projectDescription.val() !== ''){
                $('#myModal2').modal('show');
            }
            else {
                keeper.val($thisVal);
                if ($thisVal === '') {
                    projectDescription.val('');
                } else {
                    $.ajax({
                        dataType: "json",
                        url: projectCategoryTemplateURL,
                        success: function (data, status, xhr) {
                            $.each(data, function(i, value) {
                                var projectDescription = $('#description');
                                    projectDescription.data('category_template', value);
                                    projectDescription.val(value);
                            })
                        }
                    });
                }
            }
        });
    });
    $(function () {
        $('select').selecter({
            "cover": true
        });
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