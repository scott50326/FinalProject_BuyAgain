<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller Billboard</title>

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

<section>
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">公告資料表</h3>
					<div style="text-align:center;position: absolute; top:310px;right:187px;  ">
						<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertbillboard.controller"><b>新增公告</b></a>
					</div>
				<div class="col-md-12">
					<form>
						<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center;">公告編號</th>
											<th>發布者</th>
											<th>公告內容</th>
											<th>發布時間</th>
											<th>最後修改人</th>
											<th>最後修改時間</th>
											<th style="text-align: center;">修改</th>
											<th style="text-align: center;">刪除</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="lastId" value="0" />
										<c:forEach var='billboard' items='${allbillboards}'>
											<tr>
												<td style="text-align: center;">${billboard.billboardId}</td>
												<td>${billboard.publisher}</td>
												<td><div class="box"><p class="ellipsis">${billboard.content}</p></div></td>
												<td>${billboard.registerDate}</td>
												<td>${billboard.lastUpdateManager}</td>
												<td>${billboard.lastUpdateTime}</td>
												<td style="text-align: center;"><a class="btn btn-default" href="updatebillboard.controller?billboardId=${billboard.billboardId}"><i class="tf-pencil2" aria-hidden="true"></i></a></td>
												<td style="text-align: center;"><a title="deltitle" class="btn btn-default" href="deletebillboard.controller?billboardId=${billboard.billboardId}"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
<%-- 												<td><a class="tf-pencil2" href="updatebillboard.controller?billboardId=${billboard.billboardId}">修改</a></td> --%>
<%-- 												<td><a class="tf-scissors2" href="deletebillboard.controller?billboardId=${billboard.billboardId}">刪除</a></td> --%>
											</tr>
											<c:set var="lastId" value="${billboard.billboardId}" />
											</c:forEach>
										<tr>
									</tbody>
								</table>
<!-- 								<div style="border:1px solid #dedede;text-align:center "> -->
<!-- 									<a style="font-size: 14px" class="tf-tools" href="insertbillboard.controller"><b>新增公告</b></a> -->
<!-- 								</div> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("a[title='deltitle']").click(function() {
			var yes = confirm('確定要刪除此筆資料嗎？');
			if (yes) {
				alert('刪除成功');
			} else {
				event.preventDefault();
				alert('取消刪除');
			}
		})
	})
</script>
</body>
</html>
