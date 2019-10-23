<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>사진첩 - ${ group.teamName } | moim@</title>
	
	<style>
		@media screen and (max-width: 768px) {
			.tab-base > ul {
				display: none;
			}
			
			.tab-base > .btn-group {
				display: inline-block;
			}
		}
		
		@media screen and (min-width: 768px) {
			.tab-base > ul {
				display: block;
			}
			
			.tab-base > .btn-group {
				display: none;
			}
		}
		
		.content-box > .row:first-child {
			display: flex;
			flex-flow: wrap;
			justify-content: normal;
		}
		
		.content-box > .row > .panel {
			padding-left: 0;
			padding-right: 0;
		}  
		
		.img-thumbnail-box {
			padding: 0;
		}
		
		.thumbnail {
			position: relative;
			padding-top: 75%;
			overflow: hidden;
		}
		
		.thumbnail > .centered {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			-webkit-transform: translate(50%, 50%);
			-ms-transform: translate(50%, 50%);
			transform: translate(50%, 50%);
		}
				
		.thumbnail > .centered > img {
			position: absolute;
			top: 0;
			left: 0;
			max-width: auto;
			height: 100%;
			-webkit-transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		
		.img-desc-box {
			padding: 15px;
		}
		
		.img-desc-box > ul {
			list-style: none;
			padding-left: 0;
		}
		
		.ellipsis {
			width: 100%;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		
	</style>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../../includes/main-nav.jsp" %>
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
                    <h1 class="page-header text-overflow">${ group.teamName }</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    

            	    <!--Default Tabs (Left Aligned)-->
			        <!--===================================================-->
			        <div class="tab-base col-lg-12">
			
			            <!--Nav Tabs-->
			            <ul class="nav nav-tabs">
			                <li>
			                    <a href="/groups/${ group.teamId }">홈</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/member">구성원</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/schedule">모임일정</a>
			                </li>
			                <li class="active">
			                    <a href="/groups/${ group.teamId }/photos">사진첩</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/posts">게시판</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/chat">채팅</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/settings">설정</a>
			                </li>
			            </ul>
			            
                        <!--Default Dropdown button-->
                        <!--===================================================-->
                        <div class="btn-group">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 사진첩
                            </button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="/groups/${ group.teamId }">홈</a></li>
                                <li><a href="/groups/${ group.teamId }/member">구성원</a></li>
                                <li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
                                <li class="active"><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
                                <li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
                                <li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
                                <li class="divider"></li>
                                <li><a href="/groups/${ group.teamId }/settings">설정</a></li>
                            </ul>
                        </div>
                        <!--===================================================-->
                        
			            <!--Tabs Content-->
			            <div class="tab-content">
			                <div class="content-box">
			                    <div class="row">

									<c:forEach items="${ posts }" var="item">
										<div class="panel col-lg-4 col-xs-6">
											<div class="panel-body img-thumbnail-box">
												<a href="/groups/${ group.teamId }/photos/${ item.postId }">
													<div class="thumbnail">
														<div class="centered">
															<img src="${ item.imgPath }">
														</div>
													</div>
												</a>
											</div>

											<div class="panel-body img-desc-box">
												<div class="ellipsis text-bold"><a href="/groups/${ group.teamId }/photos/${ item.postId }">${ item.postTitle }</a></div>
												<div class="text-right mar-top">${ item.postNickname }</div>
												<div class="text-right mar-btm">${ item.postRegdate }</div>
												<div class="text-right">
													<i class="fa fa-comments">${ item.commentNums }</i>&nbsp;&nbsp;
													<i class="fa fa-eye">${ item.postHit }</i>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

								<div class="row text-right mar-rgt">
									<a href="/groups/${ group.teamId }/photos/new"><button class="btn btn-default">글쓰기</button></a>
								</div>

								<div class="row text-center">

									<!--Pagination with disabled and active states-->
									<!--===================================================-->
									<ul class="pagination">
										<li class="disabled"><a href="#" class="demo-pli-arrow-left"></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><span>...</span></li>
										<li><a href="#">20</a></li>
										<li><a href="#" class="demo-pli-arrow-right"></a></li>
									</ul>
									<!--===================================================-->
									<!--End Pagination with disabled and active states-->

								</div>

								<div class="row text-center">
									<form class="form-inline" action="/${ group.teamId }/photos/search" method="get">
										<div class="searchbox input-group mar-btm">
											<div class="input-group-btn">
												<select id="demo-foo-filter-status" class="form-control bord-no">
													<option value="title">제목</option>
													<option value="content">내용</option>
													<option value="nickname">작성자</option>
												</select>
											</div>
											<div class="input-group custom-search-form">
												<input type="text" class="form-control" placeholder="검색어를 입력하세요">
												<span class="input-group-btn">
                                					<button class="text-muted" type="button"><i class="demo-pli-magnifi-glass"></i></button>
												</span>
											</div>
										</div>
									</form>
								</div>
			                    
			                </div>
			            </div>
			        </div>
			        <!--===================================================-->
			        <!--End Default Tabs (Left Aligned)-->

					
                </div>
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
			
			
			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="../../includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->




	<script>
		$(document).ready(function() {

		});
	</script>
	
	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>