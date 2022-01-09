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


	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Cart</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">Home</a></li>
							<li class="active">cart</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>



	<div class="page-wrapper">
		<div class="cart shopping">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="block">
							<div class="product-list">

								<form name="shopping" action="payment.controller" method="post" id="pay">
									<table class="table">
										<thead>
											<tr>
												<th class="">Item</th>
												<!--類別-->
												<th class="">Sure</th>
												<!--勾勾-->
												<th class="">Name</th>
												<!--商品名稱-->
												<th>增加</th>
												<th class="">Quantity</th>
												<!--數量-->
												<th>減少</th>
												<th class="">Price</th>
												<!--價格-->
												<th class="">Subtotal</th>
												<!--小計-->
												<th class="">Actions</th>
												<!--刪除-->
											</tr>
										</thead>

										<tbody>

											<c:forEach items="${allProducts}" var="shoppingcart"
												varStatus="loop">
												<tr class="">
													<td id="num">${loop.count}</td>
													<td><input type="checkbox"
														id="checkbox${shoppingcart.productBean.productId}"
														name="checkbox" value=""
														onclick="oncheck(${shoppingcart.productBean.productId},${shoppingcart.productBean.quantity})" /></td>

													<td class="">
														<div class="product-info">
															<!-- 圖片 -->
															<img width="80"
																src="images/productimages/${shoppingcart.productBean.img1}"
																alt="" /> <a href="#!">${shoppingcart.productBean.name}</a>
														</div>
													</td>
													<td><input type="button"
						
														onclick="updateup(${shoppingcart.productBean.productId},${shoppingcart.quantity},'+')"
														value="+" /></td>
													<td><input style="height: 34px; width: 80px" readonly="readonly"
														id="product-quantity${shoppingcart.productBean.productId}"
														type="text" value="${shoppingcart.quantity}" /></td>
													<td><c:if test="${shoppingcart.quantity >1}"><input type="button"  value="-"
													onclick="updateup(${shoppingcart.productBean.productId},${shoppingcart.quantity},'-')"/>
													</c:if></td>
													<!-- 														<input -->
													<%-- 														type="checkbox" id="checkbox1${shoppingcart.productBean.productId}"  --%>
													<%-- 														onclick="oncheck1(${shoppingcart.productBean.productId})" /> --%>
													<%-- 														<a class="product-remove" id="updateshop${shoppingcart.productBean.productId}" --%>
													<!-- 														href="#">更新數量</a> -->
													<td class=""
														id="unitPrice${shoppingcart.productBean.productId}">${shoppingcart.productBean.unitPrice}</td>
													<td class=""
														id="smallTotal${shoppingcart.productBean.productId}">${shoppingcart.totalPrice}</td>
													<td class=""><a class="product-remove" onclick="oncheck3(${shoppingcart.productBean.productId})"
														href="deleteshoppingcartdetail.controller?shoppingcartDetailId=${shoppingcart.shoppingcartDetailId}">Remove</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<p>
										總金額: <span id="total">0</span>
									<p />
									<input type="button" onclick="oncheck4()" class="btn btn-main pull-right" value="Checkout"/>
								</form>
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
	
	function oncheck(id,productQuantity){
		var flag = $("#checkbox"+id+"").prop("checked");
			if(flag ==true){

			  var quantity = document.getElementById("product-quantity"+id).value;
			  if(quantity>productQuantity){
				
				$("#checkbox"+id+"").prop('checked',false);
				alert("數量超過");
			return;
			  }
			  var unitPrice = document.getElementById("unitPrice"+id).innerHTML;		
		  var smt = document.getElementById("smallTotal"+id).innerHTML;
			  var total =parseInt( $("#total").html()) + parseInt($("#smallTotal"+id).html());			
			  $("#total").html(total);			
			  var productquantity = document.getElementById("product-quantity"+id).value;
			  var cc = $("#checkbox"+id).val(id+":"+productquantity+":"+smt);
			  console.log(cc);
			}else{
				var total =parseInt( $("#total").html()) - parseInt($("#smallTotal"+id).html());
				$("#total").html(total);
			
			}			
		};
		function updateup(id,quantity,status){		
				$.ajax({
					url : 'updateshoppingcartdetail.controller',
					type : 'POST',
					data :{
						fk_productId : id,
						quantity : quantity,
						status : status
					},	
					success : function(data){
						
						window.location.reload();
					}
				})
	  }
		
	function oncheck3(id){
		var yes = confirm('確定刪除商品嗎？');

		if (yes) {
		    alert('確定刪除');
		} else {
		    alert('取消刪除');
		    event.preventDefault();
		    
		}
		
	}
	
	function oncheck4(){
		var yes = confirm('確定送出訂單嗎？');
		var total = $('#total').html();
			if (yes) {
				if(total==0){
				alert("尚未選取商品")
				return
				}
			$('#pay').submit();
			} else {
				alert('取消');
				event.preventDefault();
			}
	}
		
		
// 		function oncheck1(id){
// 			var quantity1 = document.getElementById("product-quantity"+id).value;

// 			alert(quantity1);
// 			alert(id);
// 			$("#updateshop"+id).attr("href","updateshoppingcartdetail.controller?quantity=" + quantity1 +"productId="+id);
// 		}
		
		
		
// 			function check(chk)
// 		{
// 		  var checkboxs = document.getElementsByName(checkbox);
// 		    for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;}
// 		}
			
			
		
	</script>
</body>
</html>
