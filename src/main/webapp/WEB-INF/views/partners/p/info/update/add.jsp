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
		
		<jsp:include page="../../../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/partners/p/<%=this_account.getId() %>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> <a
								href="/partners/p/<%=this_account.getId() %>/info/update/">[ 파트너스 정보 ]</a>
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a
								href="/partners/p/<%=this_account.getId() %>/info/update/">파트너스 정보</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
							<h3 class="header-text" style="margin-bottom: 30px">파트너스 정보
								등록</h3>
						</section>
						<div class="p5-content-body">
							<form class="form-horizontal has-validation-callback"
								id="partners-info-edit-form" method="POST">
								<input name="csrfmiddlewaretoken" type="hidden"
									value="K0aCXjNzfSfjdDu1siojuxEQYZptQDj9" /><span
									class="help-block"></span>
								<div class="form-group p5-form-group">
									<label class="control-label required p5-box-control-label"
										for="job"><span>*</span>직군</label>
									<div class="control-wrapper p5-control-wrapper">
										<select class="form-control" id="p5-job" name="job"
											required="required"><option value="">선택</option>
											<option value="1">개발자</option>
											<option value="2">디자이너</option></select>
									</div>
								</div>
								<div class="form-group p5-form-group">
									<label class="control-label " for="job_subcategory_develop">관심
										분야</label>
									<div class="control-wrapper p5-info-check-wrapper">
										<span class="p5-job-subcategory_develop">개발</span>
										<div class="checkbox p5-checkbox p5-develop-checkbox">
											<input id="job_subcategory_develop_1"
												name="job_subcategory_develop" type="checkbox" value="101" /><label
												for="job_subcategory_develop_1">웹</label><input
												id="job_subcategory_develop_2"
												name="job_subcategory_develop" type="checkbox" value="102" /><label
												for="job_subcategory_develop_2">애플리케이션</label><input
												id="job_subcategory_develop_3"
												name="job_subcategory_develop" type="checkbox" value="103" /><label
												for="job_subcategory_develop_3">워드프레스</label><input
												id="job_subcategory_develop_4"
												name="job_subcategory_develop" type="checkbox" value="104" /><label
												for="job_subcategory_develop_4">퍼블리싱</label><br />
											<input id="job_subcategory_develop_5"
												name="job_subcategory_develop" type="checkbox" value="105" /><label
												for="job_subcategory_develop_5">일반 소프트웨어</label><input
												id="job_subcategory_develop_6"
												name="job_subcategory_develop" type="checkbox" value="106" /><label
												for="job_subcategory_develop_6">커머스,쇼핑몰</label><input
												id="job_subcategory_develop_7"
												name="job_subcategory_develop" type="checkbox" value="107" /><label
												for="job_subcategory_develop_7">게임</label><input
												id="job_subcategory_develop_8"
												name="job_subcategory_develop" type="checkbox" value="108" /><label
												for="job_subcategory_develop_8">임베디드</label><br />
											<input id="job_subcategory_develop_9"
												name="job_subcategory_develop" type="checkbox" value="109" /><label
												for="job_subcategory_develop_9">기타</label>
										</div>
										<span class="p5-job-subcategory_design">디자인</span><br />
										<div class="checkbox p5-checkbox p5-design-checkbox">
											<input id="job_subcategory_design_1"
												name="job_subcategory_design" type="checkbox" value="201" /><label
												for="job_subcategory_design_1">웹</label><input
												id="job_subcategory_design_2" name="job_subcategory_design"
												type="checkbox" value="202" /><label
												for="job_subcategory_design_2">애플리케이션</label><input
												id="job_subcategory_design_3" name="job_subcategory_design"
												type="checkbox" value="203" /><label
												for="job_subcategory_design_3">제품</label><input
												id="job_subcategory_design_4" name="job_subcategory_design"
												type="checkbox" value="204" /><label
												for="job_subcategory_design_4">프레젠테이션</label><br />
											<input id="job_subcategory_design_5"
												name="job_subcategory_design" type="checkbox" value="205" /><label
												for="job_subcategory_design_5">인쇄물</label><input
												id="job_subcategory_design_6" name="job_subcategory_design"
												type="checkbox" value="206" /><label
												for="job_subcategory_design_6">커머스, 쇼핑몰</label><input
												id="job_subcategory_design_7" name="job_subcategory_design"
												type="checkbox" value="207" /><label
												for="job_subcategory_design_7">로고</label><input
												id="job_subcategory_design_8" name="job_subcategory_design"
												type="checkbox" value="208" /><label
												for="job_subcategory_design_8">그래픽</label><br />
											<input id="job_subcategory_design_9"
												name="job_subcategory_design" type="checkbox" value="209" /><label
												for="job_subcategory_design_9">영상</label><input
												id="job_subcategory_design_10" name="job_subcategory_design"
												type="checkbox" value="210" /><label
												for="job_subcategory_design_10">게임</label><input
												id="job_subcategory_design_11" name="job_subcategory_design"
												type="checkbox" value="211" /><label
												for="job_subcategory_design_11">기타</label>
										</div>
									</div>
								</div>
								<div class="form-group p5-form-group">
									<label class="control-label required p5-box-control-label"
										for="p5-availability"><span>*</span>활동가능성</label>
									<div class="control-wrapper">
										<select class="form-control" id="p5-availability"
											name="availability" required="required"><option
												selected="selected" value="0">활동가능</option>
											<option value="1">협의필요</option>
											<option value="2">활동불가</option></select>
									</div>
								</div>
								<div
									class="form-group p5-form-group p5-profile-manage-btn-group">
									<div class="btn-wrapper pull-right">
										<a class="btn btn-cancel p5-btn-left"
											href="/partners/p/<%=this_account.getId() %>/info/update/" type="button">취소</a>
										<button class="btn btn-partners btn-submit" type="submit">등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
		<jsp:include page="../../../../footer.jsp" flush="false" />
	<script>
$(document).ready(function() {
    $('.content-inner').on('click','.btn-submit', function(e) {
        e.preventDefault();

        if($('#p5-job').val()==""||$('#p5-availability').val()=="") {
            if($('#p5-job').val()=="") {
                $('#p5-job').parent().addClass('has-error');
                $('#p5-job').addClass('error');
                $('#p5-job').parent().children('.form-error').remove();
                $('#p5-job').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#p5-job').parent().removeClass('has-error');
                $('#p5-job').removeClass('error');
                $('#p5-job').parent().children('.form-error').remove();
            }

            if($('#p5-availability').val()=="") {
                $('#p5-availability').parent().addClass('has-error');
                $('#p5-availability').addClass('error');
                $('#p5-availability').parent().children('.form-error').remove();
                $('#p5-availability').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#p5-availability').parent().removeClass('has-error');
                $('#p5-availability').removeClass('error');
                $('#p5-availability').parent().children('.form-error').remove();
            }
            return 0;
        }
        else{
            $('#partners-info-edit-form').submit();
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