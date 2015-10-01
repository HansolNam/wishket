<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ContractInfo"%>
<%
	ContractInfo contract = (ContractInfo)request.getAttribute("contract");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 관리 - 평가 하기</title>
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
<body class="logged-in client client-management past-management">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
					<p class="back">
						<a href='/wjm/client/manage/past/review-contract/'>[평가 대기중]으로 가기 <i
							class='fa fa-arrow-circle-o-right'></i></a>

					</p>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							평가하기 <small class="small-text">더 좋은 서비스를 위해 파트너스를 평가해
								주세요.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. 진행했던 <strong>파트너를 평가</strong>해 주세요.<br /> 2. 평가는 <strong>신중하게
									작성</strong>해 주세요.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">파트너스 평가</h3>
						</section>
						<section>
						<form action="/wjm/client/manage/review/<%=contract.getProject_pk() %>/<%=contract.getClient_pk()%>/<%=contract.getPartners_pk()%>" id="review_form" method="POST"
							class="has-validation-callback">
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>프로젝트명</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="project-name-input"
										name="name" required="required" type="text" value="<%=contract.getName() %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>파트너스 아이디</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="partners-id-input"
										name="partners_id" required="required" type="text" value="<%=contract.getPartners_id() %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>전문성</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="professionalism" name="professionalism"
										required="required"><option selected="selected"
											value="">전문성</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>결과물의 만족도</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="satisfaction" name="satisfaction"
										required="required"><option selected="selected"
											value="">만족도</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>일정 준수</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="schedule_observance" name="schedule_observance"
										required="required"><option selected="selected"
											value="">일정준수</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>적극성</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="activeness" name="activeness"
										required="required"><option selected="selected"
											value="">적극성</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>의사소통</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="communication" name="communication"
										required="required"><option selected="selected"
											value="">의사소통</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>추천 한마디</label>
								<div class="control-wrapper">
									<textarea class="form-control" cols="80"
										data-validation="required" id="recommendation"
										name="recommendation" required="required" rows="5"></textarea>
								</div>
								<p class="p5-form-information">
									추천 한마디는 최대 250자 입니다.
								</p>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-btn-left"
								href="/wjm/client/manage/past/review-contract/" type="button">취소</a>
							<button class="btn btn-partners btn-submit" type="submit">등록</button></span>
						</form>
						</section>
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