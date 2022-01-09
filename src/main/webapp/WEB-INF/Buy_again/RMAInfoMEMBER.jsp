<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller RMA</title>

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
  
  <style type="text/css">
/* 	input{ */
/* 		width: 90px; */
/* 		height: 40px; */
/* 		text-align: center; */
/* 	} */
	.email, .regisDate{
		width: 200px;
	}
/* 	table, tr, th, td{ */
/* 		margin: 10px auto; */
/* 		text-align: center; */
/* 	} */
/* 	button{ */
/* 		width: 50px; */
/* 	} */
	#add{
		width: 100px;
	}
	img{
		height: 40px;
	}
	.box {
		width: 300px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
  </style>
  
</head>
<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
	<!--菜單連結-->
<jsp:include page="title.jsp" />
	
	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">會員專區</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">首頁</a></li>
							<li class="active">客戶服務</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;">

		<div  class="widget widget-category"  style="margin-top: 100px; width: 250px;position:absolute;left: 100px">
		<div style="bottom: 100px;" >
			<h3 class="tf-ion-android-cart"style="text-align:left;font-size: 28px;margin-bottom: 20px;">商品相關</h3>
			<ul class="widget-category-list" style="text-align: left;font-size: 15px;margin-left: 20px;">
				<li>
					<a style="font-size: 18px" href="/memberOrder.controller">訂單查詢</a>
				</li>
				<li>
					<a style="font-size: 18px" href="Warrantyinsert1.controller">商品註冊</a>
				</li>
				<li>
					<a style="font-size: 18px" href="WarrantyfindMember.controller2">商品保固查詢</a>
				</li>
				<li>
					<a style="font-size: 18px" href="RMAfindMember.controller">送修商品查詢</a>
				</li>
			</ul>
		</div>
	</div>


		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul style="margin-left: -200px; "class="list-inline dashboard-menu text-center">
							<li><a href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
							<li><a class="active" href="memberOrder.controller">商品相關</a></li>
							<li><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

<div class="dashboard-wrapper user-dashboard"    style="border:0px">
		<div class="table-responsive">

<form id="form1" action="更新" method="Post" style=" width: 1296px;padding-top: 70px;">
	<table border='1' class="table"  style="width: 80%;margin-left: 290px;" >
		<tr height="40px" align="center">
			<th colspan='11' style="text-align:center;font-size: 20px">RMA查詢</th>
		</tr>
		<tr height="40px">
<!-- 			<th style="text-align:center;">RMA編號</th> -->
			<th style="text-align:center;">RMA單號</th>
			<th style="text-align:center;">申請日期</th>
			<th style="text-align:center;">圖片</th>
			<th style="text-align:center;">產品名稱</th>
			<th style="text-align:center;">原因</th>
<!-- 			<th style="text-align:center;">會員帳號</th> -->
			<th style="text-align:center;">寄送地址</th>
<!-- 			<th style="text-align:center;">信箱</th>	 -->
			<th style="text-align:center;">BAG收到產品日</th>
			<th style="text-align:center;">處理狀態</th>
			<th style="text-align:center;">寄出日期</th>
			<th style="text-align:center;">物流單號</th>
<!-- 			<th style="text-align:center;">處理狀態按鈕(按鈕)</th> -->
		</tr>
		<c:set var="lastId" value="0" />
		<c:forEach var='rma' items='${rma}'>
			<tr>
<!-- 			<form > -->
<%-- 				<td><input type="text" readonly="readonly" name="warrantyInfoId" value="${rma.rmaId}"></td> --%>
				<td >${rma.rmanumber}</td>
				<td >${rma.rmadate}</td>
				<td><img src="images/productimages/${rma.warrantyBean.productBean.img1}"></td>		
				<td >${rma.warrantyBean.productBean.name}</td>
				<td >${rma.RMAreason}</td>
<%-- 				<td style="font-size: 12px;">${rma.warrantyBean.memberBean.userId}</td> --%>
				<td >${rma.sendoutaddress}</td>
<%-- 				<td style="font-size: 12px;">${rma.warrantyBean.memberBean.email}</td> --%>
				<td >${rma.receiveproduct}</td>
				
				<c:choose>
					<c:when test="${rma.processingStatus == 0}">
						<td >未送達</td> <!-- 處理進度 -->
					</c:when>
					<c:when test="${rma.processingStatus == 1}">
						<td >已收到 處理中</td> <!-- 處理進度 -->
					</c:when>	
					<c:when test="${rma.processingStatus >= 2}">
						<td >產品已寄出</td> <!-- 處理進度 -->
					</c:when>															
				</c:choose>
				
				<td >${rma.sendoutdate}</td> <!-- 送出日期 -->
				<td >${rma.shipmentnumber}</td> <!-- 物流單號 -->
<%-- 			<td><input type="text" readonly="readonly" value="${rma.processingStatus}"></td> --%>
				
<!-- 				<td><button type="button" class="delete" onclick="">處理完成</button></td> -->
				
<%-- 				 <td><input type=text readonly="readonly" name="fk_memberid" value="${mbb.productId}">註冊序號比對</td> <!-- 註冊序號比對 --> --%>

				
			
			</tr>

		</c:forEach>
	</table>
</form>
</div>
</div>
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->
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
</html>
