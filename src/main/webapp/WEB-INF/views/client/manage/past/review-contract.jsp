<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ContractInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ContractInfo> reviewlist = (List<ContractInfo>)request.getAttribute("reviewlist");
	int reviewCnt = 0;

	Integer cancellednum = 0;
	if((Integer) request.getAttribute("cancellednum") != null)
		cancellednum = (Integer) request.getAttribute("cancellednum");

	Integer completednum = 0;
	if((Integer) request.getAttribute("completednum") != null)
		completednum = (Integer) request.getAttribute("completednum");
	
	if(reviewlist != null)
		reviewCnt = reviewlist.size();
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 관리 - 평가 대기 중</title>
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
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
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
							<li class="active"><a
								href="/wjm/client/manage/past/review-contract/"><span
									class="badge badge-info pull-right"><%if(reviewCnt != 0) out.print(reviewCnt); %></span>평가 대기 중</a></li>
							<li class=""><a
								href="/wjm/client/manage/past/completed-contract/"><%if(completednum != null && completednum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+completednum+"</span> "); %>완료한 프로젝트</a></li>
							<li class=""><a
								href="/wjm/client/manage/past/cancelled-project/"> <%if(cancellednum != null && cancellednum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+cancellednum+"</span> "); %>취소한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							평가 대기 중 <small class="small-text">더 좋은 서비스를 위해 파트너스를 평가해
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
						<section>
						<%
						
							if(reviewCnt != 0)
							{
								for(int i=0;i<reviewCnt;i++)
								{
								
						%>
							<section class="project-unit">
								<section class="project-unit-heading">
									<h4 class="project-title"><%=reviewlist.get(i).getName() %></h4>
									<div class="management-tools">
										<a class="btn btn-sm btn-default" 
										href="/wjm/client/manage/review/<%=reviewlist.get(i).getProject_pk() %>/<%=reviewlist.get(i).getClient_pk()%>/<%=reviewlist.get(i).getPartners_pk()%>">평가하기</a>
									</div>
								</section>
								<section class="project-unit-body">
									<ul class="project-info list-item-narrow">
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 파트너스
											</h5>
											<span><%=reviewlist.get(i).getPartners_id() %></span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-clock-o"></i> 비용
											</h5>
											<span><%=reviewlist.get(i).getBudget() %>원</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-calendar-o"></i> 종료일자
											</h5>
											<span><%=Time.toString3(reviewlist.get(i).getProject().getReg_date()) %></span></li>
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
						<p class="text-muted">평가 대기 중인 프로젝트가 없습니다.</p>
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
</body>
</html>