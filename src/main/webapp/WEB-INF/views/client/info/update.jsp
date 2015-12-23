<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp,com.wjm.models.AccountInfo ,com.wjm.models.AccountInformationInfo,com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	AccountInformationInfo accountinfo = (AccountInformationInfo)request.getAttribute("accountinfo");
	String profile = (String)request.getAttribute("profile");

	String intro = "";
	if(accountinfo.getIntroduction() != null)
		intro = accountinfo.getIntroduction();
%>
<!DOCTYPE html>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">

<title>외주몬(WJM) · 클라이언트 정보</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/dc7be87fa290.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/7ef873b38b5f.css" type="text/css" /><![endif]-->
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
<body class="logged-in client client-setting">

	<div id="wrap">
			<jsp:include page="../../header.jsp" flush="false" />

		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
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
							<li class="active"><a href="/wjm/client/info/">클라이언트 정보</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner">
						<section class="information-title">
							<h3 class="header-text" style="margin-bottom: 30px">클라이언트 정보
								수정</h3>
						</section>
						<div class="client-accounts-info-form-group">
							<form action="." autocomplete="off" class="form-horizontal"
								enctype="multipart/form-data" id="client-info-add-form"
								method="POST">
								<input name="csrfmiddlewaretoken" type="hidden"
									value="RXJ8bmA9Y6wBxr6PBFh3Izw3xcviaFis" /><span
									class="help-block"></span>
								<div class="form-group ">
									<label class="control-label required" for="company_description"><span>*</span>
										클라이언트 소개</label>
									<div class="control-wrapper">
										<textarea autocomplete="off"
											class="client_company_description form-control" cols="40"
											data-validation="required" id="company_description"
											name="company_description" rows="4"><%=intro  %></textarea>
										<span class="help-block">회사(개인)에 대해 간략하게 설명해주세요.(150자
											이내)</span>
									</div>
								</div>
								<div class="form-group">
									<div class="btn-wrapper">
										<input class="btn btn-default btn-submit"
											id="client-info-add-submit" type="button" value="수정" />
											<a
											aria-hidden="true" class="btn btn-cancel"
											data-dismiss="modal" href="/wjm/client/info/">취소</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
		<jsp:include page="../../footer.jsp" flush="false" />
	<script>
	$(document).ready(function(){

		$( "#client-info-add-submit" ).click(function() {
				
			var description = $("#company_description").val();
			
			if(description.length == 0){
				alert("소개를 입력해주세요");
				return false;
			}
			else if(description.length > 150){
				alert("소개는 최대 150자입니다.");
				return false;
			}
			
				$.ajax({
					url : "/wjm/client/info/update/",
					type : "POST",
				    data: $('#client-info-add-form').serialize(),  // 폼데이터 직렬화
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
		});
	});
	</script>
	</body>
</html>