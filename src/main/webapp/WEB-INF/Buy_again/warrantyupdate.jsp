<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 商品相關</title>

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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">


</head>
</head>

<body id="body" background="/images/background.png"
	style="background-attachment: fixed;">
	<!--菜單連結-->
	<jsp:include page="managertitle.jsp" />
	<div id="commonProblem">
		<div style="margin-top: 50px; width: 150PX;" class="refresh">
			<div class="container">
				<div class="row">
					<section class="signin-page account">
						<div class="container">
							<div class="row">
								<div class="col-md-6 col-md-offset-3" style="margin-left: 40%;">
									<div class="block text-center" style="margin: 0px;">
										<h2 class="text-center">註冊產品修改頁面</h2>
										<form class="text-left clearfix"
											action="updatewarranty.controller2" method="Post"
											enctype="multipart/form-data">

											<!--大頭貼上傳 -->
											<div
												style="height: 400px; width: 400px; position: absolute; top: 100; right: 550px; text-align: center">

												<!-- 													<div id="dropZone"> -->
												<!-- 														<img id="img1" -->
												<!-- 															src="/images/memberimages/defaultpicture.jpg" -->
												<!-- 															style="height: 150px; width: 150px;" /> -->
												<!-- 													</div> -->

												<div style="display: none;">
													<input type="file" id="file1" name="picture"
														multiple="multiple" onchange="fileViewer();"
														value="${pic}" /><br />
												</div>
												<!-- 													<div class="xyzFileUpSel"> -->
												<!-- 														<button type="button" class="btn btn-outline-dark">上傳發票</button> -->
												<!-- 													</div> -->
											</div>
											<c:forEach items="${mbbb}" var="mbbb">
												<div class="form-group">
													<p style="font-size: 15px">
														<b>帳號 :</b> <input type="text" class="form-control"
															name="userId" placeholder=""
															value="${mbbb.memberBean.userId}" readonly="readonly">
												</div>

												<div class="form-group">
													<p style="font-size: 15px">
														<b>商品圖片 :</b> <img
															src="images/productimages/${mbbb.productBean.img1}"
															width='100' height='100'>
												</div>

												<div class="form-group">
													<p style="font-size: 15px">
														<b>商品名稱 :</b> <input type="text" class="form-control"
															name="userId" placeholder=""
															value="${mbbb.productBean.name}" readonly="readonly">
												</div>

												<div class="form-group">
													<p style="font-size: 15px">
														<b>會員電話 :</b> <input type="text" class="form-control"
															name="userId" placeholder=""
															value="${mbbb.memberBean.phone}" readonly="readonly">
												</div>

												<div class="form-group">
													<p style="font-size: 15px">
														<b>會員信箱 :</b> <input type="text" class="form-control"
															name="userId" placeholder=""
															value="${mbbb.memberBean.email}" readonly="readonly">
												</div>

												<div class="form-group">
													<p style="font-size: 15px">
														<b>會員地址 :</b> <input type="text" class="form-control"
															name="userId" placeholder=""
															value="${mbbb.memberBean.address}" readonly="readonly">
												</div>

												<!-- 												<div class="form-group"> -->
												<!-- 													<p style="font-size: 15px"> -->
												<!-- 														<b>產品型號 :</b> <input type="text" class="form-control" -->
												<!-- 															name="name" placeholder="寫你要的格式" value=""> -->
												<!-- 												</div> -->
												<div class="form-group">
													<p style="font-size: 15px">
														<b>產品序號 :</b> <input type="text" class="form-control"
															name="productregisterid" readonly="readonly"
															value="${mbbb.registerid}">
												</div>
												<div class="form-group">
													<p style="font-size: 15px;">
														<b>註冊日期</b> 
														<input type="text" id="bday" style="width: 493px;height: 45px;"
															name="registerStart" readonly="readonly"
															value="${mbbb.registerStart }">
												</div>


												<div class="form-group">
													<p style="font-size: 15px">
														<b>保固結束日期 
														<input type="date" id="bday" style="width: 493px;height: 45px;"
															name="registerFinish" required
															pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}">
												</div>
												<div class="form-group">
													<p style="font-size: 15px">
														<input type="hidden" class="form-control"
															name="registerStatus" placeholder=""
															value="${mbbb.registerStatus}">
												</div>
												<div class="form-group">
													<p style="font-size: 15px">
														<b></b> <input type="hidden" class="form-control"
															name="fk_memberid" placeholder=""
															value="${mbbb.memberBean.memberId}">
												</div>
												<div class="form-group">
													<p style="font-size: 15px">
														<b></b> <input type="hidden" class="form-control"
															name="fk_productId" placeholder=""
															value="${mbbb.productBean.productId}">
												</div>
									</div>
									<div class="form-group">
										<p style="font-size: 15px">
											<b></b> <input type="hidden" class="form-control"
												name=warrantyInfoId placeholder=""
												value="${mbbb.warrantyInfoId}">
									</div>
									<div class="form-group">
										<p style="font-size: 15px">
											<b></b> <input type="hidden" class="form-control"
												name=pekoinvoice placeholder="" value="${mbbb.invoice}">
									</div>
									<div class="form-group">
										<p style="font-size: 15px">
											<b></b> <input type="hidden" class="form-control" name=pekoid
												placeholder="" value="${mbbb.registerid}">
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-main text-center">進行修改</button>
									</div>

									</c:forEach>
									</form>
								</div>
							</div>
						</div>
				</div>

			</div>
		</div>
	</div>




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