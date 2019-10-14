<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%
	String path = request.getContextPath();
	pageContext.setAttribute("path", path);
%>


<%@ include file="includes/head.jsp"%>
<title>Page Template | moim@</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Tables | Nifty - Admin Template</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">


        
    <!--DataTables [ OPTIONAL ]-->
    <link href="plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="plugins/datatables/extensions/Responsive/css/dataTables.responsive.css" rel="stylesheet">
    
    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>


    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery-2.2.4.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>

    <!--=================================================-->
    
    <!--Demo script [ DEMONSTRATION ]-->
    <script src="js/demo/nifty-demo.min.js"></script>

    
    <!--DataTables [ OPTIONAL ]-->
    <script src="plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script src="plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>


    <!--DataTables Sample [ SAMPLE ]-->
    <script src="js/demo/tables-datatables.js"></script>

</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp"%>
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
					<h1 class="page-header text-overflow">게시판</h1>
					 <!--Searchbox-->
                    
				</div>

				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<!-- #################################### -->
				<!-- #### WRITE CODE BELOW THIS LINE #### -->
				<!-- #################################### -->
				<div class="panel">
					    <div class="panel-heading">
					    <h3 class="panel-title">환영합니다</h3>
					    </div>
					
					    <div class="panel-body">
					        <table id="demo-dt-addrow" class="table table-striped table-bordered" cellspacing="0" width="100%">
					            <thead>
					                <tr>
					                    <th>게시글번호</th>
					                    <th>제목</th>
					                    <th class="min-tablet">작성자</th>
					                    <th class="min-tablet">조회수</th>
					                    <th class="min-desktop">최근등록일</th>
					                   
					                </tr>
					            </thead>
					            <tbody>
					                <tr>
					                <form action="boardmodify?postId=${list.postId}" method="post">
					                <input type="hidden" id="tmemId" name="tmemId" value="${list.tmemId}">
					                <input type="hidden" name="brdId" value="${list.brdId}">
					                 <input type="hidden" name="cmtEmail" value="${list.cmtEmail}">
					                   <input type="hidden" id="postId" name="postId" value="${list.postId}">
					                   	<td>${list.postId}</td>					                   	
					                    <td>${list.postTitle}</td>			                    
					                    <td>${list.postNickname}</td>
					                    <td>${list.postHit}</td>
					                    <td>${list.postRegdate}</td>				                 
				                </tr>		          
				                <tr>
				                </tr>
					                
					            </tbody>
					        
					        	

							<input type="submit" value="수정"> &nbsp;&nbsp; <a href="boardlist">목록보기</a> &nbsp;&nbsp;
							 <a href="deleteboard?postId=${list.postId}&tmemId=${list.tmemId}">삭제</a>
								</form>
								</table>
								<p>
									<br>
									
								</p>
								<p>
									<br>
									
								</p>
								<p>
									<br>
									
								</p>
								<p>
									<br>
									
								</p>
								
								
								<div class="tbody m-tcol-c" id="tbody">
								<p> ${list.postContent}</p>
<!-- 								</div>		   -->
					    </div>
					  		  <p>
					  		 		 <br>
									<br>
									<br>
								</p>
								<p>
									<br>
									<br>
									<br>
								</p>
								<p>
									<br>	
									<br>
									<br>
								</p>
								<p>
									<br>
									<br>
									<br>
								</p>
								<p>
									<br>
									<br>
									<br>
								</p>
								<div style="background:DarkGray;opacity:0.4;display: block;
								"class="box-reply2 bg-color u_cbox">
								
								 		
								
								<form style="font-weight: bold;font-size:1.1em;color: black;"action="reply?postId=${list.postId}" method="post">
								<c:forEach items="${list2}" var="post">
								<input type="hidden" name="brdId" value="${list.brdId}">
								<input type="hidden" id="cmtId" name="cmtId" value="${post.cmtId}">
							
														
							
								
								
								
								<p align="right">
 								 <a href="replymodify?cmtId=${post.cmtId}">수정</a>
 								 
								 <%-- <a href="replydelete?cmtId=${post.cmtId}&tmemId=${list.tmemId}">삭제</a> --%>
								<a id="deleteComment" href="javascript:fn_deleteReply(${post.cmtId});">삭제</a>
								<!-- <a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';
 -->


								</p>
<!-- 							 
https://freehoon.tistory.com/121 댓글 수정 삭제 ajax 참고사이트-->
<!-- 										다른사람 댓글 작성시간 닉네임 뿌려줘야함		
					댓글 수정하는 뷰를 보여줘야함
						 -->					
								
								<p>							
								<span id="removeCmt_${post.cmtId}">
								${post.cmtNickname}
								<td>
								${post.cmtRegdate}
								</td>
								<br>
								${post.cmtContent}
								
<!-- 								다른사람댓글뿌려주는곳 -->
								</span>
								
								</p>
								</c:forEach>
								<table cellspacing="0">
								<tbody>
								<tr>
								<td>
								
								<div>
								
								<textarea cols="50" rows="2" maxlength="6000" style="overflow:hidden; line-height: 14px;
								height: 41px; resize: none; title="댓글입력" name="cmtContent">
								</textarea>
								
								
								</div>
								
								
								<td>
								 <button type="submit" width="60" class="btn btn-lg btn-default">등록</button>
								</td>
								</form>
								</tbody>
								
								
								</table>
								
							
								</div>
								  
				  
					</div>

				
					
					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				
				<!--===================================================-->
				<!--End page content-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->



		</div>
		<!-- END BOXED -->

		<!-- FOOTER -->
		<%@ include file="includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->


</body>

<script type="text/javascript">
	function fn_deleteReply(cmtId){	
	 	
		//1. id로 값을 받거나, 2.class  ,3.name으로 값을 받거나 
		//1. $('#태그의 아이디')  2. $('.클래스의 이름')  3. $('태그[name=이름]')
		
//  		var cmt = $('#cmtId').val();
		
//   	 	var paramData = {	"cmtId"  : String(cmt),
//  							"tmemId" : String($('#tmemId').val()),
//  							"postId" : String($('#postId').val())

//  						}; 	 
// 		var paramData = {"cmtId":cmtId};

//  		$.ajax({			
//  				url: "replydelete"
<%-- <%--  			url: "<%=path%>/replydelete"  --%> 
//  			, data : paramData
//  			, type : 'POST'	
// 			, dataType : 'text'	
//  			, success: function(result){
//  				alert($('#cmtId').val());
 				
//  				$('#content').val('');

//  				console.log("성공  fn_deleteReply");
//  				$("#removeCmt"+cmtId).remove();
//  				alert("삭제되었습니다.");
//  				//showList();	
				
//  			}
	
//  			, error: function(error){	
//  				console.log("에러 : " + error);
	
//  			}	
//  		})
	
 		
	 	$.ajax({
	 		url: "replydelete",
	 		type:"post",
	 		data:{"cmtId":cmtId},
	 		success:function(result){
			
 				$("#removeCmt_"+cmtId).remove();
 				alert("삭제되었습니다.");
	 		}			
	 	});
 	}	
</script>



</html>