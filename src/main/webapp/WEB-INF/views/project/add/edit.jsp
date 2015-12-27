<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	ProjectInfo project = (ProjectInfo)request.getAttribute("project");

	String filename = project.getFilename();
	
	if(!Validator.hasValue(filename))
		filename = "파일을 등록해주세요.";
	%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 프로젝트 생성</title>
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

<style>
div.backLayer {
	display:none;
	background-color:black;
	position:absolute;
	left:0px;
	top:0px;
}

</style>
</head>
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
					<form class="form-horizontal-70" data-behaviours="lock" id="project-edit-form"
						enctype="multipart/form-data" method="POST"
						novalidate="novalidate">
						<input name="csrfmiddlewaretoken" type="hidden"
							value="ea0aZfFjzqhmsqlZpktFMN7yDYNwZToQ" />
						<div class="form-input-rapper">
							<span class="help-block"></span>
							<div class="form-group category-form-group " id="category_div">
								<label class="control-label required" for="category"><span>*</span>카테고리</label>
								<div class="control-wrapper">
									<div class="category-wrapper">
										<select id="category" name="category" required="required">
											<option value="">카테고리</option>
											<option value="개발">개발</option>
											<option value="디자인">디자인</option>
										</select>
										
										<select id="sub_category" name="sub_category" required="required">
											<option value="">세부 카테고리</option>
										</select>
									</div>
									<span class="help-block">프로젝트 카테고리를 선택해 주세요.</span>
								</div>
							</div>
							<div class="form-group form-siblings" id="is_turnkey_div">
								<label class="control-label required" for="is_turnkey"><span></span></label>
								<div class="control-wrapper">
									<div class="turnkey-checker turnkey-none" id="turnkey-box">
										<span class="turnkey-none" id="turnkey-dev"><img
											src="${pageContext.request.contextPath}/resources/static/img/exclamation-circle.png" /><strong>디자인</strong>도
											함께 필요하신가요?</span> 
											<span class="turnkey-none" id="turnkey-design"><img
											src="${pageContext.request.contextPath}/resources/static/img/exclamation-circle.png" /><strong>개발</strong>도
											함께 필요하신가요?</span>
										<div class="turnkey-radio">
											<input id="turnkey_true" name="is_turnkey" type="radio"
												value="true" /><label for="turnkey_true">네</label><input
												id="turnkey_false" name="is_turnkey" type="radio"
												value="false" /><label for="turnkey_false">아니오</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group " id="title_div">
								<label class="control-label required" for="title"><span>*</span>프로젝트
									제목</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control" id="title"
										maxlength="30" name="title" required="required" size="30"
										type="text" /><span class="help-block">프로젝트 제목을 입력해
										주세요. (30자 이내)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group " id="project_term_div">
								<label class="control-label required" for="project_term"><span>*</span>예상
									기간</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="project_term" name="project_term" required="required"
											maxlength="3" type="text" /><span class="input-group-addon">일</span>
									</div>
									<span class="help-block">프로젝트를 진행할 기간을 일 단위로 입력해 주세요.
										(최대 3자리)</span>
								</div>
							</div>
							<div class="form-group project-term-form-group " id="budget_maximum_div">
								<label class="control-label required" for="budget_maximum"><span>*</span>지출
									가능 예산</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="budget_maximum" name="budget_maximum"
											required="required" type="text" /><span
											class="input-group-addon">원</span>
									</div>
									<span class="help-block">지출 가능한 예산을 입력해 주세요. ( VAT 별도, 예
										: 100,000,000)</span>
								</div>
							</div>
							<div class="form-group description-form-group " id="planning_status_div">
								<label class="control-label required" for="planning_status"><span>*</span>
									기획 상태</label>
								<div class="control-wrapper">
									<input id="planning_keeper" name="planning_keeper"
										type="hidden" value="" />
									<ul>
										<li><label for="planning_status_1"><div
													class="radio-no-selected one" id="radio-one"
													onclick="check_plan();">
													<input id="planning_status_1" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="idea" /><br />
													<label class="radio-inline" for="planning_status_1">아이디어만 있습니다.</label>
												</div></label></li>
										<li><label for="planning_status_2"><div
													class="radio-no-selected two" id="radio-two"
													onclick="check_plan();">
													<input id="planning_status_2" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="simple" /><br />
													<label class="radio-inline" for="planning_status_2">필요한
														내용들을 간단히<br />정리해두었습니다.
													</label>
												</div></label></li>
										<li class="last-radio"><label for="planning_status_3"><div
													class="radio-no-selected three" id="radio-three"
													onclick="check_plan();">
													<input id="planning_status_3" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="project_book" /><br />
													<label class="radio-inline" for="planning_status_3">상세한
														기획 문서가<br />존재합니다.
													</label>
												</div></label></li>
									</ul>
									
								</div>
							</div>
							<div class="form-group description-form-group " id="description_div">
								<label class="control-label required" for="description"><span>*</span>프로젝트
									내용</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="description" name="description"
										required="" rows="30"><%=project.getDescription() %></textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하는
											경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
									<label class="control-label required"
										for="">파일 업로드</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="file-name"><%=filename %></span> 
												<span class="p5-custom-file-type-input-wrapper">
												<button
													class="btn btn-primary p5-custom-file-type-front"
													type="button"> 파일 변경
												</button>
												<input class="p5-custom-file-type-input"
												id="file1" name="file1" type="file" />
											<button id="p5-file-btn-1" class="btn btn-cancel p5-img-del-btn" type="button">삭제</button></span>
										</div>
									</div>
								</div>
							<div class="form-group " id="skill_required_div">
								<label class="control-label required" for="skill_required">관련
									기술</label>
								<div class="control-wrapper">
									<input id="skill_required" name="skill_required" type="text" /><span
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
							<div class="form-group deadline-form-group " id="deadline_div">
								<label class="control-label required" for="deadline"><span>*</span>모집
									마감일자</label>
								<div class="control-wrapper">
									<select id="deadline" name="deadline"
										required="required">
										
										<%
										for(int i=1;i<=14;i++)
										{
											String result = "<option value="+Time.toString1(Time.nextDate(i))
													+">"+Time.toString2(Time.nextDate(i))+"</option>";
											out.println(result);
										}
										 %>
									</select><span
										class="help-block">지원자를 모집하는 기간입니다. 최소 1일에서 최대 14일까지
										가능합니다.</span>
								</div>
							</div>
							<div class="form-group interview-form-group " id="method_pre_interview_div">
								<label class="control-label required" for="method_pre_interview"><span>*</span>사전
									미팅</label>
								<div class="control-wrapper">
									<select id="method_pre_interview" name="method_pre_interview"
										required="required"><option selected="selected"
											value="OFFLINE">오프라인 미팅</option>
										<option value="ONLINE">온라인 미팅 (카카오톡, skype, 구글 행아웃)</option></select><span
										class="help-block">사전 미팅 방식을 선택해주세요.<br />마음에 드는 지원자와의
										미팅을 위시켓에서 주선해드립니다.
									</span>
								</div>
							</div>
							<div class="form-group address-form-group " id="address_div">
								<label class="control-label required" for="address_sido"><span>*</span>사전
									미팅 지역</label>
								<div class="control-wrapper">
									<div class="address-wrapper">
										<select id="address_sido" name="address_sido"
											required="required"><option value="">시, 도</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="대구광역시">대구광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="광주광역시">광주광역시</option>
											<option value="대전광역시">대전광역시</option>
											<option value="울산광역시">울산광역시</option>
											<option value="세종특별자치시">세종특별자치시</option>
											<option value="경기도">경기도</option>
											<option value="강원도">강원도</option>
											<option value="충청북도">충청북도</option>
											<option value="충청남도">충청남도</option>
											<option value="전라북도">전라북도</option>
											<option value="전라남도">전라남도</option>
											<option value="경상북도">경상북도</option>
											<option value="경상남도">경상남도</option>
											<option value="제주특별자치도">제주특별자치도</option></select><select id="sigungu"
											name="sigungu" required="required"><option
												value="">시, 군, 구</option></select>
									</div>
									<span class="help-block">사전 미팅을 진행할 지역을 선택해 주세요</span>
								</div>
							</div>
							<div class="form-group address-form-group new-date-form " id="date_expected_kick_off_div">
								<label class="control-label required"
									for="date_expected_kick_off"><span>*</span>프로젝트 예상 시작일</label>
								<div class="control-wrapper">
									<select id="date_expected_kick_off"
										name="date_expected_kick_off"
										required="required">
										
										<%
										for(int i=1;i<=21;i++)
										{
											String result = "<option value="+Time.toString1(Time.nextDate(i))
													+">"+Time.toString2(Time.nextDate(i))+"</option>";
											out.println(result);
										}
										 %>
										</select>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group manage-experience-form-group " id="has_manage_experience_div">
								<label class="control-label required"
									for="has_manage_experience"><span>*</span>프로젝트 매니징 경험</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline"
											for="has_manage_experience_1"><input
												id="has_manage_experience_1" name="has_manage_experience"
												type="radio" value="true" />예, 매니징 경험이 있습니다.</label></li>
										<li><label class="radio-inline"
											for="has_manage_experience_2"><input
												id="has_manage_experience_2" name="has_manage_experience"
												type="radio" value="false" />아니오, 없습니다.</label></li>
									</ul>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group " id="prefer_partner_div">
								<label class="control-label" for="prefer_partner">선호하는
									파트너 형태</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="prefer_partner_1"><input
												id="prefer_partner_1" name="prefer_partner" type="radio"
												value="whatever" />상관 없음</label></li>
										<li><label class="radio-inline" for="prefer_partner_2"><input
												id="prefer_partner_2" name="prefer_partner" type="radio"
												value="corporate_business" />법인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_3"><input
												id="prefer_partner_3" name="prefer_partner" type="radio"
												value="individual_business" />개인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_4"><input
												id="prefer_partner_4" name="prefer_partner" type="radio"
												value="team" />팀</label></li>
										<li><label class="radio-inline" for="prefer_partner_5"><input
												id="prefer_partner_5" name="prefer_partner" type="radio"
												value="individual" />개인</label></li>
									</ul>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group " id="submit_purpose_div">
								<label class="control-label" for="submit_purpose">프로젝트
									의뢰 목적</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="submit_purpose_1"><input
												id="submit_purpose_1" name="submit_purpose" type="radio"
												value="request" />프로젝트 의뢰</label></li>
										<li><label class="radio-inline" for="submit_purpose_2"><input
												id="submit_purpose_2" name="submit_purpose" type="radio"
												value="inquire" />견적 문의</label></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper project-submit-group">
								<input id="category_keeper" name="category_keeper" type="hidden"
									value="" /><input id="value_keeper" name="value_keeper"
									type="hidden" value="" /><input id="turnkey_keeper"
									name="turnkey_keeper" type="hidden" value="" /><input
									id="sigungu_keeper" name="sigungu_keeper" type="hidden"
									value="" /><input
									id="status" name="status" type="hidden"
									value="" />
									<input autocomplete="off"
									class="btn btn-lg btn-client js-disable-on-click btn-submit"
									data-loading-text="제출 중" name="post_a_job" id = "post_a_job_id" type="button"
									value="프로젝트 등록" />
									<input autocomplete="off"
									class="btn btn-lg btn-default js-disable-on-click"
									data-loading-text="저장 중" name="save_for_later" id = "save_for_later_id" type="button"
									value="임시 저장" />
							</div>
						</div>
					</form>
					<div class="project-add-helper" style="float: left;">
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
							
								<!-- 로딩 이미지 -->
							<div id="viewLoading">
								<img src="${pageContext.request.contextPath}/resources/upload/viewLoading.gif" />
							</div>
							<!-- 불투명 이미지 -->
							<div class='backLayer' style='' > </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
	function LoadingScreenFunc()
	{
		var width = $(window).width();
		var height = $(window).height();
		
		var scrollLeft = $(window).scrollLeft();
		var scrollTop = $(window).scrollTop();
		
		var backLayerObj = $(".backLayer");
		var loadingDivObj = $("#viewLoading");
		
		//화면을 가리는 레이어의 사이즈 조정
		backLayerObj.width(width);
		backLayerObj.height(height);

		var left = scrollLeft;
		var top = scrollTop;
		
		//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도)
		backLayerObj.css( {
    		'display':'block',
    		'background-color':'black',
    		'opacity':'0.3',
    		'position':'absolute',
    		'left':left,
    		'top':top
    	});
		
		left = ( scrollLeft + (width - loadingDivObj.width()) / 2 );
		top = ( scrollTop + (height - loadingDivObj.height()) / 2 );
		
		//팝업 레이어 보이게
		loadingDivObj.css( {
    		'display':'block',
    		'position':'absolute',
    		'left':left,
    		'top':top
    	});
	}
	$(document).ready(function(){
		// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
		$('#viewLoading').hide();


		var file = 0;
		
	    //img delete btn
	    $('.content-inner').on('click','.p5-img-del-btn',function() {

	        if($(this).siblings('input').attr('name')=='file1') {
	        	file = 1;
	            var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front">파일 변경</button>'+
	                    '<input id="file1" name="file1" type="file" class="p5-custom-file-type-input">'+
	                    '<button  id="p5-file-btn-1" type="button" class="btn btn-cancel p5-img-del-btn">삭제</button>';
	            $('#file-name').html('파일을 등록해주세요.');
	            $('#file1').parent().html(imgAssignTag);
	        } 

	        $(this).siblings('input').val("");
	    });

	    //이미지 선택 버튼들
	    $('.content-inner').on('change','#file1', function() {
	        if($('#file1').val()==='') {
	            //donothing
	        } else {
	            $('#file-name').html($(this).val().split(/(\\|\/)/g).pop());

	            file = 1;
	        }
	    });
	    
		$( "#post_a_job_id" ).click(function() {

			if(confirm("프로젝트를 등록하시겠습니까?") == false)
				return;
			
			// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
			$('#viewLoading').hide();
			
			$("#status").val("프로젝트 등록");
			
	        $('input[name="isFileChanged"]').val(file);
	   		 var formData = new FormData($('#project-edit-form')[0]);

			$.ajax({
				url : "/wjm/project/add/edit/<%=project.getPk()%>",
				type : "POST",
				data : formData,
    		    async: true,
    		    cache: false,
    		    contentType: false,
    		    processData: false,
				dataType : "JSON",
				success : function(data) {
					var messages = data.messages;

			    	if(messages == "success")
			        	{
			    		location.href= data.path; 
			        	}
			        else if(messages == "error")
			        	{
			        	location.href= data.path; 
			        	}
			        else
			        	{
							alert(messages);
			        	}
				},
			    beforeSend:function(){
		    		LoadingScreenFunc();
	
			    }
			    ,complete:function(){
	
					$('#viewLoading').hide();
					$(".backLayer").hide();
			 
			    },
		
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}
				}
			});
		});
		
		$( "#save_for_later_id" ).click(function() {
			$("#status").val("임시저장");

			if(confirm("프로젝트를 임시저장하시겠습니까?") == false)
				return;
			
	        $('input[name="isFileChanged"]').val(file);
	   		 var formData = new FormData($('#project-edit-form')[0]);

	        
			$.ajax({
				url : "/wjm/project/add/edit/<%=project.getPk()%>",
				type : "POST",
				data :formData,
				dataType : "JSON",
    		    cache: false,
    		    contentType: false,
    		    processData: false,
				success : function(data) {
					var messages = data.messages;

			    	if(messages == "success")
			        	{
			    		location.href= data.path; 
			        	}
			        else if(messages == "error")
			        	{
			        	location.href= data.path; 
			        	}
			        else
			        	{
							alert(messages);
			        	}
				},
		
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}
				}
			});
		});
		function form_check()
		{
			var result = true;
			
	        if($('#category').val()==""||$('#sub_category').val()=="") {
	        	 $('#category').parent().addClass("has-error");
	             $('#category').addClass('error');
	             $('#category').parent().children('.form-error').remove();
	             $('#category').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
        	{
               $('#category').parent().removeClass("has-error");
               $('#category').removeClass('error');
               $('#category').parent().children('.form-error').remove();
        	}
	        
	        if($('#turnkey_true').is(":checked") ==false && $('#turnkey_false').is(":checked")==false ) {
	        	 $('#turnkey_true').parent().addClass("has-error");
	             $('#turnkey_true').addClass('error');
	             $('#turnkey_true').parent().children('.form-error').remove();
	             $('#turnkey_true').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#turnkey_true').parent().removeClass("has-error");
	              $('#turnkey_true').removeClass('error');
	              $('#turnkey_true').parent().children('.form-error').remove();
	       	}
	        

	        if($('#title').val() == "" ) {
	        	 $('#title').parent().addClass("has-error");
	             $('#title').addClass('error');
	             $('#title').parent().children('.form-error').remove();
	             $('#title').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#title').parent().removeClass("has-error");
	              $('#title').removeClass('error');
	              $('#title').parent().children('.form-error').remove();
	       	}

	        if($('#project_term').val() == "" ) {
	        	 $('#project_term').parent().addClass("has-error");
	             $('#project_term').addClass('error');
	             $('#project_term').parent().children('.form-error').remove();
	             $('#project_term').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#project_term').parent().removeClass("has-error");
	              $('#project_term').removeClass('error');
	              $('#project_term').parent().children('.form-error').remove();
	       	}

	        if($('#budget_maximum').val() == "" ) {
	        	 $('#budget_maximum').parent().addClass("has-error");
	             $('#budget_maximum').addClass('error');
	             $('#budget_maximum').parent().children('.form-error').remove();
	             $('#budget_maximum').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#budget_maximum').parent().removeClass("has-error");
	              $('#budget_maximum').removeClass('error');
	              $('#budget_maximum').parent().children('.form-error').remove();
	       	}

	        if($('#radio-one').is(":checked") ==false && $('#radio-two').is(":checked")==false && $('#radio-three').is(":checked")==false ) {
	        	 $('#radio-one').parent().addClass("has-error");
	             $('#radio-one').addClass('error');
	             $('#radio-one').parent().children('.form-error').remove();
	             $('#radio-one').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#radio-one').parent().removeClass("has-error");
	              $('#radio-one').removeClass('error');
	              $('#radio-one').parent().children('.form-error').remove();
	       	}
	        
	        if($('#description').val() == "" ) {
	        	 $('#description').parent().addClass("has-error");
	             $('#description').addClass('error');
	             $('#description').parent().children('.form-error').remove();
	             $('#description').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#description').parent().removeClass("has-error");
	              $('#description').removeClass('error');
	              $('#description').parent().children('.form-error').remove();
	       	}
	        

	        if($('#deadline').val() == "" ) {
	        	 $('#deadline').parent().addClass("has-error");
	             $('#deadline').addClass('error');
	             $('#deadline').parent().children('.form-error').remove();
	             $('#deadline').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#deadline').parent().removeClass("has-error");
	              $('#deadline').removeClass('error');
	              $('#deadline').parent().children('.form-error').remove();
	       	}
	        

	        if($('#method_pre_interview').val() == "" ) {
	        	 $('#method_pre_interview').parent().addClass("has-error");
	             $('#method_pre_interview').addClass('error');
	             $('#method_pre_interview').parent().children('.form-error').remove();
	             $('#method_pre_interview').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#method_pre_interview').parent().removeClass("has-error");
	              $('#method_pre_interview').removeClass('error');
	              $('#method_pre_interview').parent().children('.form-error').remove();
	       	}
	        

	        if($('#address_sido').val()==""||$('#sigungu').val()=="") {
	        	 $('#address_sido').parent().addClass("has-error");
	             $('#address_sido').addClass('error');
	             $('#address_sido').parent().children('.form-error').remove();
	             $('#address_sido').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
        	{
               $('#address_sido').parent().removeClass("has-error");
               $('#address_sido').removeClass('error');
               $('#address_sido').parent().children('.form-error').remove();
        	}
	        

	        if($('#date_expected_kick_off').val()=="") {
	        	 $('#date_expected_kick_off').parent().addClass("has-error");
	             $('#date_expected_kick_off').addClass('error');
	             $('#date_expected_kick_off').parent().children('.form-error').remove();
	             $('#date_expected_kick_off').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
        	{
               $('#date_expected_kick_off').parent().removeClass("has-error");
               $('#date_expected_kick_off').removeClass('error');
               $('#date_expected_kick_off').parent().children('.form-error').remove();
        	}
	        

	        if($('#has_manage_experience_1').is(":checked") ==false && $('#has_manage_experience_2').is(":checked")==false) {
	        	 $('#has_manage_experience_2').parent().addClass("has-error");
	             $('#has_manage_experience_2').addClass('error');
	             $('#has_manage_experience_2').parent().children('.form-error').remove();
	             $('#has_manage_experience_2').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
	             result = false;
	        }
	        else
	       	{
	              $('#has_manage_experience_2').parent().removeClass("has-error");
	              $('#has_manage_experience_2').removeClass('error');
	              $('#has_manage_experience_2').parent().children('.form-error').remove();
	       	}
	        
	        return result;
		}
		
		var title_val = "<%=project.getName()%>";
		var category_val = "<%=project.getCategoryL()%>";
		var sub_category_val = "<%=project.getCategoryM()%>";
		var is_turnkey_val = "<%=project.getAnother()%>";
		var project_term_val = "<%=project.getPeriod()%>";
		var budget_maximum_val = "<%=project.getBudget()%>";
		var planning_status_val = "<%=project.getPlan_status()%>";
		var skill_required_val = "<%=project.getTechnique()%>";
		var deadline_val = "<%=Time.toString1(project.getDeadline()) %>";
		var method_pre_interview_val = "<%=project.getMeeting_type() %>";
		var address_sido_val = "<%=project.getMeeting_area()%>";
		var sigungu_val = "<%=project.getMeeting_area_detail()%>";
		var date_expected_kick_off_val = "<%=Time.toString1(project.getStart_date()) %>";
		var has_manage_experience_val = "<%=project.getManaging()%>";
		var prefer_partner_val = "<%=project.getPartner_type()%>";
		var submit_purpose_val = "<%=project.getPurpose()%>";
		
		// 프로젝트 제목
		if(title_val != null && title_val != "")
		{
			document.getElementById("title").value = title_val;
		}
		//카테고리
		if(category_val != null && category_val != "")
		{
			var len = document.getElementById("category").length;
			for(var i=0; i<len; i++)
				{
					if(document.getElementById("category").options[i].value == category_val)
						{
							document.getElementById("category").options[i].selected = true;
							break;
						}
				}
			getCategoryM();
		}
		
		
		//다른 카테고리도 필요한지
		if(is_turnkey_val != null && is_turnkey_val != "")
		{
			var value = $("#category").val();
            var check = document.getElementById('turnkey-box');
            check.className = "turnkey-checker turnkey-none";
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            
            if(is_turnkey_val == "1")
            	{
                $('#turnkey_true').prop('checked', true);
                $('#turnkey_false').prop('checked', false);
            	}
            else
            	{
                $('#turnkey_true').prop('checked', false);
                $('#turnkey_false').prop('checked', true);
            	}
            
            reset_plan();
            if (value == '디자인') {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
            else {
                check.className = "turnkey-checker turnkey-show";
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
		}
		//예상기간
		if(project_term_val != null && project_term_val != "")
		{
			document.getElementById("project_term").value = project_term_val;
		}

		//지출 가능 예산
		if(budget_maximum_val != null && budget_maximum_val != "")
		{
			document.getElementById("budget_maximum").value = budget_maximum_val;
		}
		//기획 상태
		if(planning_status_val != null && planning_status_val != "")
		{
			if(planning_status_val == "idea")
				$("#planning_status_1").attr("checked","checked");
			else if(planning_status_val == "simple")
				$("#planning_status_1").attr("checked","checked");
			else if(planning_status_val == "project_book")
				$("#planning_status_1").attr("checked","checked");
		}

		//관련 기술
		if(skill_required_val != null && skill_required_val != "")
		{
			document.getElementById("skill_required").value = skill_required_val;
		}

		//모집 마감 일자
		if(deadline_val != null && deadline_val != "")
		{
			var len = document.getElementById("deadline").length;
			for(var i=0; i<len; i++)
				{
					if(document.getElementById("deadline").options[i].value == deadline_val)
						{
							document.getElementById("deadline").options[i].selected = true;
							break;
						}
				}
			$('#deadline').selecter('refresh');
		}
		//사전 미팅
		if(method_pre_interview_val != null && method_pre_interview_val != "")
		{

			var len = document.getElementById("method_pre_interview").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("method_pre_interview").options[i].value == method_pre_interview_val)
					{
						document.getElementById("method_pre_interview").options[i].selected = true;
						break;
					}
			}
			$('#method_pre_interview').selecter('refresh');
		}
		
		
		if(address_sido_val != null && address_sido_val != "")
		{

			var len = document.getElementById("address_sido").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("address_sido").options[i].value == address_sido_val)
					{
						document.getElementById("address_sido").options[i].selected = true;
						break;
					}
			}
			getAddress();
			$('#address_sido').selecter('refresh');
			$('#sigungu').selecter('refresh');
		}
		
		//프로젝트 예상 시작일
		if(date_expected_kick_off_val != null && date_expected_kick_off_val != "")
		{
			var len = document.getElementById("date_expected_kick_off").length;
			for(var i=0; i<len; i++)
				{
					if(document.getElementById("date_expected_kick_off").options[i].value == date_expected_kick_off_val)
						{
							document.getElementById("date_expected_kick_off").options[i].selected = true;
							break;
						}
				}
			$('#date_expected_kick_off').selecter('refresh');
		}
		
		
		//프로젝트 매니징 경험
		if(has_manage_experience_val != null && has_manage_experience_val != "")
		{
			if(has_manage_experience_val == "1")
				$("#has_manage_experience_1").attr("checked","checked");
			else if(has_manage_experience_val == "0")
				$("#has_manage_experience_2").attr("checked","checked");
		}
		

		//선호하는 파트너 형태
		if(prefer_partner_val != null && prefer_partner_val != "")
		{
			if(prefer_partner_val == "whatever")
				$("#prefer_partner_1").attr("checked","checked");
			else if(prefer_partner_val == "corporate_business")
				$("#prefer_partner_2").attr("checked","checked");
			else if(prefer_partner_val == "individual_business")
				$("#prefer_partner_3").attr("checked","checked");
			else if(prefer_partner_val == "team")
				$("#prefer_partner_4").attr("checked","checked");
			else if(prefer_partner_val == "individual")
				$("#prefer_partner_5").attr("checked","checked");
		}
		
		//프로젝트 의뢰 목적
		if(submit_purpose_val != null && submit_purpose_val != "")
		{
			if(submit_purpose_val == "request")
				$("#submit_purpose_1").attr("checked","checked");
			else if(submit_purpose_val == "inquire")
				$("#submit_purpose_2").attr("checked","checked");
		}

	    
		$('#address_sido').on('change', function() {
			sigungu_val = "";
			 getAddress();
			$('#sigungu').next().children().first().html("시, 군, 구");

		});
		
	    function getAddress()
	    {
	        value = $('#address_sido').val();

	        var $selectSigungu = $('#sigungu');
	        options = "<option value=''>시, 군, 구</option>";
	        
	        $selectSigungu.html(options);

	    	if(value == '')
	    	{
	    		return false;
	    	}
	    	$.ajax({
	    		url : "/wjm/getAddress",
	    		type : "POST",
	    		data : 
	    		{
	    			area:value
	    		},
	    		async : true,
	    		dataType : "JSON",
	    		success : function(data) {
	    			
	    			if(data!=null || data!="")
	    			{
	    				var list = data.arealist;
	    				var listLen = list.length;
	    				
	    				for(var i=0;i<listLen;i++)
	    				{
	    					$selectSigungu.append("<option value='"+list[i]+"'>"+list[i]+"</option>");

	    				}
	    				
	    				$selectSigungu.selecter('refresh');
	    			}
	    		},
				complete:function(){

					if(sigungu_val != null && sigungu_val != "")
					{

						var len = document.getElementById("sigungu").length;
						for(var i=0; i<len; i++)
						{
							if(document.getElementById("sigungu").options[i].value == sigungu_val)
								{
									document.getElementById("sigungu").options[i].selected = true;
									break;
								}
						}
						$('#sigungu').selecter('refresh');
						$('#sigungu').next().children().first().html(sigungu_val);

					}
					else
						{
						$('#sigungu').next().children().first().html("시, 군, 구");

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
	    

	    
	    $('#category').on('change', function() {
	    	sub_category_val = "";
	    	getCategoryM();
	        var check = document.getElementById('turnkey-box');
	        check.className = "turnkey-checker turnkey-none";
	    });
	    
		function getCategoryM()
		{
	    	$('#sub_category').html("<option value=''>세부 카테고리</option>");

			if(document.getElementById('category').value == '')
			{
				return false;
			}
			$.ajax({
				url : "/wjm/getCategoryM",
				type : "POST",
				data : 
				{
					categoryL:document.getElementById('category').value
				},
    		    async: true,
				dataType : "JSON",
				success : function(data) {
					
					if(data!=null || data!="")
					{
						var list = data.categoryMlist;
						var listLen = list.length;
						
						for(var i=0;i<listLen;i++)
						{
							$('#sub_category').append("<option value='"+list[i]+"'>"+list[i]+"</option>");
							
						}
						$('#sub_category').selecter('refresh');
					}
				},
				complete:function(){
					
					if(sub_category_val != null && sub_category_val != "")
					{
						var len = document.getElementById("sub_category").length;
						for(var i=0; i<len; i++)
							{
								if(document.getElementById("sub_category").options[i].value == sub_category_val)
									{
										document.getElementById("sub_category").options[i].selected = true;
										break;
									}
							}		
						
						$('#sub_category').next().children().first().html(sub_category_val);
					}
					else
						{
						$('#sub_category').next().children().first().html("세부 카테고리");

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

		
	});
	window.onload = function(){

        var value = "<프로젝트 진행 방식>\n예시) 시작시점에 미팅, 주 1회 미팅 등\n\n"
                +"<프로젝트의 현재 상황>\n예시) 기획 여부, 타겟 고객, 진행 계획 등"
                +"\n\n<상세한 업무 내용>\n예시) 페이지 수, 레이아웃(비슷한 페이지) 수, 필요한 조건 등"
                +"\n\n<참고자료 / 유의사항>";
        var $description = $('#description');
        if($description.val() =="")
        	$description.val(value);
        
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


    $(function () {
        $('#sub_category').on('change', function() {
	            var value = $("#category").val();
	            var check = document.getElementById('turnkey-box');
	            check.className = "turnkey-checker turnkey-none";
	            var check_dev = document.getElementById('turnkey-dev');
	            var check_design = document.getElementById('turnkey-design');
	            $('#turnkey_true').prop('checked', false);
	            $('#turnkey_false').prop('checked', false);
	            if (value == '디자인') {
	                check.className = "turnkey-checker turnkey-show";
	                check_dev.className = "turnkey-none";
	                check_design.className = "turnkey-show";
	            }
	            else {
	                check.className = "turnkey-checker turnkey-show";
	                check_dev.className = "turnkey-show";
	                check_design.className = "turnkey-none";
	            }
	         
        });
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
                    value_cat = $('#category').val();
            if(value_cat == '개발'){
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
            else if(value_cat == '디자인'){
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
        }
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
        $('select').selecter({
            "cover": true
        });
    });
</script>
	
</body>
</html>