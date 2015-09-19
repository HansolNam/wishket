<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	String cellphone_num = (String)request.getAttribute("cellphone_num");
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
		
	
%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 클라이언트 정보 폼</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link
	href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class="logged-in client project-add-contact">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						클라이언트 기본 정보 등록 <small class="small-text">프로젝트 등록 전에 기본 정보를
							입력해 주세요.</small>
					</h3>
				</div>
				<div class="content-inner">
					<form action="/wjm/project/add/contact/" id="contact-form" class="form-horizontal-70" method="POST">
						
						<div class="form-input-rapper">
							<span class="help-block"></span>
							<div class="form-group client-info-form-group " id="name_div">
								<label class="control-label" for="name"><span>*</span>이름</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control" id="name"
										name="name" type="text" value="${name}" /><span class="help-block">${name_msg}</span>
								</div>
							</div>
							<div class="form-group client-phone-form-group " id="cellphone_num_div">
								<label class="control-label" for="cellphone_num"><span>*</span>핸드폰
									번호</label>
								<div class="control-wrapper">
									<select class="form-control-phone" id="cellphone_num_code"
										name="cellphone_num_code">
										<%
											String[] cellphone_num_code = {"010","011","016","017","019"};
										
											for(int i=0;i<cellphone_num_code.length;i++)
											{
												if(cellphone_num_code[i].equals(cellphone_num_list[0]))
													out.println("<option selected='' value='"+cellphone_num_code[i]+"'>"+cellphone_num_code[i]+"</option>");
												else
													out.println("<option value='"+cellphone_num_code[i]+"'>"+cellphone_num_code[i]+"</option>");
											}
										
										%>
										</select><span class="form-phone-liner">-</span><input
										class="form-control-phone" id="cellphone_num_middle"
										name="cellphone_num_middle" type="text" value="<%=cellphone_num_list[1]%>"/><span
										class="form-phone-liner">-</span><input
										class="form-control-phone" id="cellphone_num_end"
										name="cellphone_num_end" type="text" value="<%=cellphone_num_list[2]%>"/>
								
								<span class="help-block">${cellphone_num_msg}</span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group client-business-form-group " id="form_div">
								<label class="control-label " for="form"><span>*</span>회사
									형태</label>
								<div class="control-wrapper">
									<select class="form-control" id="form"
										name="form">
										<%
										String list1[] = {"individual","team","individual_business","corporate_business"};
										String list2[] = {"개인","팀","개인 사업자","법인 사업자"};
										String form = (String)request.getAttribute("form");
										
										for(int i=0;i<list1.length;i++)
										{
											if(list1[i].equals(form))
												out.println("<option selected='' value='"+list1[i]+"'>"+list2[i]+"</option>");
											else
												out.println("<option value='"+list1[i]+"'>"+list2[i]+"</option>");
										
										}
										%></select><span
										class="help-block">${form_msg}</span>
								</div>
							</div>
							<div class="form-group client-info-form-group "
								style="display: none;" id="company_name_div">
								<label class="control-label " for="company_name"><span>*</span>회사명</label>
								<div class="control-wrapper">
									<input autocomplete="off" class=" form-control"
										id="company_name" name="company_name" type="text" value = "${company_name}"/><span
										class="help-block">${company_name_msg}</span>
								</div>
							</div>
							<div class="form-group client-info-form-group "
								style="display: none;" id="representative_div">
								<label class="control-label" for="representative"><span>*</span>회사
									대표명</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control"
										id="representative" name="representative" type="text" value = "${representative}" /><span
										class="help-block">${representative_msg}</span>
								</div>
							</div>
							<div class="form-group description-form-group"
								id="client-company-intro-divider">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group company-intro-form-group " id="introduction_div">>
								<label class="control-label" for="introduction"><span>*</span>클라이언트
									소개</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="introduction" name="introduction" rows="4">${introduction}</textarea>
									<span class="help-block" id="company_intro_help"
										style="display: none"><i
										class="fa fa-exclamation-circle"></i>150글자 이하로 입력해 주세요.</span> <span
										class="help-block">회사(개인)에 대해 간략하게 설명해주세요. (150자 이내)</span>
										<span
										class="help-block">${introduction_msg}</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper">
								<input class="btn btn-client btn-lg" tabindex="1" type="submit"
									value="다음 단계" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />

	<script type="text/javascript">
	$(document).ready(function(){
		var name_msg = "${name_msg}";
		var cellphone_num_msg = "${cellphone_num_msg}";
		var form_msg = "${form_msg}";
		var company_name_msg = "${company_name_msg}";
		var representative_msg = "${representative_msg}";
		var introduction_msg = "${introduction_msg}";
		var name_val = "${name_val}";
		var cellphone_num_code_val = "${cellphone_num_code_val}";
		var cellphone_num_middle_val = "${cellphone_num_middle_val}";
		var cellphone_num_end_val = "${cellphone_num_end_val}";
		var form_val = "${form_val}";
		var company_name_val = "${company_name_val}";
		var company_representative_val = "${company_representative_val}";
		var introduction_val = "${introduction_val}";
		
		if(name_msg != null && name_msg != "")
		{
			$("#name_div").addClass('has-error');
		}
		if(name_val != null && name_val != "")
		{
			document.getElementById("name").value = name_val;
		}
		if(cellphone_num_msg != null && cellphone_num_msg != "")
		{
			$("#cellphone_num_div").addClass('has-error');
		}
		
		if(cellphone_num_code_val != null && cellphone_num_code_val != "")
		{
			var len = document.getElementById("cellphone_num_code").length;
			for(var i=0; i<len; i++)
				{
					if(document.getElementById("cellphone_num_code").options[i].value == cellphone_num_code_val)
						{
							document.getElementById("cellphone_num_code").options[i].selected = true;
							break;
						}
				}
			document.getElementById("cellphone_num_middle").value = cellphone_num_middle_val;
			document.getElementById("cellphone_num_end").value = cellphone_num_end_val;
		}
		if(form_msg != null && form_msg != "")
		{
			$("#form_div").addClass('has-error');
		}
		if(form_val != null && form_val != "")
		{
			document.getElementById("form").value = form_val;
		}
		
		if(company_name_msg != null && company_name_msg != "")
		{
			$("#company_name_div").addClass('has-error');
		}
		if(company_name_val != null && company_name_val != "")
		{
			document.getElementById("company_name").value = company_name_val;
		}
		
		if(representative_msg != null && representative_msg != "")
		{
			$("#representative_div").addClass('has-error');
		}
		if(company_representative_val != null && company_representative_val != "")
		{
			document.getElementById("company_representative").value = company_representative_val;
		}
		if(introduction_msg != null && introduction_msg != "")
		{
			$("#introduction_div").addClass('has-error');
		}
		if(introduction_val != null && introduction_val != "")
		{
			document.getElementById("introduction").value = introduction_val;
		}
	});
	</script>
	<script type="text/javascript">
    $(function () {
      var $form, $form_val;
      $form = $('#form');
      $form_val = $form.val();
      if ($form_val != 'individual' && $form_val != 'team') {
        $('#company_name').parents('.form-group').show();
        $('#representative').parents('.form-group').show();
      }
      $form.on('change', function() {
        $form_val = $(this).val();
        if ($form_val == 'individual' || $form_val == 'team') {
          $('#company_name').parents('.form-group').hide();
          $('#representative').parents('.form-group').hide();
        } else {
          $('#company_name').parents('.form-group').show();
          $('#representative').parents('.form-group').show();
        }
      });
    });
  $(function () {
   $('select').selecter({
     "cover": true
    });
  });

    $(function () {
      $('.content-inner').on('keyup','#company_intro', function(e) {
            if($(this).val().length > 150) {
                $(this).css('border-color', '#f33d12');
                $('#company_intro_help').css('color','#f33d12');
                $('#company_intro_help').css('display','block');
                setTimeout( function() {
                    $('#company_intro').css('border-color', '#cccccc');
                    $('#company_intro_help').css('color','#999');
                    $('#company_intro_help').css('display','none');
                }, 1500);
                $(this).val($(this).val().substr(0,150));
            }
        });
    })
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