<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head>

<meta charset="utf-8" />
<meta http-equiv="Content-Language" content="ko" />
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
</head>
<body class=" account signup">
	<div id="wrap">
	
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						회원가입 <small class="small-text">외주몬에 오신 것을 환영합니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<section class="signup-body">
						<form action="/wjm/accounts/signup/" autocomplete="off" class="form-horizontal" id="signup-form"
							method="post">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6uNyCofkYxLTSsxGWtCuwuZEL7X1bTPR" />
							<div class="form-group signup-usage " id="account_type_div">
								<label class="control-label required" for="id_usage"><span>*</span>이용목적</label>
								<div class="control-wrapper">
									<ul>
										<li><label for="client"><div
													class="radio-no-selected one">
													<input id="client" name="usage" type="radio"
														value="client" /><label class="radio-inline"
														for="client"><strong>클라이언트</strong><br />프로젝트를
														의뢰하고 싶습니다.</label>
												</div></label></li>
										<li><label for="partners"><div
													class="radio-no-selected two">
													<input id="partners" name="usage" type="radio"
														value="partners" /><label class="radio-inline"
														for="partners"><strong>파트너스</strong><br />일거리를
														찾고 있습니다.</label>
												</div></label></li>
									</ul>
									<span class="help-block">${account_type_msg}</span>
									
								</div>
							</div>
							<div class="form-group " id="email_div">
								<label class="control-label required" for="email"><span>*</span>이메일</label>
								<div class="email-control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="email" maxlength="75" name="email" required="required"
										type="text" />
									<span class="help-block">${email_msg}</span>
										
								</div>
							</div>
							<div class="form-group " id="id_div">
								<label class="control-label required" for="id"><span>*</span>아이디</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="id" name="id" required="required"
										type="text" />
									<span class="help-block">${id_msg}</span>
								</div>
							</div>
							<div class="form-group " id="password_div">
								<label class="control-label required" for="password"><span>*</span>비밀번호</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="password" name="password" required="required"
										type="password" />
									<span class="help-block">${password_msg}</span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="password_confirm"><span>*</span>비밀번호
									재입력</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="required form-control"
										id="password_confirm" name="password_confirm" required="required"
										type="password" /><span class="help-block">동일한 비밀번호를
										입력해 주세요.</span>
								</div>
							</div>
							<div class="tos form-group " id="tos_div">
								<div class="checkbox-wrapper">
									<div class="checkbox" style="padding-top: 0 !important;">
										<label for="tos"><input class="required"
											id="tos" name="tos" type="checkbox" /><span><a
												href="/wjm/terms-of-service/">이용 약관</a> 및 <a
												href="/wjm/privacy/">개인 정보 보호 방침</a>에 동의합니다.</span></label>
									</div>
									<span class="help-block">${tos_msg}</span>
								</div>
							</div>
							<div class="form-group">
								<div class="btn-wrapper">
									<input class="btn btn-block btn-wishket btn-lg account-btn"
										type="submit" value="회원가입" />
										<!-- onclick="signup_clicked();"  -->
								</div>
							</div>
						</form>
					</section>
					<aside class="signup-aside">
						<p class="redirect-login">
							이미 회원이신가요? <a href="/wjm/accounts/login/">로그인</a>
						</p>
						<p class="aside-benefit-text">
							<strong class="strong-value">${clientnum}</strong>개의 <strong>클라이언트
								기업</strong>과<br /> <strong class="strong-value">${partnersnum}</strong>개의 <strong>개발회사
								&amp; 프리랜서</strong>가<br /> 함께하는 온라인 아웃소싱 플랫폼 외주몬
						</p>
					</aside>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../footer.jsp" flush="false" />
		
	<script type="text/javascript">
	$(document).ready(function(){
		var tos_msg = "${tos_msg}";
		var account_type_msg = "${account_type_msg}";
		var id_msg = "${id_msg}";
		var email_msg = "${email_msg}";
		var password_msg = "${password_msg}";

		var tos_val = "${tos_val}";
		var account_type_val = "${account_type_val}";
		var id_val = "${id_val}";
		var email_val = "${email_val}";
		
		if(tos_msg != null && tos_msg != "")
		{
			$("#tos_div").addClass('has-error');
		}
		
		if(tos_val != null && tos_val != "")
		{
			document.getElementById("tos").checked = true;
		}
		
		if(account_type_msg != null && account_type_msg != "")
		{
			$("#account_type_div").addClass('has-error');
		}

		if(account_type_val != null && account_type_val != "")
		{
			document.getElementById(account_type_val).checked = true;
		}

		if(id_msg != null && id_msg != "")
		{
			$("#id_div").addClass('has-error');
		}
		
		if(id_val != null && id_val != "")
		{
			document.getElementById("id").value = "${id_val}";
		}

		if(email_msg != null && email_msg != "")
		{
			$("#email_div").addClass('has-error');
		}
		if(email_val != null && email_val != "")
		{
			document.getElementById("email").value = "${email_val}";
		}
		if(password_msg != null && password_msg != "")
			$("#password_div").addClass('has-error');
		
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
