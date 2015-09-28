<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	String img_path = (String)request.getAttribute("img_path");
	if(img_path != null)
		{
			if(img_path.isEmpty())
			{
				img_path = "default_avatar.png";
			}
		}
	if(account == null) response.sendRedirect("/wjm/accounts/login");
	
	boolean hasBasicInfo=false, hasPhoneNum=false, hasEmail=false;
	
	if((String)request.getAttribute("hasBasicInfo") != null)
		hasBasicInfo = true;
	if((String)request.getAttribute("hasPhoneNum") != null)
		hasPhoneNum = true;
	if((String)request.getAttribute("hasEmail") != null)
		hasEmail = true;
	
			//img_path = "resources/static/img/default_avatar.png";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 기본 정보 수정</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/p5.css" rel="stylesheet" />
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
<body class="logged-in client account-setting profile">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />

		<div class="container">
			<div id="messages">${msg}</div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${img_path}" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a class="active"
								href="/wjm/accounts/settings/profile/">기본 정보 수정</a></li>
							<li class=""><a href="/wjm/accounts/settings/verify_identity/">신원
									인증</a></li>
							<li class=""><a href="/wjm/accounts/settings/bank_account/">계좌
									관리</a></li>
							<li class=""><a href="/wjm/accounts/settings/relogin/">비밀번호
									변경</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							기본 정보 수정 <small class="small-text">계정의 기본 정보들을 수정할 수
								있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<h4>
							기본 정보 입력
							<button class="btn btn-default" id="show_base_button"
								onclick="show_base_form()" style="<%if(!hasBasicInfo) out.print("display:none; ");%>float: right">수정하기</button>
								
						</h4>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_show_form" method="POST"
							style="<%if(!hasBasicInfo) out.print("display:none; ");%>border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 프로필
									사진</label>
								<div class="control-wrapper" style="padding-top: 7px;">
									<img alt="<%=account.getId() %> 사진" class="partners-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=img_path %>"
										style="border-radius: 10%; border: 1px solid #dedede; width: 220px; height: 220px;" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									클라이언트 형태</label>
								<div class="control-wrapper">
									<input disabled="" id="get_form_of_business"
										name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 이름</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${full_name }" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 성별</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${gender }" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									생년월일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${date_of_birth_year}-${date_of_birth_month}-${date_of_birth_day}" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 지역
									- 시, 도</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${address_sido }" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 세부
									지역 - 시, 군, 구</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${sigungu }" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">나머지 주소</label>
								<div class="control-wrapper">
									<input style="border: none; margin-top: 5px;"
										type="text" value="${address_detail }" />
								</div>
							</div>
						</form>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_edit_form" method="POST"
							novalidate=""
							style="<%if(hasBasicInfo) out.print("display:none; ");%>border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="base" />
							<div class="form-group p5-portfolio-form-group ">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span> 프로필 사진</label>
								<div class="p5-portfoilo-img-control-wrapper"
									style="height: 110px;">
									<div class="control-wrapper">
										<span class="p5-img-name" id="p5-image-name"
											style="margin-top: 8px;"><%if(img_path == null){ %>제출된 '<strong>프로필 이미지</strong>'가
											없습니다.<%}else{ %><%=img_path %> <%} %>
										</span> <span class="p5-custom-file-type-input-wrapper"><button
												class="btn btn-primary p5-custom-file-type-front"
												style="cursor: pointer; left: 0; margin-left: 0"
												type="button">
												<i class="fa fa-plus"></i> 이미지 변경
											</button>
											<input accept="image/*" class="p5-custom-file-type-input"
											id="p5-file-btn" name="image"
											style="cursor: pointer; left: 0px; margin-left: 0"
											type="file" />
										<button class="btn btn-cancel p5-img-del-btn"
												style="left: 120px;" type="button">삭제</button>
											<input id="image_del" name="image_del" type="hidden"
											value="False" /></span> <span class="help-block"
											style="position: relative; top: 85px">이미지 파일(.jpg,
											.jpeg, .png, .gif 등)만 업로드할 수 있습니다.</span>
									</div>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="form_of_business"><span>*</span>
									클라이언트 형태</label>
								<div class="control-wrapper">
									<select class="form-control" id="form_of_business"
										name="form_of_business" required="required">
										<option value='individual'>개인</option>
										<option value='team'>팀</option>
										<option value='individual_business'>개인 사업자</option>
										<option value='corporate_business'>법인 사업자</option>
										</select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" id="full_name_label"><span>*</span>
									담당자명</label>
								<div class="control-wrapper">
									<input class="form-control" id="full_name" name="full_name"
										type="text" value="${full_name }" />
								</div>
							</div>
							<div class="form-group " style="display: none;">
								<label class="control-label required" for="company_name"
									id="company_name_label"><span>*</span> 회사명</label>
								<div class="control-wrapper">
									<input class="form-control" id="company_name"
										name="company_name" type="text" value="${company_name }" />
								</div>
							</div>
							<div class="form-group " style="display: none;">
								<label class="control-label required" for="representative"
									id="representative_label"><span>*</span> 대표자명</label>
								<div class="control-wrapper">
									<input class="form-control" id="representative"
										name="representative" type="text" value="${representative }" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="gender"><span>*</span>
									성별</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="gender_1"><input
												id="gender_1" name="gender" required="" type="radio"
												value="m" />남성</label></li>
										<li><label class="radio-inline" for="gender_2"><input
												id="gender_2" name="gender" required="" type="radio"
												value="f" />여성</label></li>
									</ul>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="date_of_birth"
									id="date_of_birth_label"><span>*</span> 설립일</label>
								<div class="control-wrapper">
									<select class="form-control" id="id_date_of_birth_year"
										name="date_of_birth_year">
										<option value=''>---</option>
										</select><select class="form-control"
										id="id_date_of_birth_month" name="date_of_birth_month"><option
											value="">---</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option></select><select class="form-control"
										id="id_date_of_birth_day" name="date_of_birth_day"><option
											value="">---</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option></select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="address_sido"><span>*</span>
									지역 - 시, 도</label>
								<div class="control-wrapper">
									<select class="form-control" id="address_sido"
										name="address_sido"><option value="">선택</option>
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
										<option value="제주특별자치도">제주특별자치도</option></select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="sigungu"><span>*</span>
									세부 지역 - 시, 군, 구</label>
								<div class="control-wrapper">
									<select class="form-control" id="sigungu" name="sigungu"
										required="required"></select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label " for="address_detail">나머지
									주소</label>
								<div class="control-wrapper">
									<input class="form-control" id="address_detail"
										name="address_detail" type="text" value="${address_detail}" />
								</div>
							</div>
							<div class="form-group last-form-group"
								style="padding-top: 15px;">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										id="base_submit_btn" style="margin-right: 10px;" type="button"
										value="등록하기" />
								</div>
							</div>
						</form>
						<h4>
							연락처 정보 입력
							<button class="btn btn-default" id="show_connect_button"
								onclick="show_connect_form()" style="<%if(!hasPhoneNum) out.print("display:none; ");%>float: right">수정하기</button>
						</h4>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="connect_show_form"
							method="POST"
							style="border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 핸드폰
									번호</label>
								<div class="control-wrapper">
									<input disabled="" name="cell_phone_number" id="cell_phone_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${cell_phone_number_code }${cell_phone_number_middle }${cell_phone_number_end }" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">전화번호</label>
								<div class="control-wrapper">
								<input disabled="" name="phone_number" id="phone_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${phone_number_code }${phone_number_entered}" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">팩스 번호</label>
								<div class="control-wrapper">
									<input disabled="" name="fax_number" id="fax_number2"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="${fax_number }" />
								</div>
							</div>
						</form>
						<form  action="/wjm/accounts/settings/profile/email" class="form-horizontal"
							enctype="multipart/form-data" id="connect_edit_form" method="POST"
							style="<%if(hasPhoneNum) out.print("display:none; ");%> border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="connect" />
							<div class="form-group ">
								<label class="control-label required"><span>*</span> 핸드폰
									번호</label>
								<div class="control-wrapper">
									<select class="form-control-phone" id="cell_phone_number_code"
										name="cell_phone_number_code">
										<option value=''>---</option>
										<option value='010'>010</option>
										<option value='011'>011</option>
										<option value='016'>016</option>
										<option value='017'>017</option>
										<option value='019'>019</option>
										</select><span class="form-phone-liner">-</span><input
										class="form-control-phone" id="cell_phone_number_middle"
										name="cell_phone_number_middle" type="text" value="" /><span
										class="form-phone-liner">-</span><input
										class="form-control-phone" id="cell_phone_number_end"
										name="cell_phone_number_end" type="text" value="" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required">전화번호</label>
								<div class="control-wrapper">
									<select class="form-control-phone" id="phone_number_code"
										name="phone_number_code"><option value=''>---</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
										<option value="999">해외</option></select><span class="form-phone-liner">-</span><input
										class="form-control-phone-noncell" id="phone_number_entered"
										name="phone_number_entered" type="text" value="" />
								</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
							</div>
							<div class="form-group ">
								<label class="control-label" for="company_name">팩스 번호</label>
								<div class="control-wrapper">
									<input class="form-control" id="fax_number" name="fax_number"
										type="text" value="" />
								</div>
							</div>
							<div class="form-group last-form-group"
								style="padding-top: 15px;">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										id="connect_submit_btn" style="margin-right: 10px;"
										type="button" value="등록하기" />
								</div>
							</div>
						</form>
						<h4>이메일 구독 설정</h4>
						<form action="/wjm/accounts/settings/profile/email" class="form-horizontal"
							enctype="multipart/form-data" id="email_edit_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="email" />
							<div class="form-group">
								<label class="control-label">이메일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=account.getEmail()%>" />
								</div>
							</div>
							<div class="form-group ">
								<div class="checkbox-wrapper">
									<div class="checkbox">
										<label class="" for="email_subscription"><input
											checked="checked" id="email_subscription"
											name="email_subscription" value="true" type="checkbox" />외주몬의 프로젝트 소식을
											구독합니다.</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
	function base_submit()
    {
		  var formData = new FormData($('#base_edit_form')[0]);
		$.ajax({
		    type: "POST",
		    url: "/wjm/accounts/settings/profile/base",
		    data: formData,  // 폼데이터 직렬화
		    async: false,
		    cache: false,
		    contentType: false,
		    processData: false,
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.msg;

			    if(messages == "success")
	        	{
			    	var accountinfo = data.accountinfo;
			    	
			    	if(data.hasBasicInfo == "true")
		        	{
        			edit_base_form();
		        	}
			        else
		        	{
	        		show_base_form();
		        	}
			    	
			    	var img_path = accountinfo.profile_img;
			    	var form_of_business = accountinfo.form;
			    	var full_name = accountinfo.name;
			    	var company_name = accountinfo.company_name;
			    	var representative = accountinfo.company_name;
			    	var gender = accountinfo.company_name;
			    	
			    	var str = accountinfo.birth_date;
			    	var date_of_birth_year, date_of_birth_month, date_of_birth_day;
			    	
			    	if(str == "")
			    		{
				    	date_of_birth_year = "";
				    	date_of_birth_month = "";
				    	date_of_birth_day = "";
			    		}
			    	else
			    		{
			    		var res = str.split("-");
				    	date_of_birth_year = res[0];
				    	date_of_birth_month = res[1];
				    	date_of_birth_day = res[2];
			    		}
			    	
			    	var address_sido = accountinfo.regionl;
			    	var sigungu = accountinfo.regionm;
			    	var address_detail = accountinfo.regionr;
			    	updateBasicInfo(img_path, form_of_business, full_name, company_name, representative,
			    			gender,date_of_birth_year ,date_of_birth_month,date_of_birth_day,address_sido,
			    			sigungu,address_detail);
			    	$("#messages").html("<div class='alert alert-success fade in'>기본 정보 등록을 완료했습니다.</div>");

	        	}
			    else
	        	{
				$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
	
	        	}
        
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});

	}
	function connect_submit()
    {
		$.ajax({
		    type: "POST",
		    url: "/wjm/accounts/settings/profile/connect",
		    data: $('#connect_edit_form').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.msg;

		    if(messages == "success")
		        	{
			        var accountinfo = data.accountinfo;
			        
			        if(data.hasPhoneNum == "true")
			        	{
	        			edit_connect_form();
			        	}
			        else
			        	{
		        		show_connect_form();
			        	}
			        
			        var str = accountinfo.cellphone_num;
			        var cell_phone_number_code,cell_phone_number_middle,cell_phone_number_end;
			        if(str == "")
			        	{
			        	cell_phone_number_code = "";
			        	cell_phone_number_middle = "";
			        	cell_phone_number_end = "";
			        	}
			        else
			        	{
				        var res = str.split("-");
			        	cell_phone_number_code = res[0];
			        	cell_phone_number_middle = res[1];
			        	cell_phone_number_end = res[2];
			        	$("#cell_phone_number2").val(str);
			        	}
			        
			        str = accountinfo.telephone_num;
			        var phone_number_code,phone_number_entered;
			        if(str == "")
		        	{
			        	phone_number_code = "";
			        	phone_number_entered = "";
		        	}
			        else
			        	{
				        var res = str.split("-");
				        phone_number_code = res[0];
				        phone_number_entered = res[1];
			        	$("#phone_number2").val(str);
			        	}
			        
			        var fax_number = accountinfo.fax_num;
		        	$("#fax_number2").val(fax_number);
			        
			        updateConnectInfo(cell_phone_number_code,cell_phone_number_middle,cell_phone_number_end,
			    			phone_number_code,phone_number_entered, fax_number);
					$("#messages").html("<div class='alert alert-success fade in'>연락처 정보 등록을 완료했습니다.</div>");

		        	}
		        else
		        	{
					$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

		        	}
		        
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});

    }
	function email_submit()
    {
		$.ajax({
		    type: "POST",
		    url: "/wjm/accounts/settings/profile/email",
		    data: $('#email_edit_form').serialize(),  // 폼데이터 직렬화
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.msg;

		    if(messages == "success")
        	{
		        var accountinfo = data.accountinfo;
		        
		        if(accountinfo.subscription == 1){
					document.getElementById("email_subscription").checked = true;
					$("#messages").html("<div class='alert alert-success fade in'>이메일 구독 신청을 완료했습니다.</div>");
		        }
				else{
					document.getElementById("email_subscription").checked = false;
					$("#messages").html("<div class='alert alert-success fade in'>이메일 구독 신청을 취소했습니다.</div>");
		        }
	        	}
	        else
	        	{
				$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

	        	}
		        
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});

    }
	
	function updateBasicInfo(img_path, form_of_business, full_name, company_name, representative,
			gender,date_of_birth_year ,date_of_birth_month,date_of_birth_day,address_sido,
			sigungu,address_detail)
	{
		if(form_of_business != null && form_of_business != "")
		{
			if(form_of_business == "individual")
				$('#get_form_of_business').val('개인');
			else if(form_of_business == "team")
				$('#get_form_of_business').val('팀');
			else if(form_of_business == "individual_business")
				$('#get_form_of_business').val('개인 사업자');
			else if(form_of_business == "corporate_business")
				$('#get_form_of_business').val('법인 사업자');
			
			var len = document.getElementById("form_of_business").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("form_of_business").options[i].value == form_of_business)
					{
						document.getElementById("form_of_business").options[i].selected = true;
						break;
					}
			}
		}
		if(full_name != null && full_name != "")
		{
			document.getElementById("full_name").value = full_name;
		}
		if(company_name != null && company_name != "")
		{
			document.getElementById("company_name").value = company_name;
		}
		if(representative != null && representative != "")
		{
			document.getElementById("representative").value = representative;
		}
		if(gender != null && gender != "")
		{
			if(gender == "남성")
				{
				document.getElementById("gender_1").checked = true;
				}
			else
				{
				document.getElementById("gender_2").checked = true;
				}
		}
		if(date_of_birth_year != null && date_of_birth_year != "")
		{
			$('#id_date_of_birth_year').html('<option value="">----</option>');
			var d = new Date();
			var year = d.getFullYear();
			for(var i=70; i>=0; i--)
			{
				if((year-i) == parseInt(date_of_birth_year))
					{
					$('#id_date_of_birth_year').append("<option value="+(year-i)+" selected>"+(year-i)+"</option>");
					}
				else
					{
					$('#id_date_of_birth_year').append("<option value="+(year-i)+">"+(year-i)+"</option>");
					}
			}
			$('#id_date_of_birth_year').selecter('refresh');
		}
		if(date_of_birth_month != null && date_of_birth_month != "")
		{
			$('#id_date_of_birth_month').html('<option value="">--</option>');
		
			for(var i=1;i<=12;i++)
			{
				if(i == parseInt(date_of_birth_month))
					{
					$('#id_date_of_birth_month').append("<option value="+i+" selected>"+i+"</option>");
					}
				else
					{
					$('#id_date_of_birth_month').append("<option value="+i+">"+i+"</option>");
					}
			}
			$('#id_date_of_birth_month').selecter('refresh');
		}
		if(date_of_birth_day != null && date_of_birth_day != "")
		{
			$('#id_date_of_birth_day').html('<option value="">--</option>');
		
			for(var i=1;i<=31;i++)
			{
				if(i == parseInt(date_of_birth_day))
					{
					$('#id_date_of_birth_day').append("<option value="+i+" selected>"+i+"</option>");
					}
				else
					{
					$('#id_date_of_birth_day').append("<option value="+i+">"+i+"</option>");
					}
			}
			$('#id_date_of_birth_day').selecter('refresh');
		}
		if(address_sido != null && address_sido != "")
		{
			var len = document.getElementById("address_sido").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("address_sido").options[i].value == address_sido)
					{
						document.getElementById("address_sido").options[i].selected = true;
						getSigungu(address_sido);
						break;
					}
			}
			$('#address_sido').selecter('refresh');
			$('#sigungu').selecter('refresh');
		}
		if(sigungu != null && sigungu != "")
		{
			var len = document.getElementById("sigungu").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("sigungu").options[i].value == sigungu)
					{
						document.getElementById("sigungu").options[i].selected = true;
						break;
					}
			}
		}
		if(address_detail != null && address_detail != "")
		{
			document.getElementById("address_detail").value = address_detail;
		}
	}
	
	function updateConnectInfo(cell_phone_number_code,cell_phone_number_middle,cell_phone_number_end,
			phone_number_code,phone_number_entered, fax_number)
	{
		if(cell_phone_number_code != null && cell_phone_number_code != "")
		{
			var len = document.getElementById("cell_phone_number_code").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("cell_phone_number_code").options[i].value == cell_phone_number_code)
					{
						document.getElementById("cell_phone_number_code").options[i].selected = true;
						break;
					}
			}
		}
		if(cell_phone_number_middle != null && cell_phone_number_middle != "")
		{
			document.getElementById("cell_phone_number_middle").value = cell_phone_number_middle;
		}
		if(cell_phone_number_end != null && cell_phone_number_end != "")
		{
			document.getElementById("cell_phone_number_end").value = cell_phone_number_end;
		}
		if(phone_number_code != null && phone_number_code != "")
		{
			var len = document.getElementById("phone_number_code").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("phone_number_code").options[i].value == phone_number_code)
					{
						document.getElementById("phone_number_code").options[i].selected = true;
						break;
					}
			}
		}
		if(phone_number_entered != null && phone_number_entered != "")
		{
			document.getElementById("phone_number_entered").value = phone_number_entered;
		}
		if(fax_number != null && fax_number != "")
		{
			document.getElementById("fax_number").value = fax_number;
		}
	}
	
	function updateEmailInfo(email_subscription)
	{
		if(email_subscription != null && email_subscription != "")
		{
			if(email_subscription == '1')
				document.getElementById("email_subscription").checked = true;
			else
				document.getElementById("email_subscription").checked = false;
		}
		
	}
	
    $(document).ready( function() {
    	
    	var d = new Date();
        for(var i=0;i < 70; i++) {
            var temp = '<option value="'+(parseInt(d.getFullYear())-i)+'">'+
                    (parseInt(d.getFullYear())-i)+'</option>';
            $('#id_date_of_birth_year').append(temp);
        }
    	
        var email_type = '';

        var img_path = "${img_path}";
        var form_of_business = "${form_of_business}";
        var full_name = "${full_name}";
        var company_name = "${company_name}";
        var representative = "${representative}";
        var gender = "${gender}";
        var date_of_birth_year = "${date_of_birth_year}";
        var date_of_birth_month = "${date_of_birth_month}";
        var date_of_birth_day = "${date_of_birth_day}";
        var address_sido = "${address_sido}";
        var sigungu = "${sigungu}";
        var address_detail = "${address_detail}";
        var cell_phone_number_code = "${cell_phone_number_code}";
        var cell_phone_number_middle = "${cell_phone_number_middle}";
        var cell_phone_number_end = "${cell_phone_number_end}";
        var phone_number_code = "${phone_number_code}";
        var phone_number_entered = "${phone_number_entered}";
        var fax_number = "${fax_number}";
        var email_subscription = "${email_subscription}";
        
        updateBasicInfo(img_path, form_of_business, full_name, company_name, representative,
    			gender,date_of_birth_year ,date_of_birth_month,date_of_birth_day,address_sido,
    			sigungu,address_detail);
		
        updateConnectInfo(cell_phone_number_code,cell_phone_number_middle,cell_phone_number_end,
    			phone_number_code,phone_number_entered, fax_number);
		
        updateEmailInfo(email_subscription);
		
    });
    $('.content-inner').on('change','#p5-file-btn', function() {
            if($('#p5-file-btn').val()==='') {
            } else {
                $('#p5-image-name').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn');
                $('#image_del').val('False');
            }
        });
    $('.content-inner').on('click','.p5-img-del-btn',function() {
        var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front" style="cursor: pointer; left: 0; margin-left: 0"><i class="fa fa-plus"></i>&nbsp;이미지 변경</button>'+
                '<input id="p5-file-btn" type="file" name="image" class="p5-custom-file-type-input" style="cursor: pointer; left: 0px;  margin-left: 0" accept="image/*">'+
                '<button type="button" class="btn btn-cancel p5-img-del-btn" style="left: 120px;">삭제</button><input type="hidden" name="image_del" id="image_del" value="True"/>';
        $('#p5-image-name').html("제출된 '<strong>프로필 이미지</strong>'가 없습니다.");
        $('#p5-file-btn').parent().html(imgAssignTag);
        $(this).siblings('input').val("");
        $(this).parent().siblings('.p5-img-name').html("제출된 '<strong>프로필 이미지</strong>'가 없습니다.");
    });
    $('.content-inner').on('change', '#email_subscription', function(){
        //$('#email_edit_form').submit();
        email_submit();
    });
    $('.content-inner').on('click', '#connect_submit_btn', function(){
        //$('#email_edit_form').submit();
        connect_submit();
    });
    $('.content-inner').on('click', '#base_submit_btn', function(){
        //$('#email_edit_form').submit();
        base_submit();
    });
    function show_connect_form(){
        $('#show_connect_button').css('display', 'none');
        $('#connect_show_form').css('display', 'none');
        $('#connect_edit_form').css('display', 'block');
    }
    function show_base_form(){
        $('#show_base_button').css('display', 'none');
        $('#base_show_form').css('display', 'none');
        $('#base_edit_form').css('display', 'block');
    }
    function edit_connect_form(){
        $('#show_connect_button').css('display', 'block');
        $('#connect_show_form').css('display', 'block');
        $('#connect_edit_form').css('display', 'none');
        $('#connect_submit_btn').val('등록하기');
    }
    function edit_base_form(){
        $('#show_base_button').css('display', 'block');
        $('#base_show_form').css('display', 'block');
        $('#base_edit_form').css('display', 'none');
        $('#base_submit_btn').val('등록하기');
    }
    $(function () {
        var $form, $form_val;
        $form = $('#form_of_business');
        $form_val = $form.val();
        if ($form_val != 'individual') {
            if($form_val == 'team'){
                $('#representative_label').html('<span>*</span> 팀 대표명');
                $('#company_name_label').html('<span>*</span> 팀명');
            }
            else{
                $('#representative_label').html('<span>*</span> 대표자명');
                $('#company_name_label').html('<span>*</span> 회사명');
            }
            $('#company_name').parents('.form-group').show();
            $('#representative').parents('.form-group').show();
            $('#date_of_birth_label').html('<span>*</span> 설립일');
            $('#full_name_label').html('<span>*</span> 담당자명');
            $('#gender_1').parents('.form-group').hide();
        }
        else{
            $('#gender_1').parents('.form-group').show();
            $('#full_name_label').html('<span>*</span> 이름');
            $('#date_of_birth_label').html('<span>*</span> 생년월일');
        }
        $form.on('change', function() {
            $form_val = $(this).val();
            if ($form_val == 'individual') {
                $('#full_name_label').html('<span>*</span> 이름');
                $('#date_of_birth_label').html('<span>*</span> 생년월일');
                $('#full_name_view_label').html('<span>*</span> 이름');
                $('#date_of_birth_view_label').html('<span>*</span> 생년월일');
                $('#company_name').parents('.form-group').hide();
                $('#representative').parents('.form-group').hide();
                $('#gender_1').parents('.form-group').show();
            }
            else if ($form_val == 'team'){
                $('#full_name_label').html('<span>*</span> 담당자명');
                $('#representative_label').html('<span>*</span> 팀 대표명');
                $('#company_name_label').html('<span>*</span> 팀명');
                $('#date_of_birth_label').html('<span>*</span> 설립일');
                $('#full_name_view_label').html('<span>*</span> 담당자명');
                $('#representative_view_label').html('<span>*</span> 팀 대표명');
                $('#company_name_view_label').html('<span>*</span> 팀명');
                $('#date_of_birth_view_label').html('<span>*</span> 설립일');
                $('#company_name').parents('.form-group').show();
                $('#representative').parents('.form-group').show();
                $('#gender_1').parents('.form-group').hide();
            }
            else {
                $('#full_name_label').html('<span>*</span> 담당자명');
                $('#representative_label').html('<span>*</span> 대표자명');
                $('#company_name_label').html('<span>*</span> 회사명');
                $('#date_of_birth_label').html('<span>*</span> 설립일');
                $('#full_name_view_label').html('<span>*</span> 담당자명');
                $('#representative_view_label').html('<span>*</span> 팀 대표명');
                $('#company_name_view_label').html('<span>*</span> 팀명');
                $('#date_of_birth_view_label').html('<span>*</span> 설립일');
                $('#company_name').parents('.form-group').show();
                $('#representative').parents('.form-group').show();
                $('#gender_1').parents('.form-group').hide();
            }
        });
    });
    
    function getSigungu(value)
    {
    	var options = '';
    	
    	if(value == '')
    		return false;
    	
    	$.ajax({
    		url : "/wjm/getAddress",
    		type : "POST",
    		data : 
    		{
    			area:value
    		},
    		dataType : "JSON",
    		success : function(data) {
    			
    			if(data!=null || data!="")
    			{
    				var list = data.arealist;
    				var listLen = list.length;
    				var $addressSigungu = $('input[name="address_sigungu"]');
                    var addressSigunguVal = $addressSigungu.val();

                    options = '';
    				for(var i=0;i<listLen;i++)
    				{
                        if (list[i] == addressSigunguVal) {
                            options += "<option value='" + list[i] + "' selected='selected'>" + list[i] + "</option>";
                        } else {
                            options += "<option value='" + list[i] + "'>" + list[i] + "</option>";
                        }
    				}
    	            $('#sigungu').html(options);
    	            $('#sigungu').selecter('refresh');
    			}
    		},

    		error : function(request, status, error) {
    			if (request.status != '0') {
    				alert("code : " + request.status + "\r\nmessage : "
    						+ request.reponseText + "\r\nerror : " + error);
    			}
    		}
    	});

        if (value === '') {
            options = '<option value="">선택</option>';
            $('#sigungu').html(options);
            $('#sigungu').selecter('refresh');
        }
    }
    $(function () {
        var $sido, sido_val;

        $sido = $('#address_sido');
        sido_val = $sido.val();
        if (sido_val !== 0) {
            getSigungu(sido_val);
        }

        $sido.on('change', function() {
            var value;
            value = $(this).val();
            getSigungu(value);
            
        });
    });
        $('.content-inner').on('click','#notify-modal-btn', function(e) {
            e.preventDefault();
            $('#notify-modal').modal('toggle');
        });
        $('.content-inner').on('click','#notify-cancel-modal-btn', function(e) {
            e.preventDefault();
            $('#notify-cancel-modal').modal('toggle');
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