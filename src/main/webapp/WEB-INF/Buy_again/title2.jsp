<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again</title>

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
  
  	<script type="text/javascript">
		function getData(){
			var req = new XMLHttpRequest();
			req.open("get","title");
			req.onload = function(){
				var content = document.getElementById("content");
				content.innerHTML = this.responseText;				
			};
			req.send();
		}		
	</script>
  
</head>

<body id="body">

<div id="demo">
<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container" style="border-bottom:0px;padding-bottom:0px">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<i class="tf-ion-ios-telephone"></i>
					<span style="font-size:14px">02-1234-5678</span>
					&emsp; 
					<c:if test="${user == null}">
						<a style="font-size:16px" href="managerlogin.controller">
						<i class="tf-ion-ios-contact"></i>
							<span>管理者專區</span>
						</a>
					</c:if>
				</div>
<!-- 				<div> -->
<!-- 					<span onclick="getData();">更新</span> -->
<!-- 				</div> -->
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="/homepage.controller">
						<!-- replace logo here -->
						<img style="height: 80px;" src="./images/Baglogo.png">
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				
				<ul class="top-menu text-right list-inline">
					<!-- Cart -->
					<li class="dropdown cart-nav dropdown-slide">
						<a style="font-size:16px" href="#!">
							<i class="tf-ion-android-cart"></i>
							購物車
						</a>						
					</li><!-- / Cart -->
					<!-- 管理者專區 -->
					<li class="dropdown search dropdown-slide">
						<c:if test="${user == null}">
							<a style="font-size:16px" href="managerlogin.controller">
							<i class="tf-ion-ios-contact"></i>
								管理者專區
							</a>
						</c:if>
					</li><!-- / 管理者專區 -->
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

					<!-- 首頁 -->
					<li class="dropdown ">
						<a href="homepage.controller">首頁</a>
					</li><!-- / 首頁 -->

					<!-- 聯絡我們 -->
					<li class="dropdown ">
						<a href="/contactUs">聯絡我們</a>
					</li><!-- / 聯絡我們 -->

					<!-- 購物區 -->
					<li class="dropdown dropdown-slide">
						<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
							role="button" aria-haspopup="true" aria-expanded="false">購物區<span
								class="tf-ion-ios-arrow-down"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/themes/aviato/shopping.jsp">熱銷商品</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#!">cpu</a></li>
							<li><a href="#!">電腦</a></li>
							<li><a href="#!">鍵盤</a></li>
							<li><a href="#!">滑鼠</a></li>
						</ul>
					</li>

					<!-- 論壇 -->
					<li class="dropdown ">
						<a href="/themes/aviato/forum.html">論壇</a>
					</li><!-- / 論壇 -->

					<!-- 產品保固 -->
					<li class="dropdown ">
						<a href="#!">產品保固</a>
					</li><!-- / 產品保固 -->
							<!-- Shop -->
						<c:choose>
							<c:when test="${memlogin == null || memlogin == ''}">
								<li class="dropdown dropdown-slide">
									<a href="memberlogin.controller">會員專區<span	class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li><a href="memberlogin.controller">個人帳戶管理</a></li>
										<li><a href="memberlogin.controller">商品相關</a></li>
										<li><a href="memberlogin.controller">客戶服務</a></li>
									</ul>
								</li>
							</c:when>
								
							<c:when test="${memlogin != null || memlogin != ''}">
									<li class="dropdown dropdown-slide">
										<a href="memberService.controller">會員專區<span	class="tf-ion-ios-arrow-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
											<li><a href="memberOrder.controller">商品相關</a></li>
											<li><a href="selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
										</ul>
									</li>
								</c:when>
						</c:choose>
							<!-- Shop -->
				</ul><!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
	
</section>
</div>
</body>
</html>