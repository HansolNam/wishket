<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 프로젝트 찾기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
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
	
	<link
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"
		rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class=" project-list">
	<div id="wrap">
	<jsp:include page="header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 찾기 <small class="small-text"><span
							id="total_list_num">${project_num}개의 프로젝트가 있습니다.</span></small>
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
	<jsp:include page="footer.jsp" flush="false" />
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/jStorage.js"></script>
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
        var loading = "<section class='no-result'><div class='no-result-img'><img src='${pageContext.request.contextPath}/resources/static/img/icon_loading.png' alt='검색'/></div><p>로딩 중입니다.</p></section>";
        $("#project-list-box").html(loading);
        $.ajax({
            url: '/wjm/project_ajax',
	        type: "get",
			data : 
			{
				page : page,
				q : q,
				sort : sort,
				cat_dev : cat_dev,
				cat_design : cat_design,
				addr : addr
			},
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
</body>
</html>