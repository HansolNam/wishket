<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AssessmentInfo, com.wjm.main.function.Validator,java.util.List, com.wjm.models.ProjectInfo, com.wjm.models.AccountInfo, com.wjm.models.CommentInfo, com.wjm.models.AccountInformationInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	String profile = (String)request.getAttribute("profile");
	AccountInformationInfo accountinfo = (AccountInformationInfo) request.getAttribute("accountinfo");
	ProjectInfo project = (ProjectInfo) request.getAttribute("project");
	List<CommentInfo> comment = (List<CommentInfo> ) request.getAttribute("comment");
	Integer applicantnum = (Integer) request.getAttribute("applicantnum");
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
	
	String interest = (String)request.getAttribute("interest");
	String available = (String)request.getAttribute("available");
	
	String introduction = "";
	if(accountinfo != null)
	{
		if(Validator.hasValue(accountinfo.getIntroduction()))
			introduction = accountinfo.getIntroduction().replaceAll("\r\n","<br/>");
	}
	
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	int check_cnt = 0;
	int recruit_cnt = 0;
	int ing_cnt = 0;
	int finish_cnt = 0;
	
	if(projectlist != null)
	{
		for(int i=0;i<projectlist.size();i++)
		{
			if(projectlist.get(i).getStatus().equals("검수중"))
			{
				check_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("지원자모집중"))
			{
				recruit_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("진행중"))
			{
				ing_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("완료한프로젝트"))
			{
				finish_cnt++;
			}
		}
	}
	
	//총 누적금액
	Integer total_budget = (Integer)request.getAttribute("total");
	if(total_budget == null) total_budget = 0;

	//평가받은 리스트
	List<AssessmentInfo> assessmentlist = (List<AssessmentInfo>)request.getAttribute("assessmentlist");
	int assessmentnum;
	int total = 0, professionalism = 0, satisfaction = 0, communication = 0, schedule_observance = 0,activeness = 0;
	double total_avg = 0.0;
	if(assessmentlist == null) assessmentnum = 0;
	else
	{
		assessmentnum = assessmentlist.size();
		
		for (int i = 0; i < assessmentnum; i++) {
			int avg = (assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
					+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
					+ assessmentlist.get(i).getActiveness()) / 5;
			
			professionalism += assessmentlist.get(i).getProfessionalism();
			satisfaction += assessmentlist.get(i).getSatisfaction();
			communication += assessmentlist.get(i).getCommunication();
			schedule_observance += assessmentlist.get(i).getSchedule_observance();
			activeness += assessmentlist.get(i).getActiveness();
		}
			
		if (assessmentnum != 0) {
				total = professionalism + satisfaction + communication + schedule_observance + activeness;
				total_avg = (double) total / (double) (assessmentnum * 5);
				professionalism /= assessmentnum;
				satisfaction /= assessmentnum;
				communication /= assessmentnum;
				schedule_observance /= assessmentnum;
				activeness /= assessmentnum;
			}
	}
	
	String filename = project.getFilename();

%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 프로젝트 - <%=project.getName() %></title>
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
<body class="logged-in client project-detail">
	<jsp:include page="../header.jsp" flush="false" />
	<div id="wrap">
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<p class="back">
					<a href="/wjm/project"><i class="fa fa-arrow-circle-o-left"></i>
						프로젝트 찾기로 돌아가기</a>
				</p>
				<div class="content-inner">
					<div class="header-text project-detail-header">
						<span><%=project.getName()%></span> <span
							class="label label-sm label-partners-availability possible pull-right"
							style="*margin-top: -17px;"><%
							int remain = Time.remainDate(project.getDeadline(), now);
							if (remain >= 0)
								out.println("모집 " + Time.remainDate(remain) + " 전");
							else
								out.println("모집 마감");
						%></span>
					</div>
					<div class="project-detail-category"><% if(project.getCategoryL().equals("design")) out.print("디자인"); else out.print("개발");%>
						<span class="applicant-count pull-right">총 <span class="applicant-num"><%=applicantnum.intValue()%>명</span>
							지원  </span>
					</div>
					<div class="summary">
						<div class="project-detail-basic-info">
							<div class="budget">
								<i class="fa fa-krw"></i> <span class="title">예상금액</span>
								<%=project.getBudget()%>원
							</div>
							<div class="term">
								<i class="fa fa-clock-o"></i> <span class="title">예상기간</span>
								<%=project.getPeriod()%>일
							</div>
							<div class="deadline">
								<i class="fa fa-pencil"></i> <span class="title">모집마감</span>
								<%=Time.toString3(project.getDeadline())%>
							</div>
						</div>
						<div class="project-detail-meta-info">
							<div class="project-data-box">
								<div class="title one">기획 상태</div>
								<div class="data d-one">
									<%
										if (project.getPlan_status().equals("idea"))
											out.print("아이디어");
										else if (project.getPlan_status().equals("simple"))
											out.print("간단한 정리");
										else if (project.getPlan_status().equals("project_book"))
											out.print("상세한 기획 문서");
									%>
								</div>
								<div class="title two">매니징 경험</div>
								<div class="data d-two">

									<%
										if (project.getManaging() == 1)
											out.print("있음");
										else
											out.print("없음");
									%>
								</div>
								<div class="title three">등록 일자</div>
								<div class="data d-three"><%=Time.toString3(project.getReg_date())%></div>
							</div>
							<div class="project-data-box bottom-box">
								<div class="title one">예상 시작일</div>
								<div class="data d-one"><%=Time.toString3(project.getStart_date())%></div>
								<div class="title two">미팅 방식</div>
								<div class="data d-two">
									<%
										if (project.getMeeting_type().equals("ONLINE"))
											out.print("온라인 미팅");
										else
											out.print("오프라인 미팅");
									%>
								</div>
								<div class="title three">진행 지역</div>
								<div class="data d-three"><%=project.getMeeting_area()%>
									&gt;
									<%=project.getMeeting_area_detail()%></div>
							</div>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 내용</div>
							<%=project.getDescription().replaceAll("\r\n", "<br/>")%>
							
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 첨부파일</div>
							<%
								if(!Validator.hasValue(filename))
								{
							%>
							파일이 존재하지 않습니다.
							<%
								}
								else
								{
							%>
							
							<a href="/wjm/Filedownload?filename=<%=java.net.URLEncoder.encode(project.getFilename())%>"><%=project.getFilename()%></a>
							<%
								}
							%>
						</div>
						<div class="project-skill-required">
							<div class="skill-required-title">관련 기술</div>
							<%
								String[] skill = project.getTechnique().split(",");
								for (int i = 0; i < skill.length; i++) {
									out.println("<span class='project-skill label-skill'>" + skill[i] + "</span>");
								}
							%>

						</div>
					</div>
				</div>
				<div class="content-inner" style="margin-top: 5px;">
					<div class="project-comment">
						<h4 class="project-comment-title">프로젝트 문의</h4>
						<%
						if(comment != null)
						{

							for(int i=0;i<comment.size();i++)
							{
								remain = Time.remainDate(now, comment.get(i).getReg_date());

								%>
								
								
						<div class="media" id="comment_<%=comment.get(i).getPk()%>">
							<a class="pull-left" href="/wjm/partners/p/<%=comment.get(i).getId() %>"><img
								alt="프로필 이미지" class="media-object"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=comment.get(i).getImg() %>"></a>
							<div class="media-body">
								<div class="media-heading">
									<a href="/wjm/partners/p/<%=comment.get(i).getId() %>/"><%=comment.get(i).getId() %></a> <small
										class="comment-timestamp"><%=Time.remainDate(remain) %> 전</small>
								</div>
								<p><%=comment.get(i).getContent() %></p>
							</div>
						</div>
								
								<%
								
							}
						}
						%>
						<div class="media">
							<a class="pull-left" href="#"><img
								alt="<%=account.getId() %>의 프로필 이미지" class="media-object"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%if(!Validator.hasValue(profile)) out.print("default_avatar.png"); else out.print(profile); %>" /></a>
							<div class="media-body">
								<form action="/wjm/project/<%=project.getName()%>/<%=project.getPk() %>" method="POST">
									<input name="csrfmiddlewaretoken" type="hidden"
										value="ea0aZfFjzqhmsqlZpktFMN7yDYNwZToQ" />
									<div class="">
										<textarea class="form-control" cols="40" id="id_body"
											name="body" required="" rows="10"></textarea>
									</div>
									<input class="btn btn-primary btn-submit" id="id_submit"
										type="submit" value="작성하기" /><span><small
										class="text-warning">프로젝트 문의에 작성한 내용은 수정 및 삭제가 불가능합니다.</small></span>
								</form>
							</div>
						</div>
						<p class="paragraph-danger">
							<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하여 직거래를
							유도하는 경우, 서비스 이용에 제재를 받을 수 있습니다.
						</p>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<%
						if (account.getAccount_type().equals("partners")) {
							if(available == null)
							{
					%>
					<div class="project-action-btn-group">
						<a
							class="btn btn-large btn-project-application btn-warning disabled btn-block"
							disabled="" href="#">프로젝트 지원불가</a>
						<hr>
						<div
							class="btn btn-large btn-project-application btn-default btn-block disabled"
							style="margin-bottom: 0;">
							<span>관심 프로젝트 추가불가</span>
						</div>
					</div>
					
					<%
							}
							else{
					%>
					<div class="project-action-btn-group">
						<a
							class="btn btn-large btn-partners btn-project-application btn-block"  id="id_apply"
							href="/wjm/project/<%=project.getName()%>/<%=project.getPk()%>/proposal/apply/">프로젝트
							지원하기</a>
						<hr>
						<%
							if(interest == null)
							{
						%>
						<a
							class="btn btn-large btn-project-application btn-black btn-block"
							href="#" onclick="toggle_interest(this);"
							style="margin-bottom: 0;"><span id="interest_action_text">관심
								프로젝트 추가하기</span></a>
						<%
							}
							else
							{
						%>
						<div
							class="btn btn-large btn-project-application btn-default btn-block"
							href="#" onclick="toggle_interest(this);"
							style="margin-bottom: 0;">
							<span id="interest_action_text">관심 프로젝트 삭제하기</span>
						</div>
						<%
							}
						%>
					</div>
					<%
							}
						}
					%>
					<%
						int register_num = check_cnt+recruit_cnt+ing_cnt+finish_cnt;
						int contract_num = ing_cnt+finish_cnt;
						
						double contract_per = 0;
						if(register_num != 0)
						{
							contract_per = 100.0*(double)contract_num/(double)register_num;
						}
						
						if(assessmentnum != 0)
						{
						total_avg = (double) total / (double) (assessmentnum * 5);
						professionalism /= assessmentnum;
						satisfaction /= assessmentnum;
						communication /= assessmentnum;
						schedule_observance /= assessmentnum;
						activeness /= assessmentnum;
						}
					%>
					<div class="client-info-box">
						<h3 class="client-name-tag-heading">클라이언트</h3>
						<div class="client-name-tag-body">
							<img alt="<%=project.getAccount().getId() %> 사진" class="client-img-lg"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<% if(!Validator.hasValue(accountinfo.getProfile_img())) out.print("default_avatar.png"); else out.print(accountinfo.getProfile_img()); %>" />
							<div class="client-company-info"><%=introduction %></div>
							<div class="client-evaluation-body"
								onclick="expand_rating(this);">
								<div class="rating star-md star-md-0"></div>
								<div class="rating-body">
									<span class="averageScore"><%=Math.round(total_avg * 10) / 10.0%></span> <span
										class="averageScore-body">/ 평가 <%=assessmentnum %>개</span>
									<div class="rating-expand-arrow">
										<span class="fa fa-sort-asc" id="rating-arrow"></span>
									</div>
								</div>
							</div>
							<div class="expanded-rating" id="expanded-rating"
								style="display: none">
								<div class="rating-row">
									<span class="expanded-rating-title">전문성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=professionalism %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">일정 준수</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=schedule_observance %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">사전 준비</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=satisfaction %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">적극성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=activeness %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">의사소통</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=communication %></span>
								</div>
							</div>
							<div class="client-history-body">
								<div class="project">
									<div class="history-body-title">프로젝트 등록</div>
									<div class="pull-right history-body-data"><%=register_num %> 건</div>
								</div>
								<div class="contract">
									<div class="contract-title">
										<div class="history-body-title">계약한 프로젝트</div>
										<div class="pull-right history-body-data"><%=contract_num %> 건</div>
									</div>
									<div class="contract-data">
										<div class="contract-data-box">
											<div class="history-body-title">계약률</div>
											<div class="pull-right history-body-data"><%=Math.round(contract_per*10.0)/10.0%>%</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">진행중인 프로젝트</div>
											<div class="pull-right history-body-data"><%=ing_cnt %> 건</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">완료한 프로젝트</div>
											<div class="pull-right history-body-data"><%=finish_cnt %> 건</div>
										</div>
									</div>
								</div>
							</div>
							<div class="client-history-budget-body">
								<div class="budget-body-title">누적 완료 금액</div>
								<div class="pull-right budget-body-data">
									<%=total_budget %> <span class="budget-body-clo">원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>

	<jsp:include page="../footer.jsp" flush="false" />
	<script>
	
	$('#id_submit').click(function(){

		if($('#id_body').val() == '')
		{
			alert("값을 입력해주세요");
			return false;
		}
		if($('#id_body').val().length > 249)
		{
			alert("댓글은 최대 250자입니다.");
			return false;
		}
		
		return true;
	});
	
		function expand_rating(obj) {
			var $obj = $(obj);
			if ($obj.attr('class') == 'client-expanded-evaluation-body') {
				$('#expanded-rating').css('display', 'none');
				$obj.attr('class', 'client-evaluation-body');
				$('#rating-arrow').prop('class', 'fa fa-sort-asc');
			} else {
				$('#expanded-rating').css('display', 'block');
				$obj.attr('class', 'client-expanded-evaluation-body');
				$('#rating-arrow').prop('class', 'fa fa-sort-desc');
			}
		}
		function toggle_interest(obj) {
			var project_id = '<%=project.getPk()%>';
			$.ajax({
						url : "/wjm/partners/manage/interest/toggle/"
								+ project_id + "/",
						dataType : "json", // 데이터타입을 JSON형식으로 지정
						success : function(data) {
							if (data.messages == 'false') {
								obj.className = 'btn btn-large btn-project-application btn-black btn-block';
								$('#interest_action_text').html('관심 프로젝트 추가하기');
								$(obj)
										.find('#interest_action_img')
										.attr(
												'src',
												'${pageContext.request.contextPath}/resources/static/img/no-interested-project-default.png');
							} else if (data.messages == 'true') {
								obj.className = 'btn btn-large btn-project-application btn-default btn-block';
								$('#interest_action_text').html('관심 프로젝트 삭제하기');
								$(obj)
										.find('#interest_action_img')
										.attr(
												'src',
												'${pageContext.request.contextPath}/resources/static/img/interested-project-default.png');
							} else {
								alert(data.messages);
							}
						},
						error : function(data) {
							console.log(data);
						}
					})
		}
	</script>
	
	<script type="text/javascript">

	$(document).ready(function(){

		$( "#id_apply" ).click(function() {

			if(confirm("프로젝트에 지원하시겠습니까?") == false)
				return false;
			
			return true;
		
			});
		});
	</script>
</body>
</html>