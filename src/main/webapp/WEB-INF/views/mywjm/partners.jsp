<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, java.util.List"%>
<%@ page
	import="com.wjm.main.function.Time, java.sql.Timestamp, com.wjm.models.ProjectInfo, com.wjm.models.ApplicantInfo"%>
<%@ page
	import="com.wjm.models.NoticeInfo,com.wjm.main.function.Validator, com.wjm.models.ContractInfo"%>

<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<ProjectInfo> interest = (List<ProjectInfo>)request.getAttribute("interest");
	List<ApplicantInfo> apply = (List<ApplicantInfo>)request.getAttribute("apply");
	List<ContractInfo> contractlist = (List<ContractInfo>)request.getAttribute("contractlist");
	List<NoticeInfo> notice = (List<NoticeInfo>)request.getAttribute("notice");

	if(interest != null)
		if(interest.size() == 0)
			interest = null;
	if(apply != null)
		if(apply.size() == 0)
			apply = null;
	if(contractlist != null)
		if(contractlist.size() == 0)
			contractlist = null;
	
	Integer applynum = (Integer)request.getAttribute("applynum");
	Integer contractnum = (Integer)request.getAttribute("contractnum");
	Integer completenum = (Integer)request.getAttribute("completenum");
	Integer total = (Integer)request.getAttribute("total");
	
	if(applynum == null) applynum = 0;
	if(contractnum == null) contractnum = 0;
	if(completenum == null) completenum = 0;
	if(total == null) total = 0;

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
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 마이외주몬</title>
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
<body class="logged-in partners mywishket">
	<div id="wrap">
		<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						마이외주몬 <small class="small-text"><a href="/wjm/partners-use/">처음
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
						<div class="interest-project">
							<h5 class="proposal-project-heading">
								<a href="/wjm/partners/manage/interest/">관심 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="interest-project-title">프로젝트 제목</th>
										<th class="interest-project-budget">예상금액</th>
										<th class="interest-project-term">예상기간</th>
										<th class="interest-created-date">마감일자</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<%
									if(interest == null)
									{
								%>
									<tr>
										<td class="text-muted" colspan="5">관심 프로젝트가 없습니다.</td>
									</tr>
								<%
									}
									else{
										for(int i=0;i<interest.size();i++)
										{
								
								%>
								
									<tr>
										<td><a
											href="/wjm/project/<%=interest.get(i).getName() %>/<%=interest.get(i).getPk() %>/"
											style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><%=interest.get(i).getName() %></a></td>
										<td><%=interest.get(i).getBudget() %>원</td>
										<td><%=interest.get(i).getPeriod() %>일</td>
										<td><%=Time.toString3(interest.get(i).getDeadline())%></td>
										<td><a
											href="/wjm/partners/manage/interest/delete/<%=interest.get(i).getPk() %>"
											title="'관심 프로젝트'에서 삭제하기"><img
												src="/static/img/interest-selected.png"></a></td>
									</tr>
	
								<%
										}
									}
								%>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/partners/manage/interest/">더 자세히 보기 <i
									class="fa fa-chevron-right"></i></a>
							</p>
						</div>
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="/wjm/partners/manage/proposal/counselling/">지원한 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="proposal-project-title">프로젝트 제목</th>
										<th class="proposal-project-budget">지원비용</th>
										<th class="proposal-project-term">기간</th>
										<th class="proposal-created-date">제출일자</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(apply == null)
									{
								%>
									<tr>
										<td class="text-muted" colspan="4">지원 중인 프로젝트가 없습니다.</td>
									</tr>
								<%
									}
									else
									{
										for(int i=0;i<apply.size();i++)
										{
								%>
									<tr>
										<td><a
											href="/wjm/project/<%=apply.get(i).getName() %>/<%=apply.get(i).getProject_pk() %>/"
											style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><%=apply.get(i).getName() %></a></td>
										<td><%=apply.get(i).getApplication_cost() %>원</td>
										<td><%=apply.get(i).getApplication_period() %>일</td>
										<td><%=Time.toString3(apply.get(i).getReg_date())%></td>
									</tr>
								<%
										}
									}
								%>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/partners/manage/proposal/counselling/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
						<div class="contract-project">
							<h5 class="contract-project-heading">
								<a href="/wjm/partners/manage/contract-in-progress/">진행 중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="contract-project-title">프로젝트 제목</th>
										<th class="contract-project-client">클라이언트</th>
										<th class="contract-project-budget">비용</th>
										<th class="contract-project-term">남은기간/기간</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(contractlist != null)
									{
										for(int i=0;i<contractlist.size();i++)
										{
											out.print("<tr><td><a href='/wjm/project/"+contractlist.get(i).getName()+"/"
												+contractlist.get(i).getProject_pk()+"'>"+contractlist.get(i).getName()+"</a></td>");
											out.print("<td>"+contractlist.get(i).getClient_id()+"</td>");
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
										out.println("<tr><td class='text-muted' colspan='4'>진행 중인 프로젝트가 없습니다.</td></tr>");
									
								%>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/partners/manage/contract-in-progress/">더
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
						<h3 class="user-name-tag-heading">파트너스</h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${profile}" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="partners-history">
						<h3 class="partners-history-heading">외주몬 히스토리</h3>
						<div class="partners-history-body">
							<table class="table table-responsive">
								<tbody>
									<tr>
										<th>지원한 프로젝트</th>
										<td><%= applynum%> <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>계약한 프로젝트</th>
										<td><%=contractnum %> <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>완료한 프로젝트</th>
										<td><%=completenum %> <span class="append-unit">건</span></td>
									</tr>
								</tbody>
							</table>
							<dl>
								<dt>누적 완료 금액</dt>
								<dd>
									<%=total %> <span class="append-unit">원</span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>