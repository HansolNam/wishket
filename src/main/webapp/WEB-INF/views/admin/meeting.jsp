<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp,com.wjm.models.ContractInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%@ page import="com.wjm.models.NoticeInfo"%>

<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ContractInfo> contractlist = (List<ContractInfo>)request.getAttribute("contractlist");

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
						미팅 신청 페이지 
					</h3>
				</div>
				<div class="content-inner">
					
					<div class="mywishket-project">
						
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="#">미팅 신청</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>클라이언트</th>
										<th>파트너스</th>
										<th>도구1</th>
										<th>도구2</th>
										<th>제출일자</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(contractlist == null)
									{
								%>
								<tr><td class='text-muted' colspan='6'>미팅 신청 리스트가 없습니다.</td></tr>
								<%
									}
									else
									{
										for(int i=0;i<contractlist.size();i++)
										{
								%>
								<tr>
									<td><a href="/wjm/project/<%=contractlist.get(i).getProject().getName() %>/<%=contractlist.get(i).getProject_pk() %>"><%=contractlist.get(i).getProject().getName() %></a></td>
									<td><a href="/wjm/admin/accounts/profile/<%=contractlist.get(i).getClient_pk() %>"><%=contractlist.get(i).getClient_id() %></a></td>
									<td><a href="/wjm/admin/accounts/profile/<%=contractlist.get(i).getPartners_pk() %>"><%=contractlist.get(i).getPartners_id() %></a></td>
									<td><a class='btn btn-sm btn-client success-btn' href='/wjm/admin/contract/success/<%=contractlist.get(i).getProject_pk()%>/<%=contractlist.get(i).getClient_pk()%>/<%=contractlist.get(i).getPartners_pk()%>'>계약 성사</a></td>
									<td><a class='btn btn-sm btn-client fail-btn' href='/wjm/admin/contract/fail/<%=contractlist.get(i).getProject_pk()%>/<%=contractlist.get(i).getPartners_pk()%>/<%=contractlist.get(i).getPk()%>'>계약 실패</a></td>
									<td><%=Time.toString3(contractlist.get(i).getReg_date()) %></td>
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
</body>
	<script type="text/javascript">

	$(document).ready(function(){

		$( ".success-btn" ).click(function() {

			if(confirm("계약을 성사시키겠습니까?") == false)
				return false;
			
			return true;
		
			});
		
		$( ".fail-btn" ).click(function() {

			if(confirm("계약이 실패되었습니까?") == false)
				return false;
			
			return true;
		
			});
		});
	</script>
</html>