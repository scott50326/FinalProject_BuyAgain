<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller Product</title>

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
	input{
		width: 90px;
		height: 40px;
		text-align: center;
	}
	.email, .regisDate{
		width: 200px;
	}
	table, tr, th, td{
		margin: 10px auto;
		text-align: center;
	}
	button{
		width: 50px;
	}
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

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="managertitle.jsp" />
<h3 style="text-align: center;">會員商品購買紀錄</h3>

<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
	<div class="table-responsive">



		<table class="table">
			<thead style="background-color:#ffffffb0">
				<tr >
					<th style="text-align:center;">訂單編號</th>
					<th style="text-align:center;">購買此訂單會員帳號</th>
					<th style="text-align:center;">商品圖片</th>
					<th style="text-align:center;">商品名稱</th>
					<th style="text-align:center;">購買時間</th>
		<!-- 			<th style="text-align:center;">會員信箱</th> -->
		<!-- 			<th style="text-align:center;">商品類別</th> -->
		
		<!-- 			<th style="text-align:center;">會員地址</th>	 -->
					<th style="text-align:center;">該產品之註冊序號</th>
					<th style="text-align:center;">產品註冊時間</th>
					<th style="text-align:center;">註冊此產品會員帳號</th>
					
		<!-- 			<th style="text-align:center;">產品保固結束日</th> -->
		<!-- 			<th style="text-align:center;">會員上傳發票</th> -->
		<!-- 			<th style="text-align:center;">修改保固日</th> -->
		<!-- 			<th style="text-align:center;">註銷保固</th> -->
				</tr>
			</thead>
			<tbody style="background-color:#ffffffb0">
						<c:set var="lastId" value="0" />
		<c:forEach var='pdrg' items='${pdrg}'>
			<tr>
<!-- 			<form > -->
				<td>${pdrg.orderBean.orderNo}</td>
				<td>${pdrg.orderBean.memberBean.userId}</td>
				<td><img src="images/productimages/${pdrg.productBean.img1}"></td>		
				<td>${pdrg.productBean.name}</td>
				<td>${pdrg.orderBean.orderDate}</td>
				<td>${pdrg.licenseKey}</td>	
				<td>${pdrg.registerDate}</td>		

				<td>${pdrg.memberBean.userId}</td>
<%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>	 --%>
				
<%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%>								
			</tr>
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
		</c:forEach>

			</tbody>
		</table>
	</div>
</div>
<!-- <form id="form1" action=""> -->
<!-- 	<table border='1' class="table" > -->
<!-- 		<tr height="40px" align="center"><th colspan='11' style="text-align:center;">會員商品購買紀錄</th></tr> -->
<!-- 		<tr height="40px"> -->
<!-- 			<th style="text-align:center;">訂單編號</th> -->
<!-- 			<th style="text-align:center;">購買此訂單會員帳號</th> -->
<!-- 			<th style="text-align:center;">商品圖片</th> -->
<!-- 			<th style="text-align:center;">商品名稱</th> -->
<!-- 			<th style="text-align:center;">購買時間</th> -->
<!-- <!-- 			<th style="text-align:center;">會員信箱</th> --> 	
<!-- <!-- 			<th style="text-align:center;">商品類別</th> --> 

<!-- <!-- 			<th style="text-align:center;">會員地址</th>	 --> 
<!-- 			<th style="text-align:center;">該產品之註冊序號</th> -->
<!-- 			<th style="text-align:center;">產品註冊時間</th> -->
<!-- 			<th style="text-align:center;">註冊此產品會員帳號</th> -->
	
<!-- <!-- 			<th style="text-align:center;">產品保固結束日</th> --> 
<!-- <!-- 			<th style="text-align:center;">會員上傳發票</th> --> 
<!-- <!-- 			<th style="text-align:center;">修改保固日</th> -->
<!-- <!-- 			<th style="text-align:center;">註銷保固</th> --> 
<!-- 		</tr> -->
<%-- 		<c:set var="lastId" value="0" /> --%>
<%-- 		<c:forEach var='pdrg' items='${pdrg}'> --%>
<!-- 			<tr> -->
<!-- <!-- 			<form > --> 
<%-- 				<td>${pdrg.orderBean.orderNo}</td> --%>
<%-- 				<td>${pdrg.orderBean.memberBean.userId}</td> --%>
<%-- 				<td><img src="images/productimages/${pdrg.productBean.img1}"></td>		 --%>
<%-- 				<td>${pdrg.productBean.name}</td> --%>
<%-- 				<td>${pdrg.orderBean.orderDate}</td> --%>
<%-- 				<td>${pdrg.licenseKey}</td>	 --%>
<%-- 				<td>${pdrg.registerDate}</td>		 --%>

<%-- 				<td><input type="text" readonly="readonly" value="${pdrg.memberBean.userId}"></td> --%>
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>	 --%> 
				
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%> 
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%> 
				
				
				
				
	
				
				
			
<!-- 			</tr> -->
<%-- <%-- 			<c:set var="lastId" value="${product.productId}" /> --%> 
<%-- 		</c:forEach> --%>
	
<!-- <!-- 		<tr> --> 
<%-- <%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%> 
<!-- <!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">新增商品</a></button></td> --> 
<!-- <!-- 			<td colspan='2'></td> --> 
<!-- <!-- 		</tr> --> 
<!-- <!-- 		</form> --> 
<!-- 	</table> -->
<!-- </form> -->
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->


</html>
