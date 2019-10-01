<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

	<!-- HEAD -->
	<%@ include file="../includes/head.jsp" %>
	<title>Login Page</title>
	<style>
		#container{
			border : 1px solid block;
		}
	
	</style>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
	<%-- 	<%@ include file="../includes/header-navbar.jsp" %> --%>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
		<%-- 	<%@ include file="../includes/main-nav.jsp" %> --%>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">Login</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
				<div id="page-content">
					<div id="container"
						class="effect aside-float aside-bright mainnav-lg">
						<div id="bg-overlay"></div>
						<div class="cls-content">
							<div class="cls-content-sm panel">
								<div class="panel-body">
									<div class="mar-ver pad-btm">
										<h3 class="h4 mar-no">Account Login</h3>
										<p class="text-muted">Sign In to your account</p>
									</div>
									<form id="loginForm" action="login" method="post">
										<div class="form-group">
											<input type="text" id="memEmail" name="memEmail"
												class="form-control" placeholder="아이디 입력" autofocus>
										</div>
										<div class="form-group">
											<input type="password" id="memPassword" name="memPassword"
												class="form-control" placeholder="패스워드 입력">
										</div>
										<div class="checkbox pad-btm text-left">
											<input id="demo-form-checkbox" class="magic-checkbox"
												type="checkbox"> <label for="demo-form-checkbox">ID 기억하기</label>
										</div>
										<button class="btn btn-primary btn-lg btn-block" type="button"
											onclick="checkValue();">Sign In</button>
									</form>
								</div>

								<div class="pad-all">
									<a href="/auth/findPwd" class="btn-link mar-rgt">비밀번호 찾기</a> <a
										href="/auth/join" class="btn-link mar-lft">회원가입</a>

									<div class="media pad-top bord-top">
										<div class="pull-right">
											<a href="#" class="pad-rgt"><i
												class="demo-psi-facebook icon-lg text-primary"></i></a> <a
												href="#" class="pad-rgt"><i
												class="demo-psi-twitter icon-lg text-info"></i></a> <a href="#"
												class="pad-rgt"><i
												class="demo-psi-google-plus icon-lg text-danger"></i></a>
										</div>
										<div class="media-body text-left">Login with</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!--===================================================-->
                <!--End page content-->
            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="../includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	
	<script>
	
	$(document).ready(function(){

	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("userInputId");
	    if(key != null && key != ""){
	    	$('#memEmail').val(key)
	    	$("#demo-form-checkbox").prop("checked", true); /* by ID */
	    }
	});
	
	
	// 유효성 체크후 전송
	function checkValue(){
		let id=""
		// id의 체크
		// 1. id필드의 값을 갖고온다
		let memEmail = $('#memEmail').val();
		
		// 2. 공백 체크
		if ($('#memEmail').val() == null || $('#memEmail').val() == '') {
			alert('이메일아이디 항목을 확인해주세요');
			$('#memEmail').focus();
			return;
		}
		// 3. 길이체크
		if(memEmail.length < 8 || memEmail.length > 30) {
			alert('아이디는 최소 8자이상 30자 미만입니다');
			$('#memEmail').focus();
			return;
		}
	
		// 4. 이메일 형식체크	
		//정규식...isEmail=>email형식이 맞는지 확인
   		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        
   	  	if (!isEmail.test(memEmail)) {
          alert("이메일 주소 형식 다시 확인해주세요.");
          $('#memEmail').focus();
          return;
      	}
   	  	
   	  	//비밀번호 체크
   	  	//1. 비밀번호 값을 가져온다
   	  	let memPassword = $('#memPassword').val();
   	  	
   	  	// 2. 공백 체크
		if ($('#memPassword').val() == null || $('#memPassword').val() == '') {
			alert('비밀번호 항목을 확인해주세요');
			$('#memPassword').focus();
			return;
		}
		// 3. 길이체크
		if(memPassword.length < 3 || memPassword.length > 15) {
			alert('비밀번호 최소 3자이상 15자 미만입니다');
			$('#memPassword').focus();
			return;
		}
		
		// 아이디 저장
		if($("#demo-form-checkbox").is(":checked")){
	        setCookie("userInputId", memEmail, 7); // 7일 동안 쿠키 보관
	    }else{
	    	deleteCookie("userInputId", "", 7); // 쿠키삭제
	    }
		
		// 전송
		$('#loginForm').submit();
	}
	
	// 쿠키 관련 (나중에 공통 js로 통합해서 쓸 예정)
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	</script>
</body>
</html>