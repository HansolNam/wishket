<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");

	if(account == null)
	{

%>
<header class="header">
	<section class="nav-main nav-main-mini navbar" role="navigation"
		style="background-color: #2d3a45">
		<div class="container" style="background-color: #2d3a45">
			<div class="nav-inner" style="background-color: #2d3a45">
				<div class="navbar-header navbar-not-login"
					style="background-color: #2d3a45">
					<a class="navbar-brand" href="/wjm/">WJM</a>
				</div>
				<nav>
					<ul class="nav navbar-nav nav-primary">
						<li class=""><a href="/wjm/project/">프로젝트 찾기</a></li>
						<li class=""><a href="/wjm/partners/">파트너스 목록</a></li>
						<li><a href="/wjm/service-intro/">이용방법</a></li>
					</ul>
					<span class="navbar-nav navbar-right"><span class="w-help"><a
							href="/wjm/service-intro/"><i
								class="fa fa-question-circle fa-lg" style="color: #fff"></i></a></span> <span
						class="w-login"><a class="btn btn-login"
							href="/wjm/accounts/login/" style="color: #fff">로그인</a></span> <span
						class="w-signup"><a class="btn btn-signup"
							href="/wjm/accounts/signup/" style="color: #fff">회원가입</a></span></span>
				</nav>
			</div>
		</div>
	</section>
</header>
<%
	}
	else
	{
		if(account.getAccount_type().equals("client"))
		{
%>
<header class="header">
	<section class="nav-main navbar" role="navigation"
		style="background-color: #2d3a45;">
		<div class="container"
			style="background-color: #2d3a45; color: #fff;">
			<div class="nav-inner"
				style="background-color: #2d3a45; color: #fff;">
				<div class="navbar-header active" style="color: #fff">
					<a class="navbar-brand" href=<%="/wjm/mywjm/"+account.getAccount_type() %>>WJM</a>
				</div>
				<nav>
					<ul class="nav navbar-nav nav-primary">
						<li class="" style="color: #fff"><a href="/wjm/project/add/"
							style="color: #fff">프로젝트 등록</a></li>
						<li class="" style="color: #fff"><a href="/wjm/project/"
							style="color: #fff">프로젝트 찾기</a></li>
						<li class="" style="color: #fff"><a href="/wjm/partners/"
							style="color: #fff">파트너스 목록</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right nav-secondary">
						<li class="help"><a
							class="nav-help pull-left how_to_use_button"
							href="/wjm/client-use/"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
						<li class="notification"><a
							class="nav-notification how_to_use_button"
							href="/wjm/accounts/notifications/"> <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></a></li>
						<li class="dropdown"><a
							class="dropdown-toggle how_to_use_button"
							data-toggle="dropdown" href="#"><%= account.getId() %>님 <b
								class="fa fa-caret-down"></b></a>
						<ul class="dropdown-menu">
								<li><a href="/wjm/client/info/" tabindex="-1">클라이언트 정보 관리</a></li>
								<li><a href="/wjm/accounts/settings/profile/" tabindex="-1">계정
										설정</a></li>
								<li class="divider"></li>
								<li class="dropdown_li"><a class="dropdown_li"
									href="/wjm/accounts/logout/" tabindex="-1">로그아웃</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
	<section class="nav-sub"
		style="box-shadow: 1px 1px #bdc4cc; background-color: #dadee2;">
		<div class="container">
			<div class="nav-inner">
				<nav>
					<ul class="nav navbar-nav">
						<li class=""><a href="/wjm/client/manage/project/submitted/"
							style="color: #333; font-weight: 500 !important;">검수 중</a></li>
						<li class=""><a href="/wjm/client/manage/recruiting/"
							style="color: #333; font-weight: 500 !important;">지원자 모집 중</a></li>
						<li class=""><a href="/wjm/client/manage/wait/"
							style="color: #333; font-weight: 500 !important;">결제 대기중인 프로젝트</a></li>
						<li class=""><a href="/wjm/client/manage/contract-in-progress/"
							style="color: #333; font-weight: 500 !important;">진행 중인
								프로젝트</a></li>
						<li class=""><a href="/wjm/client/manage/past/review-contract/"
							style="color: #333; font-weight: 500 !important;">종료된 프로젝트</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
</header>
<% 
		}
		else if(account.getAccount_type().equals("partners"))
		{
%>
<header class="header">
	<section class="nav-main navbar" role="navigation"
		style="background-color: #2d3a45;">
		<div class="container"
			style="background-color: #2d3a45; color: #fff;">
			<div class="nav-inner"
				style="background-color: #2d3a45; color: #fff;">
				<div class="navbar-header active" style="color: #fff">
					<a class="navbar-brand" href=<%="/wjm/mywjm/"+account.getAccount_type() %>>WJM</a>
				</div>
				<nav>
					<ul class="nav navbar-nav nav-primary">
						<li class="" style="color: #fff"><a href="/wjm/project/"
							style="color: #fff">프로젝트 찾기</a></li>
						<li class="" style="color: #fff"><a href="/wjm/partners/"
							style="color: #fff">파트너스 목록</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right nav-secondary">
						<li class="help"><a
							class="nav-help pull-left how_to_use_button"
							href="/wjm/partners-use/"><i
								class="fa fa-question-circle fa-lg "></i></a></li>
						<li class="notification"><a
							class="nav-notification how_to_use_button"
							href="/wjm/accounts/notifications/"><i
								class="fa fa-bell fa-lg "></i></a></li>
						<li class="dropdown"><a
							class="dropdown-toggle how_to_use_button"
							data-toggle="dropdown" href="#"><%=account.getId() %>님 <b
								class="fa fa-caret-down"></b></a>
						<ul class="dropdown-menu">
								<li><a href="/wjm/partners/p/<%=account.getId() %>/" tabindex="-1">내
										프로필 보기</a></li>
								<li><a href="/wjm/partners/p/<%=account.getId() %>/info/update/"
									tabindex="-1">프로필 정보 관리</a></li>
								<li><a href="/wjm/accounts/settings/profile/" tabindex="-1">계정
										설정</a></li>
								<li class="divider"></li>
								<li class="dropdown_li"><a class="dropdown_li"
									href="/wjm/accounts/logout/" tabindex="-1">로그아웃</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
	<section class="nav-sub"
		style="box-shadow: 1px 1px #bdc4cc; background-color: #dadee2;">
		<div class="container">
			<div class="nav-inner">
				<nav>
					<ul class="nav navbar-nav">
						<li class=""><a href="/wjm/partners/p/<%=account.getId() %>/"
							style="color: #333; font-weight: 500 !important;">내 프로필</a></li>
						<li class=""><a href="/wjm/partners/manage/interest/"
							style="color: #333; font-weight: 500 !important;">관심 프로젝트</a></li>
						<li class=""><a href="/wjm/partners/manage/proposal/counselling"
							style="color: #333; font-weight: 500 !important;">지원 내역</a></li>
						<li class=""><a
							href="/wjm/partners/manage/contract-in-progress/"
							style="color: #333; font-weight: 500 !important;">진행 중인
								프로젝트</a></li>
						<li class=""><a
							href="/wjm/partners/manage/past/review-contract/"
							style="color: #333; font-weight: 500 !important;">완료한 프로젝트</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
</header>
<%	
		}

		else if(account.getAccount_type().equals("admin"))
		{
%>
<header class="header">
	<section class="nav-main navbar" role="navigation"
		style="background-color: #2d3a45;">
		<div class="container"
			style="background-color: #2d3a45; color: #fff;">
			<div class="nav-inner"
				style="background-color: #2d3a45; color: #fff;">
				<div class="navbar-header active" style="color: #fff">
					<a class="navbar-brand" href='/wjm/admin/home'>WJM</a>
				</div>
				<nav>
					<ul class="nav navbar-nav nav-primary">
						<li class="" style="color: #fff"><a href="/wjm/project/"
							style="color: #fff">프로젝트 찾기</a></li>
						<li class="" style="color: #fff"><a href="/wjm/partners/"
							style="color: #fff">파트너스 목록</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right nav-secondary">
						<li class="help"><a
							class="nav-help pull-left how_to_use_button"
							href="/wjm/client-use/"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
						<li class="notification"><a
							class="nav-notification how_to_use_button"
							href="/wjm/accounts/notifications/"> <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></a></li>
						<li class="dropdown"><a
							class="dropdown-toggle how_to_use_button"
							data-toggle="dropdown" href="#"><%= account.getId() %>님 <b
								class="fa fa-caret-down"></b></a>
						<ul class="dropdown-menu">
								<li class="dropdown_li"><a class="dropdown_li"
									href="/wjm/accounts/logout/" tabindex="-1">로그아웃</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
	<section class="nav-sub"
		style="box-shadow: 1px 1px #bdc4cc; background-color: #dadee2;">
		<div class="container">
			<div class="nav-inner">
				<nav>
					<ul class="nav navbar-nav">
						<li class=""><a href="/wjm/admin/notice/"
							style="color: #333; font-weight: 500 !important;">공지사항</a></li>
						<li class=""><a href="/wjm/admin/identity/"
							style="color: #333; font-weight: 500 !important;">신원인증 신청</a></li>
						<li class=""><a href="/wjm/admin/submitted/"
							style="color: #333; font-weight: 500 !important;">검수신청</a></li>
						<li class=""><a href="/wjm/admin/meeting/"
							style="color: #333; font-weight: 500 !important;">미팅신청</a></li>
						<li class=""><a href="/wjm/admin/progress/"
							style="color: #333; font-weight: 500 !important;">진행중인 프로젝트</a></li>
						<li class=""><a href="/wjm/admin/wait/"
							style="color: #333; font-weight: 500 !important;">결제 대기중인 프로젝트</a></li>
						<li class=""><a href="/wjm/admin/contract/faillist/"
							style="color: #333; font-weight: 500 !important;">실패한 계약</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</section>
</header>
<%
		}
	}
%>