<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.PortfolioInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	PortfolioInfo portfolio = (PortfolioInfo) request.getAttribute("portfolio");
	String isSame = (String) request.getAttribute("isSame");

	String description = "";
	if (portfolio.getDescription() != null) {
		description = portfolio.getDescription();
		description = description.replaceAll("\r\n", "<br/>");
	}
%>
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
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow-before fa fa-caret-right"></i> <a
								class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.getPk() %>/update/">[
								포트폴리오 ]</a> <i class="p5-back-nav-arrow fa fa-caret-right"></i> [
							ㅁㅁㅁ ]
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/update/">자기 소개</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner"
						style="padding-top: 15px; padding-bottom: 25px;">
						<section class="p5-partition-title">
							<h3 class="header-text" style="margin-bottom: 30px">
								<%=portfolio.getName() %><span class="label label-sm label-open"
									style="margin-left: 4px; vertical-align: middle">대표작품</span> <span
									class="pull-right"><a class="btn btn-primary"
									href="/wjm/partners/p/<%=this_account.getId()%>/portfolio"
									style="margin-top: -7px;">내 프로필에서 보기</a></span>
							</h3>
						</section>
						<section>
							<h3 class="p5-portfolio-name"></h3>
							<table class="p5-partners-portfolio-info-table">
								<tbody>
									<tr>
										<td>카테고리<span class="p5-bar"></span></td>
										<td class="p5-portfolio-category text-muted"><%=portfolio.getCategoryL()%>
												&gt; <%=portfolio.getCategoryM()%></td>
									</tr>
									<tr>
										<td>설명<span class="p5-bar"></span></td>
										<td style="color: #999999;"><p
												class="p5-portfolio-category-description text-muted"></p>
											<p><%=description%></p>
											<p></p></td>
									</tr>
									<tr>
										<td>참여기간<span class="p5-bar"></span></td>
										<td class="p5-portfolio-participationTerm text-muted"><%=portfolio.getStart_date()%>
												- <%=portfolio.getEnd_date()%></td>
									</tr>
									<tr>
										<td>참여율<span class="p5-bar"></span></td>
										<td class="p5-portfolio-participationRate text-muted"><%=portfolio.getParticipation_rate()%>%</td>
									</tr>
									<tr>
										<td>이미지<span class="p5-bar"></span></td>
										<td class="p5-portfolio-img-list"><%
												boolean hasimg0=false, hasimg1=false, hasimg2=false;
												if(portfolio.getImg0()!=null)
													if(!portfolio.getImg0().isEmpty())
														hasimg0 = true;
												if(portfolio.getImg1()!=null)
													if(!portfolio.getImg1().isEmpty())
														hasimg1 = true;
												if(portfolio.getImg2()!=null)
													if(!portfolio.getImg2().isEmpty())
														hasimg2 = true;
												
												if(!hasimg0 && !hasimg1 && !hasimg2)
												{
											%>
											<span
												class="p5-no-partners-info-text">포트폴리오 <span
													class="text-center p5-bold">'이미지'</span>가 없습니다.
											</span>
											<% 
												}
												else
												{
													if(hasimg0)
													{%>
														<img
												src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.getImg0() %>" />
												<h5 class="text-muted"
													style="word-wrap: break-word; width: 632px;"><%=portfolio.getExplanation0() %></h5>
														
													<%}
													
													if(hasimg1)
													{%>
														<img
												src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.getImg1() %>" />
												<h5 class="text-muted"
													style="word-wrap: break-word; width: 632px;"><%=portfolio.getExplanation1() %></h5>
																							
													<%}
													
													if(hasimg2)
													{%>
														<img
												src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.getImg2() %>" />
												<h5 class="text-muted"
													style="word-wrap: break-word; width: 632px;"><%=portfolio.getExplanation2() %></h5>
														
													<%}
												}
											%>
											</td>
									</tr>
								</tbody>
							</table>
							<span class="pull-right"><a
								class="btn btn-default p5-portfolio-fix-btn p5-btn-left"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.getPk() %>/update/edit/">수정</a>
							<button class="btn btn-cancel p5-portfolio-delete-btn"
									data-target="#p5-delete-portfolio-modal" data-toggle="modal">삭제</button></span>
						</section>
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
											<span id="p5-modal-porfolio-title">"<%=portfolio.getName() %>"</span><br /> 포트폴리오를 정말 삭제하겠습니까?
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
		<div id="push"></div>
	</div>
	<jsp:include page="../../../../footer.jsp" flush="false" />

	<script>
    $(document).ready(function() {
        $('.content-inner').on('click','#p5-portfolio-delete-modal-btn', function(e) {
            e.preventDefault();
	        
            $('[name="delete_portfolio_id"]').val(<%=portfolio.getPk()%>);
            
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
</body>
</html>