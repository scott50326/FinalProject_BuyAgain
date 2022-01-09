<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 會員專區</title>

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
<style type="text/css">
	#p{
		    color: #000000;
		    font-size: 16px;
	}
</style>

</head>

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">

	<jsp:include page="title.jsp" />
	<section class="page-header" style="margin-top:0px;padding: 4px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">會員專區</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">首頁</a></li>
							<li class="active">個人帳戶管理</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;">

		<div class="widget widget-category"
			style="margin-top: 100px; width: 250px;position:absolute;left: 100px">
			<div>
				<h3 class="tf-ion-android-person" style="text-align:left;font-size: 28px;margin-bottom: 20px;">&thinsp;個人帳戶</h3>
				<ul class="widget-category-list" style="text-align: left;font-size: 15px;margin-left: 20px;">
					<li><a style="font-size: 18px" href="/memberInformation?memberId=${memlogin.memberId}">個人資訊</a></li>
					<li><a style="font-size: 18px" href="/memberInformationUpdate.controller">修改會員資料</a></li>
					<li><a style="font-size: 18px" href="/memberPasswordUpdate.controller">更改密碼</a></li>
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

		<div>
			<div class="container">
				<div>
					<div class="container">
						<div class="row" class="row"
							style="margin-top: 100px; padding-left: 200px;">
							<div class="col-md-3" style="width: 800px">
								<div class="widget product-category">
<!-- 									<h4 style="font-size: 22px" class="widget-title">個人資訊</h4> -->
									<div class="dashboard-wrapper user-dashboard">
										<div class="table-responsive">
											<h4 style="font-size: 26px;text-align: center;padding: 0px;" class="widget-title">個人資訊</h4>
											<form class="text-left clearfix"
												action="/MembersImg.Controller" method="POST"
												enctype="multipart/form-data">

												<section class="user-dashboard page-wrapper"
													style="padding: 0px">
													<div>
														<div>
															<div>
																<div class="dashboard-wrapper dashboard-user-profile">
																	<div class="media">
																		<div class="pull-left text-center" href="#!">

																			<!--大頭貼上傳 -->
																		<div style="padding-left: 50px;padding-top: 25px">	
																			<div id="dropZone">
																				<c:choose>
																					<c:when
																						test="${members.img == null ||members.img == ''}">
																						<img id="img1" class="media-object user-img"
																							src="images/memberimages/member.jpg" alt="Image">
																					</c:when>

																					<c:when test="${members.img != null}">
																						<img id="img1" class="media-object user-img" />
																						<img id="img1" class="media-object user-img"
																							src="images/memberimages/${members.img}"
																							alt="Image">
																					</c:when>
																				</c:choose>
																			</div>
																			</div>
																			
																			<div style="display: none">
																				<input type="text" name="memberId"value="${members.memberId}" /> 
																				<input type="text"name="userId" value="${members.userId}" /> 
																				<input type="text" name="password"value="${members.password}" /> 
																				<input type="text"name="name" value="${members.name}" /> 
																				<input type="text" name="birthday"value="${members.birthday}" /> 
																				<input type="text"name="phone" value="${members.phone}" /> 
																				<input type="text" name="address"value="${members.address}" /> 
																				<input type="text"name="email" value="${members.email}" /> 
																				<input type="text" name="spend" value="${members.spend}" />
																				<input type="text" name="rank"value="${members.rank}" /> 
																				<input type="date"name="registerDate" value="${members.registerDate}" />
																			</div>


																		</div>

																		<div class="media-body">
																			<ul class="user-profile-list">
																				<li><p id="p"><b>姓 名 : ${members.name}</b></p></li>
																				<li><p id="p"><b>生 日 : ${members.birthday}</b></p></li>
																				<li><p id="p"><b>電 話 : ${members.phone}</b></p></li>
																				<li><p id="p"><b>住 址 : ${members.address}</b></p></li>
																				<li><p id="p"><b>信 箱 : ${members.email}</b></p></li>
																				<c:choose>
																					<c:when test="${members.rank == 1}">
																						<li><p id="p"><b>會員等級 : 銅</b></p></li>
																					</c:when>
																					<c:when test="${members.rank == 2}">
																						<li><p id="p"><b>會員等級 : 銀</b></p></li>
																					</c:when>
																					<c:when test="${members.rank == 3}">
																						<li><p id="p"><b>會員等級 : 金</b></p></li>
																					</c:when>
																					<c:when test="${members.rank == 4}">
																						<li><p id="p"><b>會員等級 : 白金</b></p></li>
																					</c:when>
																					<c:when test="${members.rank == 5}">
																						<li><p id="p"><b>會員等級 : 鑽石</b></p></li>
																					</c:when>
																				</c:choose>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
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