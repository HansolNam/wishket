<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.main.function.Validator,java.sql.Timestamp,com.wjm.models.AccountInfo, com.wjm.models.ContractInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ContractInfo> contractlist = (List<ContractInfo>)request.getAttribute("contractlist");
	int contractCnt = 0;
	
	if(contractlist != null)
		contractCnt = contractlist.size();
	
	
	String profile = (String)request.getAttribute("profile");
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
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
<title>외주몬(WJM) · 관리 - 진행 중인 프로젝트</title>
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
<body
	class="logged-in partners partners-management contract-management ">
	<div id="wrap">
			<jsp:include page="../../header.jsp" flush="false" />

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
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a
								href="/wjm/partners/manage/contract-in-progress/"><span
									class="badge badge-info pull-right"><%=contractCnt%></span>진행 중인 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							진행 중인 프로젝트 <small class="small-text">계약 진행 중인 프로젝트를 확인할 수
								있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. <strong>현재 진행 중인 프로젝트</strong> 목록입니다.<br /> 2. 위시켓은 <strong>에스크로
									시스템</strong>을 통해 프로젝트가 끝날 때까지 대금을 보호합니다.<br /> 3. 프로젝트가 성공적으로 끝나면, <strong>클라이언트의
									승인 이후 대금이 지급</strong>됩니다.<br /> 4. 프로젝트 진행 중에 발생하는 문제는 <strong>고객센터
									(02-6925-4849)</strong>를 이용해주세요.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<section>
						<%
						
							if(contractCnt != 0)
							{
								for(int i=0;i<contractCnt;i++)
								{
								
						%>
							<section class="proposal-unit">
								<section class="proposal-unit-heading">
									<h4 class="project-title">
									<a href="/wjm/project/<%=contractlist.get(i).getName() %>/<%=contractlist.get(i).getProject_pk()%>/"><%=contractlist.get(i).getName() %></a>
									</h4>
								</section>
								<section class="proposal-unit-body">
									<ul class="interest-summary-info">
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 클라이언트
											</h5>
											<span><%=contractlist.get(i).getClient_id() %></span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-clock-o"></i> 남은기간
											</h5>
											<span><%
									Timestamp now = Time.getCurrentTimestamp();
									now = Time.dateToTimestamp(Time.TimestampToString(now));
									Timestamp reg_date = contractlist.get(i).getReg_date();
									reg_date = Time.dateToTimestamp(Time.TimestampToString(reg_date));
									
									int remain = Time.remainDate(now, reg_date)/(60*24);
									
									if(contractlist.get(i).getTerm() - remain>=0)
										out.print(contractlist.get(i).getTerm() - remain+" 일 전");
									else
										out.print(contractlist.get(i).getTerm() - remain*(-1)+"일 초과");
									
									%>/<%=contractlist.get(i).getTerm() %>일</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-calendar-o"></i> 비용
											</h5>
											<span><%=contractlist.get(i).getBudget() %> 원</span></li>
									</ul>
								</section>
							</section>
							<%	
								}
							}
							else
							{
							%>
						<section>
						<p class="text-muted">진행 중인 프로젝트가 없습니다.</p>
						</section>
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