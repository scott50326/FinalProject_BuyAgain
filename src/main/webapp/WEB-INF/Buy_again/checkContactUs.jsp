<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back ContactUs</title>
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
<script src="js/script.js"></script>


</head>
<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">

	<jsp:include page="managertitle.jsp" />

	<form id="contact-form" >
		<div class="col-md-6">

			<div class="post" style="background-color:#ffffffb0;border:0px">
				<h2 style="padding-top: 30px;" class="post-title">客人反應的訊息</h2>
				<div class="post-meta">
					<div class="form-group">
						<p align="left" style="font-size: 14px">編號</p>
						<%--            					<input type="hidden" readonly="readonly" class="form-control" name="confirm"  value="${contactUs.confirm}"/> --%>
						<input type="text" readonly="readonly" class="form-control"	name="contactUsId" id="contactUsId" value="${contactUs.contactUsId}" />
					</div>
					<div class="form-group">
						<p align="left">發送者</p>
						<input type="text" readonly="readonly" class="form-control"
							name="name" id="name" value="${contactUs.name}" />
					</div>
					<div class="form-group">
						<p align="left">發送日期</p>
						<input type="text" readonly="readonly" class="form-control"
							name="registerDate" id="registerDate"
							value="${contactUs.registerDate}" />
					</div>
					<div class="form-group">
						<p align="left">發送信箱</p>
						<input type="email" readonly="readonly" class="form-control"
							name="email" id="email" value="${contactUs.email}" />
					</div>
					<div class="form-group">
						<p align="left">發送主旨</p>
						<input type="email" readonly="readonly" class="form-control"
							name="title" id="title" value="${contactUs.title}" />
					</div>
					<div class="form-group">
						<p align="left">發送內文</p>
						<textarea rows="6" readonly="readonly" placeholder="想傳遞的訊息"
							class="form-control" name="content" id="content">${contactUs.content}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="post" style="background-color:#ffffffb0;border:0px">
				<h2 style="padding-top: 30px;" class="post-title">已回覆的訊息</h2>
				<div class="post-meta">
					<div class="form-group">
						<p align="left">回覆客服ID</p>
						<input type="text" id="responder" readonly="readonly" class="form-control" value="${contactUs.responder}" />
					</div>
					<div class="form-group">
						<p align="left">回覆日期</p>
						<input type="text" readonly="readonly" class="form-control" readonly="readonly"
							name="registerDate" id="registerDate"
							value="${contactUs.responseDate}" />
					</div>
					<div class="form-group">
						<p align="left">回覆主旨</p>
						<input type="text" id="responseTitle" readonly="readonly" class="form-control" value="${contactUs.responseTitle}" />
					</div>
					<div class="form-group">
						<p align="left">回覆的內文</p>
						<textarea rows="6" id="responseContent" readonly="readonly" placeholder="${contactUs.responseContent}" class="form-control"></textarea>
					</div>
					<div id="cf-submit">
						<button type="button" class="btn btn-main text-center" onclick="location.href='/contactUsfindall.controller'">回前頁</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>