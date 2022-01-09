<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 新增商品</title>

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
        <div class="block text-center" style="margin: 0px;">
          <h2 class="text-center">新增商品</h2>
          <form class="text-left clearfix" action="insertproduct2.controller" method="post" enctype="multipart/form-data">
          	
			<!--商品圖片上傳1 -->
          	<div style="height:300px; width:300px; position:absolute; top:0px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img1" src="/images/productimages/defaultpicture.jpg" style="height:150px; width:150px;"/>
    			</div>
   				<div  style="display: none;">
   					<input type="file" id="file1" name="picture1" multiple="multiple" onchange="fileViewer();" value="${pic}"/><br/>
    			</div>
    				<div class="xyzFileUpSel">
						<button type="button" class="btn btn-outline-dark">選擇第1張商品圖片</button>
					</div>
            </div>
            
            <!--商品圖片上傳2 -->
            <div style="height:300px; width:300px; position:absolute; top:200px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img2" src="/images/productimages/defaultpicture.jpg" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file2" name="picture2" multiple="multiple" onchange="fileViewer2();" value="${pic}"/><br/>
    			</div>
    				<div class="xyzFileUpSel2">
						<button type="button" class="btn btn-outline-dark">選擇第2張商品圖片</button>
					</div>
            </div>
            <!--商品圖片上傳3 -->
            <div style="height:300px; width:300px; position:absolute; top:400px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img3" src="/images/productimages/defaultpicture.jpg" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file3" name="picture3" multiple="multiple" onchange="fileViewer3();" value="${pic}"/><br/>
    			</div>
    				<div class="xyzFileUpSel3">
						<button type="button" class="btn btn-outline-dark">選擇第3張商品圖片</button>
					</div>
            </div>
            
            
            <div class="form-group">
             	<input type="text" class="form-control" name="name" id="name" placeholder="商品名稱">
            </div>
            <div class="form-group">
            	<select name="sortId" style="width: 493px;    height: 45px;">
	            	<c:forEach var='sort' items='${allproductsorts}'>
	            	<option value="${sort.sortId}">${sort.sortName}</option>
	            	</c:forEach>
            	</select>
            </div>
            <div class="form-group">
             	<input type="text" class="form-control" name="unitPrice" id="unitPrice" placeholder="商品單價">
            </div>
            <div class="form-group">
             	<input type="text" class="form-control" name="quantity" id="quantity" placeholder="商品數量">
            </div>
            <div class="form-group">
<!--              	<input type="text" class="form-control" name="content" id="content" placeholder="商品介紹"> -->
             	<textarea style="border: 1px solid #979393;" rows="6" cols="70" name="content" id="content" placeholder="商品介紹"></textarea>
            </div>
            <div class="text-center">
             	<button type="submit" class="btn btn-main text-center">註冊</button>
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
    	//商品1
    	//取得使用者在檔案選擇標籤中選取檔案
        document.getElementById("file1").addEventListener("change", fileViewer);
        function fileViewer() {
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
 
        
      //商品2
    	//取得使用者在檔案選擇標籤中選取檔案
        document.getElementById("file2").addEventListener("change", fileViewer2);
        function fileViewer2() {
            //1. 建立FileReader物件
            let reader= new FileReader();
            //3.onload資料讀取成功完成時觸發
            reader.addEventListener("load", function (e) {
                //4. 將檔案內容暫存
                let fileContent = e.target.result;
                //5. 建立img標籤
                let show = document.getElementById("img2");
                //6. 設定img的src屬性
                show.setAttribute("src",fileContent);
                //7. 設定img的class屬性
                //8. 將 img 物件新增到div標籤後
            });
            //2. 使用readAsDataURL方法，讀取檔案內容
            let file =document.getElementById("file2").files[0];
            reader.readAsDataURL(file);
        }
        $('.xyzFileUpSel2').click(function () {
            document.getElementById("file2").click();
            //$("#xyzFileUp").click();
        });
        
      //商品2
    	//取得使用者在檔案選擇標籤中選取檔案
        document.getElementById("file3").addEventListener("change", fileViewer3);
        function fileViewer3() {
            //1. 建立FileReader物件
            let reader= new FileReader();
            //3.onload資料讀取成功完成時觸發
            reader.addEventListener("load", function (e) {
                //4. 將檔案內容暫存
                let fileContent = e.target.result;
                //5. 建立img標籤
                let show = document.getElementById("img3");
                //6. 設定img的src屬性
                show.setAttribute("src",fileContent);
                //7. 設定img的class屬性
                //8. 將 img 物件新增到div標籤後
            });
            //2. 使用readAsDataURL方法，讀取檔案內容
            let file =document.getElementById("file3").files[0];
            reader.readAsDataURL(file);
        }
        $('.xyzFileUpSel3').click(function () {
            document.getElementById("file3").click();
            //$("#xyzFileUp").click();
        });
        
      //一鍵輸入
		function autoinput1() {
    		$("#name").val("Beats Solo3 Wireless 頭戴式耳機");
    		$("#unitPrice").val("6990");
    		$("#quantity").val("3");
    		$("#content").val("提供最長可達 40 小時的電池續航力，Beats Solo3 Wireless 是最適合你日常使用的完美耳機。採用 Fast Fuel 技術，充電 5 分鐘即可播放 3 小時的音樂。備受獎項肯定的 Beats 音質加上 Class 1 藍牙技術，讓你享受無線聆聽的自由。可調整的耳罩式軟墊耳罩，可依你的個人需要調整貼合，即使全天配戴也能無比舒適。");
    	}
    </script> 


  </body>
  </html>