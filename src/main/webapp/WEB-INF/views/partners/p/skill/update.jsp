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

		<jsp:include page="../../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages">
					<div class="alert alert-safe alert-warning fade in">
						프로젝트 지원을 위해 <a ,="" class="alert-link"
							href="/partners/p/gksthf16112/info/update/">'파트너스 정보'</a>, <a
							class="alert-link"
							href="/partners/p/gksthf16112/introduction/update/">'자기 소개'</a>,
						<a ,="" class="alert-link"
							href="/partners/p/gksthf16112/skill/update/">'보유 기술'</a>, <a
							,="" class="alert-link"
							href="/partners/p/gksthf16112/portfolio/update/">'포트폴리오'</a>을(를)
						입력해주세요.
					</div>
				</div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/partners/p/gksthf16112/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> [ 보유 기술 ]
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
							<li class="active"><a
								href="/partners/p/gksthf16112/skill/update/">보유 기술</a></li>
							<li class=""><a
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
						<h3 class="header-text" style="margin-bottom: 30px">
							보유 기술 <span class="pull-right"><a class="btn btn-primary"
								href="/partners/p/gksthf16112/skill" style="margin-top: -7px;">내
									프로필에서 보기</a></span>
						</h3>
						</section>
						<section id="p5-skill-section">
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/profile_skill.png" />
									<div class="p5-no-partners-info-table-text">
										등록된 <span class="text-center p5-bold">'보유 기술'</span>이 없습니다.
									</div>
									<a class="btn btn-partners"
										href="/partners/p/gksthf16112/skill/update/add/"><i
										class="fa fa-plus"></i> 보유 기술 등록하기</a>
								</div>
							</div>
						</div>
						</section>
						<div
							class="modal p5-represent-skill-modal fade p5-profile-represent-modal"
							id="p5-modify-represent-skill-modal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button aria-hidden="true" class="close" data-dismiss="modal"
											type="button">×</button>
										<h4 class="modal-title">
											대표 보유 기술 <span class="p5-fix">선택</span>
										</h4>
									</div>
									<div class="modal-body">
										<h5 style="text-align: center; font-weight: normal">
											대표 보유 기술로 회원님의 전문성을 표현할 수 있습니다.<br /> <span class="p5-bold">대표
												보유 기술은 최대 5개까지 선택할 수 있습니다.</span>
										</h5>
										<form class="p5-skill-fix-checkbox" id="rep_skill_form"
											method="POST">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="request_type" type="hidden"
												value="change_represent_skill" />
										</form>
										<div class="text-center">
											<button class="btn btn-default"
												id="p5-fix-represent-skill-btn" type="button">
												대표 보유 기술 <span class="p5-fix">선택</span>
											</button>
											<button class="btn btn-cancel" data-dismiss="modal"
												type="button">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true" class="modal p5-profile-delete-modal fade"
							id="p5-skill-delete-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">보유 기술 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="delete_skill_form" method="POST"
											style="display: none">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="request_type" type="hidden" value="delete_skill" /><input
												name="delete_skill_id" type="hidden" value="" />
										</form>
										<div class="text-center">
											<h5>
												<span id="p5-haveskill-name">"포토샾"</span><br />보유 기술을 정말
												삭제하겠습니까?
											</h5>
											<div class="text-center">
												<button class="btn btn-warning skill-delete p5-btn-left"
													id="p5-skill-delete-modal-btn">예</button>
												<button class="btn btn-cancel" data-dismiss="modal">아니오</button>
											</div>
										</div>
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
			<jsp:include page="../../../footer.jsp" flush="false" />

	<script>
$(document).ready(function() {

    $('.content-inner').on('click', '.p5-skill-delete-btn', function(event) {
        event.preventDefault();
        skillPK = $(this).attr('skill-pk');
        $('[name="delete_skill_id"]').val(skillPK);
        $('#p5-haveskill-name').html('"'+$(this).attr('item-title')+'"');
    });

    $('#p5-skill-delete-modal-btn').click(function(event) {
        event.preventDefault();
        $('#delete_skill_form').submit();
    });

    $('.content-inner').on('click', '#p5-fix-represent-skill-btn', function(event){
        event.preventDefault();
        $('#rep_skill_form').submit();
    });

    $('.content-inner').on('click','.p5-skill-fix-checkbox', function() {
        if( $(this).children().children('input:checked').length >= 5 ) {
            $(this).children().children('input:not(:checked)').attr('disabled', true);
        } else {
            $(this).children().children('input:not(:checked)').attr('disabled', false);
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