<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp,com.wjm.models.ContractInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%@ page import="com.wjm.models.NoticeInfo"%>

<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ContractInfo> progresslist = (List<ContractInfo>)request.getAttribute("progresslist");

	%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 관리자페이지</title>
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
						진행중인 프로젝트 페이지 
					</h3>
				</div>
				<div class="content-inner">
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="#">진행중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>클라이언트</th>
										<th>파트너스</th>
										<th>남은기간</th>
										<th>도구1</th>
										<th>도구2</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(progresslist == null)
									{
								%>
								<tr>
								<td class='text-muted' colspan='6'>진행중인 프로젝트 리스트가 없습니다.</td>
								</tr>
								<%
									}
									else
									{
										for(int i=0;i<progresslist.size();i++)
										{
								%>
								<tr>
									<td><a href="/wjm/project/<%=progresslist.get(i).getName() %>/<%=progresslist.get(i).getProject_pk() %>"><%=progresslist.get(i).getName() %></a></td>
									<td><a href="/wjm/admin/accounts/profile/<%=progresslist.get(i).getClient_pk() %>"><%=progresslist.get(i).getClient_id() %></a></td>
									<td><a href="/wjm/admin/accounts/profile/<%=progresslist.get(i).getPartners_pk() %>"><%=progresslist.get(i).getPartners_id() %></a></td>
									<td><%
									Timestamp now = Time.getCurrentTimestamp();
									now = Time.dateToTimestamp(Time.TimestampToString(now));
									Timestamp reg_date = progresslist.get(i).getReg_date();
									reg_date = Time.dateToTimestamp(Time.TimestampToString(reg_date));
									
									int remain = Time.remainDate(now, reg_date)/(60*24);
									
									if(progresslist.get(i).getTerm() - remain>=0)
										out.print(progresslist.get(i).getTerm() - remain+" 일 전");
									else
										out.print(progresslist.get(i).getTerm() - remain*(-1)+"일 초과");
									
									%>/<%=progresslist.get(i).getTerm() %>일</td>
									<td><a class='btn btn-sm btn-client success-btn' href='/wjm/admin/project/complete/success/<%=progresslist.get(i).getProject_pk()%>/<%=progresslist.get(i).getClient_pk()%>/<%=progresslist.get(i).getPartners_pk()%>'>완료</a></td>
									<td><a class='btn btn-sm btn-client fail-btn' href='/wjm/admin/project/complete/fail/<%=progresslist.get(i).getProject_pk()%>/<%=progresslist.get(i).getClient_pk()%>/<%=progresslist.get(i).getPartners_pk()%>'>취소</a></td>
									
								</tr>
								<%
										}
									}
								%>
								</tbody>
								
							</table>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript">
		$(document).ready(function(){
			$( ".success-btn" ).click(function() {
				if(confirm("정말 완료하시겠습니까?") == false)
					return false;
				
				return true;
				
			});
			$( ".fail-btn" ).click(function() {
				if(confirm("정말 취소하시겠습니까?") == false)
					return false;
				
				return true;
				
			});
		});
	</script>
</body>
</html>