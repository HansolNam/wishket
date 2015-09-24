<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.LicenseInfo, com.wjm.models.EducationInfo, com.wjm.models.CareerInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<CareerInfo> career = (List<CareerInfo>) request.getAttribute("career");
	List<EducationInfo> education = (List<EducationInfo>) request.getAttribute("education");
	List<LicenseInfo> license = (List<LicenseInfo>) request.getAttribute("license");
	String isSame = (String) request.getAttribute("isSame");
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
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
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
		
		<jsp:include page="../../../header2.jsp" flush="false" />
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
								class="p5-back-nav-arrow fa fa-caret-right"></i> [ 경력, 학력, 자격증 ]
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
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">보유
									기술</a></li>
							<li class="active"><a
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
						<h3 class="header-text" style="margin-bottom: 30px">
							경력, 학력, 자격증 <span class="pull-right"><a
								class="btn btn-primary"
								href="/wjm/partners/p/<%=this_account.getId()%>/background"
								style="margin-top: -7px;">내 프로필에서 보기</a></span>
						</h3>
						</section>
						<section id="p5-employ-section">
						<h4 class="header-text">경력
						
						<%if(career != null){ %><a class="btn btn-partners pull-right" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/employ/" id="employ-add-btn">추가</a><%} %>
						
						</h4>
						<%
							if (career == null) {
						%> 
						
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<div class="p5-no-partners-info-table-text">
										등록된 <span class="text-center p5-bold">'경력'</span>이 없습니다.
									</div>
									<a class="btn btn-partners" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/employ/"><i
										class="fa fa-plus"></i> 경력 등록하기</a>
								</div>
							</div>
						</div>
						<%
						 	} 
							else {
								
						%>
						<table class="table table-responsive table-hover p5-career-table">
							<thead>
								<tr>
									<th
										class="p5-head-companyName">회사명</th>
									<th class="p5-head-work">근무부서 및
										담당업무</th>
									<th class="p5-head-position">직위</th>
									<th class="p5-head-period">근무기간</th>
									<th class="p5-head-tool">도구</th>
								</tr>
							</thead>
							<tbody>
						<%
						 		for (int i = 0; i < career.size(); i++) {
						 %>
						 
								<tr>
									<td
										class="p5-head-companyName"><%=career.get(i).getCompany_name() %></td>
									<td class="p5-head-work"><%=career.get(i).getDepartment() %></td>
									<td class="p5-head-position"><%=career.get(i).getPosition() %></td>
									<td class="p5-head-period"><%=career.get(i).getStart_date() %>~<br><%=career.get(i).getEnd_date() %>
									</td>
									<td class="p5-body-tool">
										<a class="btn btn-default btn-sm skill-edit-btn" 
										href="/wjm/partners/p/<%=this_account.getId() %>/background/update/edit/employ/<%=career.get(i).getPk() %>/">수정</a>
										<button class="btn btn-cancel btn-sm p5-employ-delete-btn" data-target="#p5-delete-career-modal" 
										data-toggle="modal" employ-pk="<%=career.get(i).getPk() %>" item-title="<%=career.get(i).getCompany_name() %>" type="button">삭제</button></td>
								</tr>
						 <%
								}
						
						%>
							</tbody>
						</table>
						
						<%
							}
						%>
						</section>
						<section id="p5-education-section">
						<h4 class="header-text">학력
						<%if(education != null){ %>
						<a class="btn btn-partners pull-right" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/edu/" id="education-add-btn">추가</a>						
						<%} %>
						
						</h4>
						
						<%
							if (education == null) {
						%> 
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<div class="p5-no-partners-info-table-text">
										등록된 <span class="text-center p5-bold">'학력'</span>이 없습니다.
									</div>
									<a class="btn btn-partners" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/edu/"><i
										class="fa fa-plus"></i> 학력 등록하기</a>
								</div>
							</div>
						</div>
						
						<%
						 	} else {
						 		
				 		%>
				 		<table
							class="table table-responsive table-hover p5-educationalHistory-table">
							<thead>
								<tr>
									<th class="p5-head-schoolName">학교명</th>
									<th class="p5-head-schoolClassification">분류</th>
									<th class="p5-head-major">전공</th>
									<th class="p5-head-status">상태</th>
									<th class="p5-head-entranceDate">입학일</th>
									<th class="p5-head-graduationDate">졸업일</th>
									<th class="p5-head-tool">도구</th>
								</tr>
							</thead>
							<tbody>
				 		<%
						 		for (int i = 0; i < education.size(); i++) {
						 %>
						
								<tr>
									<td class="p5-head-schoolName"><%=education.get(i).getSchool_name() %></td>
									<td
										class="p5-head-schoolClassification"><%=education.get(i).getLevel()%></td>
									<td class="p5-head-major"><%=education.get(i).getMajor() %></td>
									<td class="p5-head-status"><%=education.get(i).getState() %></td>
									<td
										class="p5-head-entranceDate"><%=education.get(i).getStart_date() %></td>
									<td
										class="p5-head-graduationDate"><%=education.get(i).getEnd_date() %></td>
									<td class="p5-body-tool">
										<a class="btn btn-default btn-sm skill-edit-btn" 
										href="/wjm/partners/p/<%=this_account.getId() %>/background/update/edit/edu/<%=education.get(i).getPk()%>/">수정</a><button class="btn btn-cancel btn-sm p5-education-delete-btn" 
										data-target="#p5-delete-educationalHistory-modal" data-toggle="modal" education-pk="<%=education.get(i).getPk()%>" 
										item-title="<%=education.get(i).getSchool_name() %>" role="button">삭제</button>
									</td>
								</tr>
						<%
								}
				 		
				 		%>
				 		
							</tbody>
						</table>
				 		<%
							}
						%> 
						</section>
						<section id="p5-certification-section">
						<h4 class="header-text">자격증
						<%if(license != null){ %><a class="btn btn-partners pull-right" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/certify/" id="certification-add-btn">추가</a><%} %>
						</h4>
						<%
							if (license == null) {
						%>
							<div class="p5-empty-component-lg">
								<div class="p5-assign-component">
									<div>
										<div class="p5-no-partners-info-table-text">
											등록된 <span class="text-center p5-bold">'자격증'</span>이 없습니다.
										</div>
										<a class="btn btn-partners" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/add/certify/"><i
											class="fa fa-plus"></i> 자격증 등록하기</a>
									</div>
								</div>
							</div>
						<%
 							} 
							else {
						%>
						<table
							class="table table-responsive table-hover p5-certificate-table">
							<thead>
								<tr>
									<th class="p5-head-classification">구분</th>
									<th class="p5-head-certificateNumber">자격증번호</th>
									<th class="p5-head-certificateDepartment">발행처</th>
									<th class="p5-head-certificateDate">발행일자</th>
									<th class="p5-head-tool">도구</th>
								</tr>
							</thead>
							<tbody>
						<%
						 		for (int i = 0; i < license.size(); i++) {
						 %>
						
								<tr>
									<td
										class="p5-head-classification"><%=license.get(i).getName() %></td>
									<td
										class="p5-head-certificateNumber"><%=license.get(i).getSerial_num() %></td>
									<td
										class="p5-head-certificateDepartment"><%=license.get(i).getPublishing_office() %></td>
									<td
										class="p5-head-certificateDate"><%=license.get(i).getPublication_date() %></td>
									<td class="p5-body-tool">
									<a class="btn btn-default btn-sm skill-edit-btn" href="/wjm/partners/p/<%=this_account.getId() %>/background/update/edit/certify/<%=license.get(i).getPk() %>/">수정</a>
									<button certification-pk="<%=license.get(i).getPk() %>" class="btn btn-cancel btn-sm p5-certification-delete-btn" data-target="#p5-delete-certificate-modal" data-toggle="modal" item-title="<%=license.get(i).getName() %>" role="button">삭제</button></td>
								</tr>

							<%
									}
						
						%>
						
							</tbody>
						</table>
						<%
								}
							%>
						</section>
						<div aria-hidden="true" class="modal fade"
							id="p5-delete-career-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">경력 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="employ_delete" method="POST" style="display: none">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="employ_id" type="hidden" /><input name="submit_type"
												type="hidden" value="employ" />
										</form>
										<p class="text-center bold-font">
											<span id="p5-delete-career-title">"안드로이드"</span><br /> 경력을 정말
											삭제하겠습니까?
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="p5-delete-career-modal-btn">예</button>
												<a aria-hidden="true" class="btn btn-cancel"
													data-dismiss="modal">아니오</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true" class="modal fade"
							id="p5-delete-educationalHistory-modal" role="dialog"
							tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">학력 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="education_delete" method="POST"
											style="display: none">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="education_id" type="hidden" /><input
												name="submit_type" type="hidden" value="education" />
										</form>
										<p class="text-center bold-font">
											<span id="p5-delete-educationalHistory-title">""</span><br />
											학력을 정말 삭제하겠습니까?
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="p5-delete-educationalHistory-modal-btn">예</button>
												<a aria-hidden="true" class="btn btn-cancel"
													data-dismiss="modal">아니오</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true" class="modal fade"
							id="p5-delete-certificate-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">자격증 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="certify_delete" method="POST" style="display: none">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="certify_id" type="hidden" /><input name="submit_type"
												type="hidden" value="certify" />
										</form>
										<p class="text-center bold-font">
											<span id="p5-delete-certificate-title">""</span><br /> 자격증을
											정말 삭제하겠습니까?
										</p>
										<div class="form-group">
											<div class="p5-btn-wrapper-center">
												<button class="btn btn-warning skill-delete btn-submit"
													id="p5-delete-certificate-modal-btn">예</button>
												<a aria-hidden="true" class="btn btn-cancel"
													data-dismiss="modal">아니오</a>
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

		<jsp:include page="../../../footer.jsp" flush="false" />
	<script>
$(document).ready(function() {
    var employPK=0;
    var educationPK=0;
    var certificationPK=0;

    $('.content-inner').on('click', '.p5-employ-delete-btn', function(event) {
        employPK = $(this).attr('employ-pk');
        $('input[name="employ_id"]').val(employPK);
        $('#p5-delete-career-title').html('"'+$(this).attr('item-title')+'"');
    });

    $('.content-inner').on('click', '.p5-education-delete-btn', function(event) {
        educationPK = $(this).attr('education-pk');
        $('input[name="education_id"]').val(educationPK);
        $('#p5-delete-educationalHistory-title').html('"'+$(this).attr('item-title')+'"');
    });

    $('.content-inner').on('click', '.p5-certification-delete-btn', function(event) {
        certificationPK = $(this).attr('certification-pk');
        $('input[name="certify_id"]').val(certificationPK);
        $('#p5-delete-certificate-title').html('"'+$(this).attr('item-title')+'"');
    });

    $('#p5-delete-educationalHistory-modal-btn').click(function(event) {
        event.preventDefault();
        $.ajax({
		    type: "POST",
		    url: "/wjm/partners/p/<%=account.getId()%>/background/update/delete_/edu",
		    data: $('#education_delete').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/partners/p/<%=account.getId()%>/background/update"; 
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
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
        
        
    });

    $('#p5-delete-career-modal-btn').click(function(event) {
        event.preventDefault();

        $.ajax({
		    type: "POST",
		    url: "/wjm/partners/p/<%=account.getId()%>/background/update/delete_/employ",
		    data: $('#employ_delete').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/partners/p/<%=account.getId()%>/background/update"; 
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
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
        
    });

    $('#p5-delete-certificate-modal-btn').click(function(event) {
        event.preventDefault();
        $.ajax({
		    type: "POST",
		    url: "/wjm/partners/p/<%=account.getId()%>/background/update/delete_/certify",
		    data: $('#certify_delete').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/partners/p/<%=account.getId()%>/background/update"; 
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
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
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