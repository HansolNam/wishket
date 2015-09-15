<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
%>
<!DOCTYPE html>

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 프로젝트 생성</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>

<!-- Latest compiled and minified CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
          <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="shortcut icon"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="icon"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>

</head>
<script>
	function getCategoryM()
	{
		$('#categoryM').html("<option value=''>세부 카테고리</option>");
		
		if(document.getElementById('categoryL').value == '')
		{
			return false;
		}
		$.ajax({
			url : "/wjm/getCategoryM",
			type : "POST",
			data : 
			{
				categoryL:document.getElementById('categoryL').value
			},
			dataType : "JSON",
			success : function(data) {
				
				if(data!=null || data!="")
				{
					var list = data.categoryMlist;
					var listLen = list.length;
					
					for(var i=0;i<listLen;i++)
					{
						$('#categoryM').append("<option value='"+list[i]+"'>"+list[i]+"</option>");

					}
					$('#categoryM').selecter('refresh');
				}
			},

			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}
		});
	}
</script>
<body class="logged-in client project-add-detail">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를
							만날 수 있습니다.</small>
					</h3>
				</div>

				<div class="content-inner">
					<form action="/project/add/detail/" class="form-horizontal-70" data-behaviours="lock"
						enctype="multipart/form-data" method="POST"
						novalidate="novalidate">
						<div class="form-input-rapper">
							<span class="help-block"></span>
							<div class="form-group category-form-group ">
								<label class="control-label required" for="categoryL"><span>*</span>카테고리</label>
								<div class="control-wrapper">
									<div class="category-wrapper">
										<select id="categoryL" name="categoryL" required="required" onchange="getCategoryM()">
											<option value="">카테고리</option>
											<option value="develop">개발</option>
											<option value="design">디자인</option>
										</select>
										<select id="categoryM" name="categoryM" required="required">
											<option value="">세부 카테고리</option>
										</select>
									</div>
									<span class="help-block">${category_msg }</span>
								</div>
							</div>
							<div class="form-group form-siblings">
								<label class="control-label required" for="another"><span></span></label>
								<div class="control-wrapper">
									<div class="turnkey-checker turnkey-none" id="turnkey-box">
										<span class="turnkey-none" id="turnkey-dev">
											<strong>디자인</strong>도 함께 필요하신가요?
										</span> 
										<span class="turnkey-none" id="turnkey-design">
											<strong>개발</strong>도 함께 필요하신가요?
										</span>
										<div class="turnkey-radio">
											<input id="turnkey_true" name="another" type="radio"
												value="true" />
											<label for="turnkey_true">네</label>
											<input id="turnkey_false" name="another" type="radio"
												value="false" />
												<label for="turnkey_false">아니오</label>
										</div>
									</div>
									<span class="help-block">${another_msg }</span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="name"><span>*</span>프로젝트
									제목</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control" id="name"
										maxlength="30" name="name" required="required" size="30"
										type="text" /><span class="help-block">프로젝트 제목을 입력해
										주세요. (30자 이내)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="period"><span>*</span>예상
									기간</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="period" name="period" required="required"
											type="text" /><span class="input-group-addon">일</span>
									</div>
									<span class="help-block">프로젝트를 진행할 기간을 일 단위로 입력해 주세요.
										(최대 3자리)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="budget"><span>*</span>지출
									가능 예산</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="budget" name="budget"
											onclick="check_status()" required="required" type="text" /><span
											class="input-group-addon">원</span>
									</div>
									<span class="help-block">지출 가능한 예산을 입력해 주세요. ( VAT 별도, 예
										: 100,000,000)</span>
								</div>
							</div>
							<div class="form-group description-form-group ">
								<label class="control-label required" for="plan_status"><span>*</span>
									기획 상태</label>
								<div class="control-wrapper">
									<input id="planning_keeper" name="planning_keeper"
										type="hidden" value="" />
									<ul>
										<li><label for="planning_status_1"><div
													class="radio-no-selected one" id="radio-one"
													onclick="check_plan();">
													<input id="planning_status_1" name="plan_status"
														onclick="check_plan();" required="" type="radio"
														value="idea" /><br /> <label class="radio-inline"
														for="planning_status_1">아이디어만 있습니다.</label>
												</div></label></li>
										<li><label for="planning_status_2"><div
													class="radio-no-selected two" id="radio-two"
													onclick="check_plan();">
													<input id="planning_status_2" name="plan_status"
														onclick="check_plan();" required="" type="radio"
														value="simple" /><br /> <label class="radio-inline"
														for="planning_status_2">필요한 내용들을 간단히<br />정리해두었습니다.
													</label>
												</div></label></li>
										<li class="last-radio"><label for="planning_status_3"><div
													class="radio-no-selected three" id="radio-three"
													onclick="check_plan();">
													<input id="planning_status_3" name="plan_status"
														onclick="check_plan();" required="" type="radio"
														value="project_book" /><br /> <label
														class="radio-inline" for="planning_status_3">상세한
														기획 문서가<br />존재합니다.
													</label>
												</div></label></li>
									</ul>
								</div>
							</div>
							<div class="form-group description-form-group ">
								<label class="control-label required" for="description"><span>*</span>프로젝트
									내용</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="description" name="description" onclick="check_status()"
										required="" rows="30"></textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하는
											경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="technique">관련
									기술</label>
								<div class="control-wrapper">
									<input id="technique" name="technique" type="text" /><span
										class="help-block">다수의 관련 기술을 입력 할때에는 쉼표(,)로 구분해 주세요.
										(최대 5개)<br />예) Photoshop, Android, HTML5, Python, Django
									</span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group deadline-form-group ">
								<label class="control-label required" for="deadline"><span>*</span>모집
									마감일자</label>
								<div class="control-wrapper">
									<select id="deadline" name="deadline" onclick="check_status()"
										required="required"><option value="2015-09-02">2015년
											9월 2일 수요일</option>
										<option value="2015-09-03">2015년 9월 3일 목요일</option>
										<option value="2015-09-04">2015년 9월 4일 금요일</option>
										<option value="2015-09-05">2015년 9월 5일 토요일</option>
										<option value="2015-09-06">2015년 9월 6일 일요일</option>
										<option value="2015-09-07">2015년 9월 7일 월요일</option>
										<option value="2015-09-08">2015년 9월 8일 화요일</option>
										<option value="2015-09-09">2015년 9월 9일 수요일</option>
										<option value="2015-09-10">2015년 9월 10일 목요일</option>
										<option value="2015-09-11">2015년 9월 11일 금요일</option>
										<option value="2015-09-12">2015년 9월 12일 토요일</option>
										<option value="2015-09-13">2015년 9월 13일 일요일</option>
										<option value="2015-09-14">2015년 9월 14일 월요일</option>
										<option value="2015-09-15">2015년 9월 15일 화요일</option></select><span
										class="help-block">지원자를 모집하는 기간입니다. 최소 1일에서 최대 14일까지
										가능합니다.</span>
								</div>
							</div>
							<div class="form-group interview-form-group ">
								<label class="control-label required" for="meeting_type"><span>*</span>사전
									미팅</label>
								<div class="control-wrapper">
									<select id="meeting_type" name="meeting_type"
										required="required"><option selected="selected"
											value="OFFLINE">오프라인 미팅</option>
										<option value="ONLINE">온라인 미팅 (카카오톡, skype, 구글 행아웃)</option></select><span
										class="help-block">사전 미팅 방식을 선택해주세요.<br />마음에 드는 지원자와의
										미팅을 위시켓에서 주선해드립니다.
									</span>
								</div>
							</div>
							<div class="form-group address-form-group ">
								<label class="control-label required" for="meeting_area"><span>*</span>사전
									미팅 지역</label>
								<div class="control-wrapper">
									<div class="address-wrapper">
										<select id="meeting_area" name="meeting_area"
											required="required"><option value="">시, 도</option>
											<option value="1">서울특별시</option>
											<option value="2">부산광역시</option>
											<option value="3">대구광역시</option>
											<option value="4">인천광역시</option>
											<option value="5">광주광역시</option>
											<option value="6">대전광역시</option>
											<option value="7">울산광역시</option>
											<option value="8">세종특별자치시</option>
											<option value="9">경기도</option>
											<option value="10">강원도</option>
											<option value="11">충청북도</option>
											<option value="12">충청남도</option>
											<option value="13">전라북도</option>
											<option value="14">전라남도</option>
											<option value="15">경상북도</option>
											<option value="16">경상남도</option>
											<option value="17">제주특별자치도</option>
										</select>
										<select id="meeting_area_detail"
											name="meeting_area_detail" onclick="check_status()" required="required"><option
												value="">시, 군, 구</option></select>
									</div>
									<span class="help-block">사전 미팅을 진행할 지역을 선택해 주세요</span>
								</div>
							</div>
							<div class="form-group address-form-group new-date-form ">
								<label class="control-label required"
									for="start_date"><span>*</span>프로젝트 예상 시작일</label>
								<div class="control-wrapper">
									<select id="start_date"
										name="start_date" onchange="check_status()"
										required="required"><option value="2015-09-02">2015년
											9월 2일 수요일</option>
										<option value="2015-09-03">2015년 9월 3일 목요일</option>
										<option value="2015-09-04">2015년 9월 4일 금요일</option>
										<option value="2015-09-05">2015년 9월 5일 토요일</option>
										<option value="2015-09-06">2015년 9월 6일 일요일</option>
										<option value="2015-09-07">2015년 9월 7일 월요일</option>
										<option value="2015-09-08">2015년 9월 8일 화요일</option>
										<option value="2015-09-09">2015년 9월 9일 수요일</option>
										<option value="2015-09-10">2015년 9월 10일 목요일</option>
										<option value="2015-09-11">2015년 9월 11일 금요일</option>
										<option value="2015-09-12">2015년 9월 12일 토요일</option>
										<option value="2015-09-13">2015년 9월 13일 일요일</option>
										<option value="2015-09-14">2015년 9월 14일 월요일</option>
										<option value="2015-09-15">2015년 9월 15일 화요일</option>
										<option value="2015-09-16">2015년 9월 16일 수요일</option>
										<option value="2015-09-17">2015년 9월 17일 목요일</option>
										<option value="2015-09-18">2015년 9월 18일 금요일</option>
										<option value="2015-09-19">2015년 9월 19일 토요일</option>
										<option value="2015-09-20">2015년 9월 20일 일요일</option>
										<option value="2015-09-21">2015년 9월 21일 월요일</option>
										<option value="2015-09-22">2015년 9월 22일 화요일</option>
										<option value="2015-09-23">2015년 9월 23일 수요일</option>
										<option value="2015-09-24">2015년 9월 24일 목요일</option>
										<option value="2015-09-25">2015년 9월 25일 금요일</option>
										<option value="2015-09-26">2015년 9월 26일 토요일</option>
										<option value="2015-09-27">2015년 9월 27일 일요일</option>
										<option value="2015-09-28">2015년 9월 28일 월요일</option></select><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group manage-experience-form-group ">
								<label class="control-label required"
									for="has_manage_experience"><span>*</span>프로젝트 매니징 경험</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline"
											for="has_manage_experience_1"><input
												id="has_manage_experience_1" name="managing"
												type="radio" value="true" />예, 매니징 경험이 있습니다.</label></li>
										<li><label class="radio-inline"
											for="has_manage_experience_2"><input
												id="has_manage_experience_2" name="managing"
												type="radio" value="false" />아니오, 없습니다.</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group ">
								<label class="control-label" for="partner_type">선호하는
									파트너 형태</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="prefer_partner_1"><input
												id="prefer_partner_1" name="partner_type" type="radio"
												value="whatever" />상관 없음</label></li>
										<li><label class="radio-inline" for="prefer_partner_2"><input
												id="prefer_partner_2" name="partner_type" type="radio"
												value="corporate_business" />법인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_3"><input
												id="prefer_partner_3" name="partner_type" type="radio"
												value="individual_business" />개인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_4"><input
												id="prefer_partner_4" name="partner_type" type="radio"
												value="team" />팀</label></li>
										<li><label class="radio-inline" for="prefer_partner_5"><input
												id="prefer_partner_5" name="partner_type" type="radio"
												value="individual" />개인</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group ">
								<label class="control-label" for="purpose">프로젝트
									의뢰 목적</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="submit_purpose_1"><input
												id="submit_purpose_1" name="purpose" type="radio"
												value="request" />프로젝트 의뢰</label></li>
										<li><label class="radio-inline" for="submit_purpose_2"><input
												id="submit_purpose_2" name="purpose" type="radio"
												value="inquire" />견적 문의</label></li>
									</ul>
									<span class="help-block"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper project-submit-group">
								<input autocomplete="off"
									class="btn btn-lg btn-client js-disable-on-click btn-submit"
									data-loading-text="제출 중" name="post_a_job" type="submit"
									value="프로젝트 등록" />
								<input autocomplete="off"
									class="btn btn-lg btn-default js-disable-on-click"
									data-loading-text="저장 중" name="save_for_later" type="submit"
									value="임시 저장" />
							</div>
						</div>
					</form>
					<div class="project-add-helper" style="float: left;">
						<div class="expected-time-boxer">
							<div class="expected-time-title">
								작성 완료까지 예상 시간<img class="slash"
									src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
							</div>
							<div class="remain-time">
								<i class="fa fa-clock-o"></i> 약 <span id="remain-time-text"
									style="font-weight: bold;">4분</span> 소요 예정
							</div>
							<div id="progressbar"></div>
							<br />
							<div class="maximum-time">최대 10분</div>
						</div>
						<div class="project-add-info">
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-one.png" />
								<div class="info-data-letter">
									위시켓은 <strong>클라이언트님께 무료</strong>로 제공 됩니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-two.png" />
								<div class="info-data-letter">
									다양한 지원자들의 <strong>견적과 포트폴리오를 한눈에 비교</strong>할 수 있습니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-three.png" />
								<div class="info-data-letter">
									<strong>온/오프라인 미팅</strong>을 통해 마음에 드는 지원자를 선택합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-four.png" />
								<div class="info-data-letter">
									<strong>대금 보호 시스템</strong>을 통해, 돈 문제 없는 안전한 계약이 가능합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-five.png" />
								<div class="info-data-letter">
									클라이언트님의 <strong>승인 후에 파트너에게 대금이 지급</strong>됩니다.
								</div>
							</div>
						</div>
					</div>
					<div aria-hidden="true" aria-labelledby="myModalLabel"
						class="modal fade project-modal" id="myModal2" role="dialog"
						tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header project-modal-header">
									<button aria-hidden="true" class="close" data-dismiss="modal"
										type="button">×</button>
									<h4 class="modal-title meeting-cancel-title">카테고리 변경</h4>
								</div>
								<div class="modal-body project-modal-body">
									<p class="text-center">
										카테고리 변경시 작성해 놓은 프로젝트 내용이 삭제됩니다.<br /> 카테고리를 변경하시겠습니까?
									</p>
									<div class="text-center">
										<button class="btn btn-warning project-category-btn"
											data-dismiss="modal" onclick="changeDescription()"
											type="button">예</button>
										<button class="btn btn-default meeting-no-btn"
											data-dismiss="modal" id="project-modal-cancel" type="button">아니오</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div aria-hidden="true" aria-labelledby="myModalLabel"
						class="modal fade project-modal" id="myModal3" role="dialog"
						tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header project-modal-header">
									<button aria-hidden="true" class="close" data-dismiss="modal"
										type="button">×</button>
									<h4 class="modal-title meeting-cancel-title">카테고리 변경</h4>
								</div>
								<div class="modal-body project-modal-body">
									<p class="text-center">
										카테고리 변경시 작성해 놓은 프로젝트 내용이 삭제됩니다.<br /> 카테고리를 변경하시겠습니까?
									</p>
									<div class="text-center">
										<button class="btn btn-warning project-category-btn"
											data-dismiss="modal" id="category-modal-change" type="button">예</button>
										<button class="btn btn-default meeting-no-btn"
											data-dismiss="modal" id="category-modal-cancel" type="button">아니오</button>
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
	
	<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
    function changeDescription() {
        var sub = document.getElementById('sub_category'),
                projectCategoryTemplateURL = '/project/category/' + sub.value + "/",
                description = document.getElementById('description'),
                keeper = document.getElementById('value_keeper');

        $.get(projectCategoryTemplateURL, function(data){
            description.value = data.template_body;
        });
        keeper.value = sub.value;
    }

    function reset_plan(){
        var one = document.getElementById('radio-one');
        var two = document.getElementById('radio-two');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        var one_check = document.getElementById('planning_status_1');
        var two_check = document.getElementById('planning_status_2');
        var three_check = document.getElementById('planning_status_3');
        one_check.checked = false;
        two_check.checked = false;
        three_check.checked = false;
        keeper.value = 0;
        one.className = "radio-no-selected one";
        two.className = "radio-no-selected two";
        three.className = "radio-no-selected three";
    }

    function check_plan(){
        var one_check = document.getElementById('planning_status_1');
        var one = document.getElementById('radio-one');
        var two_check = document.getElementById('planning_status_2');
        var two = document.getElementById('radio-two');
        var three_check = document.getElementById('planning_status_3');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        if (one_check.checked === true){
            one.className = "radio-selected one";
            keeper.value = 1;
        }
        else {
            one.className = "radio-no-selected one";
        }
        if (two_check.checked === true){
            two.className = "radio-selected two";
            keeper.value = 2;
        }
        else {
            two.className = "radio-no-selected two";
        }
        if (three_check.checked === true){
            three.className = "radio-selected three";
            keeper.value = 3;
        }
        else {
            three.className = "radio-no-selected three";
        }
    }

    setInterval(function progress_check(){
        var cnt=0;
        if($('#title').val() != "" || null){
            cnt ++;
        }
        if($('#project_term').val() != "" || null){
            cnt ++;
        }
        if($('#budget_maximum').val() != "" || null){
            cnt ++;
        }
        if($('#description').val() != "" || null){
            cnt ++;
        }
        if($('#value_keeper').val() != "" || null){
            cnt ++;
        }
        if($('#turnkey_keeper').val() != "" || null){
            cnt ++;
        }
        if($('#sigungu_keeper').val() != "" || null){
            cnt ++;
        }
        if(cnt>2){
            $('#remain-time-text').html('3분');
        }
        else if(cnt> 3){
            $('#remain-time-text').html('2분');
        }
        else if(cnt>6){
            $('#remain-time-text').html('1분');
        }
        var cnt = cnt*10;
        $( "#progressbar" ).progressbar({
          value: cnt
        });
    }, 10000);

    $(function() {
        $( "#progressbar" ).progressbar({
          value: 0
        });
      });


    $(function () {
        $('#categoryM').on('change', function() {
            var value_sub = $(this).val();
            var check = document.getElementById('turnkey-box');
            check.className = "turnkey-checker turnkey-none";
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            $('#turnkey_true').prop('checked', false);
            $('#turnkey_false').prop('checked', false);
            reset_plan();
            if (value_sub === '9' || value_sub === '10') {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
            else if (value_sub === '1' || value_sub === '2' || value_sub === '3' || value_sub === '4' || value_sub === '6') {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
        })

        if($('#planning_keeper').val()===''){

        }
        else{
            var t = $('#planning_keeper').val();
            if(t==1){
                $('.one').attr('class', 'radio-selected one');
                $('#planning_status_1').attr('checked', true);
            }
            else if(t==2){
                $('.two').attr('class', 'radio-selected two');
                $('#planning_status_2').attr('checked', true);
            }
            else if(t==3){
                $('.three').attr('class', 'radio-selected three');
                $('#planning_status_3').attr('checked', true);
            }
        }

        if($('#value_keeper').val()===''){

        }
        else{
            var check = document.getElementById('turnkey-box');
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            var value_sub = $('#value_keeper').val(),
                    value_cat = $('#turnkey_keeper').val();
            if(value_cat == '1'){
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
            else if(value_cat == '2'){
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
            if (value_sub === '9' || value_sub === '10') {
                check.className = "turnkey-checker turnkey-show";

            }
            else if (value_sub === '1' || value_sub === '2' || value_sub === '3' || value_sub === '4' || value_sub === '6') {
                check.className = "turnkey-checker turnkey-show";

            }
        }
    });

    $(function () {
        var getSigungu, $sigunguVal;

        getSigungu = function(value) {
            var url, options, setInitState;
            var $selectSigungu = $('#sigungu');

            options = '<option value="">시, 군, 구</option>';
            url = "/address/sigungu/s/" + value + "/";
            setInitState = function() {
                $selectSigungu.html(options).selecter('refresh');
            };

            if (value === '') {
                setInitState();
                $selectSigungu.find('+ .selecter > .selecter-selected').html("세부 카테고리");
            } else {
                $.getJSON(url, function(j){
                    var $addressSigungu = $('input[name="sigungu_keeper"]'),
                            addressSigunguVal = $addressSigungu.val(),
                            fieldTitle;

                    for (var i=0; i < j.length; i++) {
                        if (j[i].pk === parseInt(addressSigunguVal, 10)) {
                            options += '<option value="' + j[i].pk + '" selected="selected">' + j[i].fields.name + '</option>';
                            fieldTitle = j[i].fields.name;
                        } else {
                            options += '<option value="' + j[i].pk + '">' + j[i].fields.name + '</option>';
                        }
                    }
                    setInitState();
                    $selectSigungu.find('+ .selecter > .selecter-selected').html(fieldTitle);
                })
            }
        }
        $('#address_sido').on('change', function() {
            var value;
            value = $(this).val();
            getSigungu(value);
        });
        $sigunguVal = $('#address_sido').val();
        if ($sigunguVal !== undefined) {
            getSigungu($sigunguVal);
        }
        getSigungu();
    });
    $(function() {
        $('#skill_required').tagit({
            tagLimit: 5,
            caseSensitive: false,
            preprocessTag: function(val) {
                var valueLen = val.length;
                if(valueLen > 25){
                    $('#skill_required').next().css('border-color', '#f33d12');
                    setTimeout( function() {
                        $('#skill_required').next().css('border-color', '#cccccc');
                    }, 1500);
                    return '';
                }
                if (!val) {
                    return '';
                } else if (val[valueLen-1] === ',') {
                    return val.slice(0, valueLen-1);
                } else {
                    return val;
                }
            }
        });

        $('#budget_maximum').priceFormat({
            prefix: "",
            thousandsSeparator: ",",
            centsLimit: ""
        });
    });
    $(function () {
        $('#address_sigungu').change(function(){
            var $thisVal = $(this).val(),
                    keeper = $('#sigungu_keeper');
            keeper.val($thisVal);
        })
    });
    $(function () {
        $('#sub_category').change(function () {
            var $thisVal = $(this).val(),
                    projectCategoryTemplateURL = '/project/category/' + $thisVal + "/",
                    projectDescription = $('#description'),
                    keeper = $('#value_keeper');
            if (projectDescription.val() !== ''){
                $('#myModal2').modal('show');
            }
            else {
                keeper.val($thisVal);
                if ($thisVal === '') {
                    projectDescription.val('');
                } else {
                    $.ajax({
                        dataType: "json",
                        url: projectCategoryTemplateURL,
                        success: function (data, status, xhr) {
                            $.each(data, function(i, value) {
                                var projectDescription = $('#description');
                                    projectDescription.data('category_template', value);
                                    projectDescription.val(value);
                            })
                        }
                    });
                }
            }
        });
    });
    $(function () {
        $('select').selecter({
            "cover": true
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