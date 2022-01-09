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
<script type="text/javascript">
	function sendMemberinformation() {

		var params = {}

		params["memberId"] = $("input[name='memberId']").val();
		params["userId"] = $("input[name='userId']").val();
		params["password"] = $("input[name='password']").val();
		params["name"] = $("input[name='name']").val();
		params["birthday"] = $("input[name='birthday']").val();
		params["phone"] = $("input[name='phone']").val();
		params["address"] = $("input[name='address']").val();
		params["email"] = $("input[name='email']").val();
		params["picture"] = $("input[name='picture']").val();
		params["registerDate"] = $("input[name='registerDate']").val();
		params["spend"] = $("input[name='spend']").val();
		params["rank"] = $("input[name='rank']").val();
		console.log(params);

		$.ajax({
			type : 'post',
			url : 'AjaxMember.controller',
			dataType : 'JSON',
			contentType : 'application/json',
			data : JSON.stringify(params),
			success : function(data) {
				console.log(data);
				window.location.href = "/memberInformation";//需要跳轉的地址
			}
		});

	}
</script>
<style type="text/css">
#inp{
	height:35px;
	width:200px;
	margin: 0px;
	border: 1px solid #00000070;
	font-size: 15px;
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

<!-- 	 -->
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
									
									<div class="dashboard-wrapper user-dashboard">
										<div class="table-responsive">
<h4 style="font-size: 26px;text-align: center;padding: 0px;" class="widget-title">修改個人資料</h4>
											<form class="text-left clearfix"
													action="updatemember3.controller" method="POST"
													enctype="multipart/form-data">

												<section class="user-dashboard page-wrapper" style="padding: 0px">
													<div>
														<div>
															<div>
																<div class="dashboard-wrapper dashboard-user-profile">
																	<div class="media">
																		<div class="pull-left text-center" href="#!">

																			<!--大頭貼上傳 -->
																			<div style="padding-left: 50px;padding-top: 50px">
																			<div id="dropZone">
																				<c:choose>
																<c:when test="${memlogin.img == null ||members.img == ''}">
																	<img id="img1" class="media-object user-img"
																		src="images/memberimages/member.jpg" alt="Image">
																</c:when>

																<c:when test="${members.img != null}">
<!-- 																	<img id="img1" class="media-object user-img" /> -->
																	<img id="img1" class="media-object user-img" src="images/memberimages/${members.img}" alt="Image">
																</c:when>
															</c:choose>

															<div style="display: none;">
																<input type="file" id="file1" name="picture"
																	multiple="multiple" onchange="fileViewer();"
																	value="" /><br />
															</div>
															<div class="xyzFileUpSel">
																<button style="border: 1px solid #cccccc;" type="button" class="btn btn-outline-dark">選擇大頭貼</button>
															</div>
														</div>
														</div>
																			<div style="display: none">
																					<input type="text" name="memberId"value="${members.memberId}" /> 
																					<input type="text" name="password"value="${members.password}" /> 
																					<input type="text" name="spend" value="${members.spend}" />
																					<input type="text" name="rank"	value="${members.rank}" />  
																					<input type="date" name="registerDate" value="${members.registerDate}" />
																			</div>


																		</div>

																		<div style="text-align:center" class="media-body">
															<ul class="user-profile-list">
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">帳&emsp;號&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="userId"	readonly="readonly" value="${members.userId}" />
																</li>
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">姓&emsp;名&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="name"	value="${members.name}" />
																</li>
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">生&emsp;日&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="birthday" value="${members.birthday}" />
																</li>
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">電&emsp;話&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="phone"	value="${members.phone}" />
																</li>
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">住&emsp;址&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="address" value="${members.address}" />
																</li>
																<li style="margin-bottom:13px">
																	<label style="font-size: 16px;">信&emsp;箱&thinsp;:&thinsp;</label>
																	<input id="inp" type="text" name="email"	value="${members.email}" />
																</li>
															</ul>
														</div>
														<div style="text-align:center">
														<button style="font-size: 15px;margin: 28px;" type="submit" class="btn btn-main btn-small btn-round">確認修改</button>
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

<!-- 	 -->


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