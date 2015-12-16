<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo"%>
<%
	AccountInfo this_account = (AccountInfo)request.getAttribute("this_account");
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	String isSame = (String)request.getAttribute("isSame");
%>

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

<title>외주몬(WJM) · 파트너스 정보 설정</title>
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
		<jsp:include page="../../../../header.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages"></div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/wjm/partners/p/<%=this_account.getId() %>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> <a
								href="/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/">[ 포트폴리오 ]</a>
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId() %>/info/update/">파트너스
									정보</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/introduction/update/">자기 소개</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/wjm/partners/p/<%=this_account.getId() %>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=this_account.getId() %>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner"
						style="padding-top: 15px; padding-bottom: 25px;">
						<section class="p5-partition-title">
							<h3 class="header-text" style="margin-bottom: 30px">포트폴리오 추가</h3>
						</section>
						<section class="p5-section">
							<form action="/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/add/"
								enctype="multipart/form-data" id="p5-fix-portfolio-form"
								method="POST">
								<input name="csrfmiddlewaretoken" type="hidden"
									value="6Tjq3XUiP4iuLFxhByMfs0Kty5RN8ZLk" /><input name="slug"
									type="hidden" /><input name="dataId" type="hidden" /><input
									name="isImage1Changed" type="hidden" /><input
									name="isImage2Changed" type="hidden" /><input
									name="isImage3Changed" type="hidden" />
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>제목</label>
									<div class="control-wrapper">
										<input class="form-control p5-portfolio-form-title"
											data-validation="required" id="p5-form-title" name="title"
											required="required" type="text" />
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>카테고리</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="form-control" data-validation="required"
											id="p5-form-category" name="categoryId"><option
												selected="selected" value="">카테고리</option>
											<option value="개발">개발</option>
											<option value="디자인">디자인</option></select><select class="form-control"
											data-validation="required" id="p5-form-subcategory"
											name="subcategoryId"><option selected="selected"
												value="">세부 카테고리</option></select>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required" for=""><span>*</span>설명</label>
									<div class="control-wrapper">
										<textarea class="form-control p5-portfolio-description"
											cols="80" data-validation="required" id="p5-form-description"
											name="description" required="" rows="10"></textarea>
									</div>
									<span class="p5-portfolio-information"
										id="p5-form-description-information">한글 기준 5000자 미만</span>
								</div>
								<div
									class="form-group year-month-widget p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>참여 시작일</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="begin form-control p5-date-select"
											data-validation="required" id="p5-form-begin-year"
											name="participationBeginYear"><option
												selected="selected" value="">연</option></select><select
											class="form-control" data-validation="required"
											id="p5-form-begin-month" name="participationBeginMonth"><option
												selected="selected" value="">월</option>
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option></select>
									</div>
								</div>
								<div
									class="form-group year-month-widget p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>참여 종료일</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="form-control p5-date-select"
											data-validation="required" id="p5-form-end-year"
											name="participationEndYear"><option
												selected="selected" value="">연</option></select><select
											class="form-control" data-validation="required"
											id="p5-form-end-month" name="participationEndMonth"
											required=""><option selected="selected" value="">월</option>
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option></select>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>참여율</label>
									<div class="control-wrapper p5-participation-control-wrapper">
										<input class="form-control p5-portfolio-participation-rate"
											data-slider-max="100" data-slider-min="1"
											data-slider-selection="before" data-slider-step="1"
											id="p5-form-participation-rate" name="participationRate"
											required="" type="text" value="" /><span class="p5-percent">%</span>
									</div>
									<span class="p5-portfolio-information"
										id="p5-participation-rate-infomation">참여율은 1에서 100까지
										정수로 입력할 수 있습니다.</span>
								</div>
								<div class="process-guide-box" style="margin-left: 150px;">
									<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
										style="float: left" />
									<p class="process-guide-text" style="float: left">
										<strong>[포트폴리오 추가 가이드]</strong><br /> 포트폴리오 이미지는 <strong>가로
											632px</strong>로 변환되어 보여집니다.<br /> <strong>이미지 파일</strong>(.jpg, .jpeg,
										.png, .gif 등)만 업로드할 수 있습니다.<br /> <strong>파일 크기는 최대
											8MB까지 업로드가 가능합니다.</strong><br />
									</p>
									<div style="clear: both;"></div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">대표 이미지</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-1">이미지를
												등록해주세요.</span> 
												<span class="p5-custom-file-type-input-wrapper">
												<button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> 이미지 변경
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-1" name="image1" type="file" />
											<button class="btn btn-cancel p5-img-del-btn" type="button">삭제</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">한
										줄 설명</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img1-description" name="caption1" type="text" />
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption1-infomation">한글 기준 120자 미만</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">이미지</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-2">이미지를
												등록해주세요.</span> <span class="p5-custom-file-type-input-wrapper"><button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> 이미지 변경
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-2" name="image2" type="file" />
											<button class="btn btn-cancel p5-img-del-btn" type="button">삭제</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">한
										줄 설명</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img2-description" name="caption2" type="text" />
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption2-infomation">한글 기준 120자 미만</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">이미지</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-3">이미지를
												등록해주세요.</span> <span class="p5-custom-file-type-input-wrapper"><button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> 이미지 변경
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-3" name="image3" type="file" />
											<button class="btn btn-cancel p5-img-del-btn" type="button">삭제</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">한
										줄 설명</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img3-description" name="caption3" type="text" />
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption3-infomation">한글 기준 120자 미만</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">태그</label>
									<div class="control-wrapper p5-tag-form-wrapper">
										<ul class="p5-tag-form-unit-group">
											<li><input class="form-control portfolio_title"
												id="p5-form-tag-input" name="tagList" type="text" /></li>
										</ul>
									</div>
									<span class="p5-portfolio-information">다수의 관련 기술을 입력
										할때에는 쉼표(,)로 구분해 주세요. (최대 5개)<br />예) Photoshop, Android,
										HTML5, Python, Django
									</span>
								</div>
							</form>
							<span class="pull-right p5-portfolio-btn-group"><a
								class="btn btn-cancel p5-btn-left"
								href="/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/"
								id="p5-portfolio-cancel-btn">취소</a>
							<button class="btn btn-partners p5-submit-portfolio-btn">추가</button></span>
						</section>
						<div aria-hidden="true"
							class="modal p5-profile-delete-modal fade "
							id="p5-delete-portfolio-modal" role="alert" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header modal-header-delete">
										<h4 class="modal-title">이미지 업로드 중</h4>
									</div>
									<div class="modal-body">
										<p class="text-center bold-font">
											<img alt="loading" src="${pageContext.request.contextPath}/resources/static/img/ajax-loader.gif"
												style="width: 40px; height: 40px;" /><br />
											<br /> <span id="p5-modal-porfolio-title">이미지 작업 중입니다.</span><br />
											잠시만 기다려 주세요.
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
		<jsp:include page="../../../../footer.jsp" flush="false" />

	<script>
    $(document).ready( function() {
        var split = location.href.split('/');
        var slug = split[5];
        var portfolioTitle='';
        var tagCnt=0;



        //일정 구하는 부분
        var d = new Date();
        for(var i=0;i < 30; i++) {
            var temp = '<option value="'+(parseInt(d.getFullYear())-i)+'">'+
                    (parseInt(d.getFullYear())-i)+'년'+
                    '</option>';
            $('.p5-date-select').append(temp);
        }

        $('.content-inner').on('change','#p5-form-category', function() {
            getSubCategory(this);
        });


        //textarea 문자열 길이
        $('.content-inner').on('keyup','#p5-form-description', function(e) {
            if($(this).val().length > 5000) {
                $('#p5-form-description-information').css('color','#f33d12');
                setTimeout( function() {
                    $('#p5-form-description-information').css('color','#999');
                }, 600);
                $(this).val($(this).val().substr(0,5000));
            } else {
                $('#p5-form-description-information').css('color','#999');
            }
        });
        //tag text
        $('.content-inner').on('keyup', '#p5-form-tag-input', function(event) {


            if(event.which==188||event.which==32) {
                if($('.p5-tag-form-unit-group').children().length < 6) {
                    var valid = true;

                    //30자 넘어가는지 검사
                    if($(this).val().length > 30 ) {
                        valid = false;
                        $(this).val("");
                    }

                    //중복문자 검사
                    for(var i=0;i < $('.p5-tag-form-unit-group').children().length; i++) {
                        if($('.p5-tag-form-unit-val').eq(i).text().trim() === $(this).val().replace(',','').trim()) {
                            //중복된 태그 백그라운드 색 잠시 바꿈
                            var temp = $('.p5-tag-form-unit-val').eq(i).parent();
                            temp.css('background-color','#fffc9a');
                            setTimeout( function() {
                                temp.css('background-color','#fff');
                            }, 700);
                            valid = false;
                            break;
                        }
                    }

                    if(valid == true) {
                        var tag = '<li><div class="p5-tag-form-unit"><span class="p5-tag-form-unit-val">'+$(this).val().replace(',','')+'</span><a href="#" class="p5-form-tag-delete-btn">x</a></div><input type="hidden" name="tagList" value="'+$(this).val().replace(',','')+'"></li>';
                        tag += '<li><input id="p5-form-tag-input" class="form-control portfolio_title" name="title" type="text"></li>';
                        tagCnt++;
                        $(this).parent().remove();
                        $('.p5-tag-form-unit-group').append(tag);

                        $('#p5-form-tag-input').focus();

                    }
                }

            }
        });

        $('.content-inner').on('keydown', '#p5-form-tag-input', function(event) {
            if(event.which==8&&$(this).val()==""&&tagCnt!=0) {//backspace
                $('.p5-tag-form-unit-group li:nth-child('+tagCnt+')').remove();
                tagCnt--;
            }
        });

        //tag delete btn
        $('.content-inner').on('click','.p5-form-tag-delete-btn', function(e) {
            e.preventDefault();
            $(this).parent().parent().remove();
        });

        //img delete btn
        $('.content-inner').on('click','.p5-img-del-btn',function() {

            if($(this).siblings('input').attr('name')=='image1') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;이미지 변경</button>'+
                        '<input id="p5-file-btn-1" type="file" name="image1" class="p5-custom-file-type-input" accept="image/*">'+
                        '<button type="button" class="btn btn-cancel p5-img-del-btn">삭제</button>';
                $('#p5-img1-description').attr('disabled',true);
                $('#p5-img1-description').val('');
                $('#p5-image-name-1').html('이미지를 등록해주세요.');
                $('#p5-file-btn-1').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image2') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;이미지 변경</button>'+
                        '<input id="p5-file-btn-2" type="file" name="image2" class="p5-custom-file-type-input" accept="image/*">'+
                        '<button type="button" class="btn btn-cancel p5-img-del-btn">삭제</button>';

                $('#p5-img2-description').attr('disabled',true);
                $('#p5-img2-description').val('');
                $('#p5-image-name-2').html('이미지를 등록해주세요.');
                $('#p5-file-btn-2').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image3') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;이미지 변경</button>'+
                        '<input id="p5-file-btn-3" type="file" name="image3" class="p5-custom-file-type-input" accept="image/*">'+
                        '<button type="button" class="btn btn-cancel p5-img-del-btn">삭제</button>';
                $('#p5-img3-description').attr('disabled',true);
                $('#p5-img3-description').val('');
                $('#p5-image-name-3').html('이미지를 등록해주세요.');
                $('#p5-file-btn-3').parent().html(imgAssignTag);
            }

            $(this).siblings('input').val("");
            $(this).parent().siblings('.p5-img-name').html("이미지를 등록해주세요.");
        });

        //이미지 선택 버튼들
        $('.content-inner').on('change','#p5-file-btn-1', function() {
            if($('#p5-file-btn-1').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-1').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-1');
                $('#p5-img1-description').attr('disabled',false); //캡션 해제


            }
        });

        $('.content-inner').on('change','#p5-file-btn-2', function() {
            if($('#p5-file-btn-2').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-2').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-2');
                $('#p5-img2-description').attr('disabled',false); //캡션 해제

            }
        });

        $('.content-inner').on('change','#p5-file-btn-3', function() {
            if($('#p5-file-btn-3').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-3').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-3');
                $('#p5-img3-description').attr('disabled',false); //캡션 해제

            }
        });
        //참여율 에러 체크
        $('.content-inner').on('keyup','#p5-form-participation-rate', function() {
            var temp = $('#p5-form-participation-rate').val();

            if(temp <= 100 && temp >= 1 && parseInt(temp) == temp) {
                $('#p5-participation-rate-infomation').css('color', '#555');
            } else {
                $('#p5-participation-rate-infomation').css('color', 'red');
            }
        });

        //이미지 캡션 에러 체크
        $('.content-inner').on('keyup','#p5-img1-description', function() {
            var temp = $('#p5-img1-description').val().length;

            if(temp <= 119) {
                $('#p5-caption1-infomation').css('color', '#555');
            } else {
                $('#p5-caption1-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption1-infomation').css('color','#999');
                }, 600);
                $('#p5-img1-description').val($('#p5-img1-description').val().substr(0,119));
            }
        });


        $('.content-inner').on('keyup','#p5-img2-description', function() {
            var temp = $('#p5-img2-description').val().length;

            if(temp <= 119) {
                $('#p5-caption2-infomation').css('color', '#555');
            } else {
                $('#p5-caption2-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption2-infomation').css('color','#999');
                }, 600);
                $('#p5-img2-description').val($('#p5-img2-description').val().substr(0,119));
            }
        });

        $('.content-inner').on('keyup','#p5-img3-description', function() {
            var temp = $('#p5-img3-description').val().length;

            if(temp <= 119) {
                $('#p5-caption3-infomation').css('color', '#555');
            } else {
                $('#p5-caption3-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption3-infomation').css('color','#999');
                }, 600);
                $('#p5-img3-description').val($('#p5-img3-description').val().substr(0,119));
            }
        });

        $('.content-inner').on('click','.p5-submit-portfolio-btn', function(e) {
            e.preventDefault();

            var particiPationValid = $('#p5-form-participation-rate').val();
            var img1DescriptionValid = $('#p5-img1-description').val().length;
            var img2DescriptionValid = $('#p5-img2-description').val().length;
            var img3DescriptionValid = $('#p5-img3-description').val().length;
            
            var file1 = $("#p5-file-btn-1")[0].files[0];
            var file2 = $("#p5-file-btn-2")[0].files[0];
            var file3 = $("#p5-file-btn-3")[0].files[0];
			
            if(file1 != null)
           	{
	            if(file1.fileSize > 8*1024*1024)
	           	{
	        		$('#p5-file-btn-1').parent().parent().parent().parent().addClass('has-error');
	                $('#p5-file-btn-1').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의 용량은 최대 8MB입니다.</span>');
	           	}
	            
	            if(file1.name.length > 30)
            	{
	            	$('#p5-file-btn-1').parent().parent().parent().parent().addClass('has-error');
	                $('#p5-file-btn-1').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의명은 최대 30자입니다.</span>');
            	}
           	}
            if(file2 != null)
           	{
	           if(file2.fileSize > 8*1024*1024)
	          	{
	       		$('#p5-file-btn-2').parent().parent().parent().parent().addClass('has-error');
	               $('#p5-file-btn-2').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의 용량은 최대 8MB입니다.</span>');
	          	}
	            
	            if(file2.name.length > 30)
           		{
	            	$('#p5-file-btn-2').parent().parent().parent().parent().addClass('has-error');
	                $('#p5-file-btn-2').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의명은 최대 30자입니다.</span>');
           		}
           	}
            if(file3 != null)
           	{
	            if(file3.fileSize > 8*1024*1024)
	           	{
	        		$('#p5-file-btn-3').parent().parent().parent().parent().addClass('has-error');
	                $('#p5-file-btn-3').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의 용량은 최대 8MB입니다.</span>');
	           	}
	            if(file3.name.length > 30)
           		{
	            	$('#p5-file-btn-3').parent().parent().parent().parent().addClass('has-error');
	                $('#p5-file-btn-3').parent().parent().parent().parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>이미지의명은 최대 30자입니다.</span>');
           		}
           	}
            var validation = true;

            //var fd = new FormData();
            var tagList= [];
            //tagList check
            if(notInValue('p5-form-title')) {
                validation = false;
            }
            if(notInValue('p5-form-category')) {
                validation = false;
            }
            if(notInValue('p5-form-subcategory')) {
                validation = false;
            }
            if(notInValue('p5-form-description')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-year')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-month')) {
                validation = false;
            }
            if(notInValue('p5-form-end-year')) {
                validation = false;
            }
            if(notInValue('p5-form-end-month')) {
                validation = false;
            }
            if(notInValue('p5-form-participation-rate')) {
                validation = false;
            }
            if(parseInt($('#p5-form-begin-year').val()) === parseInt($('#p5-form-end-year').val())){
                if(parseInt($('#p5-form-begin-month').val()) > parseInt($('#p5-form-end-month').val())){

                    $('#p5-form-begin-year').parent().addClass('has-error');
                    $('#p5-form-begin-month').parent().addClass('has-error');
                    $('#p5-form-end-year').parent().addClass('has-error');
                    $('#p5-form-end-month').parent().addClass('has-error');
                    
                    $('#p5-form-end-month').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>시작일자와 종료일자를 올바르게 선택해주세요.</span>');

                    
                    validation = false;
                }
            }


            if(parseInt($('#p5-form-begin-year').val()) > parseInt($('#p5-form-end-year').val())) {

                $('#p5-form-begin-year').parent().addClass('has-error');
                $('#p5-form-begin-month').parent().addClass('has-error');
                $('#p5-form-end-year').parent().addClass('has-error');
                $('#p5-form-end-month').parent().addClass('has-error');
                
                $('#p5-form-end-month').parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i>시작일자와 종료일자를 올바르게 선택해주세요.</span>');

                
                validation = false;
            }

            if(particiPationValid > 100 || particiPationValid < 1 || parseInt(particiPationValid) != particiPationValid) {
                validation = false;
            }

            if(img1DescriptionValid >= 120) {
                validation = false;
            }

            if(img2DescriptionValid >= 120) {
                validation = false;
            }

            if(img3DescriptionValid >= 120) {
                validation = false;
            }

            if(validation == false) {

                return 0;
            }

            if(show_modal()){
                $('input[name="slug"]').val(slug);
                $('input[name="dataId"]').val(0);
                $('input[name="isImage1Changed"]').val(1);
                $('input[name="isImage2Changed"]').val(1);
                $('input[name="isImage3Changed"]').val(1);
                $('#p5-form-tag-input').remove();
                
      		  var formData = new FormData($('#p5-fix-portfolio-form')[0]);

      		$.ajax({
    		    type: "POST",
    		    url: "/wjm/partners/p/<%=this_account.getId() %>/portfolio/update/add/",
    		    data: formData,  // 폼데이터 직렬화
    		    async: false,
    		    cache: false,
    		    contentType: false,
    		    processData: false,
    		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
    		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
    		        var messages = data.messages;

    			    if(messages == "success")
    	        	{
    			    	location.href="/wjm/partners/p/<%=account.getId()%>/portfolio/update"; 
    	        	}
    			    else if(messages == "error")
    			    	{
    			    	location.href="/wjm/partners/p/<%=account.getId()%>/portfolio"; 
    			    	}
    			    else
    	        	{
    				$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");

			    	$('#p5-delete-portfolio-modal').modal('hide');
    	        	}
            
    		    },
    		    error: function(jqXHR, textStatus, errorThrown) {
    		        //에러코드
    		        alert('에러가 발생했습니다.');
    		    }
    		});            }
        });
    });

    function getSubCategory(dom) {
        var temp='';

        if($(dom).val()=='개발') { //개발
            temp = '<option selected="selected" value="">세부 카테고리</option>' +
            '<option value="웹">웹</option>'+
            '<option value="애플리케이션">애플리케이션</option>'+
            '<option value="워드프레스">워드프레스</option>'+
            '<option value="퍼블리싱">퍼블리싱</option>'+
            '<option value="일반소프트웨어">일반 소프트웨어</option>'+
            '<option value="커머스&쇼핑몰">커머스, 쇼핑몰</option>'+
            '<option value="게임">게임</option>'+
            '<option value="임베디드">임베디드</option>'+
            '<option value="기타">기타</option>';

            $('#p5-form-subcategory').html(temp);
        } else if($(dom).val()=='디자인') {//디자인
            temp = '<option selected="selected" value="">세부 카테고리</option>' +
            '<option value="웹">웹</option>'+
            '<option value="애플리케이션">애플리케이션</option>'+
            '<option value="제품">제품</option>'+
            '<option value="프레젠테이션">프레젠테이션</option>'+
            '<option value="인쇄물">인쇄물</option>'+
            '<option value="커머스&쇼핑몰">커머스, 쇼핑몰</option>'+
            '<option value="로고">로고</option>'+
            '<option value="그래픽">그래픽</option>'+
            '<option value="영상">영상</option>'+
            '<option value="게임">게임</option>'+
            '<option value="기타">기타</option>';
            $('#p5-form-subcategory').html(temp);
        } else { //선택 제대로 안됐을 때
            temp = '<option selected="selected" value="">세부 카테고리</option>'
            $('#p5-form-subcategory').html(temp);
        }

    }

    function notInValue(formID) {
        if($('#'+formID).val()==""||$('#'+formID).val()==null||$('#'+formID).val()==undefined) {

            $('#'+formID).parent().addClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).addClass('error');
            $('#'+formID).parent().children('.form-error').remove();
            $('#'+formID).parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            return true;
        } else {
            $('#'+formID).parent().removeClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).removeClass('error');
            $('#'+formID).parent().children('.form-error').remove();
            return false;
        }
    }

    function show_modal(){
        $('#p5-delete-portfolio-modal').css('opacity', '1.0');
        $('#p5-delete-portfolio-modal').css('display', 'inherit');
        return true;
    }
</script>

</body>
</html>