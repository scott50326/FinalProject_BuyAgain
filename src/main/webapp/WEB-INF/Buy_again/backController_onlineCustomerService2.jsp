<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 客服相關</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
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
<script type="text/javascript">	
setInterval(function () { $(".refresh").load(location.href + " .refresh"); }, 5000);		
setInterval(function () { $("#refresh").load(location.href + " #refresh"); }, 5000);

function cclListMag() {
	var params={
		"ccl_type":$("#ccl_type").val(),
		"cl_ml_id":$("#cl_ml_id").val(),
		"ccl_content":$("#ccl_content").val()
	}
	console.log(params);
	$.ajax({
	   type:'POST',
	   url:'/ajax.controller',
	   dataType:'JSON',
	   contentType:'application/json',
	   data:JSON.stringify(params),
	   success: function(data){
		   console.log(data);
// 		   alert('送出成功');
		   window.location.reload();
	   }
	});
}

function updateType(id) {
	$.ajax({
	   type:'GET',
	   url:'ajaxCUBtype.controller?cl_ml_id='+id,
	   dataType:'JSON',
	   contentType:'application/json',
// 	   data:JSON.stringify(params),
	   success: function(data){
		   alert('已關閉與此會員的對話');
		   window.location.reload();
	   }
	});
}


</script>
<style type="text/css">
        .boxx{
            overflow: auto; /*隱藏超出範圍的字*/
        }
</style>
</head>

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
	<!--菜單連結-->
	<jsp:include page="managertitle.jsp" />
<!-- 					<div > -->
						<div class="dashboard-wrapper user-dashboard" 
						style="position: absolute;top: 283px; left: 64px;height: 416px;background: fixed;" ><div >

								<table class="table" id="refresh">
									
									<thead>
										<tr>
											<th colspan="3" style="text-align: center;">尚未處理</th>
										</tr>
										<tr>
											<th style="text-align: center;">會員</th>
											<th style="text-align: center;">發送時間</th>
											<th>查看</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var='list' items='${list}'>
										<c:choose> 
			 								<c:when test="${list.cl_type == 0}">
												<tr>
													<td style="text-align: center;">${list.cl_ml_id}</td>
													<td>${list.cl_add_date}</td>
													<td style="text-align: center;">
														<div class="btn-group" role="group">
															<a class="btn btn-default" href="/selectcontonlineCustomerServiceInsert2.controller?cl_ml_id=${list.cl_ml_id}"><i class="tf-pencil2" aria-hidden="true" ></i></a>
														</div>
													</td>
												</tr>
											</c:when> 
			 							</c:choose>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
<!-- 					</div> -->
	<section class="user-dashboard page-wrapper"
		style="background-color:#ffffffb0;border:0px" >
		
<!-- <div style="position: absolute; top: 100; text-align: center">		 -->
	<div id="content" >
		<div style="width: 150PX; ">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 " style="margin-left: 500px">
						<div class="block text-center">
							<h2 class="text-center">${mngLogin.name}管理員您好</h2>
							<c:forEach var='list' items='${list}'>
								<c:choose> 
	 								<c:when test="${cl_ml_id == list.cl_ml_id && list.cl_type == 0}">
										<a style="padding:0px 12px;font-size:18px;color: #ef0707" class="btn btn-default" onclick="updateType(${cl_ml_id});"><i class="tf-ion-ios-close" aria-hidden="true">處理完畢關閉對話</i></a>
									</c:when> 
									<c:when test="${cl_ml_id == list.cl_ml_id && list.cl_type == 1}"> 
										<a style="padding:0px 12px;font-size:18px;color: #27a108" class="btn btn-default" ><i class="tf-ion-ios-checkmark" aria-hidden="true">已處理完畢</i></a>
									</c:when> 
	 							</c:choose>
							</c:forEach>
								
							<div style="width: 520px;height: 300px;" class="refresh">
							<div style="border:1px solid #dedede ;width: 520px;height: 300px;" class="boxx">
								<c:forEach var='luu' items='${lu}'>
									<c:forEach var='test' items='${luu.chat_content_listBean}'>
									
										<c:if test="${test.ccl_type == mngLogin.userId}">
											<c:if test="${test.ccl_add_date != null}">										
												<div style="text-align:right;width: 500px;">
													${test.ccl_content}<br/>
													<p style="font-size: 5px">${test.ccl_add_date}</p>
												</div>
											</c:if>
										</c:if>
										
										<c:if test="${test.ccl_type == mngLogin.userId}">
											<c:if test="${test.ccl_add_date == null}">										
												<div style="text-align:right;width: 500px;">
													${test.ccl_content}<br/>
													<p style="font-size: 5px">剛剛</p>
												</div>
											</c:if>
										</c:if>

										
										<c:if test="${test.ccl_type != mngLogin.userId}">											
											<div style="text-align:left;width: 500px;">
												${test.ccl_type} : ${test.ccl_content}<br/>
												<p style="font-size: 5px">${test.ccl_add_date}</p>
											</div>
										</c:if>
									</c:forEach>
								</c:forEach>	
							</div> 
							</div>
<!-- 							<form class="text-left clearfix"action="/contactOCSInsertManager.controller" method="POST"> -->

								<div class="text-center">
									<input type="hidden"  id="ccl_type" value="${mngLogin.userId}"/>
									<input type="hidden"  id="cl_ml_id" value="${cl_ml_id}"/>
									<input style="height:35px;width: 410px;float: left;" type="text" multiple="multiple" id="ccl_content" value=""/>
								</div>

								<div class="text-center">
									<button class="btn btn-main btn-small btn-round" onclick="cclListMag();" >送出</button>
								</div>
<!-- 							</form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- </div> -->

	</section>




	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>




</body>
</html>