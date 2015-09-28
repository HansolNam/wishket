<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator, com.wjm.models.AccountInfo,com.wjm.models.AccountInformationInfo, com.wjm.models.AuthenticationInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	AccountInformationInfo accountinfo = (AccountInformationInfo)request.getAttribute("accountinfo");
	AuthenticationInfo authenticationinfo = (AuthenticationInfo)request.getAttribute("authenticatoninfo");
	
	String hasBasicInfo = (String)request.getAttribute("hasBasicInfo");
	String hasAuthentication = (String)request.getAttribute("hasAuthentication");
	
	String img_path = accountinfo.getProfile_img();
	if(img_path!= null)
		{
			if(img_path.isEmpty())
				img_path = "default_avatar.png";
		}
	else
		img_path = "default_avatar.png";
	
	
	String user_type = "";
	String identity_doc = "";
	String representer_name = "";
	String address_detail = "";
	String email_for_tax = "";
	String identify_number = "";
	String company_name = "";
	
	String name = accountinfo.getName();
	String id = account.getId();
	String form = accountinfo.getForm();
	
	if(!Validator.hasValue(name))
		name = "";
	if(!Validator.hasValue(id))
		id = "";
	if(hasAuthentication != null)
	{	
		user_type = authenticationinfo.getUser_type();
		identity_doc = authenticationinfo.getIdentity_doc();
		representer_name = authenticationinfo.getRepresenter_name();
		address_detail = authenticationinfo.getAddress_detail();
		email_for_tax = authenticationinfo.getEmail_for_tax();
		identify_number = authenticationinfo.getIdentify_number();
		company_name = authenticationinfo.getCompany_name();
	}
	if(form.equals("individual")) form = "개인";
	else if(form.equals("team")) form = "팀";
	else if(form.equals("individual_business")) form = "개인 사업자";
	else if(form.equals("corporate_business")) form = "법인 사업자";
	else form = "";
		
	
%>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 신원 인증</title>
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
<body class="logged-in client account-setting">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=id %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=img_path %>" />
							<h4 class="username"><%= id %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a class="active"
								href="/wjm/accounts/settings/profile/">기본 정보 수정</a></li>
							<li class="active"><a
								href="/wjm/accounts/settings/verify_identity/">신원 인증</a></li>
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
							신원 인증 <small class="small-text">안전한 프로젝트 계약을 위해
								신분증(사업자등록증)을 통한 신원 확인이 필요합니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png" />
							<p class="process-guide-title-text">
								<strong>[ 인증 서류 관리 가이드 ]</strong><br /> 제출한 인증 서류는 <strong
									style="color: #2099bb"><a href="/wjm/privacy/">개인 정보
										취급 방침</a></strong>에 의해 관리됩니다.
							</p>
							<div
								style="border-top: 1px dashed #dedede; padding-top: 17px; width: 100%;">
								<div style="float: left;">
									<img src="${pageContext.request.contextPath}/resources/static/img/identity_guide_one.png"
										style="margin-left: 30px; margin-top: 5px; margin-right: 14px;" />
								</div>
								<p style="float: left">
									<strong>인증 서류 제출</strong><br /> 프로젝트의 계약을 위해, <strong>인증
										서류 제출이 꼭 필요합니다.</strong><br /> 신원인증 서류는 계약서 작성 시에 이용됩니다.
								</p>
								<div style="clear: both"></div>
							</div>
							<table style="margin-left: 50px; margin-bottom: 10px;">
								<tbody>
									<tr
										style="border-top: 2px solid #2099bb; border-bottom: 1px solid #e7e7e7">
										<td
											style="padding: 11px 20px; font-weight: bold; background: #f5f5f5">법인
											사업자 , 개인 사업자</td>
										<td
											style="padding: 11px 20px; border-right: 1px solid #e7e7e7; border-left: 1px solid #e7e7e7;">사업자
											등록증</td>
										<td
											style="padding: 11px 20px; font-weight: bold; background: #f5f5f5">개인
											, 팀</td>
										<td
											style="padding: 11px 20px; border-right: 1px solid #e7e7e7; border-left: 1px solid #e7e7e7;">주민등록증,
											여권, 운전면허증</td>
									</tr>
								</tbody>
							</table>
							<div style="width: 600px;">
								<div style="float: left;">
									<img src="${pageContext.request.contextPath}/resources/static/img/identity_guide_two.png"
										style="margin-left: 30px; margin-top: 5px; margin-right: 10px;" />
								</div>
								<p style="float: left;">
									<strong>신원 인증 처리 중</strong><br /> 신원 인증 처리에는 <strong>최대
										24시간이 소요</strong>됩니다.<br /> 인증 서류에 문제가 있을 경우에는 <strong>위시켓 팀에서
										이메일로 연락</strong>을 드립니다.
								</p>
								<div style="clear: both"></div>
							</div>
							<div style="width: 800px; margin-bottom: 15px;">
								<div style="float: left;">
									<img src="${pageContext.request.contextPath}/resources/static/img/identity_guide_three.png"
										style="margin-left: 30px; margin-top: 5px; margin-right: 10px;" />
								</div>
								<p style="float: left;">
									<strong>신원 인증 처리 완료</strong><br /> 신원 인증 서류를 변경하실 경우에는 위시켓으로
									전화를 주시면 신속하게 도와드립니다. <strong>( <i class="fa fa-phone"></i>
										02-6925-4849)
									</strong>
								</p>
								<div style="clear: both"></div>
							</div>
						</div>
						<%
							if(hasBasicInfo == null)
							{
						%>
						<h4>인증 서류 제출</h4>
						<div style="margin-top: 25px;">
							<p align="center" style="font-weight: bold;">
								기본 정보 입력 후에 인증 신청이 가능합니다.<br /> <a
									href="/wjm/accounts/settings/profile/"
									style="font-weight: bold; line-height: 30px;">기본 정보 입력하기
									&gt;</a>
							</p>
						</div>
						<%
							}
							else
							{
						%>
							<form action="/wjm/accounts/settings/verify_identity/"
							class="form-horizontal" enctype="multipart/form-data"
							method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="v1CvkzdEylYHMo4IA35c483YZ2vjwmvs" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 회사
									형태</label>
								<div class="control-wrapper">
									<input name="business_form_value" type="hidden"
										value="individual" /><input disabled=""
										name="form_of_business"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=form %>" /><span class="help-block">[기본
										정보 수정] 탭에서 수정 가능합니다.</span>
								</div>
							</div>
							<div class="form-group " id="individual_type_form"
								style="display: none;">
								<label class="control-label required" for="form_of_business"><span>*</span>
									개인 사업자 형태</label>
								<div class="control-wrapper">
									<select class="form-control" id="user_type" name="user_type"
										required="required"><option selected="" value="1">일반
											과세자</option>
										<option value="3">간이 과세자</option>
										<option value="4">부가가치세 면세 사업자</option></select>
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group ">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>인증 서류 이미지</label>
								<div class="p5-portfoilo-img-control-wrapper"
									style="height: 110px;">
									<div class="control-wrapper">
										<span class="p5-img-name" id="p5-image-name"
											style="margin-top: 8px;">
										</span> 
										<span class="p5-custom-file-type-input-wrapper"><button
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
												style="left: 120px;" type="button" id="image-del_btn">삭제</button></span> <span
											class="help-block" style="position: relative; top: 85px">이미지
											파일(.jpg, .jpeg, .png, .gif 등)만 업로드할 수 있습니다.</span>
									</div>
								</div>
							</div>
							<section id="individual_form" style="display: none">
								<div class="form-group ">
									<label class="control-label required"><span>*</span> 성명</label>
									<div class="control-wrapper">
										<input class="form-control" name="representer_name" id="representer_name1" 
											type="text" value="" />
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"><span>*</span> 주소</label>
									<div class="control-wrapper">
										<input class="form-control" name="address_detail" type="text"  id="address_detail1" 
											value="" />
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"
										style="padding-left: 60px; *padding-left: 70px; *width: 180px;"><span>*</span>
										세금계산서용 이메일 주소</label>
									<div class="control-wrapper">
										<input class="form-control" name="email_for_tax"  id="email_for_tax1" type="email" value="" /><span
											class="help-block">계약서, 세금계산서 등을 받아볼 이메일 주소를 입력해 주세요.</span>
									</div>
								</div>
							</section>
							<section id="business_form" style="display: none">
								<div class="form-group ">
									<label class="control-label required"><span>*</span>
										사업자 등록 번호</label>
									<div class="control-wrapper">
										<input class="form-control" name="identify_number"  id="identify_number" type="text" value="" 
										/><span
											class="help-block">'-'를 제외하고 입력해주세요. (10자리)</span>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"><span>*</span>
										법인명 (단체명)</label>
									<div class="control-wrapper">
										<input class="form-control" name="company_name" type="text"  id="company_name"
											value="" />
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"><span>*</span>
										대표자명</label>
									<div class="control-wrapper">
										<input class="form-control" name="representer_name"  id="representer_name2"
											type="text" value="" />
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"><span>*</span>
										사업장 소재지</label>
									<div class="control-wrapper">
										<input class="form-control" name="address_detail" type="text"  id="address_detail2"
											value=""/>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label required"
										style="padding-left: 60px; *padding-left: 70px; *width: 180px;"><span>*</span>
										세금계산서용 이메일 주소</label>
									<div class="control-wrapper" style="width: 380px;">
										<input class="form-control" name="email_for_tax"  id="email_for_tax2"
											style="width: 340px;" type="email" value=""/>
											<span class="help-block">계약서,
											세금계산서 등을 받아볼 이메일 주소를 입력해 주세요.</span>
									</div>
								</div>
							</section>
							
							<%
							if(hasAuthentication==null){
							%>
							<div class="form-group last-form-group"
								style="padding-top: 15px;">
								<div style="float: right">
									<input class="btn btn-partners account-btn"
										style="margin-right: 10px;" type="submit" value="제출하기" />
								</div>
							</div>
							<%
							}
							%>
						</form>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script>
    $(document).ready(function(){

    	var identity_doc = "<%=identity_doc%>";
    	var user_type = "<%=user_type%>";
    	var representer_name = "<%=representer_name%>";
    	var address_detail = "<%=address_detail%>";
    	var email_for_tax = "<%=email_for_tax%>";
    	var identify_number = "<%=identify_number%>";
    	var company_name = "<%=company_name%>";
    	
    	var messages = "${messages}";

    	if(identity_doc != null && identity_doc != "")
   		{
   			$("#p5-image-name").html(identity_doc);
			$( "#p5-file-btn" ).prop( "disabled", true );
			$( "#image-del_btn" ).prop( "disabled", true );
			
   		}
    	if(messages != null && messages != "")
    		$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

    	if(user_type != null && user_type != "")
		{///
			document.getElementById("user_type").value = user_type;
			$( "#user_type" ).prop( "disabled", true );
		}
    	if(representer_name != null && representer_name != "")
		{
			document.getElementById("representer_name1").value = representer_name;
			document.getElementById("representer_name2").value = representer_name;
			$( "#representer_name1" ).prop( "disabled", true );
			$( "#representer_name2" ).prop( "disabled", true );
		}
    	if(address_detail != null && address_detail != "")
		{
			document.getElementById("address_detail1").value = address_detail;
			document.getElementById("address_detail2").value = address_detail;
			$( "#address_detail1" ).prop( "disabled", true );
			$( "#address_detail2" ).prop( "disabled", true );
		}
    	if(email_for_tax != null && email_for_tax != "")
		{
			document.getElementById("email_for_tax1").value = email_for_tax;
			document.getElementById("email_for_tax2").value = email_for_tax;
			$( "#email_for_tax1" ).prop( "disabled", true );
			$( "#email_for_tax2" ).prop( "disabled", true );
		}
    	if(identify_number != null && identify_number != "")
		{
			document.getElementById("identify_number").value = identify_number;
			$( "#identify_number" ).prop( "disabled", true );
		}
    	if(company_name != null && company_name != "")
		{
			document.getElementById("company_name").value = company_name;
			$( "#company_name" ).prop( "disabled", true );
		}
    	
        var type = '<%=form%>';
        if(type == '개인' || type == '팀'){
            $('#individual_form').css('display', 'block');
            $('#individual_type_form').remove();
            $('#business_form').remove();
        }
        else if (type == '개인 사업자'){
            $('#individual_form').remove();
            $('#individual_type_form').css('display', 'block');
            $('#business_form').css('display', 'block');
        }
        else {
            $('#individual_form').remove();
            $('#individual_type_form').remove();
            $('#business_form').css('display', 'block');
        }
    });
    $('.content-inner').on('change','#p5-file-btn', function() {
            if($('#p5-file-btn').val()==='') {
                //donothing
            } else {
                $('#p5-image-name').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn');


            }
        });
    $('.content-inner').on('click','.p5-img-del-btn',function() {
        var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front" style="cursor: pointer; left: 0; margin-left: 0"><i class="fa fa-plus"></i>&nbsp;이미지 변경</button>'+
                '<input id="p5-file-btn" type="file" name="image" class="p5-custom-file-type-input" style="cursor: pointer; left: 0px;  margin-left: 0" accept="image/*">'+
                '<button type="button" class="btn btn-cancel p5-img-del-btn" style="left: 120px;">삭제</button>';
        $('#p5-image-name').html("제출된 '<strong>인증 서류</strong>'가 없습니다.");
        $('#p5-file-btn-1').parent().html(imgAssignTag);

        $(this).siblings('input').val("");
        $(this).parent().siblings('.p5-img-name').html("제출된 '<strong>인증 서류</strong>'가 없습니다.");
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