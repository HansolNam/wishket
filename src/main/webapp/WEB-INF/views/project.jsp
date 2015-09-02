<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<meta content="Wishket Inc,." name="author" />
<meta
	content="위시켓은 기업의 프로젝트와 개발자 &amp; 디자이너를 연결해주는 온라인 아웃소싱 서비스 입니다.
더 이상 지인을 수소문하지 마세요, 위시켓에서 3시간이면 충분합니다."
	name="description" />
<meta content="593258114025512" property="fb:app_id" />
<meta content="website" property="og:type" />
<meta content="http://www.wishket.com" property="og:url" />
<meta content="Wishket" property="og:title" />
<meta content="http://www.wishket.com/static/img/wishket_logo_256.png"
	property="og:image" />
<meta
	content="위시켓은 기업의 프로젝트와 개발자 &amp; 디자이너를 연결해주는 온라인 아웃소싱 서비스 입니다.
더 이상 지인을 수소문하지 마세요, 위시켓에서 3시간이면 충분합니다."
	property="og:description" />
<meta content="k6UITCIVaYG0YtRsN8g4GF2T4qg7Z3M6JD2mLJte_n4"
	name="google-site-verification" />
<meta content="d2c8672ef81fcd9ceb62f51232d13aada8512a64"
	name="naver-site-verification" />
<title>위시켓(Wishket) · 프로젝트 찾기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
<link href="/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="/static/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/static/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/static/touch-icon-ipad.png" rel="apple-touch-icon"
	sizes="76x76" />
<link href="/static/touch-icon-iphone-retina.png" rel="apple-touch-icon"
	sizes="120x120" />
<link href="/static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152" />
<script src="/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class=" project-list">
	<div id="fb-root"></div>
	<script src="/static/django_facebook/js/facebook.js"
		type="text/javascript"></script>
	<script>
    facebookAppId = '593258114025512';
    facebookDefaultScope = ["email", "user_about_me", "user_birthday", "user_website"];
    staticUrl = '/static/';
    function facebookJSLoaded(){
        FB.init({appId: facebookAppId, status: false, cookie: true, xfbml: true, oauth: true});
    }
    window.fbAsyncInit = facebookJSLoaded;
    F = new facebookClass(facebookAppId);
    F.load();
</script>
	<div id="wrap">
		<header class="header">
			<section class="nav-main nav-main-mini navbar" role="navigation"
				style="background-color: #2d3a45">
				<div class="container" style="background-color: #2d3a45">
					<div class="nav-inner" style="background-color: #2d3a45">
						<div class="navbar-header navbar-not-login"
							style="background-color: #2d3a45">
							<a class="navbar-brand" href="/">Wishket</a>
						</div>
						<nav>
							<ul class="nav navbar-nav nav-primary">
								<li><a href="/project/add/">프로젝트 등록</a></li>
								<li class=""><a href="/project/">프로젝트 찾기</a></li>
								<li class=""><a href="/partners/">파트너스 목록</a></li>
								<li><a href="/service-intro/">이용방법</a></li>
							</ul>
							<span class="navbar-nav navbar-right"><span class="w-help"><a
									href="/service-intro/"><i
										class="fa fa-question-circle fa-lg" style="color: #fff"></i></a></span> <span
								class="w-login"><a class="btn btn-login"
									href="/accounts/login/" style="color: #fff">로그인</a></span> <span
								class="w-signup"><a class="btn btn-signup"
									href="/accounts/signup/" style="color: #fff">회원가입</a></span></span>
						</nav>
					</div>
				</div>
			</section>
		</header>
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 찾기 <small class="small-text"><span
							id="total_list_num">2,457개의 프로젝트가 있습니다.</span></small>
					</h3>
					<div class="search search-right">
						<form action="." class="form-inline" id="form_id"
							onsubmit="return false;" role="form">
							<div class="form-group">
								<input class="input-query form-control" id="id_q"
									maxlength="100" name="q" type="text" />
							</div>
							<input id="id_flush" name="flush" type="hidden" value="" /><input
								id="id_page" name="page" type="hidden" value="1" /><input
								id="id_addr" name="addr" type="hidden"
								value="111111111111111111" /><input id="id_sort" name="sort"
								type="hidden" value="0" /><input id="id_cat_dev" name="cat_dev"
								type="hidden" value="1111111111" /><input id="id_cat_design"
								name="cat_design" type="hidden" value="11111111111" />
							<div class="form-group">
								<input class="btn btn-default form-control"
									onclick="clear_page(); submitList();" type="button"
									value="검색하기" />
							</div>
						</form>
					</div>
				</div>
				<div class="content-inner">
					<div class="project-list-filter-box" style="float: left">
						<div class="project-list-sort-box">
							<div class="sort-box-title">프로젝트 정렬</div>
							<div class="left-box">
								<div class="sort-button" id="sort-1"
									onclick="setSortFilterValue(this)">금액 높은 순</div>
								<div class="sort-button" id="sort-2"
									onclick="setSortFilterValue(this)">금액 낮은 순</div>
							</div>
							<div class="right-box">
								<div class="sort-button" id="sort-3"
									onclick="setSortFilterValue(this)">최신 등록 순</div>
								<div class="sort-button" id="sort-4"
									onclick="setSortFilterValue(this)">마감 임박 순</div>
							</div>
						</div>
						<div class="project-list-category-box">
							<div class="category-box-title">프로젝트 카테고리</div>
							<div class="category-selecter both">
								<input id="category-kip" name="category-kip" type="hidden"
									value="22" />
								<ul class="category-selecter-list">
									<li class="parent dev-category-list"><div
											class="dev-skipper"></div>
										<input id="dev" name="dev" type="checkbox" /><label for="dev">개발</label>
									<ul class="child-list">
											<li><input id="dev-1" name="dev" type="checkbox" /><label
												for="dev-1">웹</label></li>
											<li><input id="dev-2" name="dev" type="checkbox" /><label
												for="dev-2">애플리케이션</label></li>
											<li><input id="dev-3" name="dev" type="checkbox" /><label
												for="dev-3">워드프레스</label></li>
											<li><input id="dev-4" name="dev" type="checkbox" /><label
												for="dev-4">퍼블리싱</label></li>
											<li><input id="dev-5" name="dev" type="checkbox" /><label
												for="dev-5">일반 소프트웨어</label></li>
											<li><input id="dev-6" name="dev" type="checkbox" /><label
												for="dev-6">커머스, 쇼핑몰</label></li>
											<li><input id="dev-7" name="dev" type="checkbox" /><label
												for="dev-7">게임</label></li>
											<li><input id="dev-8" name="dev" type="checkbox" /><label
												for="dev-8">임베디드</label></li>
											<li><input id="dev-9" name="dev" type="checkbox" /><label
												for="dev-9">기타</label></li>
										</ul></li>
									<li class="parent design-category-list"><div
											class="design-skipper"></div>
										<input id="design" name="design" type="checkbox" /><label
										for="design">디자인</label>
									<ul class="child-list">
											<li><input id="design-1" name="design" type="checkbox" /><label
												for="design-1">웹</label></li>
											<li><input id="design-2" name="design" type="checkbox" /><label
												for="design-2">애플리케이션</label></li>
											<li><input id="design-3" name="design" type="checkbox" /><label
												for="design-3">제품</label></li>
											<li><input id="design-4" name="design" type="checkbox" /><label
												for="design-4">프레젠테이션</label></li>
											<li><input id="design-5" name="design" type="checkbox" /><label
												for="design-5">인쇄물</label></li>
											<li><input id="design-6" name="design" type="checkbox" /><label
												for="design-6">커머스, 쇼핑몰</label></li>
											<li><input id="design-7" name="design" type="checkbox" /><label
												for="design-7">로고</label></li>
											<li><input id="design-8" name="design" type="checkbox" /><label
												for="design-8">그래픽</label></li>
											<li><input id="design-9" name="design" type="checkbox" /><label
												for="design-9">게임</label></li>
											<li><input id="design-10" name="design" type="checkbox" /><label
												for="design-10">기타</label></li>
										</ul></li>
								</ul>
							</div>
						</div>
						<div class="project-list-address-box">
							<div class="address-title">미팅 진행 지역</div>
							<div class="wrapper-dropdown address-box" id="address-box">
								<button class="btn btn-default address-select-button"
									data-toggle="dropdown" id="project-list-address-button"
									type="button">
									<span style="float: left">전체 선택</span><i class="fa fa-sort"></i>
								</button>
								<ul class="dropdown-selecter">
									<li id="dropdown-scroll-controller"
										style="overflow: auto; height: 160px;"><input
										id="address" name="address" type="checkbox" /><label
										class="address-select-label" for="address">전체 선택</label>
									<ul>
											<li><input id="address-1" name="address" type="checkbox" /><label
												class="address-select-label" for="address-1">서울특별시</label></li>
											<li><input id="address-9" name="address" type="checkbox" /><label
												class="address-select-label" for="address-9">경기도</label></li>
											<li><input id="address-4" name="address" type="checkbox" /><label
												class="address-select-label" for="address-4">인천광역시</label></li>
											<li><input id="address-2" name="address" type="checkbox" /><label
												class="address-select-label" for="address-2">부산광역시</label></li>
											<li><input id="address-3" name="address" type="checkbox" /><label
												class="address-select-label" for="address-3">대구광역시</label></li>
											<li><input id="address-5" name="address" type="checkbox" /><label
												class="address-select-label" for="address-5">광주광역시</label></li>
											<li><input id="address-6" name="address" type="checkbox" /><label
												class="address-select-label" for="address-6">대전광역시</label></li>
											<li><input id="address-7" name="address" type="checkbox" /><label
												class="address-select-label" for="address-7">울산광역시</label></li>
											<li><input id="address-8" name="address" type="checkbox" /><label
												class="address-select-label" for="address-8">세종특별자치시</label></li>
											<li><input id="address-10" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-10">강원도</label></li>
											<li><input id="address-11" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-11">충청북도</label></li>
											<li><input id="address-12" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-12">충청남도</label></li>
											<li><input id="address-13" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-13">전라북도</label></li>
											<li><input id="address-14" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-14">전라남도</label></li>
											<li><input id="address-15" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-15">경상북도</label></li>
											<li><input id="address-16" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-16">경상남도</label></li>
											<li><input id="address-17" name="address"
												type="checkbox" /><label class="address-select-label"
												for="address-17">제주특별자치도</label></li>
										</ul></li>
									<li><div class="address-selecter-submit"
											id="address-selecter-submit">확인</div>
										<div class="address-selecter-cancel"
											id="address-selecter-cancel">취소</div></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="project-list-box" id="project-list-box"
						style="float: left; width: 852px;">
						<input id="project_total_number" type="hidden" value="2,457" /><input
							id="page_size" type="hidden" value="246" />
						<section class="no-result">
							<div class="no-result-img">
								<img alt="검색" src="/static/img/icon_loading.png" />
							</div>
							<p>로딩 중입니다.</p>
						</section>
					</div>
					<div class="pagination-wrapper" style="clear: both">
						<ul class="pagination" id="pagination_box">
							<li class="active"><span class="current">1</span></li>
							<li><a href="?page=2">2</a></li>
							<li><a href="?page=3">3</a></li>
							<li><a href="?page=4">4</a></li>
							<li><a href="?page=5">5</a></li>
							<li><a href="?page=6">6</a></li>
							<li><a href="?page=7">7</a></li>
							<li><a href="?page=8">8</a></li>
							<li><a href="?page=9">9</a></li>
							<li><a href="?page=10">10</a></li>
							<li><a class="next" href="?page=2"><i
									class="fa fa-arrow-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<footer class="footer">
		<div class="footer-inner">
			<div class="info">
				<div class="footer-logo">
					<img class="footer-logo-img"
						src="/static/img/wishket_footer_logo.svg" />
				</div>
				<div class="contact">
					<i class="fa fa-phone"></i> <a href="tel:82269254849">02-6925-4849</a><br />
					<i class="fa fa-envelope"></i> <a href="mailto:help@wishket.com">help@wishket.com</a><br />
					<img src="/static/img/yellow_id.png" style="margin-right: 4px;" /><a
						href="http://goto.kakao.com/@wishket">Kakao ID 친구추가: @wishket</a><br />
					고객센터 운영시간: 오전 10시부터 오후 6시까지<small>(공휴일 제외)</small>
				</div>
				<address class="address">
					서울특별시 강남구 테헤란로77길 11-18 창애빌딩 4층<br /> 사업자등록번호: 209-81-57303 / 대표이사:
					박우범<br />
				</address>
				<span class="copyright">© 2014 Wishket, inc.</span>
			</div>
			<div class="category">
				<h5 class="category-heading">위시켓</h5>
				<ul class="category-list">
					<li class="category-item"><a href="/service-intro/">서비스 소개</a></li>
					<li class="category-item"><a href="/client-use/">클라이언트
							이용방법</a></li>
					<li class="category-item"><a href="/partners-use/">파트너스
							이용방법</a></li>
					<li class="category-item"><a href="/service-fee/">이용요금</a></li>
					<li class="category-item"><a href="/faq">자주 묻는 질문</a></li>
				</ul>
			</div>
			<div class="category">
				<h5 class="category-heading">관련 정보</h5>
				<ul class="category-list">
					<li class="category-item"><a href="/company-intro/">회사소개</a></li>
					<li class="category-item"><a href="/terms-of-service/">이용약관</a></li>
					<li class="category-item"><a
						href="http://blog.wishket.com/category/media/">보도자료</a></li>
				</ul>
			</div>
			<div class="category">
				<h5 class="category-heading">관련 링크</h5>
				<ul class="category-list">
					<li class="category-item"><a
						href="http://www.facebook.com/wishket">페이스북</a></li>
					<li class="category-item"><a href="http://blog.wishket.com">블로그</a></li>
					<li class="category-item"><a href="http://twitter.com/wishket">트위터</a></li>
				</ul>
				<div class="mixpanel-banner">
					<a href="https://mixpanel.com/f/partner" target="_blank"><img
						alt="Mobile Analytics"
						src="//cdn.mxpnl.com/site_media/images/partner/badge_blue.png" /></a>
				</div>
			</div>
		</div>
	</footer>
	<link
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"
		rel="stylesheet" />
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script src="/static/js/jStorage.js"></script>
	<script>

    $(function(){
        if($('#id_flush').val() == 'true'){
            $(document).ready(hasHistoryViewSetup());
            $(document).ready(submitList());
        }
        else{
            $(window).onunload = $.jStorage.flush();
            setSortActive();
            setDevCategoryActive();
            setDesignCategoryActive();
            setAddressActive();
            $(document).ready(submitList());
        }
    });
    /*
    function onloadList(){

        var page = document.location.href.split("/")[4],
                q = $("input[name='q']").val().replace(/\//g, "__slash__"),
                sort = $('#id_sort').val(),
                cat_dev = $('#id_cat_dev').val(),
                cat_design = $('#id_cat_design').val(),
                addr = $('#id_addr').val();
        if(page==''){
            page = 1;
        }
        try {
            if(page.indexOf("status") > -1){
                page = 1;
            }
        }
        catch(err){

        }

        $.jStorage.set('value', page + '/' + q  + '/' + sort + '/' + cat_dev + '/' + cat_design + '/' + addr);
        if(q === ''){
            q="None"
        }
        var loading = "<section class='no-result'><div class='no-result-img'><img src='/static/img/icon_loading.png' alt='검색'/></div><p>로딩 중입니다.</p></section>";
        $("#project-list-box").html(loading);
        $.ajax({
            url: '/project/pl/' + page + '/' + q + '/' + sort + '/' + cat_dev + '/' + cat_design + '/' + addr + '/',
            success: function(data){
                $("#project-list-box").html(data);
                var t = $('#project_total_number').val();
                if(parseInt(t)>0){
                    $('#total_list_num').text(t+'개의 프로젝트가 있습니다.');
                }
                else{
                    $('#total_list_num').text('검색 결과가 없습니다.');
                }
                setPagination(page, $('#page_size').val());
            }
        })
    }
    */

    function clear_page(){
        $('#id_page').val(1);
    }

    function hasHistoryViewSetup(){
        var list_val = $.jStorage.get('value');
        if(list_val){
            var list = list_val.split('/');
            $('#id_page').val(list[0]);
            $('#id_q').val(list[1]);
            $('#id_sort').val(list[2]);
            $('#id_cat_dev').val(list[3]);
            $('#id_cat_design').val(list[4]);
            $('#id_addr').val(list[5]);
            setSortActive();
            setDevCategoryActive();
            setDesignCategoryActive();
            setAddressActive();
        }
    }
    function setSortActive(){
        var sort_n = $('#id_sort').val();
        if (sort_n != 0){
            var sort_btn = $('.sort-button')[sort_n-1];
            sort_btn.className="sort-button active";
        }
    }

    function setDevCategoryActive(){
        var devlist = $("input[name='dev']"),
                filtervalue = $("input[id='id_cat_dev']").val().split('');
        if (filtervalue[0] == 2){
            $('#dev').prop({
                indeterminate: false,
                checked: true
            });
        }
        else{
            var cnt=0;
            for(var i = 1; i< devlist.length; i++){
                if(filtervalue[i] == 2){
                    $('#dev-'+i).prop('checked', true);
                    cnt ++;
                }
            }
            if(cnt>0){
                $('#dev').prop({
                    indeterminate: true,
                    checked: false
                });
            }
        }
    }
    function setDesignCategoryActive(){
        var designlist = $("input[name='design']"),
                filtervalue = $("input[id='id_cat_design']").val().split('');
        if (filtervalue[0] == 2){
            $('#design').prop({
                indeterminate: false,
                checked: true
            });
        }
        else{
            var cnt=0;
            for(var i = 1; i< designlist.length; i++){
                if(filtervalue[i] == 2){
                    $('#design-'+i).prop('checked', true);
                    cnt ++;
                }
            }
            if(cnt>0){
                $('#design').prop({
                    indeterminate: true,
                    checked: false
                });
            }
        }
    }
    function setAddressActive(){
        var addresslist = $("input[name='address']"),
                filtervalue = $("input[id='id_addr']").val().split(''),
                cnt = 0, so_val = '';

        for(var i=0; i< addresslist.length; i++){
            if(filtervalue[i] == 2){
                $('#address-'+i).prop('checked', true);
                so_val = addresslist[i].nextSibling.innerHTML;
                cnt ++;
            }
        }
        if(cnt == 1){
            $('#project-list-address-button').html('<span style="float:left">'+so_val+'</span><i class="fa fa-sort"></i>');
        }
        else if (cnt == 18){
            $('#project-list-address-button').html('<span style="float:left">전체 선택</span><i class="fa fa-sort"></i>');
            $('#address').prop({
                indeterminate: false,
                checked: checked
            })
        }
        else if (cnt > 1 && cnt < 18){
            $('#project-list-address-button').html('<span style="float:left">' + cnt + '개 선택</span><i class="fa fa-sort"></i>');
            $('#address').prop({
                indeterminate: true,
                checked: false
            })
        }
        else{
            $('#project-list-address-button').html('<span style="float:left">전체 선택</span><i class="fa fa-sort"></i>');
        }
    }
    $(function() {
  	  // Apparently click is better chan change? Cuz IE?
      $('input[type="checkbox"]').change(function(e) {
      var checked = $(this).prop("checked"),
          container = $(this).parent(),
          siblings = container.siblings();

      container.find('input[type="checkbox"]').prop({
          indeterminate: false,
          checked: checked
      });

      function checkSiblings(el) {
          var parent = el.parent().parent(),
              all = true,
              name=el.children('input[type="checkbox"]').attr("name");

          el.siblings().each(function() {
              return all = ($(this).children('input[type="checkbox"]').prop("checked") === checked);
          });

          if (all && checked) {
              parent.children('input[type="checkbox"]').prop({
                  indeterminate: false,
                  checked: checked
              });
              checkSiblings(parent);
          } else if (all && !checked) {
              parent.children('input[type="checkbox"]').prop("checked", checked);
              parent.children('input[type="checkbox"]').prop("indeterminate", (parent.find('input[type="checkbox"]:checked').length > 0));
              checkSiblings(parent);
          } else {
              el.parents("li").children('input[type="checkbox"]').prop({
                  indeterminate: true,
                  checked: false
              });
          }
          if(name == 'dev'){
            $('#id_page').val(1);
            setDevFilterValue();
            submitList();
          }
          else if(name == 'design'){
            $('#id_page').val(1);
            setDesignFilterValue();
            submitList();
          }
      }
      checkSiblings(container);

      });

    });

    function setAddressFilterValue(){
        var addresslist = $("input[name='address']"),
                filterset = $("input[id='id_addr']"),
                filtervalue = filterset.val().split(''),
                cnt = 0, so_val = '', t = 0;

        for(var i=0; i< addresslist.length; i++){
            var t = parseInt(addresslist[i].id.split('-')[1]);
            if(addresslist[i].checked){
                filtervalue[t] = 2;
                so_val = addresslist[i].nextSibling.innerHTML;
                cnt ++;
            }
            if(addresslist[i].checked === false){
                filtervalue[t] = 1;
            }
        }
        if(cnt == 1){
            $('#project-list-address-button').html('<span style="float:left">'+so_val+'</span><i class="fa fa-sort"></i>');
        }
        else if (cnt == 18){
            $('#project-list-address-button').html('<span style="float:left">전체 선택</span><i class="fa fa-sort"></i>');
        }
        else if (cnt > 1 && cnt < 18){
            $('#project-list-address-button').html('<span style="float:left">' + cnt + '개 선택</span><i class="fa fa-sort"></i>');
        }
        else{
            $('#project-list-address-button').html('<span style="float:left">전체 선택</span><i class="fa fa-sort"></i>');
        }
        filterset.val(filtervalue.join(""));
    }

    function clearAddressFilter(){
        var addresslist = $("input[name='address']");
        $('#project-list-address-button').html('<span style="float:left">전체 선택</span><i class="fa fa-sort"></i>');
        $('#address').prop({
                  indeterminate: false,
                  checked: false
              });
        addresslist.each(function(){
            $(this).prop('checked', false);
        })
    }

    function setDevFilterValue(){
        var devlist = $("input[name='dev']"),
                filterset = $("input[id='id_cat_dev']"),
                filtervalue = filterset.val().split('');
        for(var i = 0; i< devlist.length; i++){
            if(devlist[i].checked){
                filtervalue[i] = 2;
            }
            else if(devlist[i].checked === false){
                filtervalue[i] = 1;
            }
        }
        filterset.val(filtervalue.join(""));
    }

    function setSortFilterValue(obj){

        var id=obj.id,
                filterset = $("input[id='id_sort']"),
                all_div = $('.sort-button');

        for(var i = 0; i < all_div.length; i++){
            all_div[i].className = 'sort-button';
        }
        var id_value = id.split('-')[1];
        filterset.val(id_value);
        obj.className = 'sort-button active';
        $('#id_page').val(1);

        submitList();
    }

    function setDesignFilterValue(){
        var designlist = $("input[name='design']"),
                filterset = $("input[id='id_cat_design']"),
                filtervalue = filterset.val().split('');
        for(var i = 0; i< designlist.length; i++){
            if(designlist[i].checked){
                filtervalue[i] = 2;
            }
            else if(designlist[i].checked === false){
                filtervalue[i] = 1;
            }
        }
        filterset.val(filtervalue.join(""));
    }

    function submitList(){

        var page = $('#id_page').val(),
                q = $("input[name='q']").val().replace(/\//g, "__slash__"),
                sort = $('#id_sort').val(),
                cat_dev = $('#id_cat_dev').val(),
                cat_design = $('#id_cat_design').val(),
                addr = $('#id_addr').val();
        $.jStorage.set('value', page + '/' + q  + '/' + sort + '/' + cat_dev + '/' + cat_design + '/' + addr);
        if(q === ''){
            q="None"
        }
        var loading = "<section class='no-result'><div class='no-result-img'><img src='/static/img/icon_loading.png' alt='검색'/></div><p>로딩 중입니다.</p></section>";
        $("#project-list-box").html(loading);
        $.ajax({
            url: '/project/pl/' + page + '/' + q + '/' + sort + '/' + cat_dev + '/' + cat_design + '/' + addr + '/',
            success: function(data){
                $("#project-list-box").html(data);
                var t = $('#project_total_number').val();
                if(parseInt(t)>0){
                    $('#total_list_num').text(t+'개의 프로젝트가 있습니다.');
                }
                else{
                    $('#total_list_num').text('검색 결과가 없습니다.');
                }
                setPagination(page, $('#page_size').val());
            }
        });
        $('html,body').scrollTop(0);
    }

    function setPagination(present, total){
        var html="",
                box=$('#pagination_box'),
                present_id='#page_'+present+'',
                prev=Number(present) - 1,
                next=Number(present) + 1;
        if(present % 10 == 0){
            var max_page = parseInt(present / 10) * 10;
        }
        else{
            var max_page = (parseInt(present / 10) + 1) * 10;
        }
        if(max_page > total){
            max_page = total;
        }
        var min_page = max_page - 9;
        if(min_page < 1){
            min_page = 1;
        }

        if(present != 1){
            html += "<li><a style='cursor:pointer' onclick='setPage(" + prev + ");' class='prev'><i class='fa fa-arrow-left'></i></a></li>";
        }
        for(var i = min_page; i<=max_page; ++i){
            html +="<li id='page_" + i + "'><a style='cursor:pointer' onclick='setPage(" + i + ");'>" + i + "</a></li>";
        }
        //html +="<li id='page_" + i + "'><a style='cursor:pointer' onclick='setPage(" + total + ");'>" + total + "</a></li>";
        if(present != total){
            html += "<li><a style='cursor:pointer' onclick='setPage(" + next + ");' class='next'><i class='fa fa-arrow-right'></i></a></li>";
        }

        box.html(html);
        $(present_id).addClass('active');
    }

    function setPage(link){
        $('#id_page').val(link);
        submitList();
    }

    function toggle_interest(obj){
        var project_id = obj.getAttribute('project-id');
        $.ajax({
            url: "/partners/toggle_interest/"+project_id+"/",
            success: function(data){
                if(data.interest == 'false'){
                    obj.className = 'project-action-img interest-nonselected';
                    obj.setAttribute('title', "'관심 프로젝트'에 추가하기");
                }
                else{
                    obj.className = 'project-action-img interest-selected';
                    obj.setAttribute('title', "'관심 프로젝트'에서 삭제하기");
                }
            },
            error: function(data){
            }
        })
        $('.ui-tooltip').css('display', 'none');
    }

    function DropDown(el) {
        this.box = el;
        this.button = this.box.find('button');
        this.ul = this.box.find('ul');
        this.opts = this.box.find('ul.dropdown-selecter > li');
        this.val = [];
        this.index = [];
        this.initEvents();
    }
    DropDown.prototype = {
        initEvents : function() {
            var obj = this;
            obj.button.on('click', function(e){
                var $y=e.screenY;
                var $selecter = $('.dropdown-selecter');
                var $selecter_y = $('#project-list-address-button').position().top;
                if($y > 500){
                    $selecter.css('top', $selecter_y - 208);
                }
                else{
                    $selecter.css('top', $selecter_y + 26);
                }
                obj.ul.toggleClass('active');
                e.stopPropagation();
            });
            $('#address-selecter-submit').click(function(){
                var $scroll_control = $('#dropdown-scroll-controller');
                setAddressFilterValue();
                $scroll_control.scrollTop(0);
                obj.ul.removeClass('active');
                $('#id_page').val(1);
                submitList();
            });
            $('#address-selecter-cancel').click(function(){
                var $scroll_control = $('#dropdown-scroll-controller');
                clearAddressFilter();
                setAddressActive();
                $scroll_control.scrollTop(0);
                obj.ul.removeClass('active');
            });
        }
    };
    $(function() {
        var box = new DropDown( $('#address-box') );
    });

    $(function() {
        $("input[name='q']").keydown(function(evt){
            if (evt.keyCode == 13){
                $('#id_page').val(1);
                submitList();
            }
        })
    })
    $(function() {
        $('.dev-skipper').click(function(){
            if($('#category-kip').val()==11){
                $('#category-kip').val(21);
            }
            else if($('#category-kip').val()==21){
                $('#category-kip').val(11);
            }
            else if($('#category-kip').val()==22){
                $('#category-kip').val(12);
            }
            else if($('#category-kip').val()==12){
                $('#category-kip').val(22);
            }
            change_status();
        });
        $('.design-skipper').click(function(){
            if($('#category-kip').val()==11){
                $('#category-kip').val(12);
            }
            else if($('#category-kip').val()==21){
                $('#category-kip').val(22);
            }
            else if($('#category-kip').val()==22){
                $('#category-kip').val(21);
            }
            else if($('#category-kip').val()==12){
                $('#category-kip').val(11);
            }
            change_status();
        });
        function change_status(){
            if($('#category-kip').val() == 21){
                $('.category-selecter').attr('class', 'category-selecter dev');
            }
            else if($('#category-kip').val() == 22){
                $('.category-selecter').attr('class', 'category-selecter both');
            }
            else if($('#category-kip').val() == 12){
                $('.category-selecter').attr('class', 'category-selecter design');
            }
            else if($('#category-kip').val() == 11){
                $('.category-selecter').attr('class', 'category-selecter nothing');
            }
        }

    });

    $(function() {
        if($(window).width() > 1080){
            $( document ).tooltip({
              position: {
                my: "right bottom-10",
                at: "right+14 top",
                using: function( position, feedback ) {
                  $( this ).css( position );
                  $( "<div>" )
                    .addClass( feedback.vertical )
                    .addClass( feedback.horizontal )
                    .appendTo( this );
                }
              }
            });
        }
      });
</script>
	<script type="text/javascript">
  $(function() {
    wishket.init();
    
    svgeezy.init(false, 'png');
  });
</script>
	<script>

$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;


	if ( $( window ).width() >= 1200 ) {
		$( '.p5-side-nav-deactive' ).css( 'display', 'none' );
	} else  {
		$( '.p5-side-nav-active' ).css( 'display', 'none' );
		$( '.p5-side-nav-deactive' ).css( 'display', 'block');
	}

	$('.content-inner').on('click', '.p5-side-nav-active-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'none' );
		$('.p5-side-nav-deactive').css('display','block');
	});

	$('.content-inner').on('click', '.p5-side-nav-deactive-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'block' );
		$('.p5-side-nav-deactive').css('display','none');
	});


    $( window ).scroll ( function () {
		if ( $(window).scrollTop() > 87 && p5TotalSubNavigationFlag === 0) {
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').removeClass('hide fadeOut');
				$('#p5-total-sub-navigation-wrapper').addClass('fadeInDown');
			}, 200 );
			flag = 1;


		} else if ( $(window).scrollTop() <= 87 ){
			p5TotalSubNavigationFlag = 0;
			$('#p5-total-sub-navigation-wrapper').removeClass('fadeInDown');
			$('#p5-total-sub-navigation-wrapper').addClass('fadeOut');
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').addClass('hide');
			}, 200 );
		}
	});
});

</script>
	<script type="text/javascript">
        var TRS_AIDX = 9287;
        var TRS_PROTOCOL = document.location.protocol;
        document.writeln();
        var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
        document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
        </script>
	<script type="text/javascript">
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-31427125-2', 'wishket.com');
        var ga_now = new Date();
        var dimension4Value = "Y" + ga_now.getFullYear()
                              + "M" + (ga_now.getMonth()+1)
                              + "D" + (ga_now.getDate())
                              + "H" + (ga_now.getHours())
                              + "I" + (ga_now.getMinutes())
                              + "W" + (ga_now.getDay());
        ga('require', 'displayfeatures');
        ga('set', '&uid', 'None');
        ga('send', 'pageview', {
          'dimension1': 'anonymous',
          'dimension2': 'unknown',
          'dimension3': 'None',
          'dimension4': dimension4Value
        });
      </script>
	<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
mixpanel.init("c7b742deb9d00b4f1c0e1e9e8c5c3115");</script>
	<script type="text/javascript"> if (!wcs_add) var wcs_add={}; wcs_add["wa"] = "s_3225afd5bb50";if (!_nasa) var _nasa={};wcs.inflow();wcs_do(_nasa);</script>
</body>
</html>