<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人小屋</title>
<style type="text/css">
.div1{
margin-left: 25%;
margin-right: 50%;
}
.ellipsis{
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
}
.box{
width: 50px;
height:25px;
overflow: hidden;
}
.inline{
display: inline-flex;
}
#div2{

}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >
<!--菜單連結-->
<jsp:include page="title.jsp" />
<div class="div1" id="div2" >
	<c:forEach var="article" items="${articles}">
<%-- 	<c:set var="pageContent" value="${article.content}"/> --%>
<%-- 	<c:out value="${pageContent}"/> --%>
<!-- 	<script type="text/javascript"> -->
<%-- // 		var pageContent = '${pageContent}'; --%>
<!-- // 		console.log(pageContent) -->
<!-- // 		var reg = /<[^>]+>|&[^>]+;/g; -->
<!-- // 		pageContent = pageContent.replace(reg,''); -->

<!-- 	</script> -->
		<div>
		<div class="col-md-6" style="width: 250%;">
				<div class="post" style="margin:10px;padding:20px">
<!-- 					<div class="post-media post-media-audio"> -->
<!-- 						<iframe width="100%" height="400" src="https://www.youtube.com/embed/Ljik3zsGNF4" frameborder="0" allowfullscreen></iframe> -->
<!-- 					</div> -->
					<h2 class="post-title"><a href="blog-single.html">【${article.articleSortBean.sortName}】${article.header}</a></h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i>${article.registerDate}
							</li>
							<li>
								<i class="tf-ion-android-person"></i>${article.name}
							</li>
<!-- 							<li> -->
<!-- 								<a href="blog-full-width.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-full-width.html"> TRAVEL</a>, <a href="blog-full-width.html">FASHION</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a> -->
<!-- 							</li> -->
						</ul>
					</div>
					<div class="post-content">
						<div class='box inline'><p class="ellipsis"><p>${article.content}</p></p></div>
						<a class='inline' href="articlecontentupdate?articleId=${article.articleId}">&ensp;<p>(繼續閱讀...)</p></a>
<%-- 						<a href="articlecontentupdate?articleId=${article.articleId}" class="btn btn-main">繼續閱讀</a> --%>
					</div>
				</div>
<%-- 		 <h3>【${article.articleSortBean.sortName}】${article.header}</h3> --%>
<%-- 		 <p>作者:${article.name}&ensp;${article.registerDate}</p> --%>
<%-- 		 <div class='box inline'><p class="ellipsis">${article.content}</p></div><a class='inline' href="articlecontentupdate?articleId=${article.articleId}">(繼續閱讀...)</a> --%>
		 <hr>
		</div>
	</c:forEach>
	
	
	
			<div class="dashboard-wrapper user-dashboard" id="div2" style="position:absolute; right:550px;    width: 341px;left: 30px;top: 131px;border:0px">
										<div class="table-responsive">

											<form class="text-left clearfix"
												action="/MembersImg.Controller" method="POST"
												enctype="multipart/form-data">

												<section class="user-dashboard page-wrapper"style="padding: 0px;    margin-top: 36px;">
													<div>
														<div>
															<div>
																<div class="dashboard-wrapper dashboard-user-profile" style="    background-color: #ffffff;">
																	<div class="media">
																		<div class="pull-left text-center" href="#!">

																			<!--大頭貼上傳 -->
																		<div style="padding-left: 50px;padding-top: 25px">	
																			<div id="dropZone">
																				<c:choose>
																					<c:when
																						test="${tempBean.img == null ||tempBean.img == ''}">
																						<img id="img1" class="media-object user-img"
																							src="images/memberimages/member.jpg" alt="Image">
																					</c:when>

																					<c:when test="${tempBean.img != null}">
																						<img id="img1" class="media-object user-img" />
																						<img id="img1" class="media-object user-img"
																							src="images/memberimages/${tempBean.img}"
																							alt="Image">
																					</c:when>
																				</c:choose>
																			</div>
																			</div>
																			
																			<div style="display: none">
																				<input type="text" name="memberId"value="${tempBean.memberId}" /> 
																				<input type="text"name="userId" value="${tempBean.userId}" /> 
																				<input type="text" name="password"value="${tempBean.password}" /> 
																				<input type="text"name="name" value="${tempBean.name}" /> 
																				<input type="text" name="birthday"value="${tempBean.birthday}" /> 
																				<input type="text"name="phone" value="${tempBean.phone}" /> 
																				<input type="text" name="address"value="${tempBean.address}" /> 
																				<input type="text"name="email" value="${tempBean.email}" /> 
																				<input type="text" name="spend" value="${tempBean.spend}" />
																				<input type="text" name="rank"value="${tempBean.rank}" /> 
																				<input type="date"name="registerDate" value="${tempBean.registerDate}" />
																			</div>


																		</div>

																		<div class="media-body">
																			<ul class="user-profile-list">
																				<li><p>姓 名 : ${tempBean.name}</p></li>
																				<li><p>生 日 : ${tempBean.birthday}</p></li>
																				<li><p>電 話 : ${tempBean.phone}</p></li>
																				<li><p>住 址 : ${tempBean.address}</p></li>
																				<li><p>信 箱 : ${tempBean.email}</p></li>
																				<c:choose>
																					<c:when test="${tempBean.rank == 1}">
																						<li><p>會員等級 : 銅</p></li>
																					</c:when>
																					<c:when test="${tempBean.rank == 2}">
																						<li><p>會員等級 : 銀</p></li>
																					</c:when>
																					<c:when test="${tempBean.rank == 3}">
																						<li><p>會員等級 : 金</p></li>
																					</c:when>
																					<c:when test="${tempBean.rank == 4}">
																						<li><p>會員等級 : 白金</p></li>
																					</c:when>
																					<c:when test="${tempBean.rank == 5}">
																						<li><p>會員等級 : 鑽石</p></li>
																					</c:when>
																				</c:choose>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</form>

										</div>
									</div>
</div>								
</body>
</html>