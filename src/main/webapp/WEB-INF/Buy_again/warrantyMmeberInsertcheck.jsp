<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 註冊產品</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
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
<script type="text/javascript"></script>


</head>

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
	<!--菜單連結-->
	<jsp:include page="title.jsp" />

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">會員專區</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">首頁</a></li>
							<li class="active">客戶服務</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;">

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


		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul style="margin-left: -200px; "class="list-inline dashboard-menu text-center">
							<li><a class="active" href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
							<li><a href="memberOrder.controller">商品相關</a></li>
							<li><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="commonProblem">
			<div style="margin-top: 50px; width: 150PX;" class="refresh">
				<div class="container">
					<div class="row">
						<section class="signin-page account">
							<div class="container">
								<div class="row">
									<div class="col-md-6 col-md-offset-3" style="    margin-left: 40%;margin-top: 57px;">
										<div class="block text-center" style="margin: 0px;">
											<h2 class="text-center" style="margin: 40px;">註冊產品</h2>
											<table>
											<form class="text" action="Warrantyinsertcheck.controller"
												method="Post">

										
												
		
													<div class="form-group" style="    margin-bottom: 51px;">
													<p style="font-size: 15px;float: left;"><b>會員帳號&ensp;:</b></p> 
														<input type="text" class="form-control"
															name="productid" placeholder="註冊帳號"  readonly="readonly"
															value="${memlogin.userId}">
												</div>
											
<!-- 												<div class="form-group"> -->
<!-- 													<p style="font-size: 15px"> -->
<!-- 														<b>購買日期:</b> <input type="text" class="form-control" -->
<!-- 															name="buytime" placeholder="請輸入產品購買日 格式 yyyy-MM-dd" -->
<!-- 															value=""> -->
<!-- 												</div> -->
												<div class="form-group">
												<p style="font-size: 15px;float: left;"><b>註冊序號&ensp;:</b></p> 
												<input type="text" class="form-control"
															name="registerid" placeholder="請輸入產品序號"
															value="">
													</div>
														<button type="submit" class="btn btn-main btn-small btn-round">開始註冊</button>
													
												</form>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>

	</section>



	<jsp:include page="footer.jsp" />
	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>
	<script>

	</script>



</body>
</html>