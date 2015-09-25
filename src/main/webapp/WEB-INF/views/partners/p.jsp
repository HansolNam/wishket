<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.TechniqueInfo, java.util.List"%>
<%@ page
	import="com.wjm.models.LicenseInfo, com.wjm.models.EducationInfo, com.wjm.models.CareerInfo, com.wjm.models.Partners_infoInfo, com.wjm.models.PortfolioInfo"%>

<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	String introduction = (String) request.getAttribute("introduction");
	Partners_infoInfo info = (Partners_infoInfo) request.getAttribute("info");
	List<PortfolioInfo> portfolio = (List<PortfolioInfo>) request.getAttribute("portfolio");
	if (portfolio != null && portfolio.size() == 0)
		portfolio = null;
	List<TechniqueInfo> skill = (List<TechniqueInfo>) request.getAttribute("skill");
	if (skill != null && skill.size() == 0)
		skill = null;
	List<CareerInfo> career = (List<CareerInfo>) request.getAttribute("career");
	if (career != null && career.size() == 0)
		career = null;
	List<EducationInfo> education = (List<EducationInfo>) request.getAttribute("education");
	if (education != null && education.size() == 0)
		education = null;
	List<LicenseInfo> license = (List<LicenseInfo>) request.getAttribute("license");
	if (license != null && license.size() == 0)
		license = null;
	String isSame = (String) request.getAttribute("isSame");
	introduction = introduction.replaceAll("\r\n", "<br/>");
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

<title>외주몬(WJM) · <%=this_account.getAccount_type()%> - <%=this_account.getId()%></title>
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

		<jsp:include page="../header2.jsp" flush="false" />
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
								src="${pageContext.request.contextPath}/<%=this_accountinfo.getProfile_img() %>" />
							<h4 class="partners-username-bottom"><%=this_account.getId()%>
							</h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/">전체보기</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/">자기
									소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/">포트폴리오</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/wjm/partners/p/<%=this_account.getId()%> /evaluation/">클라이언트의
									평가</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/history/">위시켓에서
									진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">

						<h2 class="p5-header-text">
							<span style="margin-right: 12px;"><%=this_account.getId()%></span>
							<span
								class="label label-md label-partners-availability possible ">
								<%
									if (info == null)
										out.print("황동 가능성 미입력");
									else
										out.print(info.getAvailability());
								%>
							</span>
							<%
								if (isSame != null) {
							%><a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/"
								style="margin-top: 7px;">업데이트 하기</a>
							<%
								}
							%>
						</h2>

						<h5 class="p5-basic-info-underground">
							<span> <span>
									<%
										if (info == null)
											out.print("직종 미입력");
										else
											out.print(info.getJob());
									%>
							</span><span class="p5-basic-info-seperator">|</span></span> <span> <span>개인</span><span
								class="p5-basic-info-seperator">|</span></span> <span
								class="text-muted"><span>신원 미인증</span><span
								class="p5-basic-info-seperator">|</span></span> <span
								class="text-muted"> <span>연락처 미등록</span></span>
						</h5>
						</section>
						<section class="profile-info"
							style="padding-bottom:30px; border-bottom:1px dashed #dedede">
						<div class="profile-info-inner">
							<div class="profile-activity-summary-info">
								<span class="p5-2spanRight"><h5>활동 요약 정보</h5>
									<div class="star-ultra p5-averageScore-star star-ultra-0"
										style="width: 161px;"></div>
									<div>
										평균평점 <span class="pull-right p5-average-review-title"><span
											class="p5-averageScore p5-">0.0</span> <span
											class="text-muted bold-font">/ 평가 <span
												class="p5-reviewCount">0</span>개
										</span></span>
									</div>
									<div>
										계약한 프로젝트<span class="p5-contractCount">0 <span>건</span></span>
									</div>
									<div>
										포트폴리오<span class="p5-portfolioCount">
											<%
												if (portfolio == null)
													out.print("0");
												else
													out.print(portfolio.size());
											%><span>개</span>
										</span>
									</div></span>
								<div style="clear: right"></div>
							</div>
							<div id="myChart_rader_tooltip" style="float: left"
								title="파트너님은 위시켓에서 진행한 프로젝트가 없습니다.">
								<div class="profile-detail-evaluation">
									<h5>세부 항목 평가</h5>
									<canvas id="myChart_rader"></canvas>
									<div style="clear: left"></div>
								</div>
							</div>
							<div id="myChart_tooltip" style="float: left"
								title="파트너님은 위시켓에서 진행한 프로젝트가 없습니다.">
								<div class="profile-main-category">
									<h5>진행한 카테고리</h5>
									<div>
										<canvas height="105" id="myChart" width="130"></canvas>
										<ul class="doughnut-legend">
											<li><span style="background-color: #dedede;"></span>진행한
												프로젝트 없음</li>
										</ul>
										<div style="clear: left"></div>
									</div>
								</div>
							</div>
							<div style="clear: left"></div>
						</div>
						</section>
						<section>
						<div class="p5-2spanInfo">
							<div>
								<h4 class="p5-page-title" style="margin-top: 25px;">
									자기소개
									<%
									if (isSame != null) {
								%>
									<a class="btn btn-primary pull-right"
										href="/wjm/partners/p/<%=this_account.getId()%>/introduction/update/"
										style="margin-top: -7px;">업데이트 하기</a>
									<%
										}
									%>
								</h4>

								<%
									if (introduction != null) {
								%>
								<div class="p5-description-hasvalue"
									style="text-overflow: ellipsis; overflow: hidden; word-wrap: break-word; margin-bottom: 30px;">
									<%=introduction%>
								</div>
								<%
									if (isSame == null) {
								%>
								<div>
									<h6 class="pull-right" style="margin-top: -20px;">
										<a class="p5-more-introduction"
											href="/wjm/partners/p/<%=this_account.getId()%>/introduction/">자기소개
											더 보기 &gt;</a>
									</h6>
								</div>
								<%
									}
								%>
								<%
									} else {
								%>
								<div class="p5-empty-component-md">
									<div class="p5-assign-component">
										<div>
											<div>
												입력된 <span class="text-center p5-bold">'자기소개'</span>가 없습니다.
												</p>
											</div>
										</div>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
						</section>
						<section class="p5-partition p5-portfolio-partition">
						<h4 class="p5-page-title">
							포트폴리오<%
							if (isSame != null) {
						%><a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/"
								style="margin-top: -7px;">업데이트 하기</a>
							<%
								}
							%>
						</h4>
						<div class="p5-represent-portfolio-img-list">
							<%
								if (portfolio == null) {
							%>

							<span class="p5-portfolio-no-img3"><div>
									<div>
										<div class="p5-no-partners-info-text">
											등록된 <span class="p5-bold">'포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
							<%
								} else {
							%>
							<div class="p5-represent-portfolio-img-list">
								
								<%
									int portfolionum = portfolio.size();
									if(portfolionum>3) portfolionum = 3;
									for(int i=0;i<portfolionum;i++)
									{
								%>
								<span category-id="<%=portfolio.get(i).getCategoryL() %>" subcategory-id="<%=portfolio.get(i).getCategoryM() %>" style="width:210px"><img
									src="/resources/upload/portfolio/<%=portfolio.get(i).getImg0() %>"><a
									href="/wjm/partners/p/<%=this_account.getId() %>/portfolio/<%=portfolio.get(i).getPk() %>/update/"><span
										class="p5-img-info"><div class="p5-img-brief-info">
												<div class="p5-img-title text-right"><%=portfolio.get(i).getName() %></div>
												<div class="p5-img-category text-right"><%=portfolio.get(i).getCategoryL() %> &gt; <%=portfolio.get(i).getCategoryM() %></div>
												<div class="p5-img-project-date text-right"><%=portfolio.get(i).getStart_date() %> ~
													<%=portfolio.get(i).getEnd_date() %></div>
											</div>
											</span>
										</a>
									</span> 
								<%
									}
								%>
							</div>
							<%
								}
							%>
						</div>
						</section>
						<section class="p5-partition">
						<h4 class="p5-page-title">
							보유 기술<%
							if (isSame != null) {
						%><a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/"
								style="margin-top: -7px;">업데이트 하기</a>
							<%
								}
							%>
						</h4>
						<%
							if (skill == null) {
						%> <span><div class="p5-partners-no-info">
								<div class="p5-assign-component">
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/static/img/profile_skill.png" />
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'보유 기술'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> <%
 	} else {
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
									for (int i = 0; i < skill.size(); i++) {
											if (i == 8)
												break;
								%>
								<tr>
									<td class="p5-head-title"><%=skill.get(i).getName()%>
										<%
											if (skill.get(i).getRepresentative() == 1)
														out.print("<span class='label label-sm label-open'>대표 보유 기술</span>");
										%></td>
									<td class="p5-head-rating"><%=skill.get(i).getSkill()%></td>
									<td class="p5-head-experience"><%=skill.get(i).getExperience()%></td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>

						<%
							if (isSame == null) {
						%>
						<div>
							<h6 class="pull-right" style="margin-top: -20px;">
								<a class="p5-more-introduction"
									href="/wjm/partners/p/<%=this_account.getId()%>/skill/">보유기술
									더 보기 &gt;</a>
							</h6>
						</div>
						<%
							}
						%> <%
 	}
 %> </section>
						<section class="p5-partition"> <section>
						<h4 class="p5-page-title">
							경력<%
							if (isSame != null) {
						%><a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/"
								style="margin-top: -7px;">업데이트 하기</a>
							<%
								}
							%>
						</h4>
						<span> <%
 	if (career == null) {
 %>
							<div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'경력'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div> <%
 	} else {
 %>
							<table class="table table-responsive table-hover p5-career-table">
								<thead>
									<tr>
										<th class="p5-head-companyName">회사명</th>
										<th class="p5-head-work">근무부서 및 담당업무</th>
										<th class="p5-head-position">직위</th>
										<th class="p5-head-period">근무기간</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < career.size(); i++) {
									%>

									<tr>
										<td class="p5-head-companyName"><%=career.get(i).getCompany_name()%></td>
										<td class="p5-head-work"><%=career.get(i).getDepartment()%></td>
										<td class="p5-head-position"><%=career.get(i).getPosition()%></td>
										<td class="p5-head-period"><%=career.get(i).getStart_date()%>~<br><%=career.get(i).getEnd_date()%>
										</td>
									</tr>

									<%
										}
									%>
								</tbody>
							</table> <%
 	}
 %>
						</span></section> <section>
						<h4 class="p5-page-title">학력</h4>

						<%
							if (education == null) {
						%> <span><div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'학력'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> <%
 	} else {
 %>
						<table
							class="table table-responsive table-hover p5-educationalHistory-table">
							<thead>
								<tr>
									<th class="p5-head-schoolName">학교명</th>
									<th class="p5-head-schoolClassification">분류</th>
									<th class="p5-head-major">전공</th>
									<th class="p5-head-status">상태</th>
									<th class="p5-head-entranceDate">입학일</th>
									<th class="p5-head-graduationDate">졸업일</th>

								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < education.size(); i++) {
								%>

								<tr>
									<td class="p5-head-schoolName"><%=education.get(i).getSchool_name()%></td>
									<td class="p5-head-schoolClassification"><%=education.get(i).getLevel()%></td>
									<td class="p5-head-major"><%=education.get(i).getMajor()%></td>
									<td class="p5-head-status"><%=education.get(i).getState()%></td>
									<td class="p5-head-entranceDate"><%=education.get(i).getStart_date()%></td>
									<td class="p5-head-graduationDate"><%=education.get(i).getEnd_date()%></td>

								</tr>
								<%
									}
								%>

							</tbody>
						</table>
						<%
							}
						%> </section> <section>
						<h4 class="p5-page-title">자격증</h4>

						<%
							if (license == null) {
						%> <span><div class="p5-empty-component-md">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-text text-center">
											등록된 <span class="text-center p5-bold">'자격증'</span>이 없습니다.
										</div>
									</div>
								</div>
							</div></span> <%
 	} else {
 %>
						<table
							class="table table-responsive table-hover p5-certificate-table">
							<thead>
								<tr>
									<th class="p5-head-classification">구분</th>
									<th class="p5-head-certificateNumber">자격증번호</th>
									<th class="p5-head-certificateDepartment">발행처</th>
									<th class="p5-head-certificateDate">발행일자</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < license.size(); i++) {
								%>

								<tr>
									<td class="p5-head-classification"><%=license.get(i).getName()%></td>
									<td class="p5-head-certificateNumber"><%=license.get(i).getSerial_num()%></td>
									<td class="p5-head-certificateDepartment"><%=license.get(i).getPublishing_office()%></td>
									<td class="p5-head-certificateDate"><%=license.get(i).getPublication_date()%></td>
								</tr>

								<%
									}
								%>

							</tbody>
						</table>
						<%
							}
						%> </section></section>
						<section class="p5-evaluation-list">
						<h4 class="p5-page-title">
							평가<%
							if (isSame != null) {
						%><a class="btn btn-primary pull-right"
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/"
								style="margin-top: -7px; *margin-top: -17px;">업데이트 하기</a>
							<%
								}
							%>
						</h4>
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<img
										src="${pageContext.request.contextPath}/resources/static/img/profile_evaluation.png" />
									<p class="p5-no-partners-info-text">
										등록된 <span class="text-center p5-bold">'평가'</span>가 없습니다.
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
	<jsp:include page="../footer.jsp" flush="false" />

	<link
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"
		rel="stylesheet" />
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/static/js/Chart.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/static/js/excanvas.js"
		type="text/javascript"></script>
	<script>
    $(document).ready(function() {
        $('.content-inner').on('click','.p5-review-show-btn', function(e) {
            e.preventDefault();
            $(this).children('span').html('간단히 보기');
            $(this).children('.fa-sort-asc').css('display','none');
            $(this).children('.fa-sort-desc').css('display','inline');

            $(this).parent().parent().siblings('.p5-review-specific-info').removeClass('p5-hidden-component');
            $(this).removeClass('p5-review-show-btn').addClass('p5-review-hide-btn');
        });

        $('.content-inner').on('click','.p5-review-hide-btn', function(e) {
            e.preventDefault();
            $(this).children('span').html('자세히 보기');
            $(this).children('.fa-sort-desc').css('display','none');
            $(this).children('.fa-sort-asc').css('display','inline');

            $(this).parent().parent().siblings('.p5-review-specific-info').addClass('p5-hidden-component');
            $(this).removeClass('p5-review-hide-btn').addClass('p5-review-show-btn');
        });
    });

    $(function(){
        $(document).tooltip({
            position: {
                my: "center bottom",
                at: "center top-10",
                using: function (position, feedback) {
                    $(this).css(position);
                    $("<div>").addClass("arrow")
                              .addClass(feedback.vertical)
                              .addClass(feedback.horizontal)
                              .appendTo(this);
                }
            }
        })
    });

    $(document).ready(function(){

        var cnt=$(".doughnut-legend ").children().length;
        var marginTop;
        if(cnt===1){
            marginTop="46px"
        }
        else if(cnt===2){
            marginTop="39px"
        }
        else if(cnt===3){
            marginTop="32px"
        }
        else if(cnt===4){
            marginTop="25px"
        }
        else if(cnt===5){
            marginTop="18px"
        }
        else if(cnt===6){
            marginTop="11px"
        }
        else if(cnt===7){
            marginTop="4px"
        }

        $(".doughnut-legend").css({
            "margin-top" : marginTop
        })
    });

    window.onload = function(){
        Chart.defaults.global.tooltipFontSize = 10;

        if($("#myChart").length) {

            var data =[
            
                
                    {
                        value: 1,
                        color: '#dedede',
                        highlight: '#dedede',
                        label: "진행한 프로젝트 없음"
                    }
                
            ];

            new Chart(document.getElementById("myChart").getContext("2d")).Doughnut(data, {
                animation: false,
                tooltipFontSize: 8,
                
                showTooltips: false
                
            });
        }


        if($("#myChart_rader").length)
        {
            var review_data = new Array(5);
            for (var i = 0; i < review_data.length; i++) {
                review_data[i] = Number($('.p5-review-star').children().eq(2 * i + 1).text());
            }
            var ctx1 = document.getElementById("myChart_rader").getContext("2d");
            var data = {
                labels: ["전문성", "만족도", "의사소통", "일정준수", "적극성"],
                datasets: [{
                        pointColor: "#42ab8c",
                        fillColor: "rgba(66,171,140, 0.2)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [
                            0,
                            0,
                            0,
                            0,
                            0
                        ]
                    }]
                };

            window.RadarChart = new Chart(ctx1).Radar(data, {
                datasetStrokeWidth: 1,
                animation: false,
                responsive: false,
                pointDot: true,
                scaleOverride: true,
                scaleSteps: 5,
                scaleStepWidth: 1,
                scaleStartValue: 0,
                pointDotStrokeWidth: 2,
                
                showTooltips: false
                
            });
        }
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