<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time, java.sql.Timestamp"%>

<%	
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
	
	if(projectlist != null)
	{
		int pagenum;
		if(projectlist.size()%10 == 0)
			pagenum = projectlist.size()/10;
		else
			pagenum = projectlist.size()/10 + 1;
		%>
		
<input id="project_total_number" type="hidden" value=<%=projectlist.size()%> />
<input id="page_size" type="hidden" value=<%=pagenum%> />
		<%
		for(int i=0;i<projectlist.size();i++)
		{
	
%>

<section class="become-close project-unit" >
 	<div class="project_unit-heading" style="">
 		<h4 class="project-title">
	 		<a href="/wjm/project/about/<%=projectlist.get(i).getName()%>/<%=projectlist.get(i).getPk() %>">
	 			<%=projectlist.get(i).getName() + "(" + projectlist.get(i).getStatus() + ")" %>
	 		</a>
 		</h4>
 	</div>
 	<div class="project-unit-body">
 		<div class="project-unit-basic-info">
 			<span>
 				<i class="fa fa-won">
 					예상금액 <%=projectlist.get(i).getBudget() %>원
 				</i>
 			</span>
 			<span>
 				<i class="fa fa-clock-o">
 					"예상기간 <%=projectlist.get(i).getPeriod() %>일"
 				</i>
 			</span>
 			<span class="date-recruitment">등록일자 <%=Time.TimestampToString(projectlist.get(i).getReg_date()) %></span>
 		</div>
 		<div class="project-unit-desc">
 			<p>
 			<%=projectlist.get(i).getDescription() %>
 			</p>
 		</div>
 		<div class="outer-info">
 			<div class="outer-info-upper-data">
	 			<!-- <img class="project-outer-info-img" src="aaa"> -->
 				<span>
 					<strong>
 					
 					<% 
 					int remain = Time.remainDate(projectlist.get(i).getDeadline(), now);
 					if(remain>=0) out.println("마감 "+Time.remainWeekDate(remain)+" 전");
 					else out.println("모집 마감");
 					%>
 					</strong>
 				</span>
 			</div>
	 		<div class="outer-info-under-data">
	 			<!-- <img class="project-outer-info-img" src="aaa"> -->
	 			<span class="applied">
	 				총 
	 				<strong>11명</strong>
	 				 지원
	 			</span>
	 		</div>
	 	</div>
 		<div style="clear: both;"></div>
 	</div>
 	<div class="project-unit-additional-info">
 		<span class="project-category">
 		<%if(projectlist.get(i).getCategoryL().equals("design"))
 			{
 				out.println("디자인");
 			}
 		else
 		{
 			out.println("개발");
 		}
 		
 		%>
 		</span>
 		<span class="project-subcategory"><%=projectlist.get(i).getCategoryM() %></span>
 		<div class="project-skill-required"><span class="info-title">요구기술</span>
 		
 		<%
 			String[] array = projectlist.get(i).getTechnique().split(",");
 			
 			for(int j=0;j<array.length;j++)
 				out.println("<span class='project-skill label-skill'>"+array[j].trim()+"</span>");
 				
 		%> 
 		</div>
 	</div>
 </section>
<%
		}
	}
%>