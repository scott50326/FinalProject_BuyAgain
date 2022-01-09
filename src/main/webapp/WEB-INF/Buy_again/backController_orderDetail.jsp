<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller OrderDetail</title>

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

<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">

<!--菜單連結-->
<jsp:include page="managertitle.jsp" />

<section>
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">訂單明細資料表</h3>
				<div class="col-md-12">
					<form>
						<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center;">訂單明細編號</th>
											<th>訂單編號</th>
											<th>商品</th>
											<th style="text-align: center;">購買數量</th>
											<th>單價</th>
											<th>總價</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="orderTotalPrice" value="0" />
										<c:forEach var='orderdetail' items='${allorderdetails}'>
											<tr>
												<td style="text-align: center;">${orderdetail.orderDetailId}</td>
												<td>${orderdetail.orderBean.orderNo}</td>
												<td>${orderdetail.productBean.name}</td>
												<td style="text-align: center;">${orderdetail.quantity}</td>
												<td>${orderdetail.unitPrice}</td>
												<td>${orderdetail.totalPrice}</td>
											</tr>
										<c:set var="orderTotalPrice" value="${orderTotalPrice + orderdetail.totalPrice}" />
										</c:forEach>
										<tr>
											<td colspan="5" align="right"><b>訂單總金額&ensp;$</b></td>
											<td>${orderTotalPrice}</td>
										</tr>
									</tbody>
								</table>
								<div style="border:1px solid #dedede; text-align:center ">
									<a class="tf-tools" href="findallorders.controller">回訂單管理</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	

</script>
</body>
</html>
