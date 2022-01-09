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
  <style type="text/css">
	.box {
		width: 200px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
  </style>
  

</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

	<jsp:include page="managertitle.jsp" />

	<section>
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">聯絡我們</h3>
				<div class="col-md-12">
					<form>
						<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center;">編號</th>
											<th>顧客姓名</th>
											<th>電子郵件</th>
											<th>主旨</th>
											<th>內容</th>
											<th>寄送時間</th>
											<th style="text-align: center;">目前狀態</th>
											<th style="text-align: center;">詳文</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='contactUs' items='${allcontactUs}'>
											<tr>
												<td style="text-align: center;">${contactUs.contactUsId}</td>
												<td>${contactUs.name}</td>
												<td>${contactUs.email}</td>
												<td>${contactUs.title}</td>
												<td><div class="box"><p class="ellipsis">${contactUs.content}</p></div></td>
												<td>${contactUs.registerDate}</td>
												<td style="text-align: center;">
													<div class="btn-group" role="group">
														<c:choose>
															<c:when test="${contactUs.confirm == 0}">
																<a style="color: red" href="CUfindById.controller?contactUsId=${contactUs.contactUsId}">尚未回覆</a>
															</c:when>
															<c:when test="${contactUs.confirm == 1}">
																<a href="checkContactUs.controller?contactUsId=${contactUs.contactUsId}">已處理</a>
															</c:when>
														</c:choose>
													</div>
												</td>
												<td style="text-align: center;">
													<div class="btn-group" role="group">
														<c:choose>
															<c:when test="${contactUs.confirm == 0}">
																<a class="btn btn-default"
																	href="CUfindById.controller?contactUsId=${contactUs.contactUsId}"><i class="tf-pencil2" aria-hidden="true"></i></a>
															</c:when>
															<c:when test="${contactUs.confirm == 1}">
																<a class="btn btn-default" href="checkContactUs.controller?contactUsId=${contactUs.contactUsId}"><i	class="tf-pencil2" aria-hidden="true"></i></a>
															</c:when>
														</c:choose>
													</div>
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
