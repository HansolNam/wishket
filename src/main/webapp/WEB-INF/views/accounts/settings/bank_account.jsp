<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	boolean hasAccount = false;
	String id = "", bank_name="",account_holder="",account_number="";
	
	if(account == null) response.sendRedirect("/accounts/login");
	else
	{
		id = account.getId();
		bank_name = (String)request.getAttribute("bank_name");
		account_holder = (String)request.getAttribute("account_holder");
		account_number = (String)request.getAttribute("account_number");
		
		if(bank_name == null) bank_name = "";
		if(account_holder == null) account_holder = "";
		if(account_number == null) account_number = "";
		
		if("true".equals((String)request.getAttribute("hasAccount")))
		{
			hasAccount = true;
		}
	}
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 계좌 관리</title>
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
</head>
<body class="logged-in client account-setting">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=id %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<h4 class="username"><%=id %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a class="active"
								href="/wjm/accounts/settings/profile/">기본 정보 수정</a></li>
							<li class=""><a href="/wjm/accounts/settings/verify_identity/">신원
									인증</a></li>
							<li class=" active "><a
								href="/wjm/accounts/settings/bank_account/">계좌 관리</a></li>
							<li class=""><a href="/wjm/accounts/settings/relogin/">비밀번호
									변경</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							계좌 관리 <small class="small-text">프로젝트 대금을 지급받을 계좌 정보를
								등록해주세요.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-warning.png" />
							<p class="process-guide-title-text">
								<strong>[ 계좌 관리 가이드 ]</strong><br /> 프로젝트 대금의 안전한 송금을 위해 <strong>정확한
									계좌번호</strong>가 필요합니다.
							</p>
						</div>
						<%
							if(!hasAccount)
							{
						%>
						<h4 id="sub_title">계좌 등록</h4>
						<%
							}
							else
							{
						%>
						<h4 id="sub_title">
							등록 계좌<input class="btn btn-default" id="do_edit"
								onclick="show_form()" style="float: right" type="submit"
								value="수정하기" />
						</h4>
						<%
							}
						%>
						<form action="." class="form-horizontal" id="show_bank_form"
							method="POST" style="margin-top: 25px;<%if(!hasAccount) out.print("display: none;");%>">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="v1CvkzdEylYHMo4IA35c483YZ2vjwmvs" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 은행명</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=bank_name %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 예금주</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=account_holder %>" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									계좌번호</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="<%=account_number %>" />
								</div>
							</div>
						</form>
						<form class="form-horizontal" enctype="multipart/form-data"
							id="edit_bank_form" method="POST" style="margin-top: 25px;<%if(hasAccount) out.print("display: none;");%>">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" /><span
								class="help-block"></span>
							<div class="form-group ">
								<label class="control-label required" for="id_bank"><span>*</span>
									은행명</label>
								<div class="control-wrapper">
									<select class="form-control" id="id_bank" name="bank"
										required="required"><option value="">은행 선택</option>
										<option value="1">한국산업은행</option>
										<option value="2">기업은행</option>
										<option value="3">국민은행</option>
										<option value="4">우리은행</option>
										<option value="5">신한은행</option>
										<option value="6">하나은행</option>
										<option value="7">농협</option>
										<option value="8">단위농협</option>
										<option value="9">SC은행</option>
										<option value="10">외환은행</option>
										<option value="11">한국씨티은행</option>
										<option value="12">우체국</option>
										<option value="13">경남은행</option>
										<option value="14">광주은행</option>
										<option value="15">대구은행</option>
										<option value="16">도이치</option>
										<option value="17">부산은행</option>
										<option value="18">산림조합</option>
										<option value="19">산업은행</option>
										<option value="20">상호저축은행</option>
										<option value="21">새마을금고</option>
										<option value="22">수협</option>
										<option value="23">신협중앙회</option>
										<option value="24">전북은행</option>
										<option value="25">제주은행</option>
										<option value="26">BOA</option>
										<option value="27">HSBC</option>
										<option value="28">JP모간</option>
										<option value="29">교보증권</option>
										<option value="30">대신증권</option>
										<option value="31">대우증권</option>
										<option value="32">동부증권</option>
										<option value="33">동양증권</option>
										<option value="34">메리츠증권</option>
										<option value="35">미래에셋</option>
										<option value="36">부국증권</option>
										<option value="37">삼성증권</option>
										<option value="38">솔로몬투자증권</option>
										<option value="39">신영증권</option>
										<option value="40">신한금융투자</option>
										<option value="41">우리투자증권</option>
										<option value="42">유진투자은행</option>
										<option value="43">이트레이드증권</option>
										<option value="44">키움증권</option>
										<option value="45">하나대투</option>
										<option value="46">하이투자</option>
										<option value="47">한국투자</option>
										<option value="48">한화증권</option>
										<option value="49">현대증권</option>
										<option value="50">HMC증권</option>
										<option value="51">LIG투자증권</option>
										<option value="52">NH증권</option>
										<option value="53">SK증권</option>
										<option value="54">비엔비파리바은행</option></select>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="id_account_holder"><span>*</span>
									예금주</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_account_holder"
										name="account_holder" required="required" type="text" />
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="id_account_number"><span>*</span>
									계좌번호</label>
								<div class="control-wrapper">
									<input class="form-control" id="id_account_number"
										name="account_number" required="required" type="text" /><span
										class="help-block">'-'를 제외하고 입력해주세요.</span>
								</div>
							</div>
							<input id="id_owner" name="owner" type="hidden" value="28155" />
							<div class="form-group">
								<div style="float: right; margin-top: 15px; margin-right: 10px;">
									<input class="btn btn-client" id="bank_account_submit_btn"
										type="submit" value="등록하기" />
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
    $(document).ready(function(){

		var bank_name = "${bank_name}";
		var bank_id = "${bank_id}";
		var account_holder = "${account_holder}";
		var account_number = "${account_number}";

		var messages = "${messages}";
		if(messages != null && messages != "")
			$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

		if(bank_name == null || bank_id == null ||account_holder == null || account_number == null)
			show_form();
		else if(bank_name == ""||bank_id == ""||account_holder == ""||account_number == "")
			show_form();
		else
			cancel_edit();

		if(bank_id != null && bank_id != "")
		{
			var len = document.getElementById("id_bank").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("id_bank").options[i].value == bank_id)
					{
						document.getElementById("id_bank").options[i].selected = true;
						break;
					}
			}
		}
		if(account_holder != null && account_holder != "")
		{
			document.getElementById("id_account_holder").value = account_holder;
		}
		if(account_number != null && account_number != "")
		{
			document.getElementById("id_account_number").value = account_number;
		}
    });

    var bank_id = $('#id_bank').val();
    function show_form(){
    	$('#sub_title').html("계좌 등록");
        $('#edit_bank_form').css('display', 'block');
        $('#show_bank_form').css('display', 'none');
        $('#cancel_edit').css('display', 'block');
        $('#do_edit').css('display', 'none');
        $('#bank_account_submit_btn').val('수정하기');
    }
    function cancel_edit(){
    	$('#sub_title').html("등록 계좌<input class='btn btn-default' id='do_edit'"+
    			"onclick='show_form()' style='float: right' type='submit'"+
    			"value='수정하기' />");
        $('#edit_bank_form').css('display', 'none');
        $('#show_bank_form').css('display', 'block');
        $('#cancel_edit').css('display', 'none');
        $('#do_edit').css('display', 'block');
        $('#id_bank').val(bank_id);
        $('#id_account_holder').val('');
        $('#id_account_number').val('');
    }
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