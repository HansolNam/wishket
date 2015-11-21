<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ page
	import="com.wjm.main.function.Time, com.wjm.main.function.Validator,com.wjm.models.AssessmentInfo,com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.LicenseInfo, com.wjm.models.EducationInfo, com.wjm.models.CareerInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	
	String isSame = (String) request.getAttribute("isSame");
	
	String profile = this_accountinfo.getProfile_img();
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
	
	//평가받은 리스트
	List<AssessmentInfo> assessmentlist = (List<AssessmentInfo>)request.getAttribute("assessmentlist");
	int assessmentnum;
	double total = 0, professionalism = 0, satisfaction = 0, communication = 0, schedule_observance = 0,activeness = 0;
	double total_avg = 0.0;
	if(assessmentlist == null) assessmentnum = 0;
	else
	{
		assessmentnum = assessmentlist.size();
		
		for (int i = 0; i < assessmentnum; i++) {
			int avg = (assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
					+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
					+ assessmentlist.get(i).getActiveness()) / 5;
			
			professionalism += assessmentlist.get(i).getProfessionalism();
			satisfaction += assessmentlist.get(i).getSatisfaction();
			communication += assessmentlist.get(i).getCommunication();
			schedule_observance += assessmentlist.get(i).getSchedule_observance();
			activeness += assessmentlist.get(i).getActiveness();
		}
			
		if (assessmentnum != 0) {
				total = professionalism + satisfaction + communication + schedule_observance + activeness;
				total_avg = (double) total / (double) (assessmentnum * 5);
				professionalism /= (double) assessmentnum;
				satisfaction /= (double) assessmentnum;
				communication /= (double) assessmentnum;
				schedule_observance /= (double) assessmentnum;
				activeness /= (double) assessmentnum;
			}
	}
	
	Integer applynum = (Integer)request.getAttribute("applynum");
	Integer progressnum = (Integer)request.getAttribute("progressnum");
	Integer completenum = (Integer)request.getAttribute("completenum");
	Integer totalbudget = (Integer)request.getAttribute("total");
	
	if(applynum == null) applynum = 0;
	if(progressnum == null) progressnum = 0;
	if(completenum == null) completenum = 0;
	if(totalbudget == null) total = 0;
%>
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
		
		<jsp:include page="../../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId() %>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> [ 프로젝트 히스토리 ]
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId() %>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/background/update/">경력, 학력,
									자격증</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId() %>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">
							프로젝트 히스토리 <span class="pull-right"><a
								class="btn btn-primary"
								href="/wjm/partners/p/<%=this_account.getId() %>/evaluation"
								style="margin-top: -7px;">내 프로필에서 보기</a></span>
						</h3>
						</section>
						<section class="p5-projecthistory-section">
						<h4 class="p5-page-title">평가</h4>
						<span class="p5-project-history-summary"><div
								class="p5-project-history-project-num">
								<div>
									<span class="p5-project-num-title">지원한 프로젝트</span> <span
										class="pull-right"><span class="p5-project-num"><%=applynum %></span><span
										class="p5-append-text">건</span></span>
								</div>
								<div>
									<span class="p5-project-num-title">진행중인 프로젝트</span> <span
										class="pull-right"><span class="p5-project-num"><%=progressnum %></span><span
										class="p5-append-text">건</span></span>
								</div>
								<div>
									<span class="p5-project-num-title">완료한 프로젝트</span> <span
										class="pull-right"><span class="p5-project-num"><%=completenum %></span><span
										class="p5-append-text">건</span></span>
								</div>
							</div>
							<div class="p5-project-history-amount">
								<div>
									<span class="p5-project-num-accumulate-title">누적 완료 금액</span> <span
										class="pull-right"><span class="p5-project-money"><%=totalbudget %></span><span
										class="p5-append-text">원</span></span>
								</div>
							</div></span> <span class="p5-project-history-review"><div
								class="p5-project-history-review-breif">
								<span class="p5-average-score-title">평균평점</span>
								<div class="rating star-rating star-lg star-lg star-lg-0"></div>
								<span class="p5-project-num"><%=Math.round(total_avg * 10) / 10.0%></span> <span
									class="text-muted p5-evaluation-review-info">/ 평가 <span
									class="p5-bold"><%=assessmentnum %></span>개
								</span>
							</div>
							<div class="p5-project-history-review-specific">
								<div>
									<span class="p5-review-specific-title">전문성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="p5-review-rate-num"><%=Math.round(professionalism * 10) / 10.0%></span>
								</div>
								<div>
									<span class="p5-review-specific-title">결과물 만족도</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="p5-review-rate-num"><%=Math.round(satisfaction * 10) / 10.0%></span>
								</div>
								<div>
									<span class="p5-review-specific-title">의사소통</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="p5-review-rate-num"><%=Math.round(communication * 10) / 10.0%></span>
								</div>
								<div>
									<span class="p5-review-specific-title">일정 준수</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="p5-review-rate-num"><%=Math.round(schedule_observance * 10) / 10.0%></span>
								</div>
								<div>
									<span class="p5-review-specific-title">적극성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="p5-review-rate-num"><%=Math.round(activeness * 10) / 10.0%></span>
								</div>
							</div></span></section>
						<section class="p5-evaluation-list">
						<%
						 	if (assessmentnum > 0) {
						 		for (int i = 0; i < assessmentnum; i++) {

									double d = (double)(assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
											+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
											+ assessmentlist.get(i).getActiveness());
									
									d = (double)d/5.0;
						 %>

						<div class="p5-partners-project-evaluation">
							<div class="p5-partners-project-evaluation-header">
								<div class="p5-partners-project-evaluation-title">
									<h4>
										<a
											href="/wjm/project/<%=assessmentlist.get(i).getProject().getName() %>/<%=assessmentlist.get(i).getProject_pk() %>/"><%=assessmentlist.get(i).getProject().getName() %></a>
									</h4>
								</div>
								<div class="p5-partners-project-evaluation-info">
									<span>클라이언트 <span class="p5-partners-project-info-id"><%=assessmentlist.get(i).getClient().getId() %></span></span>
									<span>카테고리 <span
										class="p5-partners-project-info-category"><%=assessmentlist.get(i).getProject().getCategoryL() %> &gt; <%=assessmentlist.get(i).getProject().getCategoryM() %></span></span>
								</div>
							</div>
							<div class="p5-partners-project-evaluation-body1">
								<span><i class="fa fa-clock-o"></i>계약일<span
									class="p5-partners-project-evaluation-date"><%=Time.toString3(assessmentlist.get(i).getContract().getReg_date())%></span></span>
								<span><i class="fa fa-won"></i>계약금액<span
									class="p5-partners-project-evaluation-cost"><%=assessmentlist.get(i).getContract().getBudget()%> 원</span></span>
								<span><i class="fa fa-clock-o"></i>계약기간<span
									class="p5-partners-project-evaluation-period"><%=assessmentlist.get(i).getContract().getTerm()%> 일</span></span>
							</div>
							<div class="p5-partners-project-evaluation-body2">
								<h5>평균별점</h5>
								<div class="star-lg star-lg-5"></div>
								<span class="p5-partners-project-rating"><%=Math.round(d*10)/10.0 %></span> 
							</div>
							<div class="p5-review-specific-info">
								<div class="p5-review-group1">
									<span class="p5-review-title">전문성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getProfessionalism() %></span></span> <span
										class="p5-review-title">만족도</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getSatisfaction() %></span></span> <span
										class="p5-review-title">의사소통</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getCommunication() %></span></span>
								</div>
								<div class="p5-review-group2">
									<span class="p5-review-title">일정 준수</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getSchedule_observance() %></span></span> <span
										class="p5-review-title">적극성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=assessmentlist.get(i).getActiveness() %></span></span>
								</div>
								<div class="p5-user-comment">
									<span class="p5-user-img-box"><h6>추천 한마디</h6>
										<img alt="<%=assessmentlist.get(i).getClient().getId() %> 사진" class="p5-user-comment-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=assessmentlist.get(i).getProfile() %>"></span>
									<span class="p5-user-comment-box"><div>
											<span class="label label-default label-role"><%=assessmentlist.get(i).getClient().getId() %></span>
										</div>
										<div class="p5-review-comment"><%=assessmentlist.get(i).getRecommendation()%></div></span>
								</div>
							</div>
						</div>
						<%
							}
							}
						 	else
						 	{
						%>

						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<p class="p5-no-partners-info-text">
										등록된 <span class="text-center p5-bold">'평가'</span>가 없습니다.
									</p>
								</div>
							</div>
						</div>
						<%
						 	}
						%>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../../footer.jsp" flush="false" />
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