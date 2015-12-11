<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.NoticeInfo,com.wjm.models.AccountInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	NoticeInfo notice = (NoticeInfo) request.getAttribute("notice");
	AccountInfo account = (AccountInfo) session.getAttribute("account");

	String content = "";
	String name = "";
	String reg_date = "";
	
	if(notice != null)
	{
		name = notice.getName();
		content = notice.getContent().replaceAll("\r\n", "<br/>");
		reg_date = Time.toString3(notice.getReg_date());
	}
%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 공지사항 - <%=name %></title>
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
<body class="logged-in client project-preview">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="content">
				<p class="back">
				<a href='/wjm/mywjm/<%=account.getAccount_type() %>/'>[마이외주몬 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
				<div class="content-inner">
					<div class="header-text project-detail-header"><%=name %>
					</div>
					<div class="summary">
						<div class="project-desc">
							<div class="project-desc-title">공지사항 내용</div>
							<%=content%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
	<script type="text/javascript">
		

		$(document).ready(function() {
		    $('img').each(function() {
			    var maxWidth = 500; // Max width for the image
			    var maxHeight = 500;    // Max height for the image
			    var ratio = 0;  // Used for aspect ratio
			    var width = $(this).width();    // Current image width
			    var height = $(this).height();  // Current image height
	
			    // Check if the current width is larger than the max
			    if(width > maxWidth){
			        ratio = maxWidth / width;   // get ratio for scaling image
			        $(this).css("width", maxWidth); // Set new width
			        $(this).css("height", height * ratio);  // Scale height based on ratio
			        height = height * ratio;    // Reset height to match scaled image
			    }
	
			    var width = $(this).width();    // Current image width
			    var height = $(this).height();  // Current image height
	
			    // Check if current height is larger than max
			    if(height > maxHeight){
			        ratio = maxHeight / height; // get ratio for scaling image
			        $(this).css("height", maxHeight);   // Set new height
			        $(this).css("width", width * ratio);    // Scale width based on ratio
			        width = width * ratio;    // Reset width to match scaled image
			    }
			})
		});
	</script>
</body>
</html>