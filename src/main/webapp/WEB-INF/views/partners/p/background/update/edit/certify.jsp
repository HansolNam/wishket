<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.LicenseInfo"%>
	<%@ page import="java.sql.Timestamp, com.wjm.main.function.Time"%>
<%
	AccountInfo this_account = (AccountInfo)request.getAttribute("this_account");
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	String isSame = (String)request.getAttribute("isSame");
	LicenseInfo license = (LicenseInfo)request.getAttribute("license");
	Timestamp temp = Time.dateToTimestamp5(license.getPublication_date());
	int date_issued_year = temp.getYear()+1900;
	int date_issued_month = temp.getMonth()+1;
	int date_issued_day = temp.getDate()+1;

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

<title>외주몬(WJM) · 파트너스 정보 설정</title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
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
<body class="logged-in partners partners-setting">
	<div id="wrap">
		
		<jsp:include page="../../../../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/partners/p/<%=this_account.getId() %>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> <a
								href="/partners/p/<%=this_account.getId() %>/background/update/">[ 경력, 학력,
								자격증 ]</a>
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/skill/update/">보유
									기술</a></li>
							<li class="active"><a
								href="/partners/p/<%=this_account.getId() %>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/partners/p/<%=this_account.getId() %>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">자격증 수정</h3>
						</section>
						<section>
						<h4>자격증</h4>
						<form id="certification_edit_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" />
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>자격증</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-certification-title-input"
										name="title" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>발행기관</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-Institution-input"
										name="institution" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>일련번호</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-certificationNumber-input"
										name="certification_number" required="required" type="text" />
								</div>
							</div>
							<div class="form-group p5-portfolio-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>발행일</label>
								<div class="control-wrapper p5-3-control-wrapper">
									<select class="form-control p5-date-select"
										data-validation="required" id="p5-issuedYear-select"
										name="date_issued_year"><option selected="selected"
											value="">연</option></select><select class="form-control"
										data-validation="required" id="p5-issuedMonth-select"
										name="date_issued_month"><option selected="selected"
											value="">월</option>
										<option value="1">1월</option>
										<option value="2">2월</option>
										<option value="3">3월</option>
										<option value="4">4월</option>
										<option value="5">5월</option>
										<option value="6">6월</option>
										<option value="7">7월</option>
										<option value="8">8월</option>
										<option value="9">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option></select><select class="form-control"
										data-validation="required" id="p5-issuedDay-select"
										name="date_issued_day"><option selected="selected"
											value="">일</option></select>
								</div>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-certificate-cancel-btn p5-btn-left"
								href="/partners/p/<%=this_account.getId() %>/background/update/">취소</a>
							<button class="btn btn-partners btn-submit" type="button">수정</button></span>
						</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>

		<jsp:include page="../../../../../footer.jsp" flush="false" />
	<script>
$(document).ready(function() {
    //일정 구하는 함수
    var d = new Date();
    for (var i = 0; i < 30; i++) {
        var temp = '<option value="' + (parseInt(d.getFullYear()) - i) + '">' + (parseInt(d.getFullYear()) - i) + '년' + '</option>';
        $('.p5-date-select').append(temp);
    }

    for (var i = 1; i < 32; i++) {
        var temp = '<option value="' + i + '">' + i + '일' + '</option>';
        $('#p5-issuedDay-select').append(temp);
    }


    //변경사항 보내는 함수
    $('.content-inner').on('click', '.btn-submit', function (e) {
        e.preventDefault();
        if ($('#p5-certification-title-input').val() == "" || $('#p5-certificationNumber-input').val() == "" ||
                $('#p5-Institution-input').val() == "" || $('#p5-issuedYear-select').val() == "" ||
                $('#p5-issuedMonth-select').val() == "" || $('#p5-issuedDay-select').val() == "") {
            p5MakeWarning('p5-certification-title-input');
            p5MakeWarning('p5-certificationNumber-input');
            p5MakeWarning('p5-Institution-input');
            p5MakeWarning('p5-issuedYear-select');
            p5MakeWarning('p5-issuedMonth-select');
            p5MakeWarning('p5-issuedDay-select');
            return 0;
        }
        else{
            $.ajax({
    		    type: "POST",
    		    url: "/wjm/partners/p/<%=account.getId()%>/background/update/edit/certify/<%=license.getPk()%>",
    		    data: $('#certification_edit_form').serialize(),  // 폼데이터 직렬화
    		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
    		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
    		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
    		        var messages = data.messages;

    		    if(messages == "success")
    		        	{location.href="/wjm/partners/p/<%=account.getId()%>/background/update"; 
    		        	}
	        else if(messages == "error")
	        	{
	        	location.href="/wjm/partners/p/<%=account.getId()%>/background"; 
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

        function p5MakeWarning(itemId) {
            if ($('#' + itemId).val() == "") {
                $('#' + itemId).parent().addClass('has-error');
                $('#' + itemId).addClass('error');
                $('#' + itemId).parent().children('.form-error').remove();
                $('#' + itemId).parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#' + itemId).parent().removeClass('has-error');
                $('#' + itemId).removeClass('error');
                $('#' + itemId).parent().children('.form-error').remove();
            }
        }
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

    var title = "<%=license.getName() %>";
	var institution = "<%=license.getPublishing_office() %>";
    var certification_number = "<%=license.getSerial_num() %>";
    var date_issued_year = "<%=date_issued_year%>";
	var date_issued_month = "<%=date_issued_month%>";
	var date_issued_day = "<%=date_issued_day%>";
	

	if(title != null && title != "")
	{
		document.getElementById("p5-certification-title-input").value = title;
	}

	if(institution != null && institution != "")
	{
		document.getElementById("p5-Institution-input").value = institution;
	}

	if(certification_number != null && certification_number != "")
	{
		document.getElementById("p5-certificationNumber-input").value = certification_number;
	}

	if(date_issued_year != null && date_issued_year != "")
	{
		var len = document.getElementById("p5-issuedYear-select").length;
		for(var i=0; i<len; i++)
		{
			if(document.getElementById("p5-issuedYear-select").options[i].value == date_issued_year)
			{
				document.getElementById("p5-issuedYear-select").options[i].selected = true;
				break;
			}
		}	
		$('#p5-issuedYear-select').selecter('refresh');
	}

	if(date_issued_month != null && date_issued_month != "")
	{
		var len = document.getElementById("p5-issuedMonth-select").length;
		for(var i=0; i<len; i++)
		{
			if(document.getElementById("p5-issuedMonth-select").options[i].value == date_issued_month)
			{
				document.getElementById("p5-issuedMonth-select").options[i].selected = true;
				break;
			}
		}	
		$('#p5-issuedMonth-select').selecter('refresh');
	}

	if(date_issued_day != null && date_issued_day != "")
	{
		var len = document.getElementById("p5-issuedDay-select").length;
		for(var i=0; i<len; i++)
		{
			if(document.getElementById("p5-issuedDay-select").options[i].value == date_issued_day)
			{
				document.getElementById("p5-issuedDay-select").options[i].selected = true;
				break;
			}
		}	
		$('#p5-issuedDay-select').selecter('refresh');
	}
	
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