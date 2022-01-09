<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller</title>

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

<body id="body">

<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container" style="border-bottom: 1px solid #00000061">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<i class=></i>
					<span style="font-size:15px">管理員宗旨:服務至上</span>
				</div>
			</div>
			<div style="text-align: center;" class="col-md-4 col-xs-12 col-sm-4">
					<h1>Bag商城管理系統</h1>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				
				<ul class="top-menu text-right list-inline">
					<!-- 登入/註冊 -->
					<li class="dropdown cart-nav dropdown-slide">
						
							<i class="tf-ion-android-person"></i>
							您好, 管理員 ${mngLogin.name}
										
					</li><!-- /登入/註冊 -->
					
					<li class="dropdown search dropdown-slide">
						<a href="homepage.controller">
							回商城首頁
						</a>
					</li><!-- / 管理者專區 -->
					
					<li class="dropdown search dropdown-slide">
						<a href="managerlogout.controller">
							登出
						</a>
					</li>

					
					
				</ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->

<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<li class="dropdown ">
						<a href="findallmembers.controller">會員管理</a>
					</li>

					<li class="dropdown ">
						<a href="findallproducts.controller">商品管理</a>
					</li>

					<li class="dropdown ">
						<a href="findallorders.controller">訂單管理</a>
					</li>
					
					<li class="dropdown ">
						<a href="findallarticles.controller">文章管理</a>
					</li>

					<li class="dropdown ">
						<a href="findallbillboards.controller">公告管理</a>
					</li>
					<li class="dropdown ">
						<a href="/contactUsfindall.controller">聯繫我們</a>
					</li>
					
					<li class="dropdown ">
						<a href="/selectOCSfindAll.controller">客服專區</a>
					</li>
					
					<li class="dropdown ">
						<a href="findallmanagers.controller">管理員資訊</a>
					</li>
					
					<li class="dropdown ">
						<a href="findalllotterys.controller">抽獎系統</a>
					</li>
					<li class="dropdown ">
						<a href="Warrantyfindall.controller">保固管理</a>
					</li>
					<li class="dropdown ">
						<a href="RMAFINDALL.controller">RMA管理</a>
					</li>
					<li class="dropdown ">
						<a href="FINDALLproductid.controller">查詢會員購買紀錄之序號</a>
					</li>

				</ul><!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
</section>

</body>
</html>