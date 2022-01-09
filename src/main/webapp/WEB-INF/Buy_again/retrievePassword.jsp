<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy again | 忘記密碼</title>

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

<body id="body" background="/images/background.png" style=" background-attachment: fixed;">

<!--菜單連結-->
<jsp:include page="title2.jsp" />
<section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="text-align: center;">
        	<i style="background: black;margin-bottom: 30px" class="tf-ion-ios-email-outline"></i>
         	 
         	 <form action="/register2" method="post">
         	  <div class="form-group">
            	<label style="font-size: 16px;margin: 0px">請輸入信箱&ensp;:</label>
              	<input style="height:35px;width: 410px;float: right;" type="email" class="form-control" name="email" id="email" placeholder="信箱">
              	<span style="color: red">${errors.mail}</span>
            </div>
            
            
            <div class="text-center" style="margin-top:50px">
              	<button type="submit" class="btn btn-main btn-small btn-round">找回密碼</button>
              	<a href="homepage.controller" class="btn btn-main btn-small btn-round">回首頁</a>
            </div>
          
          	</form>
          
        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->
</body>
</html>