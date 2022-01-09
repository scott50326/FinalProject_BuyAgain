<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 商品修改</title>

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
          <h2 class="text-center">商品修改</h2>
          <form class="text-left clearfix" action="updateproduct2.controller" method="post" enctype="multipart/form-data">
          	
			<!--商品圖片上傳1 -->
          	<div style="height:300px; width:300px; position:absolute; top:0px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img1" src="/images/productimages/${product.img1}" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file1" name="picture1" multiple="multiple" onchange="fileViewer();" value="${pic1}"/><br/>
    			</div>
    				<div class="xyzFileUpSel">
						<button style="border: 1px solid #cccccc;padding: 6px 4px;" type="button" class="btn btn-default">選擇第1張商品圖片</button>
					</div>
            </div>
            <!--商品圖片上傳2 -->
            <div style="height:300px; width:300px; position:absolute; top:200px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img2" src="/images/productimages/${product.img2}" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file2" name="picture2" multiple="multiple" onchange="fileViewer2();" value="${pic2}"/><br/>
    			</div>
    				<div class="xyzFileUpSel2">
						<button style="border: 1px solid #cccccc;padding: 6px 4px;" type="button" class="btn btn-default">選擇第2張商品圖片</button>
					</div>
            </div>
            <!--商品圖片上傳3 -->
            <div style="height:300px; width:300px; position:absolute; top:400px; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img3" src="/images/productimages/${product.img3}" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file3" name="picture3" multiple="multiple" onchange="fileViewer3();" value="${pic3}"/><br/>
    			</div>
    				<div class="xyzFileUpSel3">
						<button style="border: 1px solid #cccccc;padding: 6px 4px;" type="button" class="btn btn-default">選擇第3張商品圖片</button>
					</div>
            </div>
            
            <div class="form-group">
              	<input type="text" class="form-control" name="productId" placeholder="商品標號" value="${product.productId}" readonly="readonly">
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="name" placeholder="商品名稱" value="${product.name}">
            </div>
            <div class="form-group">
            	<select name="sortId" style="width: 493px;height: 40px">
	            	<c:forEach var='sort' items='${allproductsorts}'>
	            		<c:if test="${sort.sortId == product.productSortBean.sortId}">
		            	<option value="${sort.sortId}" selected="selected">${sort.sortName}</option>
		            	</c:if>
		            	<c:if test="${sort.sortId != product.productSortBean.sortId}">
		            	<option value="${sort.sortId}">${sort.sortName}</option>
		            	</c:if>
	            	</c:forEach>
            	</select>
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="unitPrice" placeholder="商品單價" value="${product.unitPrice}">
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="quantity" placeholder="商品數量" value="${product.quantity}">
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="buyCount" placeholder="已購數量" value="${product.buyCount}">
            </div>
            <div class="form-group">
              	<textarea style="width: 493px;height:100px " class="form-control" name="content" placeholder="商品介紹" >${product.content}</textarea>
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="clickCount" placeholder="點擊次數" value="${product.clickCount}">
            </div>
            <div class="form-group">
              	<input type="text" class="form-control" name="onSale" placeholder="是否特價" value="${product.onSale}">
            </div>
            <div class="text-center">
              	<button type="submit" class="btn btn-main text-center">修改完成</button>
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
        });
        
      //商品3
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
        });
    </script> 


  </body>
  </html>