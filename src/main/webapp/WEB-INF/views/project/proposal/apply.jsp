<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.ProjectInfo, com.wjm.models.AccountInfo, com.wjm.models.PortfolioInfo, com.wjm.main.function.Time, java.sql.Timestamp, java.util.List"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<PortfolioInfo> portfolio = (List<PortfolioInfo>) request.getAttribute("portfolio");
	ProjectInfo project = (ProjectInfo) request.getAttribute("project");
	
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
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

<title>외주몬(WJM) · '<%=project.getName() %>'에 지원하기</title>
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
<!--[if lt IE 10]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/ie-for-class.css" /><![endif]-->
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
<body class="logged-in partners proposal-applicant  proposal-applicant ">
	<jsp:include page="../../header2.jsp" flush="false" />
	<div id="wrap">
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						'<%=project.getName()%>'에 지원하기 <small class="small-text">기간과
							금액을 산정하여 지원해주세요.</small>
					</h3>
				</div>
				<div class="content-inner" style="padding-bottom: 20px;">
					<div class="proposal-summary">
						<div class="project-detail-basic-info">
							<div class="budget">
								<i class="fa fa-krw"></i> <span class="title">예상금액</span>
								<%=project.getBudget()%>원
							</div>
							<div class="term">
								<i class="fa fa-clock-o"></i> <span class="title">예상기간</span>
								<%=project.getPeriod()%>일
							</div>
							<div class="deadline">
								<i class="fa fa-pencil"></i> <span class="title">모집마감</span>
								<%=Time.toString3(project.getDeadline())%>
							</div>
						</div>
						<div class="project-detail-meta-info">
							<div class="project-data-box">
								<div class="title one">기획 상태</div>
								<div class="data d-one"><%
										if (project.getPlan_status().equals("idea"))
											out.print("아이디어");
										else if (project.getPlan_status().equals("simple"))
											out.print("간단한 정리");
										else if (project.getPlan_status().equals("project_book"))
											out.print("상세한 기획 문서");
									%></div>
								<div class="title two">매니징 경험</div>
								<div class="data d-two"><%
										if (project.getManaging() == 1)
											out.print("있음");
										else
											out.print("없음");
									%></div>
								<div class="title three">등록 일자</div>
								<div class="data d-three"><%=Time.toString3(project.getReg_date())%></div>
							</div>
							<div class="project-data-box bottom-box">
								<div class="title one">예상 시작일</div>
								<div class="data d-one"><%=Time.toString3(project.getStart_date())%></div>
								<div class="title two">미팅 방식</div>
								<div class="data d-two"><%
										if (project.getMeeting_type().equals("ONLINE"))
											out.print("온라인 미팅");
										else
											out.print("오프라인 미팅");
									%></div>
								<div class="title three">진행 지역</div>
								<div class="data d-three"><%=project.getMeeting_area()%> &gt; <%=project.getMeeting_area_detail()%></div>
							</div>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 내용</div>
							<%=project.getDescription().replaceAll("\r\n", "<br/>")%>
							</div>
							<div class="project-skill-required">
								<div class="skill-required-title" style="margin-top: 20px;">관련
									기술</div>
								<%
								String[] skill = project.getTechnique().split(",");
								for (int i = 0; i < skill.length; i++) {
									out.println("<span class='project-skill label-skill'>" + skill[i] + "</span>");
								}
							%>
							</div>
						</div>
						<div class="data-expand-btn" data-status="close"
							onclick="toggle_data_size(this)">
							자세히보기 <b class="fa fa-caret-down"></b>
						</div>
						<p class="text-danger" style="margin-bottom: 0;">
							<span class="label label-danger">주의</span> 위 내용은 클라이언트의 제시 기간 및
							금액으로 충분히 변동 가능합니다.
						</p>
					</div>
				</div>
				<div class="sidebar" style="float: right !important;">
					<div class="inner">
						<div class="proposal-guide-box">
							<div class="guide-box">
								<div class="number-box">
									<img src="${pageContext.request.contextPath}/resources/static/img/proposal/guide_number_one.png" />
								</div>
								<div class="text-box">
									<p class="guide-title">프로필</p>
									<p class="guide-body">
										<strong>프로필과 포트폴리오</strong>가 매력적일수록 프로젝트를 진행할 기회가 많아집니다.
									</p>
								</div>
							</div>
							<div class="guide-box">
								<div class="number-box">
									<img src="${pageContext.request.contextPath}/resources/static/img/proposal/guide_number_two.png" />
								</div>
								<div class="text-box">
									<p class="guide-title">지원내용</p>
									<p class="guide-body">
										<strong>프로젝트 내용을 분석</strong>하여,<br />어떤 방식으로 프로젝트를 진행할지 구체적으로
										설명해주세요.
									</p>
								</div>
							</div>
							<div class="guide-box">
								<div class="number-box">
									<img src="${pageContext.request.contextPath}/resources/static/img/proposal/guide_number_three.png" />
								</div>
								<div class="text-box">
									<p class="guide-title">금액과 기간</p>
									<p class="guide-body">
										<strong>금액과 기간은 고정되어 있지 않습니다.</strong> 제공할 수 있는 서비스에 대한 합리적인
										견적을 산정해주세요.
									</p>
								</div>
							</div>
							<div class="guide-box guide-alert-box"
								style="margin-bottom: 10px;">
								<div class="number-box">
									<img src="${pageContext.request.contextPath}/resources/static/img/proposal/guide_alert.png" />
								</div>
								<div class="text-box">
									<p class="guide-body">프로젝트와 무관한 포트폴리오의 단순 나열이나, 과도한 홍보글은
										지원서의 신뢰를 떨어뜨릴 수 있습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-inner" style="margin-top: 5px;">
					<div class="proposal-form">
						<div class="proposal-form-title"
							style="padding-bottom: 15px; margin-bottom: 25px; border-bottom: 1px dashed #dedede">
							<span
								style="font-size: 24px; color: #555; font-weight: bold; line-height: 24px;">'<%=project.getName()%>'의 지원서 작성</span>
						</div>
						<form action="." class="form-horizontal" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="UrfEdIo7bkTF44xh4WtL6MveRrufwODk" /><span
								class="help-block"></span>
							<div class="form-group proposal-budget-form-group ">
								<label class="control-label required" for="estimated_budget"><span>*</span>지원
									금액</label>
								<div class="control-wrapper">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-krw"></i></span><input
											class="form-control" id="estimated_budget"
											name="estimated_budget" required="required" type="text" />
									</div>
									<span class="help-block">희망 금액을 원 단위로 입력해 주세요. (예
										100,000,000)<br />
									<p class="text-danger">
											<span class="label label-danger">주의</span> 위시켓 수수료 10%를 포함한
											가격입니다.
										</p>
									</span>
								</div>
							</div>
							<div class="form-group proposal-term-form-group ">
								<label class="control-label required" for="estimated_term"><span>*</span>지원
									기간</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input class="form-control" id="estimated_term"
											name="estimated_term" required="required" type="text" /><span
											class="input-group-addon">일</span>
									</div>
									<span class="help-block">프로젝트를 진행할 희망 기간을 일 단위로 입력해 주세요.
										(최대 3자리)</span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="body"><span>*</span>지원
									내용</label>
								<div class="control-wrapper">
									<textarea class="form-control" cols="40" id="body" name="body"
										required="" rows="15">&lt;프로젝트에 대한 분석/제안 등&gt;


&lt;프로젝트에 관련된 경험과 기술 등&gt;</textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하여
											직거래를 유도하는 경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
								</div>
							</div>
							<div class="form-group related-portfolio-form-group ">
								<label class="control-label" for="has_related_portfolio"
									style="cursor: default"><span
									class="label label-sm label-info"
									style="padding: .2em .3em .2em; font-size: 10px;">Beta</span> <span
									style="cursor: pointer">관련 포트폴리오</span></label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline"
											for="has_related_portfolio_1"><input
												id="has_related_portfolio_1" name="has_related_portfolio"
												type="radio" value="True" />관련된 포트폴리오가 있습니다.</label></li>
										<li><label class="radio-inline"
											for="has_related_portfolio_2"><input
												id="has_related_portfolio_2" name="has_related_portfolio"
												type="radio" value="False" />없습니다.</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
							<div id="related_portfolio_box"
								style="border-top: 1px dashed #dedede; padding-top: 20px; display: none;">
								<div class="process-guide-box">
									<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
										style="float: left" />
									<p class="process-guide-text" style="float: left">
										1. 관련 포트폴리오는 이미 등록한 포트폴리오 중 <strong>최대 3개</strong>까지 선택이
										가능합니다.<br /> 2. 관련 포트폴리오를 진행했던 <strong>경험과 진행 과정, 핵심
											요소</strong> 등에 대해 상세히 작성해주세요.<br />
									</p>
									<div style="clear: both;"></div>
								</div>
								<div class="form-group">
									<label class="control-label" for="form.related_portfolio">관련
										포트폴리오</label>
									<div class="control-wrapper">
										<div class="related-portfolio-group"
											id="selected_portfolio_showroom">
											<div class="none-selected-box">
												<div class="nth-text-box">
													<p>
														첫번째<br /> 관련<br /> 포트폴리오
													</p>
												</div>
											</div>
											<div class="none-selected-box">
												<div class="nth-text-box">
													<p>
														두번째<br /> 관련<br /> 포트폴리오
													</p>
												</div>
											</div>
											<div class="none-selected-box">
												<div class="nth-text-box">
													<p>
														세번째<br /> 관련<br /> 포트폴리오
													</p>
												</div>
											</div>
											<div style="clear: both;"></div>
										</div>
										<div class="btn btn-primary"
											data-target="#related-portfolio-select-modal"
											data-toggle="modal">
											<i class="fa fa-plus"></i> 관련 포트폴리오 선택
										</div>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label" for="related_description">관련
										포트폴리오 설명</label>
									<div class="control-wrapper">
										<textarea class="form-control" cols="40"
											id="related_description" name="related_description" rows="5"></textarea>
										<span class="help-block" id="portfolio_description_help"
											style="display: none"><i
											class="fa fa-exclamation-circle"></i>500자 이하로 입력해 주세요.</span> <span
											class="help-block">한글 기준 500자 미만</span>
									</div>
								</div>
								<input id="first_related_portfolio_id" name="related_portfolio"
									type="hidden" value="" /><input
									id="second_related_portfolio_id" name="related_portfolio"
									type="hidden" value="" /><input id="third_related_portfolio_id"
									name="related_portfolio" type="hidden" value="" />
							</div>
							<div class="form-group" style="margin-bottom: 0;">
								<div class="btn-block-wrapper">
									<input class="btn btn-partners btn-submit" name="apply"
										type="submit" value="프로젝트 지원" /><a class="btn btn-cancel"
										href="/project/%EA%B3%A0%EA%B0%9D%EC%84%9C%EB%B9%84%EC%8A%A4%EC%9A%A9-%EB%AA%A8%EB%B0%94%EC%9D%BC%EC%95%B1-%ED%81%B4%EB%9D%BC%EC%9D%B4%EC%96%B8%ED%8A%B8-%EA%B0%9C%EB%B0%9C_4982/">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div aria-hidden="true"
					class="modal proposal-modal related-portfolio-delete-modal fade "
					id="related-portfolio-delete-modal" role="dialog" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-header-delete">
								<h4 class="modal-title">관련 포트폴리오 삭제</h4>
							</div>
							<div class="modal-body">
								<p class="text-center bold-font">해당 포트폴리오를 '관련 포트폴리오'에서
									삭제하시겠습니까?</p>
								<div class="form-group">
									<div class="btn-wrapper-center">
										<button class="btn btn-warning skill-delete btn-submit"
											id="related-portfolio-delete-modal-btn">예</button>
										<a aria-hidden="true" class="btn btn-cancel"
											data-dismiss="modal">아니오</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div aria-hidden="true"
					class="modal proposal-modal related-portfolio-cancel-modal fade "
					id="related-portfolio-cancel-modal" role="dialog" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-header-delete">
								<h4 class="modal-title">프로젝트 관련 경험</h4>
							</div>
							<div class="modal-body">
								<p class="text-center bold-font">
									해당 항목 변경시 작성한 '관련 포트폴리오'가 모두 삭제됩니다.<br /> 해당 항목을 변경하시겠습니까?
								</p>
								<div class="form-group">
									<div class="btn-wrapper-center">
										<button class="btn btn-warning skill-delete btn-submit"
											id="related-portfolio-cancel-modal-btn">예</button>
										<a aria-hidden="true" class="btn btn-cancel"
											data-dismiss="modal"
											id="related-portfolio-cancel-modal-no-btn">아니오</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div aria-hidden="false"
					class="modal fade related-portfolio-select-modal in"
					id="related-portfolio-select-modal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" class="close" data-dismiss="modal"
									type="button">×</button>
								<h4 class="modal-title">
									관련 포트폴리오 <span class="p5-fix">선택</span>
								</h4>
							</div>
							<div class="modal-body">
								<h5
									style="text-align: center; font-weight: normal; line-height: 20px;">
									관련 포트폴리오는 <strong>이미 등록한 포트폴리오 중 최대 3개까지 선택</strong>이 가능합니다.<br />
									관련 포트폴리오를 아직 등록하지 않았다면, [프로필 정보 관리] 에서 추가할 수 있습니다.<br /> ( <span
										id="selected_portfolio_count">0</span> /3개)
								</h5>
								<section>
									<nav class="navbar order-type" role="navigation">
										<ul class="nav navbar-nav navbar-right">
											<li><div
													class="btn-group classification asec-desc filter-category-box">
													<button class="btn btn-default dropdown-toggle"
														data-toggle="dropdown" type="button">
														카테고리 <i class="fa fa-sort"></i>
													</button>
													<ul class="dropdown-menu category-filter" role="menu">
														<li><a href="">전체</a></li>
														<li><a href="">개발</a></li>
														<li><a href="">디자인</a></li>
													</ul>
												</div></li>
											<li style="margin-left: 10px;"><div
													class="btn-group classification asec-desc filter-subcategory-box">
													<button class="btn btn-default dropdown-toggle"
														data-toggle="dropdown" type="button">
														세부 카테고리 <i class="fa fa-sort"></i>
													</button>
													<ul class="dropdown-menu subcategory-filter" role="menu">
														<li><a href="">전체 선택</a></li>
													</ul>
												</div></li>
										</ul>
									</nav>
								</section>
								<form class="p5-portfolio-checkbox has-validation-callback"
									id="portfolio-checkbox-form"
									style="width: 738px; height: 280px; border-top: none !important;">
									<input id="first_related_portfolio" type="hidden" /><input
										id="second_related_portfolio" type="hidden" /><input
										id="third_related_portfolio" type="hidden" />
									<div class="related-portfolio-group"
										style="border-bottom: none !important;">
										
										<%
											if(portfolio != null)
											{
												for(int i =0;i<portfolio.size();i++)
												{
										%>
										<div class="related-portfolio-box" data-category="<%=portfolio.get(i).getCategoryL() %>"
											data-subcategory="<%=portfolio.get(i).getCategoryM() %>">
											<span style="margin-bottom: 15px;"><img
												src="${pageContext.request.contextPath}/resources/upload/portfolio/<%=portfolio.get(i).getImg0() %>"
												style="cursor: pointer" /><a
												onclick="change_modal_input_value(this)"
												portfolio-id="<%=portfolio.get(i).getPk()%>"><span class="portfolio-info"><div
															class="brief-info">
															<div class="title"><%=portfolio.get(i).getName() %></div>
														</div></span></a></span>
										</div>
										
										<%		}
											}
										%>
									</div>
									<p class="no-data-alert"
										style="display: none; text-align: center; padding-top: 100px; font-size: 14px; color: #555; font-weight: bold;">등록된
										'포트폴리오'가 없습니다.</p>
									<div style="clear: both; border-bottom: none;"></div>
								</form>
								<div class="text-center modal-btn-group">
									<button class="btn btn-default"
										id="related-portfolio-select-modal-btn" type="button">
										<span class="p5-fix">선택</span>완료
									</button>
									<button class="btn btn-cancel"
										id="related-portfolio-select-modal-cancel-btn" type="button">취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />

	<script type="text/javascript">
        $(function() {
            $('#estimated_budget').priceFormat({
                prefix: "",
                thousandsSeparator: ",",
                centsLimit: ""
            })
        });
        
        $('.content-inner').on('change','#estimated_term', function() {
            if($('#estimated_term').val().length > 3) {            	
            	$('#estimated_term').parent().addClass('has-error');

            }
            else
            	{
            	$('#estimated_term').parent().removeClass('has-error');

            	}
        });
        
        function toggle_data_size(obj){
            var $obj = $(obj);
            var $desc = $('.project-desc');
            if($obj.attr('data-status')=='close'){
                $desc.animate({'height' : $desc[0].scrollHeight }, 400, function() {});
                $obj.attr('data-status', 'open');
                $obj.html('간략히보기 <b class="fa fa-caret-up"></b>');
            }
            else{
                $desc.animate({'height' : '170px'}, 400, function() {});
                $obj.attr('data-status', 'close');
                $obj.html('자세히보기 <b class="fa fa-caret-down"></b>');
            }
        }

        function make_portfolio_by_modal(id, count){
            var $modal_portfolio = $('a[portfolio-id='+id+']').parent();
            var img_link = $modal_portfolio.children('img').attr('src');
            var title = $modal_portfolio.find('.title').html();
            var html = '<div class="related-portfolio-selected-box" data-portfolio-count="' + count + '">' +
                    '<span>' +
                    '<img src="'+img_link+'">' +
                    '<a>' +
                    '<span class="portfolio-info">' +
                    '<div class="brief-info">' +
                    '<div class="title">'+title+'</div>' +
                    '</div>' +
                    '</span>' +
                    '</a>' +
                    '<div class="related-portfolio-btn-group">' +
                    '<a class="btn btn-cancel related-portfolio-delete-btn" data-target="#related-portfolio-delete-modal" onclick="toss_portfolio_count(' + count + ');" data-toggle="modal">삭제</a>' +
                    '</div>' +
                    '</span>' +
                    '</div>';
            return html;
        }

        $(document).ready(function(){
            $('#related-portfolio-select-modal-btn').on('click', function(){
                setting_showroom();
                $('#related-portfolio-select-modal').modal('toggle');
            })
        });


        $(document).ready(function(){
            $('#has_related_portfolio_1').on('click', function(){
                $('#related_portfolio_box').css('display', '');
            });

            $('#has_related_portfolio_2').on('click', function(){
                if( $('#related_portfolio_box').css('display') != 'none'){
                    $('#related-portfolio-cancel-modal').modal('toggle');
                }
                //$('#related_portfolio_box').css('display', 'none');
            });
        });

        $(document).ready(function(){
            $('#related-portfolio-cancel-modal-no-btn').on('click', function(){
                $('#has_related_portfolio_1').prop('checked', true);
            })
        });

        function toss_portfolio_count(value){
            $('#related-portfolio-delete-modal-btn').attr('portfolio-count', value);
        };

        $(document).ready(function(){
            $('#related-portfolio-select-modal-cancel-btn').on('click', function(){
                $('.selected_background_img').remove();
                $('#first_related_portfolio').val('');
                $('#second_related_portfolio').val('');
                $('#third_related_portfolio').val('');
                $('#selected_portfolio_count').text(0);
                if( $('#first_related_portfolio_id').val() != ''){
                    change_modal_input_value($('a[portfolio-id="'+$('#first_related_portfolio_id').val()+'"]'));
                }
                if( $('#second_related_portfolio_id').val() != ''){
                    change_modal_input_value($('a[portfolio-id="'+$('#second_related_portfolio_id').val()+'"]'));
                }
                if( $('#third_related_portfolio_id').val() != '' ){
                    change_modal_input_value($('a[portfolio-id="'+$('#third_related_portfolio_id').val()+'"]'));
                }
                $('#related-portfolio-select-modal').modal('toggle');
                $('.filter-category-box').children('.dropdown-toggle').html('전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                $('.filter-category-box').children('.dropdown-toggle').attr('filter-value', 0);
                set_subcategory_filter("전체");
                set_filtering("전체",0);
            });

            $('#related-portfolio-delete-modal-btn').on('click', function(){
                var count = parseInt($(this).attr('portfolio-count'));
                $('#first_related_portfolio_id').val('');
                $('#second_related_portfolio_id').val('');
                $('#third_related_portfolio_id').val('');
                switch (count){
                    case 1:
                        change_modal_input_value($('img[data-key="one"]').parent());
                        break;
                    case 2:
                        change_modal_input_value($('img[data-key="two"]').parent());
                        break;
                    case 3:
                        change_modal_input_value($('img[data-key="three"]').parent());
                        break;
                }
                setting_showroom();
                $('#related-portfolio-delete-modal').modal('toggle');
            })
        });

        $(document).ready(function(){
            if( $('#first_related_portfolio_id').val() != ''){
                change_modal_input_value($('a[portfolio-id="'+$('#first_related_portfolio_id').val()+'"]'));
            }
            if( $('#second_related_portfolio_id').val() != ''){
                change_modal_input_value($('a[portfolio-id="'+$('#second_related_portfolio_id').val()+'"]'));
            }
            if( $('#third_related_portfolio_id').val() != '' ){
                change_modal_input_value($('a[portfolio-id="'+$('#third_related_portfolio_id').val()+'"]'));
            }
            setting_showroom();
        });

        function setting_showroom(){
            var first_portfolio = $('#first_related_portfolio').val();
            var second_portfolio = $('#second_related_portfolio').val();
            var third_portfolio = $('#third_related_portfolio').val();
            var $showroom = $('#selected_portfolio_showroom');
            $('#first_related_portfolio_id').val('');
            $('#second_related_portfolio_id').val('');
            $('#third_related_portfolio_id').val('');
            $showroom.children().remove();
            if(first_portfolio!=''&&first_portfolio!='NaN'){
                var portfolio = make_portfolio_by_modal(first_portfolio, 1);
                $showroom.append(portfolio);
                $('#first_related_portfolio_id').val(first_portfolio);
            }
            else{
                $showroom.append('<div class="none-selected-box"><div class="nth-text-box"><p>첫번째<br> 관련<br> 포트폴리오</p></div></div>');
            }
            if(second_portfolio!=''&&second_portfolio!='NaN'){
                portfolio = make_portfolio_by_modal(second_portfolio, 2);
                $showroom.append(portfolio);
                $('#second_related_portfolio_id').val(second_portfolio);
            }
            else{
                $showroom.append('<div class="none-selected-box"><div class="nth-text-box"><p>두번째<br> 관련<br> 포트폴리오</p></div></div>');
            }
            if(third_portfolio!=''&&third_portfolio!='NaN'){
                portfolio = make_portfolio_by_modal(third_portfolio, 3);
                $showroom.append(portfolio);
                $('#third_related_portfolio_id').val(third_portfolio);
            }
            else{
                $showroom.append('<div class="none-selected-box"><div class="nth-text-box"><p>세번째<br> 관련<br> 포트폴리오</p></div></div>');
            }
            $showroom.append('<div style="clear:both;"></div>');
        }

        function set_subcategory_filter(num){
            var dev_subcategory = '<li><a>전체 선택</a></li>' +
                    '<li><a>웹</a></li>' +
                    '<li><a>어플리케이션</a></li>' +
                    '<li><a>워드프레스</a></li>' +
                    '<li><a>퍼블리싱</a></li>' +
                    '<li><a>일반 소프트웨어</a></li>' +
                    '<li><a>커머스, 쇼핑몰</a></li>' +
                    '<li><a>게임</a></li>' +
                    '<li><a>임베디드</a></li>' +
                    '<li><a>기타</a></li>';
            var design_subcategory = '<li><a>전체 선택</a></li>' +
                    '<li><a>웹</a></li>' +
                    '<li><a>어플리케이션</a></li>' +
                    '<li><a>제품</a></li>' +
                    '<li><a>프레젠테이션</a></li>' +
                    '<li><a>인쇄물</a></li>' +
                    '<li><a>커머스, 쇼핑몰</a></li>' +
                    '<li><a>로고</a></li>' +
                    '<li><a>그래픽</a></li>' +
                    '<li><a>영상</a></li>' +
                    '<li><a>게임</a></li>' +
                    '<li><a>기타</a></li>';
            $('.filter-subcategory-box').children('.dropdown-toggle').html('세부 카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
            $('.filter-subcategory-box').children('.dropdown-toggle').attr('filter-value', 0);
            $('.related-portfolio-group').children('.related-portfolio-box').css('display', 'block');
            if(num=="개발"){
                $('.related-portfolio-group').children('div[data-category="디자인"]').css('display', 'none');
                $('.subcategory-filter').html(dev_subcategory);
            }
            else if(num=="디자인"){
                $('.related-portfolio-group').children('div[data-category="개발"]').css('display', 'none');
                $('.subcategory-filter').html(design_subcategory);
            }
            else{
                $('.subcategory-filter').html('<li><a>전체 선택</a></li>');
            }

            clear_margin();
        }

        function set_filtering(category_id, subcategory_id){
        	var dev_list = ["전체","웹","애플리케이션","워드프레스","퍼블리싱","일반소프트웨어","커머스_쇼핑몰","게임","임베디드","기타"];
        	var design_list = ["전체","웹","애플리케이션","제품","프레젠테이션","인쇄물","커머스_쇼핑물","로고","영상","그래픽","게임","기타"];
        	
        	var subcategory_id_val;
        	if(category_id == "개발")
        		subcategory_id_val = dev_list[subcategory_id];
        	if(category_id == "디자인")
        		subcategory_id_val = design_list[subcategory_id];
        	
            $('.related-portfolio-group').children('.related-portfolio-box').css('display', 'none');
            if(category_id=="전체"){
                $('.related-portfolio-group').children('.related-portfolio-box').css('display', 'block');
            }
            else if(category_id=="개발"){
                switch (subcategory_id_val){
                    case "전체":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-category="개발"]').css('display', 'block');
                        break;
                    case "웹":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('웹&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="웹"]').css('display', 'block');
                        break;
                    case "애플리케이션":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('어플리케이션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="애플리케이션"]').css('display', 'block');
                        break;
                    case "워드프레스":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('워드프레스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="워드프레스"]').css('display', 'block');
                        break;
                    case "퍼블리싱":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('퍼블리싱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="퍼블리싱"]').css('display', 'block');
                        break;
                    case "일반소프트웨어":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('일반 소프트웨어&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="일반소프트웨어"]').css('display', 'block');
                        break;
                    case "커머스_쇼핑몰":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('커머스, 쇼핑몰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="커머스_쇼핑몰"]').css('display', 'block');
                        break;
                    case "게임":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('게임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="게임"]').css('display', 'block');
                        break;
                    case "임베디드":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('임베디드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="임베디드"]').css('display', 'block');
                        break;
                    case "기타":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('기타&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="기타"]').css('display', 'block');
                        break;
                }
            }
            else if(category_id=="디자인"){
                switch (subcategory_id_val){
                    case "전체":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-category="디자인"]').css('display', 'block');
                        break;
                    case "웹":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('웹&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="웹"]').css('display', 'block');
                        break;
                    case "어플리케이션":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('어플리케이션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="어플리케이션"]').css('display', 'block');
                        break;
                    case "제품":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('제품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="제품"]').css('display', 'block');
                        break;
                    case "프레젠테이션":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('프레젠테이션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="프레젠테이션"]').css('display', 'block');
                        break;
                    case "인쇄물":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('인쇄물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="인쇄물"]').css('display', 'block');
                        break;
                    case "커머스_쇼핑몰":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('커머스, 쇼핑몰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="커머스_쇼핑몰"]').css('display', 'block');
                        break;
                    case "로고":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('로고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="로고"]').css('display', 'block');
                        break;
                    case "그래픽":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('그래픽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="그래픽"]').css('display', 'block');
                        break;
                    case "영상":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('영상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="영상"]').css('display', 'block');
                        break;
                    case "게임":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('게임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="게임"]').css('display', 'block');
                        break;
                    case "기타":
                        $('.filter-subcategory-box').children('.dropdown-toggle').html('기타&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                        $('.related-portfolio-group').children('div[data-subcategory="기타"]').css('display', 'block');
                        break;
                }
            }
            clear_margin();
        }

        function clear_margin(){
            var $box_set = $('.related-portfolio-group').children('.related-portfolio-box');
            var cnt=1;
            for(var i=0; i < $('.related-portfolio-group').children('.related-portfolio-box').length ; i++) {
                if($box_set.eq(i).css('display')!='none') {
                    if(cnt%5==0) {
                        $box_set.eq(i).children('span').css('margin-right', '0')
                    }
                    else {
                        $box_set.eq(i).children('span').css('margin-right', '18px')
                    }
                    cnt++;
                }

            }

            var block_count=0;
            for(var i=0; i<$('.related-portfolio-group').children('.related-portfolio-box').length; i++){
                if($('.related-portfolio-group').children('.related-portfolio-box').eq(i).css('display')=='block'){
                    block_count++;
                }
            }
            if(block_count==0){
                $('.no-data-alert').css('display', 'block');
            }
            else{
                $('.no-data-alert').css('display', 'none');
            }

            if(block_count <11){
                $('#portfolio-checkbox-form').css('overflow-y', 'inherit');
            }
            else {
                $('#portfolio-checkbox-form').css('overflow-y', 'scroll');
            }
        }

        $(document).ready(function(){
            $(".filter-category-box").on('click', ".category-filter > li:eq(0)", function(event){
                event.preventDefault();
                $('.filter-category-box').children('.dropdown-toggle').html('전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                $('.filter-category-box').children('.dropdown-toggle').attr('filter-value', "전체");
                set_subcategory_filter("전체");
            });
            $(".filter-category-box").on('click', ".category-filter > li:eq(1)", function(event){
                event.preventDefault();
                $('.filter-category-box').children('.dropdown-toggle').html('개발&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                $('.filter-category-box').children('.dropdown-toggle').attr('filter-value', "개발");
                set_subcategory_filter("개발");
            });
            $(".filter-category-box").on('click', ".category-filter > li:eq(2)", function(event){
                event.preventDefault();
                $('.filter-category-box').children('.dropdown-toggle').html('디자인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-sort"></i>');
                $('.filter-category-box').children('.dropdown-toggle').attr('filter-value', "디자인");
                set_subcategory_filter("디자인");
            });

           
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(0)", function(event){
                event.preventDefault();
                var category = $('.filter-category-box').children('.dropdown-toggle').attr('filter-value');
                set_filtering(category, 0);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(1)", function(event){
                event.preventDefault();
                var category = $('.filter-category-box').children('.dropdown-toggle').attr('filter-value');
                set_filtering(category, 1);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(2)", function(event){
                event.preventDefault();
                var category = $('.filter-category-box').children('.dropdown-toggle').attr('filter-value');
                set_filtering(category, 2);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(3)", function(event){
                event.preventDefault();
                var category = $('.filter-category-box').children('.dropdown-toggle').attr('filter-value');
                set_filtering(category, 3);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(4)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 4);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(5)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 5);
            });

            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(6)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 6);
            });
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(7)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 7);
            });
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(8)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 8);
            });
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(9)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 9);
            });
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(10)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 10);
            });
            $(".filter-subcategory-box").on('click', ".subcategory-filter > li:eq(11)", function(event){
                event.preventDefault();
                var category = parseInt($('.filter-category-box').children('.dropdown-toggle').attr('filter-value'));
                set_filtering(category, 11);
            });


            $('#related-portfolio-cancel-modal-btn').on('click', function(){
                var html = '<div class="process-guide-box"><img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png" style="float: left"><p class="process-guide-text" style="float: left">1. 관련 포트폴리오는 이미 등록한 포트폴리오 중 <strong>최대 3개</strong>까지 선택이 가능합니다.<br> 2. 관련 포트폴리오는 진행했던 <strong>경험과 진행 과정, 핵심 요소</strong> 등에 대해 상세히 작성해주세요.<br></p><div style="clear: both;"></div></div><div class="form-group"><label class="control-label" for="form.related_portfolio">관련 포트폴리오</label><div class="control-wrapper"><div class="related-portfolio-group" id="selected_portfolio_showroom"><div class="none-selected-box"><div class="nth-text-box"><p>첫번째<br> 관련<br> 포트폴리오</p></div></div><div class="none-selected-box"><div class="nth-text-box"><p>두번째<br> 관련<br> 포트폴리오</p></div></div><div class="none-selected-box"><div class="nth-text-box"><p>세번째<br> 관련<br> 포트폴리오</p></div></div><div style="clear: both;"></div></div><div class="btn btn-primary" data-target="#related-portfolio-select-modal" data-toggle="modal"><i class="fa fa-plus"></i> 관련 포트폴리오 선택</div></div></div><div class="form-group "><label class="control-label" for="related_description">관련 포트폴리오 설명</label><div class="control-wrapper"><textarea class="form-control" cols="40" id="related_description" name="related_description" rows="5"></textarea><span class="help-block">한글 기준 500자 미만</span></div></div><input id="first_related_portfolio_id" name="related_portfolio" type="hidden"><input id="second_related_portfolio_id" name="related_portfolio" type="hidden"><input id="third_related_portfolio_id" name="related_portfolio" type="hidden">';
                $('#related-portfolio-cancel-modal').modal('toggle');
                $('#related_portfolio_box').empty();
                $('#related_portfolio_box').html(html);
                $('#related_portfolio_box').css('display', 'none');
                $('.selected_background_img').remove();
                $('#first_related_portfolio').val('');
                $('#second_related_portfolio').val('');
                $('#third_related_portfolio').val('');
                $('#selected_portfolio_count').text(0);
            })
        });

        $(document).ready(function($){
            var stickyTop = $('.sidebar').offset().top;


            $(window).scroll(function(){
                if($(window).height() > 500){
                    var windowTop = $(window).scrollTop();
                    var stickyLeft = $('.sidebar').offset().left - 10;
                    if (stickyTop < windowTop){
                        console.log($(document).height() - $(window).scrollTop() - $('.sidebar').height());
                        if($(document).height() - $(window).scrollTop() - $('.sidebar').height() < 250){
                            $('.sidebar').css({position: 'fixed', top: $(document).height() - $(window).scrollTop() - $('.sidebar').height() - 270, left: stickyLeft});
                        }
                        else {
                            $('.sidebar').css({position: 'fixed', top: '10px', left: stickyLeft});
                        }
                    }
                    else {
                        $('.sidebar').css('position', 'static');
                    };
                }
            })
        });

        function change_modal_input_value(obj){
            var $obj = $(obj);
            var obj_id = parseInt($(obj).attr('portfolio-id'));
            var first_portfolio = parseInt($('#first_related_portfolio').val());
            var second_portfolio = parseInt($('#second_related_portfolio').val());
            var third_portfolio = parseInt($('#third_related_portfolio').val());
            var not_selected = true;
            var selected_count = parseInt($('#selected_portfolio_count').text());

            if(first_portfolio==obj_id||second_portfolio==obj_id||third_portfolio==obj_id){
                not_selected = false;
            }

            if(not_selected){
                if(selected_count===0){
                    $('#first_related_portfolio').val(obj_id);
                    $('#selected_portfolio_count').text('1');
                    $obj.html('<img class="selected_background_img" data-key="one" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_one.png">'+$obj.html());
                }
                else if(selected_count===1){
                    $('#second_related_portfolio').val(obj_id);
                    $('#selected_portfolio_count').text('2');
                    $obj.html('<img class="selected_background_img" data-key="two" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_two.png">'+$obj.html());
                }
                else if(selected_count===2){
                    $('#third_related_portfolio').val(obj_id);
                    $('#selected_portfolio_count').text('3');
                    $obj.html('<img class="selected_background_img" data-key="three" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_three.png">'+$obj.html());
                }
            }
            else{
                $('.selected_background_img').remove();
                if(first_portfolio===obj_id){
                    $('#first_related_portfolio').val(second_portfolio);
                    $('#second_related_portfolio').val(third_portfolio);
                    $('#third_related_portfolio').val('');
                    $('a[portfolio-id='+second_portfolio+']').html('<img class="selected_background_img" data-key="one" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_one.png">'+$('a[portfolio-id='+second_portfolio+']').html());
                    $('a[portfolio-id='+third_portfolio+']').html('<img class="selected_background_img" data-key="two" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_two.png">'+$('a[portfolio-id='+third_portfolio+']').html());
                }
                else if(second_portfolio===obj_id){
                    $('#second_related_portfolio').val(third_portfolio);
                    $('a[portfolio-id='+first_portfolio+']').html('<img class="selected_background_img" data-key="one" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_one.png">'+$('a[portfolio-id='+first_portfolio+']').html());
                    $('a[portfolio-id='+third_portfolio+']').html('<img class="selected_background_img" data-key="two" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_two.png">'+$('a[portfolio-id='+third_portfolio+']').html());
                    $('#third_related_portfolio').val('');
                }
                else if(third_portfolio===obj_id){
                    $('a[portfolio-id='+first_portfolio+']').html('<img class="selected_background_img" data-key="one" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_one.png">'+$('a[portfolio-id='+first_portfolio+']').html());
                    $('a[portfolio-id='+second_portfolio+']').html('<img class="selected_background_img" data-key="two" src="${pageContext.request.contextPath}/resources/static/img/proposal/selected_two.png">'+$('a[portfolio-id='+second_portfolio+']').html());
                    $('#third_related_portfolio').val('');
                }
                $('#selected_portfolio_count').text(selected_count-1);
            }
        }

        $(function () {
            $('.content-inner').on('keyup','#related_description', function(e) {
                if($(this).val().length > 500) {
                    $(this).css('border-color', '#f33d12');
                    $('#portfolio_description_help').css('color','#f33d12');
                    $('#portfolio_description_help').css('display','block');
                    setTimeout( function() {
                        $('#related_description').css('border-color', '#cccccc');
                        $('#portfolio_description_help').css('color','#999');
                        $('#portfolio_description_help').css('display','none');
                    }, 1500);
                    $(this).val($(this).val().substr(0,500));
                    this.scrollTop = 999999;
                }
            });
        })

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