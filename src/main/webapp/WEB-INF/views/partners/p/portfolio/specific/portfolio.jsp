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
								href="/wjm/partners/p/<%=this_account.getId()%>/">[ <%=this_account.getId()%>님의
								프로필 ]
							</a> <i class="p5-back-nav-arrow-before fa fa-caret-right"></i> <a
								class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">[
								포트폴리오 ]</a> <i class="p5-back-nav-arrow fa fa-caret-right"></i> [ <%=portfolio.getName() %> ]
						</p>
					</div>
				</div>
				<div class="page-inner">
					<div class="sidebar">
						<div class="partners-name-tag">
							<h3 class="partners-name-tag-heading">파트너스</h3>
							<div class="partners-name-tag-body">
								<img alt="<%=this_account.getId()%> 사진"
									class="p5-partners-img-lg"
									src="/media/profiles/28338_20150925_9e9210bab53e9b4c.png" />
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
								<li class="active"><a
									href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
								<li class=""><a
									href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유
										기술</a></li>
								<li class=""><a
									href="/wjm/partners/p/<%=this_account.getId()%>/background/">경력,
										학력, 자격증</a></li>
								<li class="" style="border-top: 1px dashed #dedede"><a
									href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/">클라이언트의
										평가</a></li>
								<li class=""><a
									href="/wjm/partners/p/<%=this_account.getId()%>/history/">위시켓에서
										진행한 프로젝트</a></li>
							</ul>
						</div>
					</div>
					<div class="content">
						<div class="content-inner"
							style="padding-top: 15px; padding-bottom: 25px;">
							<section>
								<h3 class="portfolio-head">
									<%=portfolio.getName() %><span class="label label-sm label-open"
										style="margin-left: 4px; vertical-align: middle">대표작품</span> <%if(isSame != null){ %><a
										class="btn btn-primary pull-right"
										href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.getPk()%>/update/">업데이트
										하기</a><%} %>
								</h3>
								<div class="portfolio-head-nav">
									<small style="float: left;"><%=this_account.getId()%>님의 포트폴리오 </small>
									<div class="portfolio-nav-control-box" style="float: right">
										<div class="page-button-box">
											<div class="left_page_active"
												onclick="go_portfolio('/wjm/partners/p/<%=this_account.getId()%>/portfolio/<%=portfolio.getPk()%>/')"></div>
											<div class="right_page_nonactive" onclick="go_portfolio('')"></div>
										</div>
									</div>
									<div style="clear: both"></div>
								</div>
							</section>
							<section class="p5-partition portfolio_detail_section">
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
											<td class="p5-portfolio-img-list">
											<%
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
							</section>
							<section style="clear: both;">
								<div class="page_control_box">
									<a href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/"><div
											class="back_list_box">
											<i class="fa fa-chevron-left"></i>
											<div>목록으로 돌아가기</div>
										</div></a>
								</div>
								<div style="clear: both"></div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../../../footer.jsp" flush="false" />

	<script>
		$(document)
				.ready(
						function() {
							var current = +($('#similar_list_page').text()), max = +($('#similar_list_max_page')
									.text());

							if (current == max) {
								$('#similar_page_button_after').attr('class',
										'right_page_nonactive');
							} else {
								$('#similar_page_button_after').attr('class',
										'right_page_active');
							}

							if (max == 1) {
								var similarTemp = '';
								var similarTempCnt = $('.similar-portfolio').length;
								if (similarTempCnt != 3) {
									similarTemp = '<span class="p5-portfolio-no-img'
											+ (3 - similarTempCnt)
											+ '">'
											+ '<div>'
											+ '<div>'
											+ '<img src="${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png">'
											+ "<p class='p5-no-partners-info-text'><span class='text-center p5-bold'>'유사 포트폴리오'</span>가 없습니다.</p>"
											+ '</div>' + '</div>' + '</span>';
									$('.p5-similar-portfolio-list').append(
											similarTemp);
								}
							}

							current = +($('#other_list_page').text());
							max = +($('#other_list_max_page').text());

							if (current == max) {
								$('#other_page_button_after').attr('class',
										'right_page_nonactive');
							} else {
								$('#other_page_button_after').attr('class',
										'right_page_active');
							}
							if (current == 1) {
								$('#other_page_button_before').attr('class',
										'left_page_nonactive');
							} else {
								$('#other_page_button_before').attr('class',
										'left_page_active');
							}

						});

		function go_portfolio(url) {
			location.replace(url);
		}

		function other_page_after() {
			var current = +($('#other_list_page').text()), max = +($('#other_list_max_page')
					.text());
			if (current < max) {
				current++;
				$('#other_list_page').text(current);
				$
						.each(
								$('.other_portfolio_list').children(),
								function(i, item) {
									$(this).css('display', 'none');
									if ($(this).children($('.other_portfolio'))
											.attr('portfolio-number') > current * 5 - 5
											&& $(this).children(
													$('.other_portfolio'))
													.attr('portfolio-number') <= current * 5) {
										$(this).css('display', 'inline-block');
									}
								});
			}
			if (current == 1) {
				$('#other_page_button_before').attr('class',
						'left_page_nonactive');
			} else {
				$('#other_page_button_before')
						.attr('class', 'left_page_active');
			}
			if (current == max) {
				$('#other_page_button_after').attr('class',
						'right_page_nonactive');
			} else {
				$('#other_page_button_after')
						.attr('class', 'right_page_active');
			}

		}

		function other_page_before() {
			var current = +($('#other_list_page').text()), max = +($('#other_list_max_page')
					.text());
			if (current > 1) {
				current--;
				$('#other_list_page').text(current);
				$
						.each(
								$('.other_portfolio_list').children(),
								function(i, item) {
									$(this).css('display', 'none');
									if ($(this).children($('.other_portfolio'))
											.attr('portfolio-number') > current * 5 - 5
											&& $(this).children(
													$('.other_portfolio'))
													.attr('portfolio-number') <= current * 5) {
										$(this).css('display', 'inline-block');
									}
								});
			}
			if (current == 1) {
				$('#other_page_button_before').attr('class',
						'left_page_nonactive');
			} else {
				$('#other_page_button_before')
						.attr('class', 'left_page_active');
			}
			if (current == max) {
				$('#other_page_button_after').attr('class',
						'right_page_nonactive');
			} else {
				$('#other_page_button_after')
						.attr('class', 'right_page_active');
			}
		}

		function similar_page_before() {
			var current = +($('#similar_list_page').text()), max = +($('#similar_list_max_page')
					.text());
			if (current > 1) {
				current--;
				$('#similar_list_page').text(current);
				$.each($('.p5-similar-portfolio-list').children(), function(i,
						item) {
					$(this).css('display', 'none');
					if ($(this).attr('similar-number') > current * 3 - 3
							&& $(this).attr('similar-number') <= current * 3) {
						$(this).css('display', 'inline');
					}
				});
			}
			if (current == 1) {
				$('#similar_page_button_before').attr('class',
						'left_page_nonactive');
			} else {
				$('#similar_page_button_before').attr('class',
						'left_page_active');
			}
			if (current == max) {
				$('#similar_page_button_after').attr('class',
						'right_page_nonactive');
			} else {
				$('#similar_page_button_after').attr('class',
						'right_page_active');
			}
		}

		function similar_page_after() {
			var current = +($('#similar_list_page').text()), max = +($('#similar_list_max_page')
					.text());
			if (current < max) {
				current++;
				$('#similar_list_page').text(current);
				$.each($('.p5-similar-portfolio-list').children(), function(i,
						item) {
					$(this).css('display', 'none');
					if ($(this).attr('similar-number') > current * 3 - 3
							&& $(this).attr('similar-number') <= current * 3) {
						$(this).css('display', 'inline');
					}
				});
			}
			if (current == 1) {
				$('#similar_page_button_before').attr('class',
						'left_page_nonactive');
			} else {
				$('#similar_page_button_before').attr('class',
						'left_page_active');
			}
			if (current == max) {
				$('#similar_page_button_after').attr('class',
						'right_page_nonactive');
			} else {
				$('#similar_page_button_after').attr('class',
						'right_page_active');
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			wishket.init();

			svgeezy.init(false, 'png');
		});
	</script>
	<script>
		$(document).ready(
				function($) {
					var p5TotalSubNavigationFlag = 0;

					if ($(window).width() >= 1200) {
						$('.p5-side-nav-deactive').css('display', 'none');
					} else {
						$('.p5-side-nav-active').css('display', 'none');
						$('.p5-side-nav-deactive').css('display', 'block');
					}

					$('.content-inner')
							.on(
									'click',
									'.p5-side-nav-active-btn',
									function() {
										$('.p5-side-nav-active').css('display',
												'none');
										$('.p5-side-nav-deactive').css(
												'display', 'block');
									});

					$('.content-inner').on(
							'click',
							'.p5-side-nav-deactive-btn',
							function() {
								$('.p5-side-nav-active')
										.css('display', 'block');
								$('.p5-side-nav-deactive').css('display',
										'none');
							});

					$(window).scroll(
							function() {
								if ($(window).scrollTop() > 87
										&& p5TotalSubNavigationFlag === 0) {
									setTimeout(function() {
										$('#p5-total-sub-navigation-wrapper')
												.removeClass('hide fadeOut');
										$('#p5-total-sub-navigation-wrapper')
												.addClass('fadeInDown');
									}, 200);
									flag = 1;

								} else if ($(window).scrollTop() <= 87) {
									p5TotalSubNavigationFlag = 0;
									$('#p5-total-sub-navigation-wrapper')
											.removeClass('fadeInDown');
									$('#p5-total-sub-navigation-wrapper')
											.addClass('fadeOut');
									setTimeout(function() {
										$('#p5-total-sub-navigation-wrapper')
												.addClass('hide');
									}, 200);
								}
							});
				});
	</script>
</body>
</html>