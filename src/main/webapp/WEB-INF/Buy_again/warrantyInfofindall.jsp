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
		height: 26px;
		text-align: center;
    	border: 0px;
    	background-color: #f9f9f900;
	}
/* 	.email, .regisDate{ */
/* 		width: 200px; */
/* 	} */
/*  	table, tr, th, td{  */
/* 		margin: 10px auto;  */
/*  		text-align: center; */
/*  		vertical-align:middle; */
/*  	}  */
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
		width:20px;
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

<form id="form1" action="deletewarranty.controller" method="Post">
<h3 style="text-align: center;">會員保固資料管理表</h3>
<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
	<div class="table-responsive">
	<table class="table">
			<thead style="background-color:#ffffffb0">
				<tr style="text-align: center;">
					<th style="text-align:center;padding: 6px;">編號</th>
					<th style="text-align:center;padding: 6px;">會員帳號</th>
					<th style="text-align:center;padding: 6px;">圖片</th>
					<th style="text-align:center;padding: 6px;">品名</th>
					<th style="text-align:center;padding: 6px;">會員電話</th>
					<th style="text-align:center;padding: 6px;">會員信箱</th>
					<th style="text-align:center;padding: 6px;">商品類別</th>
					<th style="text-align:center;padding: 6px;">會員地址</th>	
					<th style="text-align:center;padding: 6px;">註冊序號</th>
					<th style="text-align:center;padding: 6px;">保固狀態</th>
					<th style="text-align:center;padding: 6px;">產品註冊時間</th>
					<th style="text-align:center;padding: 6px;">保固結束日</th>
					<th style="text-align:center;padding: 6px;">發票</th>
					<th style="text-align:center;padding: 6px;">修改保固日</th>
					<th style="text-align:center;padding: 6px;">註銷保固</th>
				</tr>
			</thead>
			<tbody style="background-color:#ffffffb0">
				<c:set var="lastId" value="0" />
		<c:forEach var='mbb' items='${warranty}'>
			<tr>
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><input style="width: 30px;" type="text" readonly="readonly" name="warrantyInfoId" value="${mbb.warrantyInfoId}"></td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.userId}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><img src="images/productimages/${mbb.productBean.img1}"></td>		
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.productBean.name}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.phone}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.email}</td>	
				
<%-- 				<td style="text-align:center;vertical-align:middle;">${mbb.productBean.productSortBean.sortId}</td>						 --%>
					<c:choose>
							<c:when test="${mbb.productBean.productSortBean.sortId == 1}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">顯示卡</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 2}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">處理器</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 3}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">記憶體</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 4}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">主機板</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 5}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">硬碟</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 6}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">螢幕</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 7}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">鍵盤</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 8}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">滑鼠</td>
							</c:when>
						</c:choose>
				
				
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><div class="box"><p class="ellipsis">${mbb.memberBean.address}</p></div></td>
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>
				<td style="vertical-align:middle;padding: 6px;">
					<c:choose>
						<c:when test="${mbb.registerStatus != 0}">
							<i class="tf-ion-android-radio-button-on"><p>保固正常</p></i>
						</c:when>
						<c:when test="${mbb.registerStatus == 0}">
							<i style="color: red" class="tf-ion-android-radio-button-on"><p>註銷保固</p></i>
						</c:when>															
					</c:choose>
				</td>
				<input type="hidden" readonly="readonly" name="registerStatus" value="${mbb.registerStatus}">
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td>
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td>
				<td style="vertical-align:middle;padding: 6px;"><img src="/images/warrantyimages/${mbb.invoice}" id="img1" ></td>
				<td style="vertical-align:middle;padding: 6px;"><a class="btn btn-default" href="updatewarranty.controller1?warrantyInfoId=${mbb.warrantyInfoId}">修改保固日期</a></td>
				<td style="vertical-align:middle;padding: 6px;"><a class="btn btn-default" href="#!" onclick="formsubmit(${mbb.warrantyInfoId})">註銷保固</a></td>
				<input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.memberBean.memberId}"></td>
				<input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}">
				<input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}">
				<input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}">
			</tr>
		</c:forEach>
		<input type="hidden" readonly="readonly" id="id" name="id" value="">
		<c:forEach var='registerid' items='${warranty}'>
	<input type="hidden" readonly="readonly" name="registerid2" value="${registerid.registerid}">
	</c:forEach>


			</tbody>
		</table>
	</div>
</div>
</form>
</body>

<!-- 	<table border='1'  > -->
<!-- 		<tr height="40px" align="center"><th colspan='11' style="text-align:center;">會員保固資料管理表</th></tr> -->
<!-- 		<tr height="40px"> -->
<!-- 			<th style="text-align:center;">編號</th> -->
<!-- 			<th style="text-align:center;">會員帳號</th> -->
<!-- 			<th style="text-align:center;">商品圖片</th> -->
<!-- 			<th style="text-align:center;">商品名稱</th> -->
<!-- 			<th style="text-align:center;">會員電話</th> -->
<!-- 			<th style="text-align:center;">會員信箱</th> -->
<!-- 			<th style="text-align:center;">商品類別</th> -->
<!-- 			<th style="text-align:center;">會員地址</th>	 -->
<!-- 			<th style="text-align:center;">註冊序號</th> -->
<!-- 			<th style="text-align:center;">產品保固狀態</th> -->
<!-- 			<th style="text-align:center;">產品註冊時間</th> -->
<!-- 			<th style="text-align:center;">產品保固結束日</th> -->
<!-- 			<th style="text-align:center;">會員上傳發票</th> -->
<!-- 			<th style="text-align:center;">修改保固日</th> -->
<!-- 			<th style="text-align:center;">註銷保固</th> -->
<!-- 		</tr> -->
<%-- 		<c:set var="lastId" value="0" /> --%>
<%-- 		<c:forEach var='mbb' items='${warranty}'> --%>
<!-- 			<tr> -->
<!-- 			<form > -->
<%-- 				<td><input type="text" readonly="readonly" name="warrantyInfoId" value="${mbb.warrantyInfoId}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.memberId}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.userId}"></td> --%>
<%-- 				<td><img src="images/productimages/${mbb.productBean.img1}"></td>		 --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.productBean.name}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.phone}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.email}"></td>	 --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.productBean.productSortBean.sortId}"></td>		 --%>
<%-- 				<c:choose> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 1}"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="顯示卡"></td> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 2"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="處理器"></td> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 3"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="記憶體"></td> -->
<%-- 				</c:when>		 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 4"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="主機板"></td> -->
<%-- 				</c:when>			 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 5"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="硬碟"></td> -->
<%-- 				</c:when>		 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 6"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="螢幕"></td> -->
<%-- 				</c:when>	 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 7"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="鍵盤"></td> -->
<%-- 				</c:when>				 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 8"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="滑鼠"></td> -->
<%-- 				</c:when> --%>
<%-- 				</c:choose> --%>
				
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.address}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td> --%>
<%-- 				<td><c:choose> --%>
<%-- 				<c:when test="${mbb.registerStatus != 0}"> --%>
<!-- 				<li><p>保固正常</p></li> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.registerStatus == 0}"> --%>
<!-- 				<li><p>註銷保固</p></li> -->
<%-- 				</c:when>															 --%>
<%-- 				</c:choose></td> --%>
				
<%-- 				<input type="hidden" readonly="readonly" name="registerStatus" value="${mbb.registerStatus}"> --%>
				
				
<%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%>
				
<%-- 				<td><img src="/images/warrantyimages/${mbb.invoice}" id="img1" ></td> --%>
<%-- 				<td><button type="button" class="update"><a href="updatewarranty.controller1?warrantyInfoId=${mbb.warrantyInfoId}">修改保固日期</a></button></td> --%>
				
<%-- 				<td><button type="button" class="delete" onclick="formsubmit(${mbb.warrantyInfoId})">註銷保固</button></td> --%>
<%-- 				 <td><input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.memberBean.memberId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}"></td> --%>
				
				
			
<!-- 			</tr> -->
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
<%-- 		</c:forEach> --%>
<!-- 		<input type="hidden" readonly="readonly" id="id" name="id" value=""> -->
		
<!-- 		<tr> -->
<%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%>
<!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">新增商品</a></button></td> -->
<!-- 			<td colspan='2'></td> -->
<!-- 		</tr> -->
<!-- 		</form> -->
<%-- <c:forEach var='registerid' items='${warranty}'> --%>
<%-- <td><input type="hidden" readonly="readonly" name="registerid2" value="${registerid.registerid}"></td> --%>
<%-- </c:forEach> --%>
<!-- 	</table> -->
<!-- </form> -->

<!-- </body> -->
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->
<script>
$(function(){
    var len = 50; // 超過50個字以"..."取代
    $(".JQellipsis").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"...";
            $(this).text(text);
        }
    });
});


	
	
	
	function formsubmit(id){
		var r = confirm("確認要註銷此產品保固?")
		if(r == true){ 
		$("#id").val(id);
			document.getElementById("form1").submit();
			alert("已註銷此產品保固");
		}
		else {
			alert("已取消操作");
		}
	}
	
		
		
		
		
	
		
	
		
	

</script>
</html>
