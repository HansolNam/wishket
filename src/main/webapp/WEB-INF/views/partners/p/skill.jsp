<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.main.function.Validator,com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.TechniqueInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<TechniqueInfo> skill = (List<TechniqueInfo>) request.getAttribute("skill");
	String isSame = (String) request.getAttribute("isSame");
	

	String profile = this_accountinfo.getProfile_img();
	
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
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 파트너스 - <%=this_account.getId()%></title>
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
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link
	href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="partners-name-tag">
						<h3 class="partners-name-tag-heading">파트너스</h3>
						<div class="partners-name-tag-body">
							<img alt="<%=this_account.getId() %> 사진"
								class="p5-partners-img-lg"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="partners-username-bottom"><%=this_account.getId()%></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/">전체보기</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/">자기
									소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/">클라이언트의
									평가</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/history/">외주몬에서
									진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section>
						<h3 class="p5-profile-head">
							<%=this_account.getId()%>의 보유 기술
						<%if(isSame != null){ %><a class="btn btn-primary pull-right" href="/wjm/partners/p/<%=this_account.getId() %>/skill/update/" style="margin-top: -7px;">업데이트 하기</a><%} %>
						</h3>
						</section>
						<section>
						<h4 style="padding-top: 15px;">보유 기술</h4>
						<%
							if (skill != null) {
						%>
						<table
							class="table table-responsive table-hover p5-haveskill-table">
							<thead>
								<tr>
									<th class="p5-head-title p5-head-title-no-body-tool">종류</th>
									<th class="p5-head-rating p5-head-raing-no-body-tool">숙련도</th>
									<th class="p5-head-experience p5-head-experience-no-body-tool">경험</th>
								</tr>
							</thead>
							<tbody>
								<%
								for(int i=0;i<skill.size();i++)
								{
							%>
								<tr>
									<td class="p5-head-title"><%=skill.get(i).getName() %></td>
									<td class="p5-head-rating"><%=skill.get(i).getSkill() %></td>
									<td class="p5-head-experience"><%=skill.get(i).getExperience() %></td>
								</tr>
							<%
								}
							%>
							</tbody>
						</table>
						<%
							} else {
						%> <span><div class="p5-partners-no-info">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'보유 기술'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div> </span> 
							<%
							 	}
							 %> </section>
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