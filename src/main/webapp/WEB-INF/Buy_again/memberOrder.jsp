<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 商品相關</title>

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

</head>

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
<!-- Start Top Header Bar -->
<jsp:include page="title.jsp" />




<!-- Main Menu Section -->


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">會員專區</h1>
					<ol class="breadcrumb">
						<li><a href="index.html">首頁</a></li>
						<li class="active">商品相關</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="user-dashboard page-wrapper" style="background-color: #f7f7f7;">

	<div  class="widget widget-category"  style="margin-top: 100px; width: 250px;position:absolute;left: 100px">
		<div style="bottom: 100px;" >
			<h3 class="tf-ion-android-cart"style="text-align:left;font-size: 28px;margin-bottom: 20px;">商品相關</h3>
			<ul class="widget-category-list" style="text-align: left;font-size: 15px;margin-left: 20px;">
				<li>
					<a style="font-size: 18px" href="/memberOrder.controller">訂單查詢</a>
				</li>
				<li>
					<a style="font-size: 18px" href="Warrantyinsert1.controller">商品註冊</a>
				</li>
				<li>
					<a style="font-size: 18px" href="WarrantyfindMember.controller2">商品保固查詢</a>
				</li>
				<li>
					<a style="font-size: 18px" href="RMAfindMember.controller">送修商品查詢</a>
				</li>
			</ul>
		</div>
	</div>

	<div class="container" style="float: right ;background-color: #f7f7f7;">
		<div class="row">
			<div class="col-md-12">
				<ul class="list-inline dashboard-menu text-center" style="margin-left: -406px;">
					<li><a href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
					<li><a class="active" href="memberOrder.controller">商品相關</a></li>
					<li><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard" style="width: 904px;margin-bottom: 205px;margin-top: 65px;">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>訂單編號</th>
									<th>下單時間</th>
<!-- 									<th>訂單筆數</th> -->
									<th>總金額</th>
									<th>訂單進度</th>
									<th>查看明細</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items='${memOrder}' var='memOrder' varStatus="loop">
								<tr>
									<td>${memOrder.orderNo}</td>
									<td>${memOrder.orderDate}</td>
<%-- 									<td id="num" style="text-align: center;">${loop.count}</td> --%>
									<td >$${memOrder.finalPrice}</td>
<%-- 									<td><span class="label label-primary">${memOrder.orderState}</span></td> --%>
									<c:choose>
										<c:when test="${memOrder.orderState == 0}">
											<td><span class="label label-primary">準備中</span></td>
										</c:when>
										<c:when test="${memOrder.orderState == 1}">
											<td><span class="label label-primary">配送中</span></td>
										</c:when>
										<c:when test="${memOrder.orderState == 2}">
											<td><span class="label label-primary">已送達</span></td>
										</c:when>
										<c:when test="${memOrder.orderState == 3}">
											<td><span class="label label-primary">已領取</span></td>
										</c:when>

								</c:choose>
									<td><a href="memberOrderDetails.controller?orderId=${memOrder.orderId}" class="btn btn-default"><i class="tf-ion-android-clipboard"></i></a></td>
								</tr>
							</c:forEach>			
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<footer class="footer section text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<ul class="footer-menu text-uppercase">
					<li>
						<a href="/contactUs">聯絡我們</a>
					</li>
					<li>
						<a href="shop.html">商店</a>
					</li>
					<li>
						<a href="pricing.html">論壇</a>
					</li>
					<li>
						<a href="contact.html">客服</a>
					</li>
				</ul>
				<p class="copyright-text">版權所有 ©2021，由Themefisher設計和開發</p>
			</div>
		</div>
	</div>
</footer>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    


  </body>
  </html>