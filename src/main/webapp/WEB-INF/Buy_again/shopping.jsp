<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 商品區</title>

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

<body id="body" background="/images/background.png" style=" background-attachment: fixed;">
<jsp:include page="title.jsp" />
	<!-- Start Top Header Bar -->
<!-- 	<section class="top-header"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4 col-xs-12 col-sm-4"> -->
<!-- 					<div class="contact-number"> -->
<!-- 						<i class="tf-ion-ios-telephone"></i> <span>02-1234-5678</span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 col-xs-12 col-sm-4"> -->
<!-- 					Site Logo -->
<!-- 					<div class="logo text-center"> -->
<!-- 						<a href="/themes/aviato/homepage.html"> replace logo here -->
<!-- 							<img style="height: 80px;" -->
<!-- 							src="./images/messageImage_1635082176618.jpg"> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 col-xs-12 col-sm-4"> -->

<!-- 					<ul class="top-menu text-right list-inline"> -->
<!-- 						登入/註冊 -->
<%-- 						<li class="dropdown cart-nav dropdown-slide"><c:if --%>
<%-- 								test="${memlogin == null}"> --%>
<!-- 								<a href="memberlogin.controller"> <i -->
<!-- 									class="tf-ion-android-person"></i> 登入 / 註冊 -->
<!-- 								</a> -->
<%-- 							</c:if> <c:if test="${memlogin != null}"> --%>
<!-- 								<i class="tf-ion-android-contact"></i> -->
<%-- 							${memlogin.name}歡迎回來♥ --%>
<!-- 							<a onclick="getData();" href="memberlogout.controller"> 登出 </a> -->
<%-- 							</c:if></li> --%>
<!-- 						/登入/註冊 -->


<!-- 						Cart -->
<!-- 						<li class="dropdown cart-nav dropdown-slide"><a -->
<!-- 							href="findallshoppingcartdetail.controller"> <i -->
<!-- 								class="tf-ion-android-cart"></i> 購物車 -->
<!-- 						</a></li> -->
<!-- 						/ Cart -->

<!-- 						管理者專區 -->
<!-- 						<li class="dropdown search dropdown-slide"><a href="#!"> -->
<!-- 								<i class="tf-ion-ios-contact"></i> 管理者專區 -->
<!-- 						</a></li> -->
<!-- 						/ 管理者專區 -->

<!-- 					</ul> -->
<!-- 					/ .nav .navbar-nav .navbar-right -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- 	<!-- End Top Header Bar --> 


<!-- 	<!-- Main Menu Section -->
<!-- 	<section class="menu"> -->
<!-- 		<nav class="navbar navigation"> -->
<!-- 			<div class="container"> -->
<!-- 				Navbar Links -->
<!-- 				<div id="navbar" class="navbar-collapse collapse text-center"> -->
<!-- 					<ul class="nav navbar-nav"> -->

<!-- 						首頁 -->
<!-- 						<li class="dropdown "><a href="homepage.controller">首頁</a></li> -->
<!-- 						/ 首頁 -->

<!-- 						聯絡我們 -->
<!-- 						<li class="dropdown "><a href="/themes/aviato/contact.html">聯絡我們</a> -->
<!-- 						</li> -->
<!-- 						/ 聯絡我們 -->

<!-- 						購物區 -->

<!-- 						產品種類 -->
<!-- 						<li class="dropdown dropdown-slide"><a href="#!" -->
<!-- 							class="dropdown-toggle" data-toggle="dropdown" -->
<!-- 							data-hover="dropdown" data-delay="350" role="button" -->
<!-- 							aria-haspopup="true" aria-expanded="false">購物區<span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->

<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li><a href="products.controller">所有商品</a></li> -->
<!-- 								<li role="separator" class="divider"></li> -->
<!-- 								<li><a href="productsClick.controller">熱門商品</a></li> -->
<!-- 								<li role="separator" class="divider"></li> -->
<!-- 								種類 -->
<%-- 								<c:forEach items='${allProductSort}' var='productSort'> --%>
<!-- 									<li> -->
<%-- 									<a href="productsSort.controller?sortId=${productSort.sortId}">${productSort.sortName}</a> --%>
<!-- 									</li> -->
<!-- 									<li role="separator" class="divider"></li> -->
<%-- 								</c:forEach> --%>

<!-- 							</ul></li> -->
<!-- 						產品種類 -->

<!-- 						論壇 -->
<!-- 						<li class="dropdown "><a href="/themes/aviato/forum.html">論壇</a> -->
<!-- 						</li> -->
<!-- 						/ 論壇 -->

<!-- 						產品保固 -->
<!-- 						<li class="dropdown "><a href="memberOrder.controller">產品保固</a></li> -->
<!-- 						/ 產品保固 -->

<!-- 						Shop -->
<!-- 						<li class="dropdown dropdown-slide"><a -->
<!-- 							href="/themes/aviato/memberService.html">會員專區<span -->
<!-- 								class="tf-ion-ios-arrow-down"></span></a> -->
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li><a href="#!">個人帳戶管理</a></li> -->
<!-- 								<li><a href="#!">商品相關</a></li> -->
<!-- 								<li><a href="#!">客戶服務</a></li> -->
<!-- 							</ul></li> -->
<!-- 						/ Blog -->
<!-- 					</ul> -->
<!-- 					/ .nav .navbar-nav -->

<!-- 				</div> -->
<!-- 				/.navbar-collapse -->
<!-- 			</div> -->
<!-- 			<!-- / .container --> 
<!-- 		</nav> -->
<!-- 	</section> -->

	<section class="page-header" style="margin-top:0px;padding: 4px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Shop</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">Buy again</a></li>
							<li class="active">shop</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="products section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">

					<form action="selectbyname">
						<div>
							<!-- 模糊查詢 -->
							<h4 class="widget-title">品牌查詢</h4>
							<input id="txt_search" type="text"	style="height:34px;width:262.5px;margin: 0px;border: 1px solid #ccc; "placeholder="請輸入要查詢的產品名稱" name="inquire" />
							<div id="searchresult" style="display: none;"></div>
						</div>
					</form>

					<ul>
						<li role="separator" class="panel-body"></li>
					</ul>
					<div class="widget">
						<h4 class="widget-title">Short By</h4>
						<form action="/productsSort.controller" method="post">
							<select id="mySelect" class="form-control">
								<option value="0">商品種類</option>
								<!-- 種類 -->
								<c:forEach items='${allProductSort}' var='productSort'>
									<option value="${productSort.sortId}">${productSort.sortName}</option>
								</c:forEach>
							</select>
						</form>

					</div>
					<!-- 寫死的品牌 -->
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
				<!-- 所有商品 -->
				<div class="col-md-9">
					<div class="row">
						<table>
							<c:forEach items='${allProducts}' var='products'>
								<div class="col-md-4">
									<div class="product-item">
										<div class="product-thumb">
											<span class="bage">Sale</span> <img class="img-responsive"
												src="images/productimages/${products.img1}"
												alt="product-img" />
											<div class="preview-meta">
												<ul>
													<!-- 傳id給後端的ajax -->
													<li><span id="span_id_${products.productId}"
														data-toggle="modal" data-target="#product-modal"> <i
															class="tf-ion-ios-search-strong"></i>
													</span></li>

													<li><a href="#!"><i class="tf-ion-ios-heart"></i></a></li>
													<!-- 點擊跳購物車alert -->
													<li id="shoppingcart1"><a
														onclick="oncheck1(${products.productId})"><i
															class="tf-ion-android-cart"></i></a></li>
												</ul>
											
											</div>
										</div>
										<div class="product-content">
											<h4>
												<a href="product-single.html">${products.name}</a>
											</h4>
											<p class="price">$${products.unitPrice}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</table>
					</div>
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
										<div class="col-md-8 col-sm-6 col-xs-12">
											<!-- 										圖片 -->
											<div class="modal-image" id="big5">
												<img class="img-responsive" src="images/productimages/"
													alt="product-img" />
											</div>
											<!-- 										圖片 -->
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="product-short-details">

												<form name="productbig" id="productbig">
													<!-- 											商品名稱  -->
													<div id="big1">
														<h2 class="product-title"></h2>
													</div>
													<!-- 											價格  -->
													<div id="big2">
														<p class="product-price"></p>
													</div>
													<!-- 											內容 -->
													<div id="big3">
														<p class="product-short-description"></p>
													</div>
												</form>

												<a id="shoppingcart2" onclick="oncheck1(${products.productId})" class="btn btn-main">Add
													To Cart</a>
												<!-- 上面購物車方法一樣 -->
												<input type="hidden" id="big7" name="clickCount" value=""/>
												<form action="product.controller" method="post">
													<input type="hidden" id="big4" name="productId" value="" />
													<input type="submit" class="btn btn-transparent"
														value="View Product Details" />
												</form>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.modal -->

				</div>
			</div>

		</div>
		</div>
	</section>




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

	<!-- product-modal -->
	${products.productId}
	<script>
	<!-- 1是所有商品 種類從2開始 -->
		$("#mySelect").change(
				function() {
					var checkText = $("#mySelect").val();
					if (checkText > 0) {
						window.location.assign("productsSort.controller?sortId="
								+ checkText);
					} else
						window.location.assign("products.controller");
				});
	<!-- bootstrap 的方法 觸發 ajax -->
		$('#product-modal').on('show.bs.modal', function(e) {
			
			var button = e.relatedTarget;
			
			$.ajax({
				url : 'oneProduct.controller',
				type : 'POST',
				data : {
					productId : button.id
				},

				success : function(data) {

					console.log(data.name);
					var big1 = data.name;
					var big2 = data.unitPrice;
					var big3 = data.content;
					var big4 = data.productId;
					var big5 = data.img1;
					var big6 = data.productId;
					var big7 = data.clickCount;
					
					$("#big1").find('h2').html(big1);
					$("#big2").find('p').html(big2);
					$("#big3").find('p').html(big3);
					$("#big4").val(big4);
					$("#big5").find('img').attr("src", "images/productimages/" + big5);
					$("#shoppingcart2").attr('onclick','oncheck1('+big6+')');
					$("#big7").val(big7);
					
				}
			});
			
		});
		
		function oncheck1(id){
			
			$.ajax({
				url : 'insertshoppingcartdetail.controller1',
				type : 'POST',
				data :{
					productId : id,
					
				},
				success : function(data){
				
					alert("購物車成功"+data+"單筆商品");
				
					
				}
			})
			
			
			
		}
		
		
		
		
	</script>




</body>
</html>
