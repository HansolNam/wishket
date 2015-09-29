<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.TechniqueInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<TechniqueInfo> skill = (List<TechniqueInfo>) request.getAttribute("skill");
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
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
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
<body class="logged-in partners partners-setting">
	<div id="wrap">

		<jsp:include page="../../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages">
				</div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">[
								프로필 정보 관리 ]</a> <i class="p5-back-nav-arrow fa fa-caret-right"></i>
							[ 보유 기술 ]
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/introduction/update/">자기
									소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/portfolio/update/">포트폴리오</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/background/update/">경력,
									학력, 자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId()%>/evaluation/update/">프로젝트
									히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">
							보유 기술 <span class="pull-right"><a class="btn btn-primary"
								href="/wjm/partners/p/<%=this_account.getId()%>"
								style="margin-top: -7px;">내 프로필에서 보기</a></span>
						</h3>
						</section>
						<section id="p5-skill-section"> <%
 	if (skill == null) {
 %>
						<div class="p5-empty-component-lg">
							<div class="p5-assign-component">
								<div>
									<div class="p5-no-partners-info-table-text">
										등록된 <span class="text-center p5-bold">'보유 기술'</span>이 없습니다.
									</div>
									<a class="btn btn-partners"
										href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/add/"><i
										class="fa fa-plus"></i> 보유 기술 등록하기</a>
								</div>
							</div>
						</div>
						<%
							} else {
						%>
						<h4 class="header-text">
							보유 기술 <span class="pull-right"><span
								id="p5-skill-btn-group"><button class="btn btn-default"
										data-target="#p5-modify-represent-skill-modal"
										data-toggle="modal" id="p5-represent-portfolio-fix-btn">대표
										보유 기술 추가</button></span> <a class="btn btn-partners"
								href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/add/"
								id="p5-represent-portfolio-add-btn">추가</a></span>
						</h4>
						<table
							class="table table-responsive table-hover p5-haveskill-table">
							<thead>
								<tr>
									<th class="p5-head-title">종류</th>
									<th class="p5-head-rating">숙련도</th>
									<th class="p5-head-experience">경험</th>
									<th class="p5-head-tool">도구</th>
								</tr>
							</thead>
							<tbody>

								<%
									for (int i = 0; i < skill.size(); i++) {
								%>
								<tr>
									<td class="p5-head-title"><%=skill.get(i).getName()%> <%if(skill.get(i).getRepresentative() == 1) out.print("<span class='label label-sm label-open'>대표 보유 기술</span>"); %></td>
									<td class="p5-head-rating"><%=skill.get(i).getSkill()%></td>
									<td class="p5-head-experience"><%=skill.get(i).getExperience()%></td>
									<td class="p5-head-tool"><a
										class="btn btn-default btn-sm skill-edit-btn"
										href="/wjm/partners/p/<%=this_account.getId()%>/skill/update/edit/<%=skill.get(i).getPk()%>/">수정</a>
										<a class="btn btn-cancel btn-sm p5-skill-delete-btn"
										data-toggle="modal" href="#p5-skill-delete-modal"
										item-title="<%=skill.get(i).getName()%>" role="button"
										skill-pk="<%=skill.get(i).getPk()%>">삭제</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>
						<%
							}
						%> </section>
						<div
							class="modal p5-represent-skill-modal fade p5-profile-represent-modal"
							id="p5-modify-represent-skill-modal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button aria-hidden="true" class="close" data-dismiss="modal"
											type="button">×</button>
										<h4 class="modal-title">
											대표 보유 기술 <span class="p5-fix">선택</span>
										</h4>
									</div>
									<div class="modal-body">
										<h5 style="text-align: center; font-weight: normal">
											대표 보유 기술로 회원님의 전문성을 표현할 수 있습니다.<br /> <span class="p5-bold">대표
												보유 기술은 최대 5개까지 선택할 수 있습니다.</span>
										</h5>
										<form class="p5-skill-fix-checkbox" id="rep_skill_form"
											method="POST" action="/wjm/partners/p/<%=this_account.getId() %>/skill/update/represent">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input
												name="request_type" type="hidden"
												value="change_represent_skill" />
											
											<%
												if(skill != null)
												{
													for(int i=0;i<skill.size();i++)
													{
											%>
											<div>
												<input experience-id="1" id="p5-skill-check<%=i %>"
													isrepresent="0" name="p5-skill-check" rating-id="3"
													title="<%=skill.get(i).getName() %>" type="checkbox" value="<%=skill.get(i).getPk()%>"<%if(skill.get(i).getRepresentative() == 1) out.print("checked"); %>><label
													for="p5-skill-check1" ><%=skill.get(i).getName() %></label><span
													class="p5-skill-check-category"><%=skill.get(i).getSkill() %></span>
											</div>
											<%
													}
												}
											%>
										</form>
										<div class="text-center">
											<button class="btn btn-default"
												id="p5-fix-represent-skill-btn" type="button">
												대표 보유 기술 <span class="p5-fix">선택</span>
											</button>
											<button class="btn btn-cancel" data-dismiss="modal"
												type="button">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div aria-hidden="true" class="modal p5-profile-delete-modal fade"
							id="p5-skill-delete-modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">보유 기술 삭제</h4>
									</div>
									<div class="modal-body">
										<form id="delete_skill_form" method="POST"
											style="display: none">
											<input name="csrfmiddlewaretoken" type="hidden"
												value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" />
												<input name="request_type" type="hidden" value="delete_skill" />
												<input name="delete_skill_id" type="hidden" value="" />
										</form>
										<div class="text-center">
											<h5>
												<span id="p5-haveskill-name">"포토샾"</span><br />보유 기술을 정말
												삭제하겠습니까?
											</h5>
											<div class="text-center">
												<button class="btn btn-warning skill-delete p5-btn-left"
													id="p5-skill-delete-modal-btn">예</button>
												<button class="btn btn-cancel" data-dismiss="modal">아니오</button>
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

    $('.content-inner').on('click', '.p5-skill-delete-btn', function(event) {
        event.preventDefault();
        skillPK = $(this).attr('skill-pk');
        $('[name="delete_skill_id"]').val(skillPK);
        $('#p5-haveskill-name').html('"'+$(this).attr('item-title')+'"');
    });

    $('#p5-skill-delete-modal-btn').click(function(event) {
        event.preventDefault();

        $.ajax({
		    type: "POST",
		    url: "/wjm/partners/p/<%=account.getId()%>/skill/update/delete_",
		    data: $('#delete_skill_form').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/partners/p/<%=account.getId()%>/skill/update"; 
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
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
    });

    $('.content-inner').on('click', '#p5-fix-represent-skill-btn', function(event){
        event.preventDefault();
        
        $.ajax({
		    type: "POST",
		    url: "/wjm/partners/p/<%=account.getId()%>/skill/update/represent",
		    data: $('#rep_skill_form').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/partners/p/<%=account.getId()%>/skill/update"; 
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
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
        
    });

    $('.content-inner').on('click','.p5-skill-fix-checkbox', function() {
        if( $(this).children().children('input:checked').length >= 5 ) {
            $(this).children().children('input:not(:checked)').attr('disabled', true);
        } else {
            $(this).children().children('input:not(:checked)').attr('disabled', false);
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