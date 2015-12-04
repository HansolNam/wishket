<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Validator,com.wjm.models.AccountInfo,com.wjm.models.ContractInfo , com.wjm.models.AdditionInfo, java.util.*,java.sql.Timestamp, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");

	List<AdditionInfo> additionlist = (List<AdditionInfo>)request.getAttribute("additionlist");
	List<AdditionInfo> progresslist = (List<AdditionInfo>)request.getAttribute("progresslist");
	int additionCnt = 0;
	int progressCnt = 0;


	if(progresslist != null)
		progressCnt = progresslist.size();
	if(additionlist != null)
		additionCnt = additionlist.size();
	
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
<body class="logged-in client client-management contract-management">
	<div id="wrap">
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class="active"><a
								href="/wjm/admin/contract/addition/list/"><span
									class="badge badge-info pull-right"><%=additionCnt %></span>추가 요청 목록</a></li>
							<li><a
								href="/wjm/admin/contract/addition/progress/"><span
									class="badge badge-info pull-right"><%=progressCnt %></span>진행중인 추가요청</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							추가요청 리스트 <small class="small-text">클라이언트가 추가요청한 목록입니다. 파트너스와 조율 후, 승인 혹은 거부를 선택해주세요. <br>승인 시, 클라이언트 결제 대기 상태가 됩니다.</small>
						</h3>
					</div>
					
					<div class="content-inner">
					
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
												<i class="fa fa-won"></i> 프로젝트명
											</h5>
											<span>
											<a href="/wjm/project/<%=additionlist.get(i).getContract().getName() %>/<%=additionlist.get(i).getContract().getProject_pk()%>"><%=additionlist.get(i).getContract().getName() %></a>									
											
											</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-clock-o"></i> 기간
											</h5>
											<span><%=additionlist.get(i).getTerm() %>일</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-calendar-o"></i> 비용
											</h5>
											<span><%=additionlist.get(i).getBudget() %> 원</span></li>
									</ul>
									
									<ul class="project-info list-item-narrow">
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 클라이언트
											</h5>
											<span>		
											<a href="/wjm/admin/accounts/profile/<%=additionlist.get(i).getContract().getClient_pk() %>"><%=additionlist.get(i).getContract().getClient_id() %></a>							
											</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 파트너스
											</h5>
											<span>									
											<a href="/wjm/admin/accounts/profile/<%=additionlist.get(i).getContract().getPartners_pk() %>"><%=additionlist.get(i).getContract().getPartners_id() %></a>							
											</span></li>
										<li><h5 class="label-item"
												style="min-width: 80px !important;">
												<i class="fa fa-won"></i> 도구
											</h5>
											<span>
																			
											<button id="submit-btn" class='btn btn-sm btn-client' addition-pk = "<%=additionlist.get(i).getPk()%>">승인</button>				
											<button id="cancel-btn" class="btn btn-cancel btn-sm " addition-pk = "<%=additionlist.get(i).getPk()%>">취소</button>
											</span></li>
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
	<jsp:include page="../../../footer.jsp" flush="false" />
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
			$( "#submit-btn" ).click(function() {
				
				if(confirm("정말 승인하시겠습니까?") == true)
					{
						var additionPk = $(this).attr('addition-pk');
						$.ajax({
							url : "/wjm/admin/addition/submit/"+additionPk,
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
			

			$( "#cancel-btn" ).click(function() {
				
				if(confirm("정말 취소하시겠습니까?") == true)
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