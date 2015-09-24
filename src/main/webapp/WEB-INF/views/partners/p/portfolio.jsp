<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo, com.wjm.models.PortfolioInfo, java.util.List"%>
<%
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<PortfolioInfo> portfolio = (List<PortfolioInfo>) request.getAttribute("portfolio");
	String isSame = (String) request.getAttribute("isSame");
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
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 파트너스 - <%=this_account.getId() %></title>
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
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
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
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<jsp:include page="../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="partners-name-tag">
						<h3 class="partners-name-tag-heading">파트너스</h3>
						<div class="partners-name-tag-body">
							<img alt="<%=this_account.getId() %> 사진" class="p5-partners-img-lg"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.jpg" />
							<h4 class="partners-username-bottom"><%=this_account.getId() %></h4>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/">전체보기</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/introduction/">자기
									소개</a></li>
							<li class="active"><a
								href="/partners/p/<%=this_account.getId() %>/portfolio/">포트폴리오</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/skill/">보유
									기술</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/background/">경력,
									학력, 자격증</a></li>
							<li class="" style="border-top: 1px dashed #dedede"><a
								href="/partners/p/<%=this_account.getId() %>/evaluation/">클라이언트의 평가</a></li>
							<li class=""><a href="/partners/p/<%=this_account.getId() %>/history/">위시켓에서
									진행한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner"
						style="padding-top: 15px; padding-bottom: 25px;">
						<section>
						<h3 class="p5-profile-head">
							<%=this_account.getId() %>의 포트폴리오 <a class="btn btn-primary pull-right"
								href="/partners/p/<%=this_account.getId() %>/portfolio/update/"
								style="margin-top: -7px;">업데이트 하기</a>
						</h3>
						</section>
						<section class="p5-partition">
						<h4 class="p5-page-title" style="margin-top: 25px; !important;">
							대표 포트폴리오(<span id="p5-represent-portfolio-num">0</span>)
						</h4>
						<div class="p5-represent-portfolio-img-list">
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<img src="${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png" />
										<div class="p5-no-partners-info-text">
											<span class="p5-bold">'대표 포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
						</div>
						</section>
						<section class="p5-portfolio-nav-section">
						<nav class="navbar p5-portfolio-nav-bar" role="navigation">
						<span class="p5-page-title">포트폴리오 (<span
							id="p5-portfolio-num">0</span>)
						</span>
						<ul class="nav navbar-nav navbar-right p5-portfolio-nav"
							id="p5-develop-subcategory">
							<li><div class="btn-group classification p5-filter">
									<button
										class="btn btn-default dropdown-toggle p5-specific-category-btn"
										data-toggle="dropdown" type="button">
										세부 카테고리 <i class="fa fa-sort"></i>
									</button>
									<ul class="dropdown-menu fob-filter"
										id="p5-develop-subcategory-filter" role="menu">
										<li category="0"><a href="">전체보기</a></li>
									</ul>
								</div></li>
						</ul>
						<ul class="nav navbar-nav navbar-right p5-portfolio-nav"
							id="p5-all-category-nav">
							<li><div class="btn-group classification p5-filter">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" id="p5-category-dropdown-btn"
										type="button">
										카테고리 <i class="fa fa-sort"></i>
									</button>
									<ul class="dropdown-menu fob-filter" id="p5-category-filter"
										role="menu">
										<li category="0"><a href="#">전체보기</a></li>
										<li category="1"><a href="#">개발</a></li>
										<li category="2"><a href="#">디자인</a></li>
									</ul>
								</div></li>
						</ul>
						</nav></section>
						<section>
						<div class="p5-portfolio-list">
							<span class="p5-portfolio-no-img3"><div>
									<div>
										<img src="${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png" />
										<div class="p5-no-partners-info-text">
											등록된 <span class="p5-bold">'포트폴리오'</span>가 없습니다.
										</div>
									</div>
								</div></span>
						</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
</div>

	<jsp:include page="../../footer.jsp" flush="false" />
	<script>
            $(document).ready(function() {
                var imgUrl="";
                var split = location.href.split('/');
                var slug = split[5];
                var currentCategory = 0;
                var currentSubCategory = 0;

                allignComponent('p5-represent-portfolio-img-list');
                allignComponent('p5-portfolio-list');

                //dropdown btn
                $('.content-inner').on('click','#p5-category-filter > li', function (event) {
                    event.preventDefault();
                    $(this).parent().siblings('button').html($(this).text()+'<i class="fa fa-sort"></i>');
                    switch(parseInt($(this).attr('category'))) {
                        case 0:
                            $('.p5-portfolio-list').children().css('display','inline-block').attr('show-thumbnail');
                            $('.p5-filter').children('.p5-specific-category-btn').html('세부 카테고리'+'<i class="fa fa-sort"></i>');
                            currentCategory = 0;
                            break;
                        case 1://개발
                            $('#p5-develop-subcategory-filter').html(makeNavCategory(1));
                            $('.p5-portfolio-list').children('span[category-id!=2]').css('display','none');
                            $('.p5-portfolio-list').children('span[category-id=2]').css('display','inline-block');
                            $('.p5-filter').children('.p5-specific-category-btn').html('세부 카테고리'+'<i class="fa fa-sort"></i>');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[category-id=2]').length);
                            currentCategory = 1;
                            break;
                        case 2://디자인
                            $('#p5-develop-subcategory-filter').html(makeNavCategory(2));
                            $('.p5-portfolio-list').children('span[category-id!=1]').css('display','none');
                            $('.p5-portfolio-list').children('span[category-id=1]').css('display','inline-block');
                            $('.p5-filter').children('.p5-specific-category-btn').html('세부 카테고리'+'<i class="fa fa-sort"></i>');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[category-id=1]').length);
                            currentCategory = 2;
                            break;
                        default:
                            $('.p5-portfolio-list').children().css('display','none');
                            break;
                    }
                    allignComponent('p5-portfolio-list');
                });

                //develop subcategory dropdown btn 수정중
                $('.content-inner').on('click','#p5-develop-subcategory-filter > li', function (event) {
                    event.preventDefault();
                    $(this).parent().siblings('button').html($(this).text()+'<i class="fa fa-sort"></i>');
                    switch(parseInt($(this).attr('category'))) {
                        case 0://전체보기
                            if (currentCategory == 0 ) {
                                $('.p5-portfolio-list').children().css('display','inline-block');
                            } else if( currentCategory == 1 ) {
                                $('.p5-portfolio-list').children('span[category-id!=2]').css('display','none');
                                $('.p5-portfolio-list').children('span[category-id=2]').css('display','inline-block');
                                makeNoPortfolioComponent($('.p5-portfolio-list').children('span[category-id=2]').length);
                            } else if( currentCategory == 2) {
                                $('.p5-portfolio-list').children('span[category-id!=1]').css('display','none');
                                $('.p5-portfolio-list').children('span[category-id=1]').css('display','inline-block');
                                makeNoPortfolioComponent($('.p5-portfolio-list').children('span[category-id=1]').length);
                            }
                            break;
                        case 101://웹
                            $('.p5-portfolio-list').children('span[subcategory-id!=101]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=101]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=101]').length);
                            break;
                        case 102://애플리케이션
                            $('.p5-portfolio-list').children('span[subcategory-id!=102]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=102]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=102]').length);
                            break;
                        case 103://워드프레스
                            $('.p5-portfolio-list').children('span[subcategory-id!=103]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=103]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=103]').length);
                            break;
                        case 104://퍼블리싱
                            $('.p5-portfolio-list').children('span[subcategory-id!=104]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=104]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=104]').length);
                            break;
                        case 105://일반 소프트웨어
                            $('.p5-portfolio-list').children('span[subcategory-id!=105]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=105]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=105]').length);
                            break;
                        case 106://커머스, 쇼핑몰
                            $('.p5-portfolio-list').children('span[subcategory-id!=106]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=106]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=106]').length);
                            break;
                        case 107://게임
                            $('.p5-portfolio-list').children('span[subcategory-id!=107]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=107]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=107]').length);
                            break;
                        case 108://임베디드
                            $('.p5-portfolio-list').children('span[subcategory-id!=108]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=108]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=108]').length);
                            break;
                        case 109://기타
                            $('.p5-portfolio-list').children('span[subcategory-id!=109]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=109]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=109]').length);
                            break;
                        case 201://웹
                            $('.p5-portfolio-list').children('span[subcategory-id!=201]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=201]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=201]').length);
                            break;
                        case 202://애플리케이션
                            $('.p5-portfolio-list').children('span[subcategory-id!=202]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=202]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=202]').length);
                            break;
                        case 203://제품
                            $('.p5-portfolio-list').children('span[subcategory-id!=203]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=203]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=203]').length);
                            break;
                        case 204://프레젠테이션
                            $('.p5-portfolio-list').children('span[subcategory-id!=204]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=204]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=204]').length);
                            break;
                        case 205://인쇄물
                            $('.p5-portfolio-list').children('span[subcategory-id!=205]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=205]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=205]').length);
                            break;
                        case 206://커머스 쇼핑몰
                            $('.p5-portfolio-list').children('span[subcategory-id!=206]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=206]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=206]').length);
                        case 207://로고
                            $('.p5-portfolio-list').children('span[subcategory-id!=207]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=207]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=207]').length);
                            break;
                        case 208://그래픽
                            $('.p5-portfolio-list').children('span[subcategory-id!=208]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=208]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=208]').length);
                            break;
                        case 209://영상
                            $('.p5-portfolio-list').children('span[subcategory-id!=209]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=209]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=209]').length);
                            break;
                        case 210://게임
                            $('.p5-portfolio-list').children('span[subcategory-id!=210]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=210]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=210]').length);
                            break;
                        case 211://기타
                            $('.p5-portfolio-list').children('span[subcategory-id!=211]').css('display','none');
                            $('.p5-portfolio-list').children('span[subcategory-id=211]').css('display','inline-block');
                            makeNoPortfolioComponent($('.p5-portfolio-list').children('span[subcategory-id=211]').length);
                            break;
                        default:
                            $('.p5-portfolio-list').children().css('display','none');
                            break;
                    }
                    allignComponent('p5-portfolio-list');

                });

                function makeNoPortfolioComponent(length) {
                    $('.p5-portfolio-list').children('.p5-portfolio-no-img3').remove();
                    if( length==0 ) {
                        temp = '<span class="p5-portfolio-no-img3">'+
                                                '<div>'+
                                                '<div>'+
                                                    "<img src='${pageContext.request.contextPath}/resources/static/img/profile_portfolio.png'>"+
                                                    "<div class='p5-no-partners-info-text'>등록된 <span class='p5-bold'>'포트폴리오'</span>가 없습니다.</div>"+
                                                '</div>'+
                                                '</div>'+
                                            '</span>';

                        $('.p5-portfolio-list').append(temp);

                    }
                }

               function makeNavCategory(categoryType) {
                    var temp="";
                    if(categoryType==1) {//개발
                        temp =  '<li category="0"><a href="">전체보기</a></li>'+
                                '<li category="101"><a href="">웹</a></li>'+
                                '<li category="102"><a href="">애플리케이션</a></li>'+
                                '<li category="103"><a href="">워드프레스</a></li>'+
                                '<li category="104"><a href="">퍼블리싱</a></li>'+
                                '<li category="105"><a href="">일반 소프트웨어</a></li>'+
                                '<li category="106"><a href="">커머스,쇼핑몰</a></li>'+
                                '<li category="107"><a href="">게임</a></li>'+
                                '<li category="108"><a href="">임베디드</a></li>'+
                                '<li category="109"><a href="">기타</a></li>';
                    } else if(categoryType==2) {//디자인
                        temp =  '<li category="0"><a href="">전체보기</a></li>'+
                                '<li category="201"><a href="">웹</a></li>'+
                                '<li category="202"><a href="">애플리케이션</a></li>'+
                                '<li category="203"><a href="">제품</a></li>'+
                                '<li category="204"><a href="">프레젠테이션</a></li>'+
                                '<li category="205"><a href="">인쇄물</a></li>'+
                                '<li category="206"><a href="">커머스, 쇼핑몰</a></li>'+
                                '<li category="207"><a href="">로고</a></li>'+
                                '<li category="208"><a href="">그래픽</a></li>'+
                                '<li category="209"><a href="">영상</a></li>'+
                                '<li category="210"><a href="">게임</a></li>'+
                                '<li category="211"><a href="">기타</a></li>';
                    }
                    return temp;
               }

               function allignComponent(wrapperId) {
                    var element = $('.'+wrapperId).children();
                    var cnt=1;
                    for(var i=0 ; i < $('.'+wrapperId).children().length ; i++) {

                        if(element.eq(i).css('display')=='inline-block'||element.eq(i).css('display')=='block') {

                            if(cnt%3 == 0) {
                                element.eq(i).css('margin-right','0px');
                                element.eq(i).css('margin-bottom','20px');
                            } else {
                                element.eq(i).css('margin-right','34px');
                                element.eq(i).css('margin-bottom','20px');
                            }
                            cnt++;
                        }

                    }

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
        ga('set', '&uid', '28338');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'partners',
          'dimension3': '28338',
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