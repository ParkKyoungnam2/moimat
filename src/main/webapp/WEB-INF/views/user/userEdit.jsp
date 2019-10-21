<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>

<!--Dropzone [ OPTIONAL ]-->
<script src="/resources/plugins/dropzone/dropzone.min.js"></script>

<!--Select2 [ OPTIONAL ]-->
<link href="/resources/plugins/select2/css/select2.min.css"
	rel="stylesheet">

<!--Select2 [ OPTIONAL ]-->
<script src="/resources/plugins/select2/js/select2.min.js"></script>

<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp"%>
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
					<h1 class="page-header text-overflow">마이페이지</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">회원정보수정</h3>
						</div>

						<!-- BASIC FORM ELEMENTS -->
						<div class="form-group"></div>
						<!--===================================================-->

						<!-- 사진  -->
						<div class="panel-body form-horizontal form-padding">
							<div class="form-group">
								<label class="col-md-3 control-label">사진</label>
								<div class="col-md-9">
									<img id="memPhoto"
										src="https://picsum.photos/seed/picsum/200/200" alt="샘플사진" />
								</div>
								<div class="bord-top pad-ver"
									style="border-top: none; text-align: left; padding: 6px 12px;">
									<!-- The fileinput-button span is used to style the file input field as button -->
									<span class="btn btn-success fileinput-button clickable">
										<i class="fa fa-plus"></i> <span>사진선택</span>
									</span>
								</div>
								<div id="previews"
									style="border-top: none; text-align: left; padding: 6px 12px;">
									<div id="template" class="pad-top bord-top">
										<div class="media">
											<div class="media-body">
												<!--This is used as the file preview template-->
												<div class="media-block">
													<div class="media-left">
														<img class="img" data-dz-thumbnail>
													</div>


													<div class="media-body">
														<p class="text-main text-bold mar-no text-overflow"
															data-dz-name></p>
														<span class="error text-danger text-sm"
															data-dz-errormessage></span>
														<p class="text-sm" data-dz-size></p>

														<!-- progress 바 -->
														<div id="total-progress" style="opacity: 0">
															<div class="progress progress-xs active"
																role="progressbar" aria-valuemin="0" aria-valuemax="100"
																aria-valuenow="0">
																<div class="progress-bar progress-bar-success"
																	style="width: 0%;" data-dz-uploadprogress></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 버튼 -->
										<div class="media-right">
											<button class="btn btn-primary start" style="display: none">
												<i class="glyphicon glyphicon-upload"></i> <span>Start</span>
											</button>
										</div>
										<div class="media-right">
											<button data-dz-remove class="btn btn-xs btn-danger cancel">
												<i class="demo-pli-cross"></i>
											</button>
										</div>
										<div class="media-right">
											<button data-dz-remove class="btn btn-danger delete"
												style="display: none">
												<i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<form class="panel-body form-horizontal form-padding"
							action="/mypage/edit" method="post" enctype="multipart/form-data"
							id="userForm">

							<!--닉네임-->
							<div class="form-group">
								<label class="col-lg-3 control-label">이름(별명)*</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" name="memNickname"
										placeholder="이름(별명)">
								</div>
							</div>

							<!--Email Input-->
							<div class="form-group">
								<label class="col-lg-3 control-label">이메일*</label>
								<div class="col-lg-7">
									<input type="email" class="form-control" name="memEmail"
										placeholder="이메일 주소">
								</div>
							</div>



							<!-- 신규 비밀번호 확인 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">비밀번호*</label>
								<div class="col-lg-7">
									<input type="password" class="form-control" name="memPassword"
										placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">비밀번호 확인*</label>
								<div class="col-lg-7">
									<input type="password" class="form-control"
										name="confirmPassword" placeholder="비밀번호">
								</div>
							</div>

							<!--생일-->
							<div class="form-group">
								<label class="col-lg-3 control-label">생년월일*</label>
								<div class="col-lg-7">
									<input type="text" placeholder="주민번호 앞자리 (YYMMDD)"
										name="memBirthday" class="form-control">
								</div>
							</div>

							<!-- 성별 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">성별*</label>
								<div class="col-lg-7">
									<div class="radio">
										<!-- Inline radio buttons -->
										<input id="demo-inline-form-radio"
											class="form-control magic-radio" type="radio"
											name="memGender" value="M" checked> <label
											for="demo-inline-form-radio">남</label> <input
											id="demo-inline-form-radio-2"
											class="form-control magic-radio" type="radio"
											name="memGender" value="F"> <label
											for="demo-inline-form-radio-2">여</label>
									</div>
								</div>
							</div>

							<!-- 지역 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">활동지역*</label>
								<div class="col-lg-7">
									<select id="select2-placeholder" class="form-control"
										name="areaRegionKey">
										<c:forEach items="${ areas }" var="area">
											<c:choose>
												<c:when test="${ area.areaKey eq 'O000' }">
													<option value="${ area.areaKey }">${ area.areaRegionName }</option>
												</c:when>
												<c:otherwise>
													<option value="${ area.areaRegionKey }">${ area.areaName }
														${ area.areaRegionName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<!-- 간단 소개글 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">소개글</label>
								<div class="col-lg-7">
									<textarea class="form-control" name="memContent" rows="5"
										placeholder="간단한 소개글을 적어보세요."></textarea>
								</div>
							</div>
							<!-- 관심사-->
							<div class="form-group">
								<label class="col-lg-3 control-label">관심사 선택*</label>
								<div class="col-lg-7">
									<select id="select2-multiple-selects" multiple="multiple"
										class="form-control" name="intKey">
										<c:forEach items="${ interest }" var="item">
											<c:choose>
												<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
													<option value="${ item.intKey }">${ item.intName }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>


							<div class="panel-footer text-right">
								<button class="btn btn-success" type="button"
									onclick="checkAndsubmit();">수정완료</button>
							</div>
						</form>
						<!--===================================================-->
						<!-- END BASIC FORM ELEMENTS -->
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
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	
<script>
$(document).ready(function(){  //onload 함수
	getCodeList();
	getMyInfo();
	
	$('#newPassword').blur(newPasswordCheck);		// 이벤트등록 (신규비밀 번호)
	$('#newPasswordCheck').blur(rePasswordCheck);	// 이벤트등록 (비밀번호 다시 입력확인)
});

function checkAndsubmit(){
	// 정규식(길이,패턴) 체크 ~ 이것도 나중에
	// 1) 생일 유효성 체크(길이, 숫자만)
	let intKeys = $('#intKey').val();
	if(intKeys.length != 3) {alert("관심사는 3개를 선택하셔야 합니다"); return;}
	$('#memInt1').val(intKeys[0]);
	$('#memInt2').val(intKeys[1]);
	$('#memInt3').val(intKeys[2]);
	// 전송
	if (confirm("회원정보를 수정하시겠습니까?")) {	
		$('#userForm').submit() 				// 개인정보 수정
	}	
}

// 신규 패스워드 검사
function newPasswordCheck(){
	if(nul_chk($('#newPassword'), 8,15)){	// 빈문자,길이체크:  nul_chk("검사할 객체, 최소길이, 최대길이") 리턴 true and false
		$('#passMsg').text("신규 패스워드는 8자이상 15자 미만입니다").css('color','red');
		return true;
	}else{
		$('#passMsg').text("");
		return false;
	}
}
//신규 패스워드 확인 검사
function rePasswordCheck(){
	 let newPassword = $('#newPassword').val()
	 let rePassword = $('#newPasswordCheck').val()
	 
	 if(newPasswordCheck()){ return false; }
	 
	 if(newPassword != rePassword){
		 $('#passMsg').text("신규 비밀번호가 일치하지 않습니다.").css('color','red');
		 return true;
	 }else{
		 $('#passMsg').text("");
	 }
}
// TODO: 메서드 전체적으로 고쳐야함
//			- required upload url.
/***** FILE UPLOAD USING DROPZONE.JS *****/
var previewNode = document.querySelector("#template");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);
var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
  url: "/mypage/photoUpload", // Set the url
  thumbnailWidth: 80,
  thumbnailHeight: 80,
  parallelUploads: 20,
  previewTemplate: previewTemplate,
  autoQueue: false, // Make sure the files aren't queued until manually added
  previewsContainer: "#previews", // Define the container to display the previews
  clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
  maxFiles: 1,
  acceptedFiles: "image/jpeg,image/png,image/gif",
  dictMaxFilesExceeded: '프로필 사진은 한장만 가능합니다.'	
});
myDropzone.on("addedfile", function(file) {
  // Hookup the start button
 
  file.previewElement.querySelector(".start").onclick = function() {  myDropzone.enqueueFile(file); };
});
// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
  document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
});
myDropzone.on("sending", function(file) {
	
  // Show the total progress bar when upload starts
  document.querySelector("#total-progress").style.opacity = "1";
  // And disable the start button
  //file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
});
// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
  document.querySelector("#total-progress").style.opacity = "0";
});
/***** END FILE UPLOAD *****/
// SELECTBOX 검색기능
$('#areaId').select2({
	width: '100%'
}).ready(function() {
	$('#areaId').css({'padding-left': '12px', 'text-align': 'left'});
});
//SELECTBOX 멀티 검색기능
$('#intKey').select2({
   	width: '100%',
  	placeholder: '찾아보기',
  	maximumSelectionLength : 3
});
//ajax 호출 코드
function callAjax(data, url, error) {
	let resultData = null;
	$.ajax({
		type : "POST",
		url : url,
		data : data,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		success : function(data, status, xhr) {
			console.log(data);
			resultData = data;
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(error);
		}
	</script>
</body>
</html>