<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp, com.wjm.main.function.Validator,com.wjm.models.ContractInfo ,com.wjm.models.NoticeInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<NoticeInfo> notice = (List<NoticeInfo>)request.getAttribute("notice");
	
	List<ContractInfo> contractlist = (List<ContractInfo>)request.getAttribute("contractlist");
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	int check_cnt = 0;
	int recruit_cnt = 0;
	int ing_cnt = 0;
	int finish_cnt = 0;
	Integer total = (Integer)request.getAttribute("total");
	if(total == null) total = 0;
	if(projectlist != null)
	{
		for(int i=0;i<projectlist.size();i++)
		{
			if(projectlist.get(i).getStatus().equals("검수중"))
			{
				check_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("지원자모집중"))
			{
				recruit_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("진행중"))
			{
				ing_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("완료한프로젝트"))
			{
				finish_cnt++;
			}
		}
	}
	
	String profile = (String)request.getAttribute("profile");
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
	
	%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 마이외주몬</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static//CACHE/css/aa41eeaffc60.css" rel="stylesheet"
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
<body class="logged-in client mywishket">
	<div id="wrap">
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						마이외주몬 <small class="small-text"><a href="/wjm/client-use/">처음
								오셨나요? 이용방법을 확인하세요 <i class="fa fa-chevron-right"></i>
						</a></small>
					</h3>
				</div>
				<div class="content-inner">
					<div class="notice">
						<h4 class="notice-heading">공지사항</h4>
						<ul class="notice-list list-unstyled">
						<%
							if(notice != null && notice.size()>0)
							{
								for(int i=0;i<notice.size();i++)
								{
						%>
						<li>
							<%if(Time.remainDate(Time.getCurrentTimestamp(), notice.get(i).getReg_date())/(60*24) < 7) out.print("<span class='label label-notice'>새소식</span>");%>
							<a href="/wjm/mywjm/notice/preview/<%=notice.get(i).getPk() %>" target="_blank"><%=notice.get(i).getName() %></a> 
							<span class="notice-date"><%=Time.toString3(notice.get(i).getReg_date()) %></span>
						</li>
						<%
								}
							}
						%>
						</ul>
					</div>
					<div class="mywishket-project">
						<h4 class="mywishket-project-heading">내 프로젝트</h4>
						<div class="submitted-project">
							<h5 class="submitted-project-heading">
								<a href="/wjm/client/manage/project/submitted/">검수 중</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>제출일자</th>
										<th>도구</th>
									</tr>
								</thead>
								<%
									if(check_cnt != 0)
									{
										for(int i=0;i<projectlist.size();i++)
										{
											if(projectlist.get(i).getStatus().equals("검수중"))
											{
								%>
								<tbody>
									<tr>
										<td><%= projectlist.get(i).getName()%></td>
										<td><%= Time.toString3(projectlist.get(i).getReg_date())%></td>
										<td><a class='btn btn-sm btn-client' href='/wjm/project/preview/<%=projectlist.get(i).getName()%>/<%= projectlist.get(i).getPk()%>/'>미리보기</a>
										</td>
									</tr>
								</tbody>
								<%
											}
										}
									}
									else
										out.println("<tbody><tr><td class='text-muted' colspan='4'>진행 중인 프로젝트가 없습니다.</td></tr></tbody>");
									
								%>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/project/submitted/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="/wjm/client/manage/recruiting/">지원자 모집 중</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>마감일자</th>
										<th>지원자 수</th>
										<th>도구</th>
									</tr>
								</thead>
								<%
									if(recruit_cnt != 0)
									{
										for(int i=0;i<projectlist.size();i++)
										{
											if(projectlist.get(i).getStatus().equals("지원자모집중"))
											{
												out.print("<tbody><tr><td><a href='/wjm/project/"+projectlist.get(i).getName()+"/"
														+projectlist.get(i).getPk()+"'>"+projectlist.get(i).getName()+"</a></td>");
												out.print("<td>"+Time.toString3(projectlist.get(i).getDeadline())+"</td>");
												out.print("<td>"+projectlist.get(i).getApplicantnum()+"</td>");
												out.println("<td><a class='btn btn-sm btn-client' href='/wjm/client/manage/project/"+projectlist.get(i).getName()+"/"+projectlist.get(i).getPk()+"/applicant'>지원자 목록</a></td></tr></tbody>");
											}
										}
									}
									else
									{
										out.println("<tbody><tr><td class='text-muted' colspan='4'>모집 중인 프로젝트가 없습니다.</td></tr></tbody>");
									}
								%>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/recruiting/">더 자세히 보기 <i
									class="fa fa-chevron-right"></i></a>
							</p>
						</div>
						<div class="contract-project">
							<h5 class="contract-project-heading">
								<a href="/wjm/client/manage/contract-in-progress/">진행 중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>파트너스</th>
										<th>금액</th>
										<th>남은기간/기간</th>
									</tr>
								</thead>
								<%
									if(ing_cnt != 0)
									{
										for(int i=0;i<contractlist.size();i++)
										{
											out.print("<tbody><tr><td><a href='/wjm/project/"+contractlist.get(i).getName()+"/"
												+contractlist.get(i).getProject_pk()+"'>"+contractlist.get(i).getName()+"</a></td>");
											out.print("<td><a href='/wjm/partners/p/"+contractlist.get(i).getPartners_id()+"'/>"+contractlist.get(i).getPartners_id()+"</a></td>");
											out.print("<td>"+contractlist.get(i).getBudget()+"</td>");

											Timestamp now = Time.getCurrentTimestamp();
											now = Time.dateToTimestamp(Time.TimestampToString(now));
											Timestamp reg_date = contractlist.get(i).getReg_date();
											reg_date = Time.dateToTimestamp(Time.TimestampToString(reg_date));
											
											int remain = Time.remainDate(now, reg_date)/(60*24);
											
											if(contractlist.get(i).getTerm() - remain>=0)
												out.print("<td>"+(contractlist.get(i).getTerm() - remain)+" 일 전");
											else
												out.print("<td>"+(contractlist.get(i).getTerm() - remain*(-1))+"일 초과");
											
											out.print("/"+contractlist.get(i).getTerm()+"일</td>");
										}
									}
									else
										out.println("<tbody><tr><td class='text-muted' colspan='4'>진행 중인 프로젝트가 없습니다.</td></tr></tbody>");
									
								%>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/contract-in-progress/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${profile}" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="project-add-suggestion">
						<h5 class="suggestion-text">
							무료로 프로젝트를<br />등록해 보세요
						</h5>
						<a class="btn btn-client btn-lg btn-project-add"
							href="/wjm/project/add/">프로젝트 등록하기</a>
					</div>
					<%
						int register_num = check_cnt+recruit_cnt+ing_cnt+finish_cnt;
						int contract_num = ing_cnt+finish_cnt;
						
						double contract_per = 0;
						if(register_num != 0)
						{
							contract_per = 100.0*(double)contract_num/(double)register_num;
						}
					%>
					<div class="client-history">
						<h3 class="client-history-heading">외주몬 히스토리</h3>
						<div class="client-history-body">
							<div class="project">
								<div class="history-body-title">프로젝트 등록</div>
								<div class="pull-right history-body-data"><%=register_num %> 건</div>
							</div>
							<div class="contract">
								<div class="contract-title">
									<div class="history-body-title">계약한 프로젝트</div>
									<div class="pull-right history-body-data"><%=contract_num %> 건</div>
								</div>
								<div class="contract-data">
									<div class="contract-data-box">
										<div class="history-body-title">계약률</div>
										<div class="pull-right history-body-data"><%=Math.round(contract_per*10.0)/10.0%>%</div>
									</div>
									<div class="contract-data-box">
										<div class="history-body-title">진행중인 프로젝트</div>
										<div class="pull-right history-body-data"><%=ing_cnt %> 건</div>
									</div>
									<div class="contract-data-box">
										<div class="history-body-title">완료한 프로젝트</div>
										<div class="pull-right history-body-data"><%=finish_cnt %> 건</div>
									</div>
								</div>
							</div>
							<div class="client-history-budget-body">
								<div class="budget-body-title">누적 완료 금액</div>
								<div class="pull-right budget-body-data">
									<%=total %> <span class="budget-body-clo">원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
	
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