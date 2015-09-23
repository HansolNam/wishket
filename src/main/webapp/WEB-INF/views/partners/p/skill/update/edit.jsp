<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.TechniqueInfo"%>
<%
	AccountInfo this_account = (AccountInfo)request.getAttribute("this_account");
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	String isSame = (String)request.getAttribute("isSame");
	TechniqueInfo skill = (TechniqueInfo)request.getAttribute("skill");
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

		<jsp:include page="../../../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> <a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">[ 보유 기술 ]</a>
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/">포트폴리오</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">보유 기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">보유 기술 수정</h3>
						</section>
						<section>
						<form id="skill_edit_form" method="POST">
							<input name="csrfmiddlewaretoken" type="hidden"
								value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" />
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>보유 기술명</label>
								<div class="control-wrapper">
									<input class="form-control portfolio_title"
										data-validation="required" id="p5-skill-name-input"
										name="title" required="required" type="text" />
								</div>
								<p class="p5-form-information">
									보유 기술은 한 가지씩 입력해 주세요.<br /> Ex) C#, Javascript, Android,
									Photoshop 등
								</p>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>경험</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="p5-partners-experience-select" name="experience"
										required="required"><option selected="selected"
											value="">경험</option>
										<option value="1년미만">1년 미만</option>
										<option value="1년이상 3년미만">1년 이상 3년 미만</option>
										<option value="3년이상 5년미만">3년 이상 5년 미만</option>
										<option value="5년이상 10년미만">5년 이상 10년 미만</option>
										<option value="10년이상">10년 이상</option></select>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>숙련도</label>
								<div class="control-wrapper">
									<select class="form-control" data-validation="required"
										id="p5-partners-rating-select" name="rating"
										required="required"><option selected="selected"
											value="">숙련도</option>
										<option value="관심있음">관심있음</option>
										<option value="초급">초급</option>
										<option value="중급">중급</option>
										<option value="고급">고급</option>
										<option value="특급">특급</option></select>
								</div>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-btn-left"
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/" type="button">취소</a>
							<button class="btn btn-partners btn-submit">수정</button></span>
						</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
		<jsp:include page="../../../../footer.jsp" flush="false" />

	<script>
$(document).ready(function() {
	
	var name = "<%=skill.getName() %>";
	var experience = "<%=skill.getExperience() %>";
	var skill = "<%=skill.getSkill()%>";
	
	if(name != null && name != "")
	{
		document.getElementById("p5-skill-name-input").value = name;
	}
	
	if(experience != null && experience != "")
	{
		var len = document.getElementById("p5-partners-experience-select").length;
		for(var i=0; i<len; i++)
		{
			if(document.getElementById("p5-partners-experience-select").options[i].value == experience)
			{
				document.getElementById("p5-partners-experience-select").options[i].selected = true;
				break;
			}
		}
		$('#p5-partners-experience-select').selecter('refresh');
	}

	if(skill != null && skill != "")
	{
		var len = document.getElementById("p5-partners-rating-select").length;
		for(var i=0; i<len; i++)
		{
			if(document.getElementById("p5-partners-rating-select").options[i].value == skill)
			{
				document.getElementById("p5-partners-rating-select").options[i].selected = true;
				break;
			}
		}
		$('#p5-partners-rating-select').selecter('refresh');
	}
	
    $('.content-inner').on('click','.btn-submit', function(e) {
        e.preventDefault();

        if($('#p5-skill-name-input').val()==""||$('#p5-partners-rating-select').val()==""||$('#p5-partners-rating-select').val()=="") {
            if($('#p5-skill-name-input').val()=="") {
                $('#p5-skill-name-input').parent().addClass("has-error");
                $('#p5-skill-name-input').addClass('error');
                $('#p5-skill-name-input').parent().children('.form-error').remove();
                $('#p5-skill-name-input').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#p5-skill-name-input').parent().removeClass("has-error");
                $('#p5-skill-name-input').removeClass('error');
                $('#p5-skill-name-input').parent().children('.form-error').remove();
            }
            if($('#p5-partners-rating-select').val()=="") {
                $('#p5-partners-rating-select').parent().addClass("has-error");
                $('#p5-partners-rating-select').addClass('error');
                $('#p5-partners-rating-select').parent().children('.form-error').remove();
                $('#p5-partners-rating-select').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#p5-partners-rating-select').parent().removeClass("has-error");
                $('#p5-partners-rating-select').removeClass('error');
                $('#p5-partners-rating-select').parent().children('.form-error').remove();
            }
            if($('#p5-partners-experience-select').val()=="") {
                $('#p5-partners-experience-select').parent().addClass("has-error");
                $('#p5-partners-experience-select').addClass('error');
                $('#p5-partners-experience-select').parent().children('.form-error').remove();
                $('#p5-partners-experience-select').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            } else {
                $('#p5-partners-experience-select').parent().removeClass("has-error");
                $('#p5-partners-experience-select').removeClass('error');
                $('#p5-partners-experience-select').parent().children('.form-error').remove();
            }
            return 0;
        }
        else{            
            $.ajax({
    		    type: "POST",
    		    url: "/wjm/partners/p/<%=account.getId()%>/skill/update/edit/<%=skill.getPk()%>",
    		    data: $('#skill_edit_form').serialize(),  // 폼데이터 직렬화
    		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
    		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
    		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
    		        var messages = data.messages;

    		    	if(messages == "success")
    		        	{location.href="/wjm/partners/p/<%=account.getId()%>/skill/update"; 
    		        	}
    		        else if(messages == "error")
    		        	{
    		        	location.href="/wjm/partners/p/<%=account.getId()%>/skill"; 
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