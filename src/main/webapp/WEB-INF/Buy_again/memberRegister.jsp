<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 註冊帳號</title>

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

<body id="body" background="/images/background.png" style=" background-attachment: fixed;">
<!--菜單連結-->
<jsp:include page="title.jsp" />

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;background-color:#ffffffb0;border:0px">
          <h2 class="text-center">創建您的帳戶</h2>
          <form class="text-left clearfix" action="register" method="post" enctype="multipart/form-data">
          	
			<!--大頭貼上傳 -->
          	<div style="height:300px; width:300px; position:absolute; top:100; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img1" src="/images/memberimages/defaultpicture.jpg" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file1" name="picture" multiple="multiple" onchange="fileViewer();" /><br/>
    			</div>
    				<div class="xyzFileUpSel">
						<button style="border: 1px solid #cccccc;" type="button" class="btn btn-outline-dark"><b>選擇大頭貼</b></button>
					</div>
            </div>
            <div class="form-group">
            	<label>請輸入帳號&ensp;:</label>
              	<input type="text" class="form-control" name="userId" id="userId" placeholder="帳號">
              	<span style="color: red">${errors.uid}</span>
            </div>
            <div class="form-group">
            	<label>請輸入密碼&ensp;:</label>
              	<input type="password" class="form-control" name="password"  id="password" placeholder="密碼">
              	<span style="color: red">${errors.pwd}</span>
            </div>
            <div class="form-group">
            	<label>請輸入姓名&ensp;:</label>
              	<input type="text" class="form-control" name="name" id="name" placeholder="姓名">
              	<span style="color: red">${errors.na}</span>
            </div>
            <div class="form-group">
           	 	<label>請輸入生日&ensp;:</label>
              	<input type="Date" class="form-control" name="birthday"  placeholder="生日">
              	<span style="color: red">${errors.bi}</span>
            </div>
            <div class="form-group">
            	<label>請輸入電話&ensp;:</label>
              	<input type="text" class="form-control" name="phone" id="phone" placeholder="電話">
              	<span style="color: red">${errors.ph}</span>
            </div>
            <div class="form-group">
            	<label>請輸入地址&ensp;:</label>
              	<input type="text" class="form-control" name="address" id="address" placeholder="地址">
              	<span style="color: red">${errors.ad}</span>
            </div>
            <div class="form-group">
            	<label>請輸入信箱&ensp;:</label>
              	<input type="email" class="form-control" name="email" id="email" placeholder="信箱">
              	<span style="color: red">${errors.em}</span>
            </div>
            <div class="text-center">
              	<button type="submit" class="btn btn-main text-center">註冊</button>
              	<button type="button" class="btn btn-main text-center" onclick='quickInput();'>一鍵輸入</button>
            </div>
          </form>
          <p class="mt-20"><b>已經有帳戶了?<a href="memberlogin.controller">登入</a></b></p>
          <p><a href="/retrievePassword.controller"><b>忘記密碼?</b></a></p>
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
        document.getElementById("file1").addEventListener("change", fileViewer);

        function fileViewer() {
            //取得使用者在檔案選擇標籤中選取檔案

            //1. 建立FileReader物件
            let reader= new FileReader();
            //3.onload資料讀取成功完成時觸發
            reader.addEventListener("load", function (e) {
                //4. 將檔案內容暫存
                let fileContent = e.target.result;
                //5. 建立img標籤
                let show = document.getElementById("img1");
                //6. 設定img的src屬性
                show.setAttribute("src",fileContent);
                //7. 設定img的class屬性

                //8. 將 img 物件新增到div標籤後

            });
            //2. 使用readAsDataURL方法，讀取檔案內容
            let file =document.getElementById("file1").files[0];
            reader.readAsDataURL(file);

        }
        
        $('.xyzFileUpSel').click(function () {
            document.getElementById("file1").click();
            //$("#xyzFileUp").click();
        });
        
      //一鍵輸入
let no = 1000;
let index = 0;
var names= ["張君雅", '成佳英', '姜哲', '曹尚佑', '吳一男', '張德秀',  '韓美女'];
var expers= [0, 1, 2, 218, 1, 101,  212];
function quickInput(){
	document.getElementById('userId').value = 'A' + no + index;
	document.getElementById('password').value = 'jp3su32k7g6c';
	document.getElementById('name').value = names[index];
// 	document.getElementById('birthday').value = '2021/11/04';
	document.getElementById('phone').value = '0939558111';
 	document.getElementById('address').value = '台北市大安區信義路三段153號';
	document.getElementById('email').value = 'buyagain134@gmail.com';
	
	index++;
    if (index >= names.length) {
    	index = 0 ;
	}
	
}  
        
    </script> 


  </body>
  </html>