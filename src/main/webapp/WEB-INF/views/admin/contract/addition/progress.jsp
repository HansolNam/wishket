<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator, java.sql.Timestamp,com.wjm.models.AdditionInfo, com.wjm.models.ContractInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%@ page import="com.wjm.models.NoticeInfo"%>

<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<AdditionInfo> progresslist = (List<AdditionInfo>)request.getAttribute("progresslist");
	List<AdditionInfo> additionlist = (List<AdditionInfo>)request.getAttribute("additionlist");
	int additionCnt = 0;
	int progressCnt = 0;

	if(progresslist != null)
		progressCnt = progresslist.size();
	if(additionlist != null)
		additionCnt = additionlist.size();
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
<body class="logged-in client mywishket  client-management contract-management">
	<div id="wrap">
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li><a
								href="/wjm/admin/contract/addition/list/"><span
									class="badge badge-info pull-right"><%=additionCnt %></span>추가 요청 목록</a></li>
							<li class="active"><a
								href="/wjm/admin/contract/addition/progress/"><span
									class="badge badge-info pull-right"><%=progressCnt %></span>진행중인 추가요청</a></li>
						</ul>
					</div>
				</div>
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						진행중인 추가요청 페이지 
					</h3>
				</div>
				<div class="content-inner">
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="#">진행중인 추가요청</a>
							</h5>
							<section>
						<%
						
						if(progressCnt != 0)
							{
								for(int i=0;i<progressCnt;i++)
								{
								
						%>
							<section class="project-unit">
								<section class="project-unit-heading">
									<h4 class="project-title">
									<%=progresslist.get(i).getTitle() %>
									</h4>
								</section>
								<section class="project-unit-body">
									<ul class="project-info list-item-narrow">
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 프로젝트명
											</h5>
											<span>									
<a href="/wjm/project/<%=progresslist.get(i).getContract().getName() %>/<%=progresslist.get(i).getContract().getProject_pk() %>"><%=progresslist.get(i).getContract().getName() %></a>											</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-clock-o"></i> 남은기간
											</h5>
											<span><%
									Timestamp now = Time.getCurrentTimestamp();
									now = Time.dateToTimestamp(Time.TimestampToString(now));
									Timestamp reg_date = progresslist.get(i).getReg_date();
									reg_date = Time.dateToTimestamp(Time.TimestampToString(reg_date));
									
									int remain = Time.remainDate(now, reg_date)/(60*24);
									
									if(progresslist.get(i).getTerm() - remain>=0)
										out.print(progresslist.get(i).getTerm() - remain+" 일 전");
									else
										out.print(progresslist.get(i).getTerm() - remain*(-1)+"일 초과");
									
									%>/<%=progresslist.get(i).getTerm() %>일</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-calendar-o"></i> 비용
											</h5>
											<span><%=progresslist.get(i).getBudget() %> 원</span></li>
									</ul>
									<ul class="project-info list-item-narrow">
									<li>
									<h5 class="label-item">
												<i class="fa fa-calendar-o"></i> 내용
											</h5>
											<%
												String description = progresslist.get(i).getDescrition();
												if(description == null) description = "";
											%>
											<span><%=description.replaceAll("\r\n","<br/>") %></span></li>
									</ul>
									<ul class="project-info list-item-narrow">
									<li>
									<h5 class="label-item">
												<i class="fa fa-calendar-o"></i> 첨부파일
											</h5>
											<span>
											<% String filename = progresslist.get(i).getFilename();
											if(!Validator.hasValue(filename))
											out.print("첨부파일이 없습니다.");
											else
											out.print("<a href='/wjm/Filedownload?filename="+java.net.URLEncoder.encode(filename)+"'>"+filename+"</a>");%>
											</span></li>
									</ul>
									<ul class="project-info list-item-narrow">
									<li>
									<h5 class="label-item">
												<i class="fa fa-calendar-o"></i> 클라이언트
											</h5>
											<span>
											<a href="/wjm/admin/accounts/profile/<%=progresslist.get(i).getContract().getClient_pk() %>"><%=progresslist.get(i).getContract().getClient_id() %></a></span></li>
									<li>
									<h5 class="label-item">
												<i class="fa fa-calendar-o"></i> 파트너스
											</h5>
											<span>
<a href="/wjm/admin/accounts/profile/<%=progresslist.get(i).getContract().getPartners_pk() %>"><%=progresslist.get(i).getContract().getPartners_id() %></a>
											</span></li>
											
									<li>
									<h5 class="label-item">
												<i class="fa fa-calendar-o"></i> 도구
											</h5>
											<span>
										<button id="complete-btn" class='btn btn-sm btn-client btn-complete' addition-name = "<%=progresslist.get(i).getTitle()%>" addition-pk = "<%=progresslist.get(i).getPk()%>">완료</button>				
											</span>
											<span>
										<button id="cancel-btn" class="btn btn-cancel btn-sm "addition-name = "<%=progresslist.get(i).getTitle()%>"  addition-pk = "<%=progresslist.get(i).getPk()%>">취소</button>
											</span>
											</li>
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
	<jsp:include page="../../../footer.jsp" flush="false" />
	
	<script type="text/javascript">
		$(document).ready(function(){

			$( ".btn-complete" ).click(function() {
				var additionName = $(this).attr('addition-name');

				if(confirm(additionName+" 을 정말 완료하시겠습니까?") == true)
					{
						var additionPk = $(this).attr('addition-pk');
						$.ajax({
							url : "/wjm/admin/addition/complete/"+additionPk,
							type : "POST",
							data : $('#addition_form').serialize(),
			    		    async: true,
							dataType : "JSON",
							success : function(data) {
								var messages = data.messages;
		
						    	if(messages == "success")
						        	{
						    		location.href= data.path; 
						        	}
						        else if(messages == "error")
						        	{
						        	location.href= data.path; 
						        	}
						        else
						        	{
										alert(messages);
						        	}
							},
							error : function(request, status, error) {
								if (request.status != '0') {
									alert("code : " + request.status + "\r\nmessage : "
											+ request.reponseText + "\r\nerror : " + error);
								}
							}
						});
					}
			});
			

			$( ".btn-cancel" ).click(function() {
				var additionName = $(this).attr('addition-name');

				if(confirm(additionName+" 을 정말 취소하시겠습니까?") == true)
					{
						var additionPk = $(this).attr('addition-pk');
						$.ajax({
							url : "/wjm/admin/addition/cancel/"+additionPk,
							type : "POST",
							data : $('#addition_form').serialize(),
			    		    async: true,
							dataType : "JSON",
							success : function(data) {
								var messages = data.messages;
		
						    	if(messages == "success")
						        	{
						    		location.href= data.path; 
						        	}
						        else if(messages == "error")
						        	{
						        	location.href= data.path; 
						        	}
						        else
						        	{
										alert(messages);
						        	}
							},
							error : function(request, status, error) {
								if (request.status != '0') {
									alert("code : " + request.status + "\r\nmessage : "
											+ request.reponseText + "\r\nerror : " + error);
								}
							}
						});
					}
			});
		});
		</script>
	
</body>
</html>