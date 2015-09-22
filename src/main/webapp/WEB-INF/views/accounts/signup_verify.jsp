<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />

<title>외주몬(WJM) · 이메일 인증</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="./resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="./resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
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
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class=" account login">
	<div id="wrap">
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						이메일 인증 <small class="small-text">등록하신 이메일로 인증 코드를 발송하였습니다. 인증 코드를 입력해야만 가입이 완료됩니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<section class="login-body">
					<form action="/wjm/accounts/signup_verify/" class="form-horizontal"
						id="login-form" method="post">
						<input name="csrfmiddlewaretoken" type="hidden"
							value="6uNyCofkYxLTSsxGWtCuwuZEL7X1bTPR" />
						<div class="form-group " id="verification_div">
							<label class="control-label required" for="verification"><span>*</span>
								인증코드</label>
							<div class="control-wrapper">
								<input autocomplete="off" class="required form-control"
									id="verification" maxlength="75" name="verification"
									type="text" />
							</div>
						</div>
						<div class="form-group ">
							<div class="checkbox-wrapper">
								<div class="checkbox"
									style="padding-top: 0px; min-height: 20px;">
									<label class="" for="reverify_btn">
									<input class="btn btn-default" id="reverify_btn"
								style="float: right" type="button" value="인증번호 다시 받기"></input>
						
										</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-block-wrapper">
								<!-- <input name="next" type="hidden" value="/project/add/" /> -->
								<button class="btn btn-wishket btn-lg btn-block"  type="submit">회원가입 인증</button>
								
							</div>
						</div>
					</form>
					</section>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../footer.jsp" flush="false" />
	
	<script type="text/javascript">
	$(document).ready(function(){
		var messages = "${messages}";

		if(messages != null && messages != "")
			$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
		
		$('.content-inner').on('click', '#reverify_btn', function(){
			reverify();
	    });
		
	});
	
	function reverify()
	{
		var options = "";
		
		$.ajax({
		    type: "POST",
		    url: "/wjm/accounts/reverify", // 폼데이터 직렬화
		    data: options, // 폼데이터 직렬화
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        var messages = data.messages;
		    
		    	if(messages == "success")
		    		{
		    		alert('인증코드를 재 발송했습니다.');
					$("#messages").html("<div class='alert alert-success fade in'>인증 코드를 재전송했습니다.</div>");
		    		}
		    	else
		    		{
		    		alert('인증코드를 재 발송에 실패했습니다.');
					$("#messages").html("<div class='alert alert-warning fade in'>인증 코드를 재전송에 실패했습니다.</div>");
		    		}

		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        //에러코드
		        alert('에러가 발생했습니다.');
		    }
		});
	}
	</script>
	

</body>
</html>