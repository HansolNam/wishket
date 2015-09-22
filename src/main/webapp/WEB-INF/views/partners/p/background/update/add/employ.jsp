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

<title>외주몬(WJM) · 파트너스 정보 설정</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
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
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<jsp:include page="../../../../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/partners/p/gksthf16112/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> <a
								href="/partners/p/gksthf16112/background/update/">[ 경력, 학력,
								자격증 ]</a>
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/partners/p/gksthf16112/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/partners/p/gksthf16112/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/partners/p/gksthf16112/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/gksthf16112/skill/update/">보유
									기술</a></li>
							<li class="active"><a
								href="/partners/p/gksthf16112/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/partners/p/gksthf16112/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">경력 추가</h3>
						</section>
						<section>
						<h4>경력</h4>
						<form id="employment_add_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" />
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>회사명</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-company-name-input"
										name="company_name" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>부서</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-division-input"
										name="division" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>직위</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-position-input"
										name="position" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>입사일</label>
								<div class="control-wrapper p5-2-control-wrapper">
									<select class="form-control p5-date-select"
										data-validation="required" id="p5-hired-year-select"
										name="date_hired_year" required="required"><option
											selected="selected" value="">년</option></select><select
										class="form-control" data-validation="required"
										id="p5-hired-month-select" name="date_hired_month"
										required="required"><option selected="selected"
											value="">월</option>
										<option value="1">1월</option>
										<option value="2">2월</option>
										<option value="3">3월</option>
										<option value="4">4월</option>
										<option value="5">5월</option>
										<option value="6">6월</option>
										<option value="7">7월</option>
										<option value="8">8월</option>
										<option value="9">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option></select>
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for="">퇴사일</label>
								<div class="control-wrapper p5-2-control-wrapper">
									<select class="form-control p5-date-select"
										id="p5-retired-year-select" name="date_retired_year"><option
											selected="selected" value="">년</option></select><select
										class="form-control" id="p5-retired-month-select"
										name="date_retired_month"><option selected="selected"
											value="">월</option>
										<option value="1">1월</option>
										<option value="2">2월</option>
										<option value="3">3월</option>
										<option value="4">4월</option>
										<option value="5">5월</option>
										<option value="6">6월</option>
										<option value="7">7월</option>
										<option value="8">8월</option>
										<option value="9">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option></select>
								</div>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-career-cancel-btn p5-btn-left"
								href="/partners/p/gksthf16112/background/update/">취소</a>
							<button class="btn btn-partners btn-submit">추가</button></span>
						</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>

		<jsp:include page="../../../../../footer.jsp" flush="false" />
	<script>
    $(document).ready(function() {
        //일정 구하는 함수
        var d = new Date();
        for (var i = 0; i < 30; i++) {
            var temp = '<option value="' + (parseInt(d.getFullYear()) - i) + '">' + (parseInt(d.getFullYear()) - i) + '년' + '</option>';
            $('.p5-date-select').append(temp);
        }


        //변경사항 보내는 함수
        $('.content-inner').on('click', '.btn-submit', function (e) {
            e.preventDefault();

            if ($('#p5-company-name-input').val() == "" ||
                    $('#p5-division-input').val() == "" ||
                    $('#p5-position-input').val() == "" ||
                    $('#p5-hired-year-select').val() == "" ||
                    $('#p5-hired-month-select').val() == "") {
                if ($('#p5-company-name-input').val() == "") {
                    $('#p5-company-name-input').parent().addClass('has-error');
                    $('#p5-company-name-input').addClass('error');
                    $('#p5-company-name-input').parent().children('.form-error').remove();
                    $('#p5-company-name-input').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
                } else {
                    $('#p5-company-name-input').parent().removeClass('has-error');
                    $('#p5-company-name-input').removeClass('error');
                    $('#p5-company-name-input').parent().children('.form-error').remove();
                }

                if ($('#p5-division-input').val() == "") {
                    $('#p5-division-input').parent().addClass('has-error');
                    $('#p5-division-input').addClass('error');
                    $('#p5-division-input').parent().children('.form-error').remove();
                    $('#p5-division-input').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
                } else {
                    $('#p5-division-input').parent().removeClass('has-error');
                    $('#p5-division-input').removeClass('error');
                    $('#p5-division-input').parent().children('.form-error').remove();
                }

                if ($('#p5-position-input').val() == "") {
                    $('#p5-position-input').parent().addClass('has-error');
                    $('#p5-position-input').addClass('error');
                    $('#p5-position-input').parent().children('.form-error').remove();
                    $('#p5-position-input').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
                } else {
                    $('#p5-position-input').parent().removeClass('has-error');
                    $('#p5-position-input').removeClass('error');
                    $('#p5-position-input').parent().children('.form-error').remove();
                }

                if ($('#p5-hired-year-select').val() == "") {
                    $('#p5-hired-year-select').parent().addClass('has-error');
                    $('#p5-hired-year-select').addClass('error');
                    $('#p5-hired-year-select').parent().children('.form-error').remove();
                    $('#p5-hired-year-select').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
                } else {
                    $('#p5-hired-year-select').parent().removeClass('has-error');
                    $('#p5-hired-year-select').removeClass('error');
                    $('#p5-hired-year-select').parent().children('.form-error').remove();
                }

                if ($('#p5-hired-month-select').val() == "") {
                    $('#p5-hired-month-select').parent().addClass('has-error');
                    $('#p5-hired-month-select').addClass('error');
                    $('#p5-hired-month-select').parent().children('.form-error').remove();
                    $('#p5-hired-month-select').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
                } else {
                    $('#p5-hired-month-select').parent().removeClass('has-error');
                    $('#p5-hired-month-select').removeClass('error');
                    $('#p5-hired-month-select').parent().children('.form-error').remove();
                }
                return 0;
            }
            else if(parseInt($('#p5-hired-year-select').val(), 10) > parseInt($('#p5-retired-year-select').val(), 10)){
                $('#p5-hired-year-select').parent().addClass('has-error');
                $('#p5-hired-year-select').addClass('error');
                $('#p5-hired-year-select').parent().children('.form-error').remove();
                $('#p5-hired-year-select').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 입사일과 퇴사일을 확인해 주세요.</span>');

            }
            else{
                $('#employment_add_form').submit();
            }

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
        ga('set', '&uid', '28338');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'partners',
          'dimension3': '28338',
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