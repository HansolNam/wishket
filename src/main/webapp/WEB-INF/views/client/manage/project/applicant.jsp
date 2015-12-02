<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.ProjectInfo, java.util.List,com.wjm.models.AccountInformationInfo,com.wjm.models.AccountInfo,com.wjm.models.ApplicantInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	List<ApplicantInfo> applicant = (List<ApplicantInfo>)request.getAttribute("applicant");
	ProjectInfo project = (ProjectInfo)request.getAttribute("project");
	
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
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
<title>외주몬(WJM) · 관리 - 지원 중</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="/wjm/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link href="/wjm/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link href="/wjm/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/wjm/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/wjm/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="/wjm/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="/wjm/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link href="/wjm/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="/wjm/resources/static/favicon.ico" rel="shortcut icon"
	type="image/x-icon" />
<link href="/wjm/resources/static/favicon.ico" rel="icon"
	type="image/x-icon" />
<link href="/wjm/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link href="/wjm/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link href="/wjm/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script src="/wjm/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script src="/wjm/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>

<style>
div.backLayer {
	display:none;
	background-color:black;
	position:absolute;
	left:0px;
	top:0px;
}

</style>

</head>
<body class="logged-in partners partners-management proposal-management">
	<div id="wrap">	
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							지원자 목록 <small class="small-text">지원자 목록을 확인할 수 있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="/wjm/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. <strong>지원자</strong> 목록입니다.<br /> 2. 미팅은 <strong>최대
									2명까지</strong> 진행하실 수 있습니다.<br />3. 마음에 드는 지원자를 선택하시면 외주몬에서 <strong>미팅을
									주선</strong> 해드립니다.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<section> 
						
						<%
							if(applicant == null)
							{
						%>
						<section>
						<p class="text-muted">지원자가 없습니다.</p>
						</section>
						<%
							}
							else
							{
								for(int i=0;i<applicant.size();i++)
								{
									String applcationcontent = "";
									if(applicant.get(i).getApplication_content() != null);
										applcationcontent =applicant.get(i).getApplication_content().replaceAll("\r\n","<br/>");
						%>
						<section class="proposal-unit"> <section
							class="proposal-unit-heading">
						<h4 class="project-title">
							<a href="/wjm/partners/p/<%=applicant.get(i).getAccount().getId() %>/"><%=applicant.get(i).getAccount().getId() %></a>
							<%
								if(applicant.get(i).getContract() == null)
								{
							%>
							<button class="btn btn-sm btn-client pull-right meeting-btn" project-pk="<%=applicant.get(i).getProject_pk() %>"
							applicant-pk="<%=applicant.get(i).getAccount_pk() %>" value="1">미팅 신청하기</button>
							<%
								}
								else
								{
							%>
							<button class="btn btn-sm btn-client pull-right meeting-btn" disabled>미팅 신청 완료</button>
							
							<%
								}
							%>
						</h4>
						</section> <section class="proposal-unit-body">
						<ul class="interest-summary-info">
							<li class="lg" style="*width: 180px;"><h5 class="label-item">
									<i class="fa fa-clock-o"></i> 지원 일자
								</h5> <span class="project-term"><%=Time.toString3(applicant.get(i).getReg_date()) %></span></li>
							<li class="sub-lg" style="*width: 135px;"><h5
									class="label-item">
									<i class="fa fa-won"></i> 지원 기간
								</h5> <span><%=applicant.get(i).getApplication_period() %> 일</span></li>
							<li class="sm"><h5 class="label-item">
									<i class="fa fa-tags"></i> 지원 금액
								</h5> <span class="project-budget"><%=applicant.get(i).getApplication_cost() %>원</span></li>
						</ul>
						<ul>
							<li class="lg"><h5 class="label-item">
									<i class="fa fa-map-marker"></i> 지원 내용
								</h5></li>
							<li><span><%=applcationcontent %></span></li>
						</ul>
						<ul>
							<li class="lg"><h5 class="label-item">
									<i class="fa fa-map-marker"></i>포트폴리오
								</h5></li>
							<li><span>지원한 포트폴리오가 <%if(applicant.get(i).getHas_portfolio() == 1)out.print("있"); else out.print("없"); %>습니다.</span></li>
						</ul>
						<ul class="interest-summary-info">
							<li class="lg" style="*width: 280px;"><h5 class="label-item">
									<i class="fa fa-tags"></i> 포트폴리오1
								</h5> <span><%
								if(applicant.get(i).getPortfolio1() != null)
								{
									int portfolio_pk = applicant.get(i).getPortfolio1().getPk();
									String portfolio_name = applicant.get(i).getPortfolio1().getName();
									out.print("<a href='/wjm/partners/p/"+applicant.get(i).getAccount().getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
								}
								else
								{
									out.print("없음");
								}
									%>
									</span>
							</li>
							<li class="sub-lg" style="*width: 235px;"><h5
									class="label-item">
									<i class="fa fa-won"></i> 포트폴리오2
								</h5> <span><%
								if(applicant.get(i).getPortfolio2() != null)
								{
									int portfolio_pk = applicant.get(i).getPortfolio2().getPk();
									String portfolio_name = applicant.get(i).getPortfolio2().getName();
									out.print("<a href='/wjm/partners/p/"+applicant.get(i).getAccount().getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
								}
								else
								{
									out.print("없음");
								}
									%></span></li>
							<li class="sm"><h5 class="label-item">
									<i class="fa fa-clock-o"></i> 포트폴리오3
								</h5> <span class="project-term"><%
								if(applicant.get(i).getPortfolio3() != null)
								{
									int portfolio_pk = applicant.get(i).getPortfolio3().getPk();
									String portfolio_name = applicant.get(i).getPortfolio3().getName();
									out.print("<a href='/wjm/partners/p/"+applicant.get(i).getAccount().getId()+"/portfolio/"+portfolio_pk+"'>"+portfolio_name+"</a>");
								}
								else
								{
									out.print("없음");
								}
									%></span></li>
						</ul>
						<ul>
							<li class="lg"><h5 class="label-item">
									<i class="fa fa-map-marker"></i> 포트폴리오 설명
								</h5></li>
							<li><span><%=applicant.get(i).getPortfolio_description().replaceAll("\r\n","<br/>") %></span></li>
						</ul>

						</section> </section> 
						<%
								}
							}
						%>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
		
		<form id="meeting_form" method="POST"
			style="display: none">
				<input name="applicant_pk" type="hidden" value="" />
				<input name="project_pk" type="hidden" value="" />
		</form>
		<!-- 로딩 이미지 -->
		<div id="viewLoading">
			<img src="${pageContext.request.contextPath}/resources/upload/viewLoading.gif" />
		</div>
		<!-- 불투명 이미지 -->
		<div class='backLayer' style='' > </div>
	</div>
	<jsp:include page="../../../footer.jsp" flush="false" />

	<script>

	function LoadingScreenFunc()
	{
		var width = $(window).width();
		var height = $(window).height();
		
		var scrollLeft = $(window).scrollLeft();
		var scrollTop = $(window).scrollTop();
		
		var backLayerObj = $(".backLayer");
		var loadingDivObj = $("#viewLoading");
		
		//화면을 가리는 레이어의 사이즈 조정
		backLayerObj.width(width);
		backLayerObj.height(height);

		var left = scrollLeft;
		var top = scrollTop;
		
		//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도)
		backLayerObj.css( {
    		'display':'block',
    		'background-color':'black',
    		'opacity':'0.3',
    		'position':'absolute',
    		'left':left,
    		'top':top
    	});
		
		left = ( scrollLeft + (width - loadingDivObj.width()) / 2 );
		top = ( scrollTop + (height - loadingDivObj.height()) / 2 );
		
		//팝업 레이어 보이게
		loadingDivObj.css( {
    		'display':'block',
    		'position':'absolute',
    		'left':left,
    		'top':top
    	});
	}
$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;

	// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
	$('#viewLoading').hide();

    $('.content-inner').on('click', '.meeting-btn', function(event) {
        event.preventDefault();
        var applicantPk = $(this).attr('applicant-pk');
        var projectPk = $(this).attr('project-pk');
        
        $('[name="applicant_pk"]').val(applicantPk);
        $('[name="project_pk"]').val(projectPk);
        
        $.ajax({
		    type: "POST",
		    url: "/wjm/client/manage/project/meeting",
		    data: $('#meeting_form').serialize(),  // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    async: true,
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;

		    	if(messages == "success")
		        	{
		    		location.href="/wjm/client/manage/project/<%=project.getName()%>/<%=project.getPk()%>/applicant"; 
		        	}
		        else if(messages == "error")
		        	{
		        	location.href="/wjm/error"; 
		        	}
		        else
		        	{
					$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
		        	}
		        
		    },
		    beforeSend:function(){
	    		LoadingScreenFunc();

		    }
		    ,complete:function(){

				$('#viewLoading').hide();
				$(".backLayer").hide();
		 
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
</body>
</html>