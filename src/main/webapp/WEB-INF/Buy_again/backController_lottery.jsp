<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="UTF-8">
  <title>Back Controller Order</title>

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
		width: 200px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	td{
		align:center; 
		valign:center;
 		text-align: center;
 	}
 </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="managertitle.jsp" />

<section>
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">抽獎獎項表</h3>
<!-- 				<div class="col-md-12"> -->
					<form>
						<div class="dashboard-wrapper user-dashboard" style="border: 0px;margin-top:0px">
							<div class="table-responsive">
								<table class="table" style="margin-bottom:0px">
									<thead>
										<tr >
											<th style="text-align: center;">
												<div>
													<label  style="margin: 0px;font-size: 15px">查詢抽獎&thinsp;:&thinsp;</label>
													<select style="width: 100px;height: 32px;" id="state">
														<option value="1">已抽獎</option>
														<option value="0">未抽獎</option>
													</select>
													<button class="btn btn-default" type="button" onclick="selectLottery()"><b>查詢</b></button>
												</div>
											</th>									
										</tr>
									</thead>
								</table>
								
								<table class="table">
									<thead style="background-color:#ffffffb0;">
										<tr>
											<th style="text-align: center;">獎品編號</th>
											<th style="text-align: center;">獎品</th>
											<th style="text-align: center;">得獎者</th>
											<th style="text-align: center;">得獎時間</th>
											<th style="text-align: center;">抽獎</th>
										</tr>
									</thead>
									<tbody style="background-color:#ffffffb0;">
										<c:forEach var='lottery' items='${alllotterys}'>
											<tr style="text-align: center;">
												<td>${lottery.lotteryId}</td>
												<td>${lottery.productBean.name}</td>
												<td>${lottery.memberBean.name}</td>
												<td>${lottery.registerDate}</td>
<%-- 												<td><button type="button"><a  onclick="productLottery(${lottery.lotteryId})">抽獎</a></button></td> --%>
												<td><a onclick="productLottery(${lottery.lotteryId})" class="btn btn-default">抽獎<i class="tf-ion-speakerphone" aria-hidden="true"></i></a></td>
											</tr>
										</c:forEach>
										<tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function productLottery(id) {
	$.ajax({
	   type:'GET',
	   url:'productlottery.controller?lotteryId='+id,
	   dataType:'JSON',
	   contentType:'application/json',
// 	   data:JSON.stringify(params),
	   success: function(data){
		   console.log(data);
		   alert('中獎者會員編號 : '+data.memberId+' , 會員姓名 : '+data.name);
		   window.location.reload();
	   }
	});
}

function selectLottery() {
	$.ajax({
		type:'get',
		url:'selectLottery.controller?state=' + $("#state").val(),
		dataType:'JSON', /*下載*/
		contentType:'application/json', /*上傳*/
		success: function(map){
			$("tbody").empty("");
			
			if($("#state").val() == 1){
				for(n=0; n<map.LotteryBean.length ; n++){				
					var tr = 
					"<tr>" +
					"<td>" + map.LotteryBean[n].lotteryId + "</td>" +
					"<td>" + map.ProductBean[n].name + "</td>" +
					"<td>" + map.MemberBean[n].name + "</td>" +
					"<td>" + map.LotteryBean[n].registerDate + "</td>" +
	  				"<td><a  class='btn btn-default'>已抽獎<i class='tf-ion-speakerphone' aria-hidden='true'></i></a></td>"+
					"</tr>";
					$("tbody").append(tr);
				}
			}else{
				for(n=0; n<map.LotteryBean.length ; n++){				
					var tr = 
					"<tr>" +
					"<td>" + map.LotteryBean[n].lotteryId + "</td>" +
					"<td>" + map.ProductBean[n].name + "</td>" +
					"<td></td>" +
					"<td></td>" +
	  				"<td><a onclick='productLottery(" +  map.LotteryBean[n].lotteryId  + ")' class='btn btn-default'>抽獎<i class='tf-ion-speakerphone' aria-hidden='true'></i></a></td>"+
					"</tr>";
					$("tbody").append(tr);
				}
			}	
		}

	});
}
	
</script>
</body>
</html>
