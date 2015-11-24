<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time, java.sql.Timestamp"%>

<%	
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	Integer projectnum = (Integer)request.getAttribute("projectnum");
	
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
	
	if(projectlist != null)
	{
		int pagenum;
		if(projectnum%10 == 0)
			pagenum = projectnum/10;
		else
			pagenum = projectnum/10 + 1;
		%>

<input id="project_total_number" type="hidden"
	value=<%=projectnum%> />
<input id="page_size" type="hidden" value=<%=pagenum%> />
<%
		for(int i=0;i<projectlist.size();i++)
		{
			String description = "";
			if(projectlist.get(i).getDescription()!=null && !projectlist.get(i).getDescription().isEmpty())
			{
				description = projectlist.get(i).getDescription();
				if(description.length() > 150)
					description = description.substring(0, 150) + "...";
			}
				int remain = Time.remainDate(projectlist.get(i).getDeadline(), now);

%>

<section class="become-close project-unit">
	<div class="project_unit-heading" style="">
		<h4 class="project-title">
			<a
				href="/wjm/project/<%=projectlist.get(i).getName()%>/<%=projectlist.get(i).getPk() %>">
				<%=projectlist.get(i).getName() %>
			</a>
			<%if(remain>= 0 && projectlist.get(i).getStatus().equals("지원자모집중"))
				{
				%>
			<span class="label label-sm label-partners-availability possible" style="*margin-top: -17px;">모집중
</span><%		}
			%>
		</h4>
	</div>
	<div class="project-unit-body">
		<div class="project-unit-basic-info">
			<span> <i class="fa fa-won"> 예상금액 <%=projectlist.get(i).getBudget() %>원
			</i>
			</span> <span> <i class="fa fa-clock-o"> "예상기간 <%=projectlist.get(i).getPeriod() %>일"
			</i>
			</span> <span class="date-recruitment">등록일자 <%=Time.TimestampToString(projectlist.get(i).getReg_date()) %></span>
		</div>
		<div class="project-unit-desc">
			<p>
				<%=description %>
			</p>
			<div class="outer-info">
				<div class="outer-info-upper-data">
					<img class="project-outer-info-img"
						src="/static/img/clock-closed.png"><span><strong><% 
 					if(remain>=0) out.println("마감 "+Time.remainDate(remain)+" 전");
 					else out.println("모집 마감");
 					%></strong></span>
				</div>
				<div class="outer-info-under-data">
					<img class="project-outer-info-img"
						src="/static/img/proposal-user.png"><span class="applied">총
						<strong><%=projectlist.get(i).getApplicantnum() %>명</strong> 지원
					</span>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="project-unit-additional-info">
		<span class="project-category"> <%if(projectlist.get(i).getCategoryL().equals("디자인"))
 			{
 				out.println("디자인");
 			}
 		else
 		{
 			out.println("개발");
 		}
 		
 		%>
		</span> <span class="project-subcategory"><%=projectlist.get(i).getCategoryM() %></span>
		<div class="project-skill-required">
			<span class="info-title">요구기술</span>

			<%
 			String[] array = projectlist.get(i).getTechnique().split(",");
 			
 			for(int j=0;j<array.length;j++)
 				out.println("<span class='project-skill label-skill'>"+array[j].trim()+"</span>");
 				
 		%>
		</div>
	</div>
	</div>
	
</section>
<%
		}
	}
%>