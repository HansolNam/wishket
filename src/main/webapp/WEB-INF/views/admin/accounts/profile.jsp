<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							<img alt=" 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${img_path}" />
							<h4 class="username">id</h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a class="active"
								href="/wjm/admin/accounts/profile/">기본 정보</a></li>
							<li class=""><a href="/wjm/admin/accounts/verify_identity/">신원
									인증</a></li>
							<li class=""><a href="/wjm/admin/accounts/bank_account/">계좌
									관리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
				<p class="back">
				<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
					<div class="content-header action">
						<h3 class="header-text">
							기본 정보 <small class="small-text">사용자 기본 정보 입니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<form action="/wjm/accounts/settings/profile/" class="form-horizontal"
							enctype="multipart/form-data" id="base_show_form" method="POST"
							style="border-bottom: 1px dashed #dedede; padding-bottom: 25px; margin-bottom: 30px;">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="7YCuiuWVSyxVfH1qjb8JOSXcBvfKqQBY" />
							<div class="form-group">
								<label class="control-label required"><span>*</span> 프로필
									사진</label>
								<div class="control-wrapper" style="padding-top: 7px;">
									<img alt=" 사진" class="partners-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/"
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
										type="text" value="aaa" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 성별</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="aaaa" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span>
									생년월일</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="aaa-aaa-aaa" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 지역
									- 시, 도</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="aaa" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label required"><span>*</span> 세부
									지역 - 시, 군, 구</label>
								<div class="control-wrapper">
									<input disabled="" name="identification"
										style="border: none; width: 100%; margin-top: 5px;"
										type="text" value="aaa" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">나머지 주소</label>
								<div class="control-wrapper">
									<input style="border: none; margin-top: 5px;"
										type="text" value="aaa" />
								</div>
							</div>
						</form>
						
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
										type="text" value="aaa" />
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