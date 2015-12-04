<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp,com.wjm.models.ContractInfo, com.wjm.models.AdditionInfo, com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%@ page import="com.wjm.models.NoticeInfo"%>

<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ContractInfo> waitlist = (List<ContractInfo>)request.getAttribute("waitlist");

	List<AdditionInfo> additionlist = (List<AdditionInfo>)request.getAttribute("additionlist");
	int addition_cnt = 0;
	if(additionlist != null) addition_cnt = additionlist.size();
%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 결제대기중</title>
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
<body class="logged-in client mywishket">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						결제 대기중 페이지 
					</h3>
				</div>
				<div class="content-inner">
					
					<div class="mywishket-project">
						
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="#">결제 대기중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>파트너스</th>
										<th>금액</th>
										<th>기간</th>
										<th>계약일자</th>
										<th>도구</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(waitlist == null)
									{
								%>
								<tr>
								<td class='text-muted' colspan='6'>결제대기중인 프로젝트 리스트가 없습니다.</td>
								</tr>
								<%
									}
									else
									{
										for(int i=0;i<waitlist.size();i++)
										{
								%>
								<tr>
									<td><a href="/wjm/project/<%=waitlist.get(i).getName() %>/<%=waitlist.get(i).getProject_pk() %>"><%=waitlist.get(i).getName() %></a></td>
									<td><a href='/wjm/partners/p/<%=waitlist.get(i).getPartners_id()%>'/><%= waitlist.get(i).getPartners_id()%></a></td>
									<td><%=waitlist.get(i).getBudget() %> 원</td>
									<td><%=waitlist.get(i).getTerm() %> 일</td>
									<td><%out.print(Time.toString3(waitlist.get(i).getReg_date()));%></td>
									<td><a class='btn btn-sm btn-client' href="/wjm/client/payment/<%=waitlist.get(i).getPk() %>/">결제</a></td>
									
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
								<a href="#">결제 대기중인 추가요청</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>추가요청 제목</th>
										<th>금액</th>
										<th>기간</th>
										<th>계약일자</th>
										<th>도구</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(addition_cnt == 0)
									{
								%>
								<tr>
								<td class='text-muted' colspan='6'>결제대기중인 추가요청 리스트가 없습니다.</td>
								</tr>
								<%
									}
									else
									{
										for(int i=0;i<additionlist.size();i++)
										{
								%>
								<tr>
									<td><a href="/wjm/project/<%=additionlist.get(i).getContract().getName() %>/<%=additionlist.get(i).getContract().getProject_pk() %>"><%=additionlist.get(i).getContract().getName() %></a></td>
									<td><%= additionlist.get(i).getTitle() %></td>
									<td><%=additionlist.get(i).getBudget() %> 원</td>
									<td><%=additionlist.get(i).getTerm() %> 일</td>
									<td><%out.print(Time.toString3(additionlist.get(i).getReg_date()));%></td>
									<td>											
									<button id="pay-btn" class='btn btn-sm btn-client' addition-pk = "<%=additionlist.get(i).getPk()%>">결제</button>				
									</td>
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
		
								<!-- 로딩 이미지 -->
							<div id="viewLoading">
								<img src="${pageContext.request.contextPath}/resources/upload/viewLoading.gif" />
							</div>
							<!-- 불투명 이미지 -->
							<div class='backLayer' style='' > </div>
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
			$( "#pay-btn" ).click(function() {
				
				if(confirm("정말 결제하시겠습니까?") == true)
					{
						var additionPk = $(this).attr('addition-pk');
						$.ajax({
							url : "/wjm/project/addition/pay/"+additionPk,
							type : "POST",
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