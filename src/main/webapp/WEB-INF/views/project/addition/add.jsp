<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.ContractInfo, com.wjm.main.function.Validator"%>
<%
	ContractInfo contract = (ContractInfo) request.getAttribute("contract");
	
	String name, client_id, partners_id;
	
	if(Validator.hasValue(contract.getName()))
		name = contract.getName();
	else
		name = "";

	if(Validator.hasValue(contract.getClient_id()))
		client_id = contract.getClient_id();
	else
		client_id = "";
	
	if(Validator.hasValue(contract.getPartners_id()))
		partners_id = contract.getPartners_id();
	else
		partners_id = "";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 추가요청 등록</title>
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
	href="${pageContext.request.contextPath}/resources/static/css/p5.css"
	rel="stylesheet" />
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
<body class="logged-in client account-setting profile">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />

		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">추가요청 정보 등록</h3>
						</section>
						<section>
						<form id="addition_form" method="POST"
							class="has-validation-callback">
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>프로젝트명</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="project-name-input"
										name="name" required="required" type="text" value="<%=name %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>클라이언트 아이디</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="client-id-input"
										name="client_id" required="required" type="text" value="<%=client_id %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>파트너스 아이디</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="partners-id-input"
										name="partners_id" required="required" type="text" value="<%=partners_id %>" disabled>
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>추가요청 내용</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="title-input"
										name="title" required="required" type="text">
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>비용(원)</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="budget-input"
										name="budget" required="required" type="text">
								</div>
							</div>
							<div class="form-group p5-form-group">
								<label class="control-label required p5-box-control-label"
									for=""><span>*</span>기간(일)</label>
								<div class="control-wrapper">
									<input class="form-control"
										data-validation="required" id="term-input"
										name="term" required="required" type="text">
								</div>
							</div>
							<span class="pull-right"><a
								class="btn btn-cancel p5-btn-left"
								href="/wjm/project/addition/list/<%=contract.getPk() %>" type="button">취소</a>
							<input autocomplete="off"
									class="btn btn-lg btn-client js-disable-on-click btn-submit"
									data-loading-text="제출 중" name="submit_btn" id = "submit_btn_id" type="button"
									value="등록" /></span>
						</form>
						</section>
						
								<!-- 로딩 이미지 -->
							<div id="viewLoading">
								<img src="${pageContext.request.contextPath}/resources/upload/viewLoading.gif" />
							</div>
							<!-- 불투명 이미지 -->
							<div class='backLayer' style='' > </div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />
		<script type="text/javascript">
		$(document).ready(function(){


			// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
			$('#viewLoading').hide();
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
			function form_check()
			{
				if($( "#title-input" ).val() == "")
					{
						alert("내용을 입력하세요.");
						return false;
					}
				

				if($( "#budget-input" ).val() == "")
					{
						alert("예산을 입력하세요.");
						return false;
					}
				

				if($( "#term-input" ).val() == "")
					{
						alert("기간을 입력하세요.");
						return false;
					}
				
				return true;
			}
			$( "#submit_btn_id" ).click(function() {
				
				if(form_check())
					{
				
						$.ajax({
							url : "/wjm/project/addition/add/<%=contract.getPk()%>",
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
						    beforeSend:function(){
					    		LoadingScreenFunc();
				
						    }
						    ,complete:function(){
				
								$('#viewLoading').hide();
								$(".backLayer").hide();
						 
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