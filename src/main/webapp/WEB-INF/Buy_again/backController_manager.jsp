<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="UTF-8">
  <title>Back Controller Manager</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  
  <style type="text/css">
 
  	.box {
		width: 300px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	td{
 		text-align: center;
 	}
 </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="managertitle.jsp" />

<section>
		<div class="container">
			<div class="row">
<h3 style="text-align: center;">管理員資料表</h3>

<div style="text-align:center;position: absolute; top:310px;right:187px;  ">
		<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertmanager.controller?lastId=${lastId}"><b>新增管理員</b></a>
	</div>


<!-- <div style="text-align:center "> -->
<%-- 		<a style="padding-right:55px;padding-left: 55px;float: right;" class="btn btn-default" href="insertmanager.controller?lastId=${lastId}"><b>新增管理員</b></a> --%>
<!-- 	</div> -->
<div class="col-md-12">
<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th style="text-align: center;">管理員編號</th>
									<th style="text-align: center;">帳號</th>
									<th style="text-align: center;">姓名</th>
									<th style="text-align: center;">註冊時間</th>
									<th style="text-align: center;">平均分數</th>
									<th style="text-align: center;">評分次數</th>
									<th style="text-align: center;">修改</th>
									<th style="text-align: center;">刪除</th>
								</tr>
							</thead>
							<tbody>
								
									<c:forEach var='manager' items='${allmanagers}'>
											<tr>
												<td>${manager.managerId}</td>
												<td>${manager.userId}</td>
												<td>${manager.name}</td>
												<td>${manager.registerDate}</td>
												<c:choose>
													<c:when test="${manager.stars == 0 }">
														<td>${manager.stars}&thinsp;<i class="tf-ion-android-star"></i></td>
													</c:when>
													<c:when test="${manager.stars != 0 }">
														<td>${manager.stars/manager.scoreCount }&thinsp;<i class="tf-ion-android-star"></i> </td>
													</c:when>
												</c:choose>				
												
												
												<td>${manager.scoreCount}</td>
												<td><a class="btn btn-default" href="updatemanager.controller?managerId=${manager.managerId}"><i class="tf-pencil2" aria-hidden="true"></i></a></td>
												<td><a class="btn btn-default" href="deletemanager.controller?managerId=${manager.managerId}"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
											</tr>
											<c:set var="lastId" value="${manager.managerId + 1}" />
											</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
</div>
</div>
</div>
</section>

<!-- <section> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<h3 style="text-align: center;">管理員資料表</h3> -->
			
<!-- 			<div class="col-md-12"> -->
<!-- 				<form> -->
<!-- 					<div class="dashboard-wrapper user-dashboard"> -->
<!-- 						<div class="table-responsive"> -->
<!-- 							<table class="table"> -->
<!-- 								<thead> -->
<!-- 									<tr> -->
<!-- 										<th style="text-align: center;">管理員編號</th> -->
<!-- 										<th style="text-align: center;">帳號</th> -->
<!-- 										<th style="text-align: center;">姓名</th> -->
<!-- 										<th style="text-align: center;">註冊時間</th> -->
<!-- 										<th style="text-align: center;">好評數</th> -->
<!-- 										<th style="text-align: center;">差評數</th> -->
<!-- 										<th style="text-align: center;">修改</th> -->
<!-- 										<th style="text-align: center;">刪除</th> -->
<!-- 									</tr> -->
<!-- 								</thead> -->
<!-- 								<tbody> -->
<%-- 									<c:set var="lastId" value="0" /> --%>
<%-- 									<c:forEach var='manager' items='${allmanagers}'> --%>
<!-- 										<tr> -->
<%-- 											<td>${manager.managerId}</td> --%>
<%-- 											<td>${manager.userId}</td> --%>
<%-- 											<td>${manager.name}</td> --%>
<%-- 											<td>${manager.registerDate}</td> --%>
<%-- 											<td>${manager.good}</td> --%>
<%-- 											<td>${manager.bad}</td> --%>
<%-- 											<td><a class="tf-pencil2" href="updatemanager.controller?managerId=${manager.managerId}">修改</a></td> --%>
<%-- 											<td><a class="tf-scissors2" href="deletemanager.controller?managerId=${manager.managerId}">刪除</a></td> --%>
<!-- 										</tr> -->
<%-- 										<c:set var="lastId" value="${manager.managerId + 1}" /> --%>
<%-- 										</c:forEach> --%>
<!-- 									<tr> -->
<!-- 								</tbody> -->
<!-- 							</table> -->
<!-- 							<div style="border:1px solid #dedede; text-align:center "> -->
<%-- 								<a class="tf-tools" href="insertmanager.controller?lastId=${lastId}">新增管理員</a> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	


</script>
</body>
</html>
