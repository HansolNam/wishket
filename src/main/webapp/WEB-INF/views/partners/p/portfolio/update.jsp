<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.PortfolioInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<PortfolioInfo> portfolio = (List<PortfolioInfo>) request.getAttribute("portfolio");
	if (portfolio != null)
		if (portfolio.size() == 0)
			portfolio = null;
	String isSame = (String) request.getAttribute("isSame");

	int representative = 0;

	if (portfolio != null) {
		for (int i = 0; i < portfolio.size(); i++) {
			if (portfolio.get(i).getRepresentative() == 1)
				representative++;
		}
	}
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
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">[
								프로필 정보 관리 ]</a> <i class="p5-back-nav-arrow fa fa-caret-right"></i>
							[ 포트폴리오 ]
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/update/">자기
									소개</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/">경력,
									학력, 자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/">프로젝트
									히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner"
						style="padding-top: 15px; padding-bottom: 25px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">
							포트폴리오 <span class="pull-right"><a class="btn btn-primary"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio"
								style="margin-top: -7px;">내 프로필에서 보기</a></span>
						</h3>
						</section>
						<section class="p5-partition">
						<h4 class="p5-page-title" style="margin-top: 25px; !important;">
							대표 포트폴리오(<span id="p5-represent-portfolio-num"><%=representative%></span>)
							<span class="pull-right" id="p5-represent-portfolio-manage-btn"><button
									class="btn btn-partners"
									data-target="#p5-add-represent-portfolio-modal"
									data-toggle="modal">대표 포트폴리오 선택</button></span>
						</h4>
						<div class="p5-represent-portfolio-img-list">
							<%
								if (representative == 0) {
							%>
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<div class="p5-no-partners-info-text">
											<span class="p5-bold">'대표 포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
							<%
								} else {
									for (int i = 0; i < portfolio.size(); i++) {
										if (portfolio.get(i).getRepresentative() == 1) {
							%>
							<span category-id="<%=portfolio.get(i).getCategoryL()%>"
								subcategory-id="<%=portfolio.get(i).getCategoryM()%>"
								style="margin-right: 34px; margin-bottom: 20px;"><img
								src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.get(i).getImg0()%>"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.get(i).getPk()%>/"><span
									class="p5-img-info"><div class="p5-img-brief-info">
											<div class="p5-img-title text-right"><%=portfolio.get(i).getName()%></div>
											<div class="p5-img-category text-right"><%=portfolio.get(i).getCategoryL()%>
												&gt;
												<%=portfolio.get(i).getCategoryM()%></div>
											<div class="p5-img-project-date text-right"><%=portfolio.get(i).getStart_date()%>
												~
												<%=portfolio.get(i).getEnd_date()%></div>
										</div></span></a> <span class="label label-sm label-open">대표 작품</span></span>
							<%
								}
									}
								}
							%>
						</div>
						</section>
						<section class="p5-portfolio-section">
						<h4 class="p5-portfolio-title">
							포트폴리오 (<span id="p5-portfolio-num">
								<%
									if (portfolio == null)
										out.print(0);
									else
										out.print(portfolio.size());
								%>
							</span>) <a class="btn btn-partners pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/add/"
								id="p5-add-portfolio-btn" style="margin-top: -7px;">추가</a>
						</h4>
						</section>
						<section>
						<div class="p5-portfolio-list">
							<%
								if (portfolio == null) {
							%>
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<div class="p5-no-partners-info-text">
											등록된 <span class="p5-bold">'포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div> </span>
							<%
								} else {
									for (int i = 0; i < portfolio.size(); i++) {
							%>
							<span category-id="<%=portfolio.get(i).getCategoryL()%>"
								subcategory-id="<%=portfolio.get(i).getCategoryM()%>"><img
								src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.get(i).getImg0()%>"
								style="-webkit-user-select: none"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.get(i).getPk()%>/update/"><span
									class="p5-img-info"><div class="p5-img-brief-info">
											<div class="p5-img-title text-right"><%=portfolio.get(i).getName()%></div>
											<div class="p5-img-category text-right"><%=portfolio.get(i).getCategoryL()%>
												&gt;
												<%=portfolio.get(i).getCategoryM()%></div>
											<div class="p5-img-project-date text-right"><%=portfolio.get(i).getStart_date()%>
												~
												<%=portfolio.get(i).getEnd_date()%></div>
										</div></span></a>
								<div class="p5-img-btn-group pull-right">
									<a class="btn btn-default"
										href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.get(i).getPk()%>/update/edit/">수정</a>
									<button class="btn btn-cancel p5-portfolio-delete-btn"
										data-target="#p5-delete-portfolio-modal" data-toggle="modal"
										portfolio-pk="<%=portfolio.get(i).getPk()%>"
										portfolio-title="<%=portfolio.get(i).getName()%>">삭제</button>
								</div></span>
							<%
								}
								}
							%>
						</div>
						</section>
						<div class="modal fade p5-profile-represent-modal"
							id="p5-add-represent-portfolio-modal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button aria-hidden="true" class="close" data-dismiss="modal"
											type="button">×</button>
										<h4 class="modal-title">
											대표 포트폴리오 <span class="p5-fix">선택</span>
										</h4>
									</div>
									<div class="modal-body">
										<h5 style="text-align: center; font-weight: normal;">
											대표 포트폴리오는 프로필을 더욱더 매력적으로 보이게 합니다.<br /> <span
												class="p5-bold">대표 포트폴리오는 최대 3개까지 선택할 수 있습니다.</span>
										</h5>
										<form class="p5-portfolio-checkbox" id="rep_porfolio_form">
											<%
												if (portfolio != null) {
													for (int i = 0; i < portfolio.size(); i++) {
											%>
											<div>
													<!-- taglist="<taggit.managers._TaggableManager object at 0 x8239650>" -->
												<input name="p5-portfolio-check" id="p5-portfolio-check<%=i %>" portfolio-id="<%=portfolio.get(i).getPk() %>"
													 type="checkbox" value="<%=portfolio.get(i).getPk() %>"><label
													for="p5-portfolio-check<%=i %>"><%=portfolio.get(i).getName() %></label><span
													class="p5-portfolio-check-category"><%=portfolio.get(i).getCategoryL() %></span>
											</div>
											<%
												}
												}
											%>
										</form>
										<div class="text-center">
											<button class="btn btn-default"
												id="p5-represent-portfolio-add-modal-btn" type="button">
												대표 포트폴리오 <span class="p5-fix">선택</span>
											</button>
											<button class="btn btn-cancel" data-dismiss="modal"
												type="button">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true"
							class="modal p5-profile-delete-modal fade "
							id="p5-delete-portfolio-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">포트폴리오 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="delete_portfolio_form" method="POST"
											style="display: none">
												<input name="delete_portfolio_id" type="hidden" value="" />
										</form>
										<p class="text-center bold-font">
											<span id="p5-modal-porfolio-title">"관심 키워드 기반 SNS
												안드로이드 앱"</span><br /> 포트폴리오를 정말 삭제하겠습니까?
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="p5-portfolio-delete-modal-btn">예</button>
												<a aria-hidden="true" class="btn btn-cancel"
													data-dismiss="modal">아니오</a>
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
	</div>
	<div id="push"></div>
	<jsp:include page="../../../footer.jsp" flush="false" />

<script>
$(document).ready(
function() {
	
	allignComponent('p5-portfolio-list');

	var split = location.href.split('/');
	var slug = split[5];
	var portfolioPK = 0;
	var portfolioTitle = '';

	$('.content-inner').on('click','#p5-represent-portfolio-add-modal-btn',function(e) {
		
	$.ajax({
	    type: "POST",
		url : '/wjm/partners/p/<%=account.getId()%>/portfolio/update/represent/',
	    data: $('#rep_porfolio_form').serialize(),  // 폼데이터 직렬화
	    dataType: "json",   // 데이터타입을 JSON형식으로 지정
	    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success : function(data) {
			$('#p5-add-represent-portfolio-modal').modal('toggle');
			var messages = data.messages;

	    	if(messages == "success")
	        	{
	    		location.href="/wjm/partners/p/<%=account.getId()%>/portfolio/update"; 
	        	}
	        else if(messages == "error")
	        	{
	        	location.href="/wjm/partners/p/<%=account.getId()%>/portfolio"; 
	        	}
	        else
	        	{
				$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
	        	}		
	    	}
	});
});

	//portfolio delete
	$('.content-inner').on('click','.p5-portfolio-delete-btn',function(e) {
				portfolioPK = $(this).attr('portfolio-pk');
				portfolioTitle = $(this).attr('portfolio-title');
		        $('[name="delete_portfolio_id"]').val(portfolioPK);
				$('#p5-modal-porfolio-title').html("'" + portfolioTitle + "'");
			});

	$('.content-inner').on('click','#p5-portfolio-delete-modal-btn',function(e) {
		e.preventDefault();
		$.ajax({
		    type: "POST",
			url : '/wjm/partners/p/<%=account.getId()%>/portfolio/update/delete_',
		    data: $('#delete_portfolio_form').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data) {
				$('#p5-delete-portfolio-modal').modal('toggle');
				 var messages = data.messages;

			    	if(messages == "success")
			        	{
			    		location.href="/wjm/partners/p/<%=account.getId()%>/portfolio/update"; 
			        	}
			        else if(messages == "error")
			        	{
			        	location.href="/wjm/partners/p/<%=account.getId()%>/portfolio"; 
			        	}
			        else
			        	{
						$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
			        	}			
			    	}
		});
	});

	$('.content-inner')
			.on(
					'click',
					'.p5-portfolio-checkbox',
					function() {
						if ($('.p5-portfolio-checkbox')
								.children()
								.children(
										'input:checked').length >= 3) {
							$(this)
									.children()
									.children(
											'input:not(:checked)')
									.attr('disabled',
											true);
						} else {
							$(this)
									.children()
									.children(
											'input:not(:checked)')
									.attr('disabled',
											false);
						}
					});

});

function allignComponent(wrapperId) {
	var element = $('.' + wrapperId).children();
	var cnt = 1;
	for (var i = 0; i < $('.' + wrapperId)
			.children().length; i++) {

		if (element.eq(i).css('display') == 'inline-block'
				|| element.eq(i).css('display') == 'block') {

			if (cnt % 3 == 0) {
				element.eq(i).css('margin-right',
						'0px');
				element.eq(i).css('margin-bottom',
						'20px');
			} else {
				element.eq(i).css('margin-right',
						'24px');
				element.eq(i).css('margin-bottom',
						'20px');
			}
			cnt++;
		}

	}

}
</script>
</body>
</html>