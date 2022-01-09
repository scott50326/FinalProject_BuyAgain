<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">

<!--菜單連結-->
<jsp:include page="title.jsp" />

<section class="user-dashboard page-wrapper" style="background-color:#ffffffb0">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th style="padding: 16px;text-align: center;font-size: 20px;width: 300px"><b>個人帳戶管理</b></th>
									<th style="padding: 16px;text-align: center;font-size: 20px;width: 300px"><b>商品相關</b></th>
									<th style="padding: 16px;text-align: center;font-size: 20px;width: 300px"><b>客戶服務</b></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="memberInformation?memberId=${memlogin.memberId}">個人資訊</a></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="/memberOrder.controller">訂單查詢</a></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">線上客服</a></td>
								</tr>
								<tr>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="/memberInformationUpdate.controller">會員資料修改</a></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="Warrantyinsert1.controller">商品註冊</a></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="commonProblem2.controller">常見Q&A</a></td>
								</tr>
								<tr>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="/memberPasswordUpdate.controller">密碼修改</a></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="WarrantyfindMember.controller2">商品保固查詢</a></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td style="padding: 16px;text-align: center;font-size: 18px;"><a href="RMAfindMember.controller">RMA維修查詢</a></td>
									<td></td>
								</tr>
							</tbody>
						</table>
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
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    


  </body>
  </html>