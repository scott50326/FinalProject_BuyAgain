<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 管理員登入</title>

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


<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="title.jsp" />
   
<section class="signin-page account" style="height: 10px;">
  <div class="container">
    <div class="row" >
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;background-color: #c0bdbd82;">
          <!-- <a class="logo" href="index.html">
            <img src="images/messageImage_1635082176618.jpg" alt="">
          </a> -->
          <h2 class="text-center">管理員登入</h2>
          <form class="text-left clearfix" action="managerchecklogin.controller" method="post">
            <div class="form-group">
            	<label>請輸入帳號&ensp;:</label>
              	<input type="text" class="form-control" name="userId" placeholder="帳號" id="userId">
              	<span style="color: red;">${errors.name}</span>
            </div>
            <div class="form-group">
            	<label>請輸入密碼&ensp;:</label>
              	<input type="password" class="form-control" name="userPwd" placeholder="密碼" id="userPwd">
              	<i id="checkEye" style="  position: absolute; top: 61%;font-size: 20px;right: 60px" class="tf-ion-eye-disabled"></i>
              	<span style="color: red;">${errors.pwd}</span>
            </div>
            <div class="text-center">
              <button style="font-size: 15px;padding: 7px 35px;" type="submit" class="btn btn-main text-center" >登入</button>
              	<br><span style="color: red;">${errors.msg}</span>
            </div>
            <div style="padding: 10px;" class="text-center">
            	<a class="btn btn-default" onclick="autoinput1()"><i class="tf-pencil2" aria-hidden="true">一鍵輸入(1)</i></a></td>
            	<a class="btn btn-default" onclick="autoinput2()"><i class="tf-pencil2" aria-hidden="true">一鍵輸入(2)</i></a></td>
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
    
	<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
	</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->
    
    <script type="text/javascript">
    
    	function autoinput1() {
    		$("#userId").val("Manager1");
    		$("#userPwd").val("Do!ng123");
    	}
    	
    	function autoinput2() {
    		$("#userId").val("Manager2");
    		$("#userPwd").val("Do!ng123");
    	}
    
    	$("#checkEye").click(function () {
  		  if($(this).hasClass('tf-ion-eye-disabled')){
  		     $("#userPwd").attr('type', 'text');
  		  }else{
  		     $("#userPwd").attr('type', 'password');
  		  }
  		  $(this).toggleClass('tf-ion-eye-disabled').toggleClass('tf-ion-eye');
  		}); 
    </script>

  </body>
  </html>