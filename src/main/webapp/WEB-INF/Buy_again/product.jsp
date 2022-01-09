<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 商品詳情</title>

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
	<!-- Start Top Header Bar -->
	<section class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-xs-12 col-sm-4">
					<div class="contact-number">
						<i class="tf-ion-ios-telephone"></i> <span>02-1234-5678</span>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Site Logo -->
					<div class="logo text-center">
						<a href="/themes/aviato/homepage.html"> <!-- replace logo here -->
							<img style="height: 80px;"
							src="./images/messageImage_1635082176618.jpg">
						</a>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">

					<ul class="top-menu text-right list-inline">
						<!-- 登入/註冊 -->
						<li class="dropdown cart-nav dropdown-slide"><c:if
								test="${memlogin == null}">
								<a href="memberlogin.controller"> <i
									class="tf-ion-android-person"></i> 登入 / 註冊
								</a>
							</c:if> <c:if test="${memlogin != null}">
								<i class="tf-ion-android-contact"></i>
							${memlogin.name}歡迎回來♥
							<a onclick="getData();" href="memberlogout.controller"> 登出 </a>
							</c:if></li>
						<!-- /登入/註冊 -->


						<!-- Cart -->
						<li class="dropdown cart-nav dropdown-slide"><a
							href="findallshoppingcartdetail.controller"> <i
								class="tf-ion-android-cart"></i> 購物車
						</a></li>
						<!-- / Cart -->

						<!-- 管理者專區 -->
						<li class="dropdown search dropdown-slide"><a href="#!">
								<i class="tf-ion-ios-contact"></i> 管理者專區
						</a></li>
						<!-- / 管理者專區 -->

					</ul>
					<!-- / .nav .navbar-nav .navbar-right -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Top Header Bar -->


	<!-- Main Menu Section -->
	<section class="menu">
		<nav class="navbar navigation">
			<div class="container">
				<!-- Navbar Links -->
				<div id="navbar" class="navbar-collapse collapse text-center">
					<ul class="nav navbar-nav">

						<!-- 首頁 -->
						<li class="dropdown "><a href="homepage.controller">首頁</a>
						</li>
						<!-- / 首頁 -->

						<!-- 聯絡我們 -->
						<li class="dropdown "><a href="/themes/aviato/contact.html">聯絡我們</a>
						</li>
						<!-- / 聯絡我們 -->

						<!-- 購物區 -->
						<!--產品種類-->
						<li class="dropdown dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="350" role="button"
							aria-haspopup="true" aria-expanded="false">購物區<span
								class="tf-ion-ios-arrow-down"></span></a>

							<ul class="dropdown-menu">
								<li><a href="products.controller">所有商品</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="productsClick.controller">熱門商品</a></li>
								<li role="separator" class="divider"></li>
								<!-- 種類 -->
								<c:forEach items='${allProductSort}' var='productSort'>
									<li>
									<a href="productsSort.controller?sortId=${productSort.sortId}">${productSort.sortName}</a>
									</li>
									<li role="separator" class="divider"></li>
								</c:forEach>

							</ul></li>
						<!--產品種類-->

						<!-- 論壇 -->
						<li class="dropdown "><a href="/themes/aviato/forum.html">論壇</a>
						</li>
						<!-- / 論壇 -->

						<!-- 產品保固 -->
						<li class="dropdown "><a href="#!">產品保固</a></li>
						<!-- / 產品保固 -->

						<!-- Shop -->
						<c:choose>
							<c:when test="${memlogin == null || memlogin == ''}">
								<li class="dropdown dropdown-slide"><a
									href="memberlogin.controller">會員專區<span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li><a href="memberlogin.controller">個人帳戶管理</a></li>
										<li><a href="memberOrder.controller">商品相關</a></li>
										<li><a href="memberlogin.controller">客戶服務</a></li>
									</ul></li>
							</c:when>

							<c:when test="${memlogin != null || memlogin != ''}">
								<li class="dropdown dropdown-slide"><a
									href="memberService.controller">會員專區<span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
										<li><a href="memberOrder.controller">商品相關</a></li>
										<li><a
											href="selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
									</ul></li>
							</c:when>
						</c:choose>
						<!-- / Blog -->
					</ul>
					<!-- / .nav .navbar-nav -->

				</div>
				<!--/.navbar-collapse -->
			</div>
			<!-- / .container -->
		</nav>
	</section>
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="shop.html">Shop</a></li>
						<li class="active">Single Product</li>
					</ol>
				</div>
				<div class="col-md-6">
					<ol class="product-pagination text-right">
						<li><a href="blog-left-sidebar.html"><i
								class="tf-ion-ios-arrow-left"></i> Next </a></li>
						<li><a href="blog-left-sidebar.html">Preview <i
								class="tf-ion-ios-arrow-right"></i></a></li>
					</ol>
				</div>
			</div>

			<div class="col-md-3" style="width: 200PX; float: left;">
				<div class="widget">
					<h4 class="widget-title">Short By</h4>
					<form action="/productsSort.controller" method="post">
						<select id="mySelect" class="form-control">
							<option value="0">商品種類</option>
							<c:forEach items='${allProductSort}' var='productSort'>
									<option value="${productSort.sortId}">${productSort.sortName}</option>
							</c:forEach>
						</select>
					</form>

				</div>
				<div class="widget product-category">
					<h4 class="widget-title"></h4>
					<div class="panel-group commonAccordion" id="accordion"
						role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne"> 華碩 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<ul>
										<li><a href="productsSort.controller?sortId=1">顯示卡</a></li>
											<li><a href="productsSort.controller?sortId=3">記憶體</a></li>
										<li><a href="#!"></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo"> 技嘉 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<ul>
										<li><a href="productsSort.controller?sortId=1">顯示卡</a></li>
											<li><a href="productsSort.controller?sortId=3">記憶體</a></li>
										<li><a href="#!"></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">微星 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<ul>
										<li><a href="productsSort.controller?sortId=1">顯示卡</a></li>
											<li><a href="productsSort.controller?sortId=3">記憶體</a></li>
										<li><a href="#!"></a></li>
										<li><a href="#!"></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-20" style="float: right; width: 900px;">
				<div class="col-md-5">
					<div class="single-product-slider">
						<div id='carousel-custom' class='carousel slide'
							data-ride='carousel'>
							<div class='carousel-outer'>
								<!-- me art lab slider -->

								<form name="product">
									<c:forEach items='${allProducts}' var='product'>
										<div class='carousel-inner ' >
											<div class='item active' >
												<img src='images/productimages/${product.img1}' alt='' 
													data-zoom-image="images/shop/single-products/product-1.jpg" />
											</div>
											<div class='item' >
												<img src='images/productimages/${product.img2}' alt='' 
													data-zoom-image="images/shop/single-products/product-2.jpg" />
											</div>

											<div class='item' >
												<img src='images/productimages/${product.img3}' alt='' 
													data-zoom-image="images/shop/single-products/product-3.jpg" />
											</div>
									</c:forEach>
								</form>
							</div>

							<!-- sag sol -->
							<a class='left carousel-control' href='#carousel-custom'
								data-slide='prev'> <i class="tf-ion-ios-arrow-left"></i>
							</a> <a class='right carousel-control' href='#carousel-custom'
								data-slide='next'> <i class="tf-ion-ios-arrow-right"></i>
							</a>
						</div>

						<!-- thumb -->
						<form name="product">
							<c:forEach items='${allProducts}' var='product'>
								<ol class='carousel-indicators mCustomScrollbar meartlab'>
									<li data-target='#carousel-custom' data-slide-to='0'
										class='active'><img
										src='images/productimages/${product.img1}' alt='' /></li>
									<li data-target='#carousel-custom' data-slide-to='1'><img
										src='images/productimages/${product.img2}' alt='' /></li>
									<li data-target='#carousel-custom' data-slide-to='2'><img
										src='images/productimages/${product.img3}' alt='' /></li>
								</ol>
							</c:forEach>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
<!-- 					<form name="product" action="insertshoppingcartdetail.controller" -->
<!-- 						> -->
						<c:forEach items='${allProducts}' var='product'>
							<h2>${product.name}</h2>
							<div style="font-size: 18px; color: red;">$商品價格</div>
							<p class="product-price">${product.unitPrice}</p>

							<p>商品內容</p>
							<p class="product-description mt-20">${product.content}</p>

							<p>剩餘數量:${product.quantity}</p>
							<div class="product-quantity">
								<span>Quantity:</span>
								<div class="product-quantity-slider">
									<input id="product-quantity" type="text" 
										name="product-quantity" value="0" />
								</div>
							</div>
							<input type="hidden" name=productId value="${product.productId}" />
							<button onclick="oncheck1(${product.productId})" class="btn btn-main mt-20">Add To
								Cart</button>
						</c:forEach>
<!-- 					</form> -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#details"
							aria-expanded="true">Details</a></li>
						<li class=""><a data-toggle="tab" href="#reviews"
							aria-expanded="false">Reviews (3)</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade active in">
							<h4>Product Description</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore eu fugiat nulla pariatur. Excepteur sint occaecat
								cupidatat non proident, sunt in culpa qui officia deserunt
								mollit anim id est laborum. Sed ut per spici</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Veritatis delectus quidem repudiandae veniam distinctio
								repellendus magni pariatur molestiae asperiores animi, eos quod
								iusto hic doloremque iste a, nisi iure at unde molestias enim
								fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum
								harum, deleniti laborum animi neque, praesentium explicabo,
								debitis ipsa?</p>
						</div>
						<div id="reviews" class="tab-pane fade">
							<div class="post-comments">
								<ul class="media-list comments-list m-bot-50 clearlist">
									<!-- Comment Item start-->
									<li class="media"><a class="pull-left" href="#!"> <img
											class="media-object comment-avatar"
											src="images/blog/avater-1.jpg" alt="" width="50" height="50" />
									</a>

										<div class="media-body">
											<div class="comment-info">
												<h4 class="comment-author">
													<a href="#!">Jonathon Andrew</a>

												</h4>
												<time datetime="2013-04-06T13:53">July 02, 2015, at
													11:34</time>
												<a class="comment-button" href="#!"><i
													class="tf-ion-chatbubbles"></i>Reply</a>
											</div>

											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Quisque at magna ut ante eleifend eleifend.Lorem ipsum
												dolor sit amet, consectetur adipisicing elit. Quod laborum
												minima, reprehenderit laboriosam officiis praesentium?
												Impedit minus provident assumenda quae.</p>
										</div></li>
									<!-- End Comment Item -->

									<!-- Comment Item start-->
									<li class="media"><a class="pull-left" href="#!"> <img
											class="media-object comment-avatar"
											src="images/blog/avater-4.jpg" alt="" width="50" height="50" />
									</a>

										<div class="media-body">

											<div class="comment-info">
												<div class="comment-author">
													<a href="#!">Jonathon Andrew</a>
												</div>
												<time datetime="2013-04-06T13:53">July 02, 2015, at
													11:34</time>
												<a class="comment-button" href="#!"><i
													class="tf-ion-chatbubbles"></i>Reply</a>
											</div>

											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Quisque at magna ut ante eleifend eleifend. Lorem
												ipsum dolor sit amet, consectetur adipisicing elit. Magni
												natus, nostrum iste non delectus atque ab a accusantium
												optio, dolor!</p>

										</div></li>
									<!-- End Comment Item -->

									<!-- Comment Item start-->
									<li class="media"><a class="pull-left" href="#!"> <img
											class="media-object comment-avatar"
											src="images/blog/avater-1.jpg" alt="" width="50" height="50">
									</a>

										<div class="media-body">

											<div class="comment-info">
												<div class="comment-author">
													<a href="#!">Jonathon Andrew</a>
												</div>
												<time datetime="2013-04-06T13:53">July 02, 2015, at
													11:34</time>
												<a class="comment-button" href="#!"><i
													class="tf-ion-chatbubbles"></i>Reply</a>
											</div>

											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Quisque at magna ut ante eleifend eleifend.</p>

										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<section class="products related-products section">
		<div class="container">
			<div class="row">
				<div class="title text-center">
					<h2>Related Products</h2>
				</div>
			</div>
			<div class="row">

				<!-- 			其他商品資訊 -->
				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
							<span class="bage">Sale</span> <img class="img-responsive"
								src="images/shop/products/product-5.jpg" alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><span data-toggle="modal" data-target="#product-modal">
											<i class="tf-ion-ios-search"></i>
									</span></li>
									<li><a href="#"><i class="tf-ion-ios-heart"></i></a></li>
									<li><a href="#!"><i class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a href="product-single.html">Reef Boardsport</a>
							</h4>
							<p class="price">$200</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="images/shop/products/product-1.jpg" alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><span data-toggle="modal" data-target="#product-modal">
											<i class="tf-ion-ios-search-strong"></i>
									</span></li>
									<li><a href="#"><i class="tf-ion-ios-heart"></i></a></li>
									<li><a href="#!"><i class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a href="product-single.html">Rainbow Shoes</a>
							</h4>
							<p class="price">$200</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="images/shop/products/product-2.jpg" alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><span data-toggle="modal" data-target="#product-modal">
											<i class="tf-ion-ios-search"></i>
									</span></li>
									<li><a href="#"><i class="tf-ion-ios-heart"></i></a></li>
									<li><a href="#!"><i class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a href="product-single.html">Strayhorn SP</a>
							</h4>
							<p class="price">$230</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="images/shop/products/product-3.jpg" alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><span data-toggle="modal" data-target="#product-modal">
											<i class="tf-ion-ios-search"></i>
									</span></li>
									<li><a href="#"><i class="tf-ion-ios-heart"></i></a></li>
									<li><a href="#!"><i class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a href="product-single.html">Bradley Mid</a>
							</h4>
							<p class="price">$200</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- 			其他商品資訊 -->


	<!-- Modal -->
	<div class="modal product-modal fade" id="product-modal">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<i class="tf-ion-close"></i>
		</button>
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8">
							<div class="modal-image">
								<img class="img-responsive"
									src="images/shop/products/modal-product.jpg" />
							</div>
						</div>
						<div class="col-md-3">
							<div class="product-short-details">
								<h2 class="product-title">GM Pendant, Basalt Grey</h2>
								<p class="product-price">$200</p>
								<p class="product-short-description">Lorem ipsum dolor sit
									amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo
									laborum numquam rem aut officia dicta cumque.</p>
								<a href="#!" class="btn btn-main">Add To Cart</a> <a href="#!"
									class="btn btn-transparent">View Product Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="social-media">
						<li><a href="https://www.facebook.com/themefisher"> <i
								class="tf-ion-social-facebook"></i>
						</a></li>
						<li><a href="https://www.instagram.com/themefisher"> <i
								class="tf-ion-social-instagram"></i>
						</a></li>
						<li><a href="https://www.twitter.com/themefisher"> <i
								class="tf-ion-social-twitter"></i>
						</a></li>
						<li><a href="https://www.pinterest.com/themefisher/"> <i
								class="tf-ion-social-pinterest"></i>
						</a></li>
					</ul>
					<ul class="footer-menu text-uppercase">
						<li><a href="contact.html">CONTACT</a></li>
						<li><a href="shop.html">SHOP</a></li>
						<li><a href="pricing.html">Pricing</a></li>
						<li><a href="contact.html">PRIVACY POLICY</a></li>
					</ul>
					<p class="copyright-text">
						Copyright &copy;2021, Designed &amp; Developed by <a
							href="https://themefisher.com/">Themefisher</a>
					</p>
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
	
	function oncheck1(id){
		var quantity = $("#product-quantity").val();
		$.ajax({
			url : 'insertshoppingcartdetail.controller',
			type : 'POST',
			data :{
				productId : id,
				'product-quantity' :quantity,
			},
			success : function(data){
				if(data != null){
						
				alert("成功"+data+"購物車");
				
				window.location.href = "findallshoppingcartdetail.controller";
				}
				
			}
			
		})
		
	}
// 		$("#mySelect").change(
// 				function() {
// 					var checkText = $("#mySelect").val();
// 					if (checkText > 1) {
// 						window.location.assign("productsSort.controller?sort="
// 								+ checkText);
// 					} else
// 						window.location.assign("products.controller");
// 				});
	</script>
</body>
</html>
