<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Back Controller</title>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
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

setInterval(function () { $("#refresh1").load(location.href + " #refresh1"); }, 5000);

</script>

</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

	<jsp:include page="managertitle.jsp" />

	<section id="refresh1">
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">會員服務</h3>
				<div class="col-md-12">
					<form>
						<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr >
											<th style="text-align: center;">流水號</th>
											<th style="text-align: center;">會員編號</th>
											<th style="text-align: center;">會員發問時間</th>
											<th style="text-align: center;">留言狀況</th>
											<th style="text-align: center;">開啟對話</th>
											<th style="text-align: center;">關閉對話</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='list' items='${list}'>
											<tr style="text-align: center;">
												<td style="text-align: center;">${list.cl_id}</td>
												<td style="text-align: center;">${list.cl_ml_id}</td>
												<td>${list.cl_add_date}</td>
												<td style="text-align: center;">
													<c:choose> 
 															<c:when test="${list.cl_type == 0}">
																<p><b style="color: red">新留言</b></p>
															</c:when> 
															<c:when test="${list.cl_type == 1}"> 
																<p>無新留言</p>
															</c:when> 
 														</c:choose>
												</td>
												<td>
													<div class="btn-group" role="group">
<%-- 														<c:choose> --%>
<%-- 															<c:when test="${list.cl_type == 0}"> --%>
<!-- 																關閉對話 -->
<%-- 															</c:when> --%>
<%-- 															<c:when test="${list.cl_type == 1}"> --%>
																<a style="padding:0px 12px;font-size:18px" class="btn btn-default" href="/selectcontonlineCustomerServiceInsert2.controller?cl_ml_id=${list.cl_ml_id}"><i class="tf-ion-chatboxes" aria-hidden="true" ></i></a>
<%-- 															</c:when> --%>
<%-- 														</c:choose> --%>
														<%--                      <a href="/Buy_again/${contactUs.contactUsId}"><i class="tf-pencil2" aria-hidden="true" ></i>已處理</a> --%>
														<!--                       <button type="button" class="btn btn-default"><i class="tf-ion-close" aria-hidden="true"></i></button> -->
													</div>
												</td>
												<td>
													<a style="padding:0px 12px;font-size:18px" class="btn btn-default" onclick="updateType(${list.cl_ml_id});"><i class="tf-pencil2" aria-hidden="true"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
