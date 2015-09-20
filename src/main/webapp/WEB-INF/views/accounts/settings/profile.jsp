<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");

	if(account == null) response.sendRedirect("/wjm/accounts/login");
	
	AccountInformationInfo accountinfo = (AccountInformationInfo)request.getAttribute("accountinfo");
	boolean hasBasicInfo=false, hasPhoneNum=false, hasEmail=false;
	
	if((String)request.getAttribute("hasBasicInfo") != null)
		hasBasicInfo = true;
	if((String)request.getAttribute("hasPhoneNum") != null)
		hasPhoneNum = true;
	if((String)request.getAttribute("hasEmail") != null)
		hasEmail = true;
	
	if(accountinfo != null)
	{

		String img_path = "";
		img_path = accountinfo.getProfile_img() ;
		if(img_path == null)
			img_path = "resources/static/img/default_avatar.png";
		if(img_path.isEmpty())
			img_path = "resources/static/img/default_avatar.png";
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
								src="${pageContext.request.contextPath}/<%=img_path %>" />
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
								onclick="show_base_form()" style="<% if(!hasBasicInfo) out.print("display: none;");%> float: right">수정하기</button>
						</h4>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_show_form" method="POST"
							style="<% if(!hasBasicInfo) out.print("display: none;");%> border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 프로필
									사진</label>
								<div class="control-wrapper" style="padding-top: 7px;">
									<img alt="<%=account.getId() %> 사진" class="partners-img"
										src="${pageContext.request.contextPath}/<%=img_path %>"
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
										type="text" value="<%
										if(accountinfo.getForm().equals("individual"))
											out.print("개인");
										else if(accountinfo.getForm().equals("team"))
											out.print("팀");
										else if(accountinfo.getForm().equals("individual_business"))
											out.print("개인 사업자");
										else if(accountinfo.getForm().equals("corporate_business"))
											out.print("법인 사업자");
										else
											out.print("None");
										%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 이름</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getName()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 성별</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getSex()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									생년월일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getBirth_date()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 지역
									- 시, 도</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getRegionl()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 세부
									지역 - 시, 군, 구</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getRegionm()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">나머지 주소</label>
								<div class="control-wrapper">
									<input style="border: none; margin-top: 5px;"
										type="text" value="<%=accountinfo.getRegionr()%>" />
								</div>
							</div>
						</form>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_edit_form" method="POST"
							novalidate=""
							style="<% if(hasBasicInfo) out.print("display: none;");%>border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
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
											style="margin-top: 8px;">제출된 '<strong>프로필 이미지</strong>'가
											없습니다.
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
										
										<%
										String list1[] = {"individual","team","individual_business","corporate_business"};
										String list2[] = {"개인","팀","개인 사업자","법인 사업자"};
									
										for(int i=0;i<list1.length;i++)
										{
											if(list1[i].equals(accountinfo.getForm()))
												out.println("<option selected='' value='"+list1[i]+"'>"+list2[i]+"</option>");
											else
												out.println("<option value='"+list1[i]+"'>"+list2[i]+"</option>");
										
										}
										%>
										</select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" id="full_name_label"><span>*</span>
									담당자명</label>
								<div class="control-wrapper">
									<input class="form-control" id="full_name" name="full_name"
										type="text" value=<%=accountinfo.getName()%> />
								</div>
							</div>
							<div class="form-group " style="display: none;">
								<label class="control-label required" for="company_name"
									id="company_name_label"><span>*</span> 회사명</label>
								<div class="control-wrapper">
									<input class="form-control" id="company_name"
										name="company_name" type="text" value="<%=accountinfo.getCompany_name()%>" />
								</div>
							</div>
							<div class="form-group " style="display: none;">
								<label class="control-label required" for="representative"
									id="representative_label"><span>*</span> 대표자명</label>
								<div class="control-wrapper">
									<input class="form-control" id="representative"
										name="representative" type="text" value="<%=accountinfo.getCompany_representative()%>" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="gender"><span>*</span>
									성별</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="gender_1"><input
												id="gender_1" name="gender" required="" type="radio"
												value="m" <%if(accountinfo.getSex().equals("남성")) out.print("checked"); %>/>남성</label></li>
										<li><label class="radio-inline" for="gender_2"><input
												id="gender_2" name="gender" required="" type="radio"
												value="f" <%if(accountinfo.getSex().equals("여성")) out.print("checked"); %> />여성</label></li>
									</ul>
								</div>
							</div>
							<%
								String[] birth = accountinfo.getBirth_date().split("-");
								
							%>
							<div class="form-group ">
								<label class="control-label required" for="date_of_birth"
									id="date_of_birth_label"><span>*</span> 설립일</label>
								<div class="control-wrapper">
									<select class="form-control" id="id_date_of_birth_year"
										name="date_of_birth_year"><option value="">---</option>
										
										
										<option value="1945">1945</option>
										<option value="1946">1946</option>
										<option value="1947">1947</option>
										<option value="1948">1948</option>
										<option value="1949">1949</option>
										<option value="1950">1950</option>
										<option value="1951">1951</option>
										<option value="1952">1952</option>
										<option value="1953">1953</option>
										<option value="1954">1954</option>
										<option value="1955">1955</option>
										<option value="1956">1956</option>
										<option value="1957">1957</option>
										<option value="1958">1958</option>
										<option value="1959">1959</option>
										<option value="1960">1960</option>
										<option value="1961">1961</option>
										<option value="1962">1962</option>
										<option value="1963">1963</option>
										<option value="1964">1964</option>
										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option></select><select class="form-control"
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
										<option value="17">제주특별자치도</option></select>
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
										name="address_detail" type="text" value="<%=accountinfo.getRegionr()%>" />
								</div>
							</div>
							<div class="form-group last-form-group"
								style="padding-top: 15px;">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										id="base_submit_btn" style="<% if(hasBasicInfo) out.print("display: none;");%>margin-right: 10px;" type="submit"
										value="등록하기" />
								</div>
							</div>
						</form>
						<h4>
							연락처 정보 입력
							<button class="btn btn-default" id="show_connect_button"
								onclick="show_connect_form()" style="float: right">수정하기</button>
						</h4>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="connect_show_form"
							method="POST"
							style="<% if(!hasPhoneNum) out.print("display: none;");%>border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 핸드폰
									번호</label>
								<div class="control-wrapper">
									<input disabled="" name="cell_phone_number"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getCellphone_num()%>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">전화번호</label>
								<div class="control-wrapper">
								<%
								if(accountinfo.getTelephone_num()==null )
								{
								%>
									<input onclick="show_connect_form()"
										style="border: none; margin-top: 5px; width: 100%; color: #2099bb; cursor: pointer;"
										type="text" value="세부 사항을 입력해 주세요." />
								<%
								}
								else if(accountinfo.getTelephone_num().isEmpty() )
								{
								%>
									<input onclick="show_connect_form()"
										style="border: none; margin-top: 5px; width: 100%; color: #2099bb; cursor: pointer;"
										type="text" value="세부 사항을 입력해 주세요." />
								<%
								}
								else
								{
									%>
									<input disabled="" name="phone_number"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getCellphone_num()%>" />
									<%
								}
								%>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">팩스 번호</label>
								<div class="control-wrapper">
								<%
								if(accountinfo.getTelephone_num()==null )
								{
								%>
									<input onclick="show_connect_form()"
										style="border: none; margin-top: 5px; width: 100%; color: #2099bb; cursor: pointer;"
										type="text" value="세부 사항을 입력해 주세요." />
								<%
								}
								else if(accountinfo.getTelephone_num().isEmpty() )
								{
								%>
									<input onclick="show_connect_form()"
										style="border: none; margin-top: 5px; width: 100%; color: #2099bb; cursor: pointer;"
										type="text" value="세부 사항을 입력해 주세요." />
								<%
								}
								else
								{
									%>
									<input disabled="" name="fax_number"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=accountinfo.getFax_num()%>" />
									<%
								}
								%>
								</div>
							</div>
						</form>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="connect_edit_form"
							method="POST"
							style="<% if(hasPhoneNum) out.print("display: none;");%> border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="connect" />
							<div class="form-group ">
								<label class="control-label required"><span>*</span> 핸드폰
									번호</label>
								<div class="control-wrapper">
									<select class="form-control-phone" id="cell_phone_number_code"
										name="cell_phone_number_code">
										<%
											String[] cellphone_num_code = {"010","011","016","017","019"};
											String cellphone_num = accountinfo.getCellphone_num();
											String[] cellphone_num_list = {"","",""};

											if(cellphone_num != null )
											{
												if(!cellphone_num.isEmpty())
												{
													String[] split = cellphone_num.split("-");
													if(split.length == 3)
														cellphone_num_list = split;
												}
											}
											
											for(int i=0;i<cellphone_num_code.length;i++)
											{
												if(cellphone_num_code[i].equals(cellphone_num_list[0]))
													out.println("<option selected='' value='"+cellphone_num_code[i]+"'>"+cellphone_num_code[i]+"</option>");
												else
													out.println("<option value='"+cellphone_num_code[i]+"'>"+cellphone_num_code[i]+"</option>");
											}
										
										%></select><span class="form-phone-liner">-</span><input
										class="form-control-phone" id="cell_phone_number_middle"
										name="cell_phone_number_middle" type="text" value="<%=cellphone_num_list[1]%>" /><span
										class="form-phone-liner">-</span><input
										class="form-control-phone" id="cell_phone_number_end"
										name="cell_phone_number_end" type="text" value="<%=cellphone_num_list[2]%>" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required">전화번호</label>
								<div class="control-wrapper">
									<select class="form-control-phone" id="phone_number_code"
										name="phone_number_code"><option>---</option>
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
										type="text" value="<%=accountinfo.getFax_num() %>" />
								</div>
							</div>
							<div class="form-group last-form-group"
								style="padding-top: 15px;">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										id="connect_submit_btn" style="margin-right: 10px;"
										type="submit" value="등록하기" />
								</div>
							</div>
						</form>
						<h4>이메일 구독 설정</h4>
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="email_edit_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><input
								name="submit_type" type="hidden" value="email" />
							<div class="form-group">
								<label class="control-label">이메일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="gksthf1611@naver.com" />
								</div>
							</div>
							<div class="form-group ">
								<div class="checkbox-wrapper">
									<div class="checkbox">
										<label class="" for="email_subscription"><input
											checked="checked" id="email_subscription"
											name="email_subscription" type="checkbox" />위시켓의 프로젝트 소식을
											구독합니다.</label>
									</div>
								</div>
							</div>
						</form>
						<div aria-hidden="true"
							class="modal p5-profile-delete-modal fade " id="notify-modal"
							role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">이메일 구독 설정</h4>
									</div>
									<div class="modal-body">
										<p class="text-center bold-font">
											<span>이메일 구독 신청이 완료되었습니다.</span>
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="notify-modal-btn">확인</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true"
							class="modal p5-profile-delete-modal fade "
							id="notify-cancel-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">이메일 구독 설정</h4>
									</div>
									<div class="modal-body">
										<p class="text-center bold-font">
											<span>이메일 구독이 취소되었습니다.</span>
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="notify-cancel-modal-btn">확인</button>
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
<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
    $(document).ready( function() {
        var email_type = '';
        
        $('#id_date_of_birth_year').val('');
        $('#id_date_of_birth_month').val('');
        $('#id_date_of_birth_day').val('');
        
        
            $('#cell_phone_number_code').val('010');
        
        
        
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
        $('#email_edit_form').submit();
    });
    function show_connect_form(){
        $('#show_connect_button').css('display', 'none');
        $('#connect_show_form').css('display', 'none');
        $('#connect_edit_form').css('display', 'block');
        $('#connect_submit_btn').val('수정하기');
    }
    function show_base_form(){
        $('#show_base_button').css('display', 'none');
        $('#base_show_form').css('display', 'none');
        $('#base_edit_form').css('display', 'block');
        $('#base_submit_btn').val('수정하기');
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
    $(function () {
        var $sido, sido_val, getSigungu;

        getSigungu = function(value) {
        	var options = '';
        	
        	if(value == '')
        		return false;
        	
        	$.ajax({
        		url : "/wjm/getAddress2",
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
<%
}
else
{
	response.sendRedirect("/wjm/accounts/login");
}
%>