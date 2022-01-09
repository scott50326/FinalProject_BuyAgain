<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 常見Q&A</title>

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

</head>

<body id="body">
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
	
		
		<div class="widget widget-category"
			style="margin-top: 50px; width: 150PX; float: left;">
			<div style="float: right; bottom: 100px;">
				<h3 class="tf-ion-android-contacts" style="text-align: center;">&thinsp;客戶服務</h3>
				<ul class="widget-category-list">
					<li><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">線上客服</a></li>
					<li><a href="#!" onclick="getcommonProblem();">常見Q&A</a></li>
				</ul>
			</div>
		</div>


		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul class="list-inline dashboard-menu text-center">
							<li><a href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
							<li><a href="order.html">商品相關</a></li>
							<li><a class="active" href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
</section>
<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;padding:0px;">
<div>		
			<div class="container">
				<div >
	<div class="container">
		<div class="row" class="row"style="padding-left: 200px;">
			<div class="col-md-3">
				<div class="widget product-category">
					<h4 style="font-size:22px" class="widget-title">常見Q&A</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	
					  	<div class="panel panel-default" style="width: 750pX">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	關於會員
						        	</a>
						      	</h4>
						    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body" style="width: 750pX">
								<ul>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">凡於Buy&thinsp;again會員不限金額消費，即刻成為銅級會員。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">凡於Buy&thinsp;again會員消費金額累積滿5000元，就能成為銀級會員。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">凡於Buy&thinsp;again會員消費金額累積滿10000元，就能成為金級會員。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">凡於Buy&thinsp;again會員消費金額累積滿20000元，就能成為白金級會員。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">凡於Buy&thinsp;again會員消費金額累積滿50000元，就能成為鑽石級會員。</a></i></li>
								</ul>
							</div>
					    </div>
					  </div>
					  <div class="panel panel-default" style="width: 750pX">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					         	訂購與付款
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					    	<div class="panel-body" style="width: 750pX">
					     		<ul>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">單筆訂購金額滿600元即可享免運費；未滿600元將酌收運費90元。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">當訂單成立後，系統將發送訂單成立通知信至您的電子信箱。也可以由「會員專區」→〈查詢訂單〉中查詢。</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">官網超商取貨需單筆金額低於3000元，方可使用超商取貨。</a></i></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					  <div class="panel panel-default" style="width: 750pX">
					    <div class="panel-heading" role="tab" id="headingThree">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          	配送及取貨
					        </a>
					      </h4>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					    	<div class="panel-body" style="width: 750pX">
					      		<ul>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">宅&emsp;&emsp;配&thinsp;：&thinsp;由送貨人員送達。(限台灣地區)</a></i></li>
									<li><i class="tf-ion-arrow-right-a">&thinsp;<a href="#!">超商取貨&thinsp;：&thinsp;貨件送達超商門市時將發送取貨簡訊通知，期限內持證件領取或付款領取即可。</a></i></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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



</body>
</html>