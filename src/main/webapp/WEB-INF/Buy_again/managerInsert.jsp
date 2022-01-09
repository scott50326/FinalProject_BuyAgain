<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 管理員新增</title>

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
<jsp:include page="managertitle.jsp" />

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;background-color:#ffffffb0;border:0px">
          <h2 class="text-center">管理員新增</h2>
          <form class="text-left clearfix" action="insertmanager2.controller" method="post" enctype="multipart/form-data">
          	
			
            <div class="form-group">
            	<p style="font-size: 15px"><b>帳號 :</b>
              	<input type="text" class="form-control" name="userId" placeholder="寫你要的格式" value="Manager${newId}" readonly="readonly">
            </div>
            <div class="form-group">
            	<p style="font-size: 15px"><b>請輸入密碼 :</b>
              	<input type="password" class="form-control" name="password" id="password" placeholder="寫你要的格式">
            </div>
            <div class="form-group">
            	<p style="font-size: 15px"><b>請輸入姓名 :</b>
              	<input type="text" class="form-control" name="name" id="name"  placeholder="寫你要的格式">
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center">完成新增</button>
              <button type="button" class="btn btn-main text-center" onclick='autoinput1();'>一鍵輸入</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

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
    <script>
  //一鍵輸入
	function autoinput1() {
		$("#password").val("Do!ng123");
		$("#name").val("Kitty");
	}
    
    </script> 


  </body>
  </html>