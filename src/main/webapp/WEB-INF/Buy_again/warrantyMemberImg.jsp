<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 發票上傳</title>

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



		<div class="container">
			<div class="row" style="padding-top: 100px;">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center" style="margin: 0px;">
						<h2 class="text-center">發票上傳</h2>
						<form class="text-left clearfix" action="warrantyimg2.controller"
							method="POST" enctype="multipart/form-data">

							<!--大頭貼上傳 -->
							<div style="text-align: center;">

								<div id="dropZone">
								
									<img id="img1" src="/images/warrantyimages/defaultpicture.jpg"
										style="height: 300px; width: 300px;" />
								</div>
				
								<div style="display: none;">
									<input type="file" id="file1" name="picture"
										multiple="multiple" onchange="fileViewer();" value="${pic}" /><br />
								</div>
								<div class="xyzFileUpSel">
									<button type="button" class="btn btn-outline-dark" style="border: 1px solid #000000;margin-top:10px;    padding: 7px 120px;"><b>選擇發票</b></button>
								</div>
							</div>
<!-- 							<div class="A"> -->
<!-- 							<p style="font-size: 15px"> -->
<!-- 								<b>產品:</b> <input type="text" readonly="readonly" -->
<%-- 									class="btn btn-outline-dark" Value="${mbb.memberBean.memberId}"> --%>
<!-- 						</div> -->
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center" style="margin: 50px;">確認上傳</button>
							</div>

							<input type="hidden" class="form-control" name="warrantyInfoId"
								placeholder="1" value="${invoice}">

						</form>
						



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
		document.getElementById("file1").addEventListener("change", fileViewer);

		function fileViewer() {
			//取得使用者在檔案選擇標籤中選取檔案

			//1. 建立FileReader物件
			let reader = new FileReader();
			//3.onload資料讀取成功完成時觸發
			reader.addEventListener("load", function(e) {
				//4. 將檔案內容暫存
				let fileContent = e.target.result;
				//5. 建立img標籤
				let show = document.getElementById("img1");
				//6. 設定img的src屬性
				show.setAttribute("src", fileContent);
				//7. 設定img的class屬性

				//8. 將 img 物件新增到div標籤後

			});
			//2. 使用readAsDataURL方法，讀取檔案內容
			let file = document.getElementById("file1").files[0];
			reader.readAsDataURL(file);

		}

		$('.xyzFileUpSel').click(function() {
			document.getElementById("file1").click();
			//$("#xyzFileUp").click();
		});
	</script>


</body>
</html>