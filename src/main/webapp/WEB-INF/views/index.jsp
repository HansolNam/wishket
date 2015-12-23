<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.List"%>

<%
	Integer projectnum = (Integer)request.getAttribute("projectnum");
	Integer projectbudget = (Integer)request.getAttribute("projectbudget");
	Integer partnersnum = (Integer)request.getAttribute("partnersnum");
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	
	if(projectnum == null) projectnum = 0;
	if(projectbudget == null) projectbudget = 0;
	if(partnersnum == null) partnersnum = 0;
%>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 가능성을 가치로!</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
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
<body class=" landing">
	<div id="wrap">
		<jsp:include page="header.jsp" flush="false" />
		<div class="jumbotron">
			<div class="jumbotron-inner">
				<div class="invitation">
					<p class="invitation-text-md">앱 개발, 웹 디자인, 쇼핑몰 제작, 워드프레스 제작 등</p>
					<h1 class="invitation-heading">빠르고 안전한 아웃소싱 플랫폼</h1>
					<p class="invitation-text-sm">외주몬의 새로운 아웃소싱을 시작해 보세요</p>
					<a class="btn btn-client btn-lg project-add-btn"
						href="/wjm/project/add/">무료로 프로젝트 등록하기</a>
				</div>
			</div>
		</div>
		<section class="wishket-status">
		<div class="wishket-status-inner">
			<div class="status-box">
				<p>등록된 프로젝트</p>
				<span id="status_project">0</span><span>개</span>
			</div>
			<div class="status-box">
				<p>프로젝트 등록금액</p>
				<span id="status_project_money">0</span><span>원</span>
			</div>
			<div class="status-box">
				<p>개발회사 &amp; 프리랜서</p>
				<span id="status_project_partners">0</span><span>명</span>
			</div>
		</div>
		</section>
		<section class="landing-project-list">
		<div class="landing-inner">
			<div class="landing-project-list-heading">
				<h4>
					<img height="20px" src="/static/img/landing/symbol.png"
						style="margin-top: -3px;" />등록된 프로젝트
				</h4>
			</div>
			<%
				if(projectlist == null)
				{
			%>
			<div class="landing-project-item right-bottom">
				<h4>
					등록된 프로젝트가 없습니다.
				</h4>
			</div>
			<%
				}
				else
				{
					for(int i=0;i<projectlist.size();i++)
					{
						String description = projectlist.get(i).getDescription();
						if(description==null) description = "프로젝트 설명이 없습니다.";
						else if(description.length() > 80) description = description.substring(0, 78) + "..";
						
						String classname ="";
						if(i == 0 || i == 1) classname = "right-bottom";
						else if(i == 2) classname = "bottom";
						if(i == 3 || i == 4) classname = "right";
						else if(i == 5) classname = "";
			%>
			<div class="landing-project-item <%=classname%>">
				<h4>
					<a href="/wjm/project/add/"><%=projectlist.get(i).getName() %></a>
				</h4>
				<h5 class="project-element-list">
					<span class="project-element-money"><i class="fa fa-krw"></i>
						<strong><%=projectlist.get(i).getAccount_pk() %>원</strong></span> <span
						class="project-element-day project-element-list-border"><i
						class="fa fa-clock-o"></i> <strong><%=projectlist.get(i).getPeriod() %>일</strong></span> <span
						class="project-element-proposal"><i class="fa fa-pencil"></i>
						<strong><%=projectlist.get(i).getApplicantnum() %>명 지원</strong></span>
				</h5>
				<p class="landing-project-item-body"><%=description %></p>
				<p class="project-skill-list">
				<%
				if(projectlist.get(i).getTechnique() != null)
				{
					if(!projectlist.get(i).getTechnique().isEmpty())
					{
						String[] skill = projectlist.get(i).getTechnique().split(",");
						for (int j = 0; j < skill.length; j++) {
							out.println("<span class='project-skill'>" + skill[j] + "</span>");
						}
					}
					else
						out.println("<span class='project-skill'>관련 기술 없음</span>");
				}
				else
					out.println("<span class='project-skill'>관련 기술 없음</span>");
				
				%>
				</p>
			</div>
					<%
					}
				}
				%>
		</div>
		</section>
		<section class="landing-process">
		<div class="landing-process-inner">
			<h4>
				<img height="20px" src="/static/img/landing/symbol.png"
					style="margin-top: -3px;" />외주몬 프로세스
			</h4>
			<img src="/static/img/landing/process.png" />
			<div>
				<span>프로젝트 등록</span> <span>지원자 비교,선택</span> <span>미팅 및 계약</span> <span>프로젝트
					진행</span> <span>프로젝트 완료</span>
			</div>
		</div>
		</section>
		<section class="landing-popped">
		<div class="landing-inner">
			<div class="text-center">
				프로젝트를 찾고 있는 프리랜서이신가요? <a class="btn btn-md btn-wishket"
					href="/wjm/accounts/signup/">회원가입하기</a>
			</div>
		</div>
		</section>
		<section class="landing-benefit">
		<div class="landing-inner">
			<div class="landing-benefit-title">
				<h4>
					<img height="20px" src="/static/img/landing/symbol.png"
						style="margin-top: -3px;" />빠르고 안전한 외주몬
				</h4>
			</div>
			<div class="benefit-item">
				<img src="/static/img/landing/benefit_first.png" />
				<h3 class="benefit-item-title">무료로 더 쉽게 프로젝트를 등록</h3>
				<p class="benefit-item-desc">
					원하는 프로젝트를<br />쉽고 빠르게 진행할 수 있습니다.<br />수많은 외주몬 파트너들에게<br />당신의
					프로젝트를 소개해 보세요.
				</p>
			</div>
			<div class="benefit-item">
				<img src="/static/img/landing/benefit_second.png"
					style="margin-left: 100px;" />
				<h3 class="benefit-item-title">실력있는 지원자를 한눈에 비교 선택</h3>
				<p class="benefit-item-desc">
					다양한 지원자들의 포트폴리오와<br />클라이언트의 평가를<br />비교할 수 있습니다.<br />외주몬의 전문가들을
					만나보세요.
				</p>
			</div>
			<div class="benefit-item">
				<img src="/static/img/landing/benefit_third.png" />
				<h3 class="benefit-item-title">안전한 대금 보호 및 확실한 비용 처리</h3>
				<p class="benefit-item-desc">
					외주몬은 에스크로 시스템을 통해<br />프로젝트 대금을 보호합니다.<br />세금계산서 발행, 계약서 작성 문제도<br />더
					이상 고민하지 마세요.
				</p>
			</div>
		</div>
		</section>
		<section class="landing-popped register">
		<div class="landing-inner">
			<div class="text-center">
				지금 당신의 프로젝트를 등록해보세요. <a class="btn btn-md btn-client"
					href="/wjm/project/add/">프로젝트 등록하기</a>
			</div>
		</div>
		</section>
		<div class="landing-addendum">
			<div class="landing-inner">
				<div class="interview-list">
					<div class="landing-project-list-heading">
						<h4>
							<img height="20" src="/static/img/landing/symbol.png"
								style="margin-top: -3px;" />유저들이 말하는 외주몬
						</h4>
					</div>
					<div class="interview-item first">
						<p class="interview-item-review">
							프로젝트 등록 후<br />
							<strong>6시간만에 11명의 지원자</strong>가!<br />그 속도에 놀랐다.
						</p>
						<p class="interview-item-reviewer-info">
							스타트업 전문 미디어<br />
							<span>besuccess</span> 이은호 에디터
						</p>
					</div>
					<div class="interview-item second">
						<p class="interview-item-review">
							파트너스 프로필의<br />
							<strong>실제 프로젝트 기록</strong> 덕분에<br />좋은 작업자를 만날 수 있었다.
						</p>
						<p class="interview-item-reviewer-info">
							신개념 맞춤 여행사<br />
							<span>마이리얼트립</span> 이동건 대표
						</p>
					</div>
					<div class="interview-item third">
						<p class="interview-item-review">
							외주몬의 <strong>대금보호 서비스</strong>가<br />정말 만족스러웠다.<br />
							<strong>미팅 주선</strong>도 큰 도움이 되었다.
						</p>
						<p class="interview-item-reviewer-info">
							컨텐츠 크리에이트 그룹<br />
							<span>써클커넥션</span> 이정우 대표
						</p>
					</div>
				</div>
			</div>
		</div>
		<section class="landing-partnership">
		<div class="landing-inner">
			<div class="landing-project-list-heading">
				<h4>
					<img height="20px" src="/static/img/landing/symbol.png"
						style="margin-top: -3px;" />외주몬과 함께 합니다
				</h4>
				<img src="/static/img/landing/withyou.png" />
			</div>
		</div>
		</section>
		<section class="landing-with-company">
		<div class="landing-inner">
			<div class="landing-company-list-heading">
				<h4>
					<img height="20px" src="/static/img/landing/symbol.png"
						style="margin-top: -3px;" />외주몬 고객사
				</h4>
				<img src="/static/img/landing/company_img.png" />
			</div>
		</div>
		</section>
		<script>
    $(window).load(function () {
        function commaSeparateNumber(val){
            while (/(\d+)(\d{3})/.test(val.toString())){
                val = val.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            }
            return val;
        }

        function count(){

            var $el = $("#status_project"); //[make sure this is a unique variable name]
            $({someValue: 0}).animate({someValue: '<%=projectnum%>'}, {
                duration: 1200,
                easing:'swing', // can be anything
                step: function() { // called on every step
                    // Update the element's text with rounded-up value:
                    $el.text(commaSeparateNumber(Math.round(this.someValue)));
                },

                complete:function(){
                    $('#status_project').text(commaSeparateNumber(Math.round(this.someValue)));
                }
            });


            $({someValue: 0}).animate({someValue: ('<%=projectbudget%>')}, {
                duration: 1200,
                easing:'swing', // can be anything
                step: function() { // called on every step
                    // Update the element's text with rounded-up value:
                    $('#status_project_money').text(commaSeparateNumber(Math.round(this.someValue)));
                },

                complete:function(){
                    $('#status_project_money').text(commaSeparateNumber(Math.round(this.someValue)));
                }
            });

            var $el2 = $("#status_project_partners");
            $({someValue: 0}).animate({someValue: '<%=partnersnum%>'}, {
                duration: 1200,
                easing:'swing', // can be anything
                step: function() { // called on every step
                    // Update the element's text with rounded-up value:
                    $el2.text(commaSeparateNumber(Math.round(this.someValue)));
                },
                complete:function(){
                    $('#status_project_partners').text(commaSeparateNumber(Math.round(this.someValue)));
                }
            });
        }

        count();
    });
</script>
	<div id="push"></div>
</div>
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>