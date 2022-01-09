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
/* /* 	} */ 
	button{ 
 		width: 90px;
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
	#tab{
	background-color:#ffffffb0;
	text-align:center;
	padding: 5px;
	padding-top: 10px;
	vertical-align:inherit;
	}
  </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="managertitle.jsp" />

<form id="form1" action="Rmafinish1.controller" method="Post">
	<table class="table" style="vertical-align: inherit;">
		<tr height="40px" align="center">
<!-- 			<th colspan='11' style="text-align:center;">會員RMA資料管理表</th></tr> -->
		<tr height="40px">
			<th id="tab">RMA編號</th>
			<th id="tab">RMA單號</th>
			<th id="tab">RMA日期</th>
			<th id="tab">RMA圖片</th>
			<th id="tab">RMA產品名稱</th>
			<th id="tab">RMA原因</th>
			<th id="tab">會員帳號</th>
			<th id="tab">寄送地址</th>
			<th id="tab">會員信箱</th>	
			<th id="tab">收到RMA物品日期</th>
			<th id="tab">處理狀態</th>
			<th id="tab">寄出日期</th>
			<th id="tab">物流單號</th>
			<th id="tab">處理狀態鈕</th>
		</tr>
<%-- 		<c:set var="lastId" value="0" /> --%>
		<c:forEach var='mbb' items='${rmabean}' varStatus="status">
			<tr>
<!-- 			<form > -->
				<td id="tab">${mbb.rmaId}</td>
				<td id="tab">${mbb.rmanumber}</td>
				<td id="tab">${mbb.rmadate}</td>
				<td id="tab"><img src="images/productimages/${mbb.warrantyBean.productBean.img1}"></td>		
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.warrantyBean.productBean.name}"></td> --%>
				<td id="tab">${mbb.warrantyBean.productBean.name}</td>
				<td id="tab">${mbb.RMAreason}</td>
				<td id="tab">${mbb.warrantyBean.memberBean.userId}</td>
				<td id="tab">${mbb.sendoutaddress}</td>
				<td id="tab">${mbb.warrantyBean.memberBean.email}</td>
				<td id="tab">${mbb.receiveproduct}</td>
				
				<c:choose>
					<c:when test="${mbb.processingStatus == 0}"> <!-- 處理進度 -->
						<td id="tab">未收到產品</td> <!-- 處理進度 -->
					</c:when>
					
					<c:when test="${mbb.processingStatus == 1}">
						<td id="tab">已收到 處理中</td> <!-- 處理進度 -->
					</c:when>	
					
					<c:when test="${mbb.processingStatus >= 2}">
						<td id="tab">RMA產品已寄出</td> <!-- 處理進度 -->
					</c:when>															
				</c:choose>
				<td id="tab">${mbb.sendoutdate }</td> <!-- 送出日期 -->
				<td id="tab">${mbb.shipmentnumber}</td> <!-- 物流單號 -->
					
				<c:choose>
					<c:when test="${mbb.processingStatus == 0}"> <!-- 處理進度 -->
						<td id="tab"><button style="padding: 4px 8px;" type="button" class="btn btn-default"  name="id"	onclick="formsubmit(${mbb.rmaId})">已收到產品</button></td> <!-- 處理進度 -->
					</c:when>
					
					<c:when test="${mbb.processingStatus >= 1}">
						<td id="tab"><button style="padding: 4px 8px;" type="button"class="btn btn-default" onclick="formsubmit1(${mbb.rmaId})" >處理完成</button></td> <!-- 處理進度 -->
					</c:when>	
				</c:choose>
				
				<input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.productId}">
				  <!-- 註冊序號比對 -->
<%-- 				<td><input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}"></td> --%>
				
				<input type="hidden"  id="id" name="id" value="">
			
			</tr>
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
		</c:forEach>
<%-- 		<input type="hidden" readonly="readonly" id="id" name="processingStatus" value="${mbb.processingStatus}"> --%>
			<input type="hidden" readonly="readonly"  name="date1" value="2021-12-16">
			
<!-- 		<tr> -->
<%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%>
<!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">新增商品</a></button></td> -->
<!-- 			<td colspan='2'></td> -->
<!-- 		</tr> -->
<!-- 		</form> -->
	</table>
</form>
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->
<script>

// function formsubmit(id){
// 	 $("#id").val(id);
// 		document.getElementById("form1").submit();
// 		alert("更新處理狀態");
// // 		alert($("#id").val());
// }

function formsubmit(id){
	var r = confirm("更新狀態已接收到產品?")
	if(r == true){ 
	$("#id").val(id);
		document.getElementById("form1").submit();
		alert("更新處理狀態");
	}
	else {
		alert("已取消操作");
	}
}

function formsubmit1(id){
	var r = confirm("處理完成，確認送出?")
	if(r == true){ 
	$("#id").val(id);
		document.getElementById("form1").submit();
		alert("更新處理狀態");
	}
	else {
		alert("已取消操作");
	}
}
</script>
</html>
