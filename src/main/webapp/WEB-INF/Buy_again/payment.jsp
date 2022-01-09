<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 購物車</title>

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


	<!-- Main Menu Section -->

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Checkout</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">Home</a></li>
							<li class="active">checkout</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="page-wrapper">
		<div class="checkout shopping">
			<div class="container">
				<div class="row">
					<div class="col-md-8">

						<div class="block billing-details">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">本次消費明細
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">

									<c:forEach items="${allProducts}" var="shoppingcart">
										<input type=hidden id="productId"
											value="${shoppingcart.productBean.productId}" />
										<ul>
											<li>商品名稱:${shoppingcart.productBean.name}</li>
											<li id="quantity${shoppingcart.productBean.productId}">商品數量:${shoppingcart.quantity}</li>
											<li id="unitPrice${shoppingcart.productBean.productId}">商品價格:${shoppingcart.productBean.unitPrice}</li>
											<li class="widget-title"
												id="smallTotal${shoppingcart.productBean.productId}">小計:${shoppingcart.totalPrice}</li>

										</ul>
									</c:forEach>
									<p>
										總金額: <span id="total" name="total">${total}</span>
									<p />
								</div>
							</div>
							<h4 class="widget-title">收件人</h4>
							<div class="checkout-form">
								<div class="form-group">
									<label for="full_name">姓名</label> <input type="text"
										class="form-control" id="name" placeholder="">
								</div>
								<div class="form-group">
									<label for="user_address">地址</label> <input type="text"
										class="form-control" id="address" placeholder="">
								</div>
								<div class="checkout-country-code clearfix">
									<div class="form-group">
										<label for="user_post_code">手機</label> <input type="text"
											class="form-control" id="phone" value="">
									</div>
									<div class="form-group">
										<label for="user_city">市話</label> <input type="text"
											class="form-control" id="telephone" name="city" value="">
									</div>
								</div>

								<div class="form-group">
									<label for="user_country">備註</label> <input type="text"
										class="form-control" id="remark" placeholder="">
								</div>
								<button id="findmember" class="btn btn-main mt-20">一鍵填入</button>
							</div>



						</div>
						<div class="block">
							
							<div class="checkout-product-details">
								<div class="payment">
									<div class="card-details">
										<form class="checkout-form" action="insertoder.controller"
											method="POST">
											
											<input type="hidden" name="productId" value="${productId}" />
											<input type="hidden" name="finalPrice" value="${total}" /> 
											<input type="hidden" name="productId" value="${totalPrice}" />
											<input
												type="hidden" id="membername" value="Luff" /> <input
												type="hidden" id="memberaddress" name="address" value="台北市" />
											<input type="hidden" id="memberphone" name="phone"
												value="0912345678" /> <input type="hidden"
												id="membertelephone" value="02-22337788" /> <input
												type="hidden" id="memberremark" value="早上10點到晚上8點方便收貨物" />
											<button type="submit" class="btn btn-main mt-20">Place
												Order</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input class="form-control" type="text"
								placeholder="Enter Coupon Code">
						</div>
						<button type="submit" class="btn btn-main">Apply Coupon</button>
					</form>
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
		$(document)
				.ready(
						function() {
							$("#findmember")
									.click(
											function() {
												var name = document
														.getElementById("membername").value;
												var address = document
														.getElementById("memberaddress").value;
												var phone = document
														.getElementById("memberphone").value;
												var telephone = document
														.getElementById("membertelephone").value;
												var remark = document
														.getElementById("memberremark").value;

												$("#name").val(name);
												$("#address").val(address);
												$("#phone").val(phone);
												$("#telephone").val(telephone);
												$("#remark").val(remark);

											});
						});
	</script>


</body>
</html>