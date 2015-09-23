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

<title>외주몬(WJM) · 파트너스 - <%=this_account.getId() %></title>
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
		<jsp:include page="../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="partners-name-tag">
						<h3 class="partners-name-tag-heading">파트너스</h3>
						<div class="partners-name-tag-body">
							<img alt="<%=this_account.getId() %> 사진" class="p5-partners-img-lg"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<h4 class="partners-username-bottom"><%=this_account.getId() %></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/">전체보기</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/introduction/">자기
									소개</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/portfolio/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/skill/">보유
									기술</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/partners/p/<%=this_account.getId() %>/evaluation/">클라이언트의 평가</a></li>
							<li class="active"><a
								href="/partners/p/<%=this_account.getId() %>/history/">위시켓에서 진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section>
						<div class="project-history-head">
							<h3 class="p5-profile-head">위시켓에서 진행한 프로젝트</h3>
							<div class="w-profile-head-content-inner">
								<div class="contract-project-table">
									<div class="contract-project-count">
										<div class="title-column">계약한 프로젝트</div>
										<div class="data-column">
											<span class="value">0</span> 개
										</div>
									</div>
									<div class="contract-project-cost">
										<div class="title-column">누적 프로젝트 금액</div>
										<div class="data-column">
											<span class="value">0</span> 원
										</div>
									</div>
								</div>
								<div style="clear: both"></div>
							</div>
						</div>
						<div class="project-history-head-content">
							<div class="profile-head-content-inner">
								<div class="main-category">
									<h5>진행한 카테고리</h5>
									<div>
										<canvas height="96" id="myChart" width="120"></canvas>
										<ul class="doughnut-legend">
											<li><span style="background-color: #dedede;"></span>진행한
												프로젝트 없음</li>
										</ul>
										<div style="clear: left"></div>
									</div>
								</div>
								<div class="project-average-box" style="float: right">
									<div class="project-average-box-price">
										<h5 style="margin-top: 0px;">프로젝트 평균 금액</h5>
										<p>
											<strong>0</strong> 원
										</p>
										<img src="${pageContext.request.contextPath}/resources/static/img/project_average_price.png" />
										<div class="project-average-price-img"></div>
										<p class="project-average-price-low"
											style="padding-left: 15px;">
											최저 <strong>0</strong> 원
										</p>
										<p class="project-average-price-high"
											style="padding-right: 30px;">
											최고 <strong>0</strong> 원
										</p>
									</div>
									<div class="project-average-box-period">
										<h5 style="margin-top: 0px;">프로젝트 평균 기간</h5>
										<p class="project-average-period-information"
											style="padding-left: 30px;">
											<strong>0</strong> 일
										</p>
										<img height="14px"
											src="${pageContext.request.contextPath}/resources/static/img/project_average_period.png" width="199px" />
										<p class="project-average-period-low">
											최저 <strong>0</strong> 일
										</p>
										<p class="project-average-period-high">
											최고 <strong>0</strong> 일
										</p>
									</div>
									<div style="clear: left"></div>
								</div>
								<div style="clear: both"></div>
							</div>
						</div>
						</section>
						<section>
						<h4 style="padding-top: 15px;">위시켓에서 진행한 프로젝트</h4>
						</section>
						<section class="p5-evaluation-list">
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<img src="${pageContext.request.contextPath}/resources/static/img/project_history_no.png" />
									<p class="p5-no-partners-info-text">
										진행한 <span class="text-center p5-bold">'프로젝트'</span>가 없습니다.
									</p>
								</div>
							</div>
						</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script src="${pageContext.request.contextPath}/resources/static/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/excanvas.js" type="text/javascript"></script>
	<script>
    $(document).ready(function() {

        $('.content-inner').on('click', '.p5-review-show-btn', function (e) {
            e.preventDefault();
            $(this).children('span').html('간단히 보기');
            $(this).children('.fa-sort-asc').css('display', 'none');
            $(this).children('.fa-sort-desc').css('display', 'inline');
            $(this).parent().parent().siblings('.p5-review-specific-info').removeClass('p5-hidden-component');
            $(this).removeClass('p5-review-show-btn').addClass('p5-review-hide-btn');
        });

        $('.content-inner').on('click', '.p5-review-hide-btn', function (e) {
            e.preventDefault();
            $(this).children('span').html('자세히 보기');
            $(this).children('.fa-sort-desc').css('display', 'none');
            $(this).children('.fa-sort-asc').css('display', 'inline');
            $(this).parent().parent().siblings('.p5-review-specific-info').addClass('p5-hidden-component');
            $(this).removeClass('p5-review-hide-btn').addClass('p5-review-show-btn');
        });

        function setPagination(present, total){
            var html="",
                    box=$('#pagination_box'),
                    present_id='#page_'+present+'',
                    prev=Number(present) - 1,
                    next=Number(present) + 1;
            if(present % 10 == 0){
                var max_page = parseInt(present / 10) * 10;
            }
            else{
                var max_page = (parseInt(present / 10) + 1) * 10;
            }
            if(max_page > total){
                max_page = total;
            }
            var min_page = max_page - 9;
            if(min_page < 1){
                min_page = 1;
            }

            if(present != 1){
                html += "<li><a style='cursor:pointer' href='/partners/p/<%=this_account.getId() %>/history/?page="+prev+"' class='prev'><i class='fa fa-arrow-left'></i></a></li>";
            }
            for(var i = min_page; i<=max_page; ++i){
                html +="<li id='page_" + i + "'><a style='cursor:pointer' href='/partners/p/<%=this_account.getId() %>/history/?page="+i+"'>" + i + "</a></li>";
            }
            //html +="<li id='page_" + i + "'><a style='cursor:pointer' onclick='setPage(" + total + ");'>" + total + "</a></li>";
            if(present != total){
                html += "<li><a style='cursor:pointer' href='/partners/p/<%=this_account.getId() %>/history/?page="+next+"' class='next'><i class='fa fa-arrow-right'></i></a></li>";
            }

            box.html(html);
            $(present_id).addClass('active');
        }
        setPagination(1, 0);
    });
</script>
	<script>
    $(document).ready(function(){

        var cnt=$(".doughnut-legend ").children().length;
        var marginTop;
        if(cnt===1){
            marginTop="42px"
        }
        else if(cnt===2){
            marginTop="35px"
        }
        else if(cnt===3){
            marginTop="28px"
        }
        else if(cnt===4){
            marginTop="21px"
        }
        else if(cnt===5){
            marginTop="14px"
        }
        else if(cnt===6){
            marginTop="7px"
        }
        else if(cnt===7){
            marginTop="0px"
        }

        $(".doughnut-legend").css({
            "margin-top" : marginTop
        })
    });

    window.onload = function(){
            var ctx = document.getElementById("myChart").getContext("2d");



            var option = {
                animation: false,
                tooltipFontSize: 8,
                
                showTooltips: false
                
            };

            var data =[
            
                
                    {
                    value: 1,
                    color: '#dedede',
                    highlight: '#dedede',
                    label: "진행한 프로젝트 없음"
                    }
                
            ];

            var doughnut_chart =
                    new Chart(ctx).Doughnut(data, option);


    };

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