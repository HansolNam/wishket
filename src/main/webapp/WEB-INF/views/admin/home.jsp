<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp,com.wjm.models.ContractInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ProjectInfo> submitted = (List<ProjectInfo>)request.getAttribute("submitted");
	List<AccountInfo> authenticationlist = (List<AccountInfo>)request.getAttribute("authenticationlist");
	List<ContractInfo> contractlist = (List<ContractInfo>)request.getAttribute("contractlist");
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
						관리자 페이지 
					</h3>
				</div>
				<div class="content-inner">
					<div class="notice">
						<h4 class="notice-heading">공지사항<small class="small-text pull-right"><a href="/wjm/admin/notice/add">공지사항 등록하기</a></small></h4>
						<ul class="notice-list list-unstyled">
							<li><span class="label label-notice">새소식</span> <a
								href="http://goo.gl/1DCKCs" target="_blank">[업데이트] 파트너 프로필
									페이지 리뉴얼 - 평가 및 데이터 차트화</a> <span class="notice-date">2015.
									08. 20</span></li>
							<li><a href="http://goo.gl/SLa1uy" target="_blank">CEO의
									입장에서 바라본 원격 근무의 장점</a> <span class="notice-date">2015. 05.
									04</span></li>
							<li><a
								href="http://blog.wishket.com/%EC%9C%84%EC%8B%9C%EC%BC%93-%EB%8C%80%EA%B8%88-%EB%B3%B4%ED%98%B8%EB%A5%BC-%ED%86%B5%ED%95%B4-%EC%8B%A0%EB%A2%B0%ED%95%A0-%EC%88%98-%EC%9E%88%EB%8A%94-%EA%B3%84%EC%95%BD%EC%9D%"
								target="_blank">[인터뷰] “대금 보호를 통해 신뢰할 수 있는 계약을 할 수 있었습니다</a> <span
								class="notice-date">2015. 01. 09</span></li>
						</ul>
					</div>
					<div class="mywishket-project">
						<h4 class="mywishket-project-heading">관리 목록</h4>
						<div class="submitted-project">
							<h5 class="submitted-project-heading">
								<a href="#">검수 신청</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>제출일자</th>
										<th>도구</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(submitted == null)
									{
								%>
								<tr><td class='text-muted' colspan='3'>검수 신청중인 프로젝트가 없습니다.</td></tr>
								<%
									}
									else
									{
										for(int i=0;i<submitted.size();i++)
										{
								%>
								<tr>
									<td><%=submitted.get(i).getName() %></td>
									<td><%= Time.toString3(submitted.get(i).getReg_date()) %></td>
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/project/preview/<%=submitted.get(i).getName()%>/<%= submitted.get(i).getPk()%>/'>자세히보기</a></td>
								</tr>
								<%
										}
									}
								%>
								</tbody>
							</table>
						</div>
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
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/contract/success/<%=contractlist.get(i).getProject_pk()%>/<%=contractlist.get(i).getClient_pk()%>/<%=contractlist.get(i).getPartners_pk()%>'>계약 성사</a></td>
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/contract/fail/<%=contractlist.get(i).getProject_pk()%>/<%=contractlist.get(i).getClient_pk()%>/<%=contractlist.get(i).getPartners_pk()%>'>계약 실패</a></td>
									<td><%=Time.toString3(contractlist.get(i).getReg_date()) %></td>
								</tr>
								<%
										}
									}
								%>
								</tbody>
								
							</table>
						</div>
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
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/project/complete/success/<%=progresslist.get(i).getProject_pk()%>/<%=progresslist.get(i).getClient_pk()%>/<%=progresslist.get(i).getPartners_pk()%>'>완료</a></td>
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/project/complete/fail/<%=progresslist.get(i).getProject_pk()%>/<%=progresslist.get(i).getClient_pk()%>/<%=progresslist.get(i).getPartners_pk()%>'>취소</a></td>
									
								</tr>
								<%
										}
									}
								%>
								</tbody>
								
							</table>
						</div>
						<div class="contract-project">
							<h5 class="contract-project-heading">
								<a href="#">신원 인증 신청</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>타입</th>
										<th>도구</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(authenticationlist != null)
									{
										for(int i=0;i<authenticationlist.size();i++)
										{
								%>
								<tr>
									<td><%=authenticationlist.get(i).getId() %></td>
									<td><% if(authenticationlist.get(i).getAccount_type().equals("client")) out.print("클라이언트"); else out.print("파트너스"); %></td>
									<td><a class='btn btn-sm btn-client' href='/wjm/admin/accounts/verify_identity/<%=authenticationlist.get(i).getPk() %>/'>자세히보기</a></td>
								</tr>
								<%
										}
									}
									else
									{
								%>
								<tr>
								<td class='text-muted' colspan='3'>제출된 인증서류가 없습니다.</td></tr>
								
								<%
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