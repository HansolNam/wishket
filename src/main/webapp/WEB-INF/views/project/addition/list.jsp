<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator,com.wjm.models.AccountInfo,com.wjm.models.ContractInfo , com.wjm.models.AdditionInfo, java.util.*,java.sql.Timestamp, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	ContractInfo contract = (ContractInfo) request.getAttribute("contract");

	List<AdditionInfo> additionlist = (List<AdditionInfo>)request.getAttribute("additionlist");
	int additionCnt = 0;
	
	if(additionlist != null)
		additionCnt = additionlist.size();
	
	String profile = (String)request.getAttribute("profile");
	
	if(!Validator.hasValue(profile))
		profile = "default_avatar.png";
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
<title>외주몬(WJM) · 프로젝트 - 추가요청 리스트</title>
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
<body class="logged-in client client-management contract-management">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading"><%if(account.getAccount_type().equals("client")) out.print("클라이언트"); else out.print("파트너스"); %></h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile %>" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a
								href="#"><span
									class="badge badge-info pull-right"><%=additionCnt %></span>추가 요청 리스트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							"<%=contract.getName() %>" 추가요청 리스트 <small class="small-text">진행중인 프로젝트에서 추가 요청 사항을 확인할 수 있습니다.</small>
						</h3>
					</div>
					
					<div class="content-inner">
					
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. <strong>현재 진행 중</strong>인 프로젝트의 추가요청 목록입니다.<br /> 2. 추가요청은 <strong>대금
									결제 후</strong>에 진행됩니다.<br /> 3. 외주몬은 대금 보호 시스템을 통해 <strong>프로젝트가
									끝날 때까지 대금을 안전하게 보호</strong>합니다.<br /> 4. 관련 문의사항은 <strong>고객센터(02-6925-4849,
									help@wishket.com)</strong>를 이용해주세요.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<div class="management-tools" style="float:right;">
							<a class='btn btn-sm btn-client' href='/wjm/project/addition/add/<%=contract.getPk() %>'>추가요청 등록</a>
						</div>
						<br>
						<br>
						<section>
						<%
						
							if(additionCnt != 0)
							{
								for(int i=0;i<additionCnt;i++)
								{
								
						%>
							<section class="project-unit">
								<section class="project-unit-heading">
									<h4 class="project-title">
									<%=additionlist.get(i).getTitle() %>
									</h4>
								</section>
								<section class="project-unit-body">
									<ul class="project-info list-item-narrow">
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 진행상태
											</h5>
											<span>									
											<%=additionlist.get(i).getStatus() %>
											</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-clock-o"></i> 남은기간
											</h5>
											<span><%
									Timestamp now = Time.getCurrentTimestamp();
									now = Time.dateToTimestamp(Time.TimestampToString(now));
									Timestamp reg_date = additionlist.get(i).getReg_date();
									reg_date = Time.dateToTimestamp(Time.TimestampToString(reg_date));
									
									int remain = Time.remainDate(now, reg_date)/(60*24);
									
									if(additionlist.get(i).getTerm() - remain>=0)
										out.print(additionlist.get(i).getTerm() - remain+" 일 전");
									else
										out.print(additionlist.get(i).getTerm() - remain*(-1)+"일 초과");
									
									%>/<%=additionlist.get(i).getTerm() %>일</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-calendar-o"></i> 비용
											</h5>
											<span><%=additionlist.get(i).getBudget() %> 원</span></li>
									</ul>
								</section>
							</section>
							<%	
								}
							}
							else
							{
							%>
						<section>
						<p class="text-muted">추가요청 목록이 없습니다.</p>
						</section>
							<%
							}
							%>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	
</body>
</html>