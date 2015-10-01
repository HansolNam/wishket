<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ApplicantInfo, com.wjm.models.PortfolioInfo,java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ApplicantInfo> apply = (List<ApplicantInfo>)request.getAttribute("apply");
	int cnt = 0;

	Integer ingnum = 0;
	if((Integer) request.getAttribute("ingnum") != null)
		ingnum = (Integer) request.getAttribute("ingnum");

	if(apply != null)
		cnt = apply.size();
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
<title>외주몬(WJM) · 관리 - 지원 종료</title>
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
<body class="logged-in partners partners-management proposal-management">
	<div id="wrap">
		<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">파트너스</h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${profile}" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/manage/proposal/counselling/"><%if(ingnum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+ingnum+"</span> "); %>지원 중</a></li>
							<li class="active"><a
								href="/wjm/partners/manage/proposal/end-counselling/"><span
									class="badge badge-info pull-right"><%if(cnt != 0) out.print(cnt); %></span>지원 종료</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							지원 종료 <small class="small-text">지원 종료된 프로젝트를 확인할 수 있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text"
								style="float: left; height: 40px; line-height: 40px;">프로젝트
								상담기간이 지났거나, 계약이 성사되지 못한 프로젝트를 확인할 수 있습니다.</p>
							<div style="clear: both;"></div>
						</div>
						<section>
						
						<%
							if(cnt == 0)
							{
						%>
						<section>
						<p class="text-muted">지원 종료된 프로젝트가 없습니다.</p>
						</section>
						<%
							}
							else
							{

								String description;
								for(int i =0;i<cnt;i++)
								{
									description = apply.get(i).getApplication_content();
									description = description.replace("\r\n", "<br/>");
						%>	
						
						<section class="proposal-unit">
							<section class="proposal-unit-heading">
							<h4 class="project-title">
								<a href="/wjm/project/<%=apply.get(i).getName() %>/<%=apply.get(i).getProject_pk() %>/"><%=apply.get(i).getName() %></a> <a class="interest-list-action-btn"
								 href="/wjm/partners/manage/interest/delete/<%=apply.get(i).getProject_pk() %>/" title="'관심 프로젝트'에서 삭제하기"></a>
							</h4>
							</section>
						<section class="proposal-unit-body">
							<ul class="interest-summary-info">
								<li class="lg" style="*width: 180px;"><h5 class="label-item">
										<i class="fa fa-clock-o"></i> 지원 일자
									</h5>
									<span class="project-term"><%=Time.toString3(apply.get(i).getReg_date())%></span>
								</li>
								<li class="sub-lg" style="*width: 135px;"><h5 class="label-item">
										<i class="fa fa-won"></i> 지원 기간
									</h5>
									<span><%=apply.get(i).getApplication_period()%> 일</span></li>
								<li class="sm"><h5 class="label-item">
										<i class="fa fa-tags"></i> 지원 금액
									</h5>
									<span class="project-budget"><%=apply.get(i).getApplication_cost()%>원</span>
								</li>
							</ul>
							<ul>
								<li class="lg"><h5 class="label-item">
										<i class="fa fa-map-marker"></i> 지원 내용
									</h5>
								</li>
								<li>
									<span><%=description %></span>
								</li>
							</ul>
							<ul>
								<li class="lg"><h5 class="label-item">
										<i class="fa fa-map-marker"></i>포트폴리오
									</h5>
								</li>
								<li>
									<span><%if(apply.get(i).getHas_portfolio() == 0){ %>지원한 포트폴리오가 없습니다.<%}else{ %>지원한 포트폴리오가 있습니다.<%} %></span></li>
							</ul>
							<%
							if(apply.get(i).getHas_portfolio() == 1){
								int portfolio_pk = 0;
								String portfolio_name = "";
								
								description = apply.get(i).getPortfolio_description();
								description = description.replace("\r\n", "<br/>");
							%>
							<ul class="interest-summary-info">
								<li class="lg" style="*width: 280px;"><h5 class="label-item">
										<i class="fa fa-tags"></i> 포트폴리오1
									</h5>
									<span><%if(apply.get(i).getPortfolio1() != null) 
											{
											portfolio_pk = apply.get(i).getPortfolio1().getPk();
											portfolio_name = apply.get(i).getPortfolio1().getName();
											out.print("<a href='/wjm/partners/p/"+account.getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
											}
									else
									{
										out.print("없음");
									}
										%></span>
								</li>
								<li class="sub-lg" style="*width: 235px;"><h5 class="label-item">
										<i class="fa fa-won"></i> 포트폴리오2
									</h5>
									<span><%if(apply.get(i).getPortfolio2() != null) 
											{
											portfolio_pk = apply.get(i).getPortfolio2().getPk();
											portfolio_name = apply.get(i).getPortfolio2().getName();
											out.print("<a href='/wjm/partners/p/"+account.getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
											}
									else
									{
										out.print("없음");
									}
										%></span></li>
								<li class="sm"><h5 class="label-item">
										<i class="fa fa-clock-o"></i> 포트폴리오3
									</h5>
									<span class="project-term"><%if(apply.get(i).getPortfolio3() != null) 
											{
											portfolio_pk = apply.get(i).getPortfolio3().getPk();
											portfolio_name = apply.get(i).getPortfolio3().getName();
											out.print("<a href='/wjm/partners/p/"+account.getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
											}
									else
									{
										out.print("없음");
									}
										%></span></li>
							</ul>
							<ul>
								<li class="lg"><h5 class="label-item">
										<i class="fa fa-map-marker"></i> 포트폴리오 설명
									</h5>
								</li>
								<li>
									<span><%=description %></span>
								</li>
							</ul>
							<%
							}
							%>
							</section>
						</section>
						<%
								}
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