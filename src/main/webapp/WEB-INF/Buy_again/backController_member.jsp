<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller Member</title>

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
 	img{ 
 		height: 40px; 
 	}
 	td{
 		text-align: center;
 	}
 	th{
 		text-align: center;
 	}
 	.box {
		width: 60px;
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

<!-- <table class="table" style="margin-bottom:0px"> -->
<!-- <thead> -->
<!-- 	<tr > -->
<!-- 		<th style="text-align: center;"> -->
<!-- 			<div> -->
<!-- 				<label  style="margin: 0px;font-size: 15px">依會員等級查詢會員&thinsp;:&thinsp;</label> -->
<!-- 				<select style="width: 100px;height: 32px;" id="memberrank"> -->
<!-- 					<option value="1">銅</option> -->
<!-- 					<option value="2">銀</option> -->
<!-- 					<option value="3">金</option> -->
<!-- 					<option value="4">白金</option> -->
<!-- 				    <option value="5">鑽石</option> -->
<!-- 				</select> -->
<!-- 				<button class="btn btn-default" type="button" onclick="selectByRank()"><b>查詢</b></button> -->
<!-- 			</div> -->
<!-- 		</th> -->
<!-- 		<th style="text-align: center;"> -->
<!-- 			<div> -->
<!-- 				<label style="margin: 0px;font-size: 15px">依姓名查詢會員&thinsp;:&thinsp;</label> -->
<!-- 				<input style="height:30px;width:140px;margin: 0px;border: 1px solid #ccc; " type="text"  placeholder="類別名稱" id="similarName"> -->
<!-- 				<button style="" type="button" class="btn btn-default" onclick="selectBySimilarName()"><b>查詢</b></button> -->
<!-- 			</div> -->
<!-- 		</th> -->
<!-- 		<th> -->
<!-- 			<div style="text-align:center;position: absolute; top:245px;right:60px;  "> -->
<!-- 				<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertmember.controller"><b>新增會員</b></a> -->
<!-- 			</div> -->
<!-- 		</th> -->
<!-- 	</tr> -->
<!-- </thead> -->
<!-- </table> -->


<h3 style="text-align: center;">會員資料表</h3>
<!-- 	<div style="text-align:center;position: absolute; top:245px;right:60px;  "> -->
<!-- 		<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertmember.controller"><b>新增會員</b></a> -->
<!-- 	</div> -->
<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
	<div class="table-responsive">

<table class="table" style="margin-bottom:0px">
							<thead>
								<tr >
									<th style="text-align: center;">
										<div>
										<label  style="margin: 0px;font-size: 15px">依會員等級查詢會員&thinsp;:&thinsp;</label>
										<select style="width: 100px;height: 32px;" id="memberrank">
											<option value="1">銅</option>
											<option value="2">銀</option>
											<option value="3">金</option>
											<option value="4">白金</option>
										    <option value="5">鑽石</option>
										</select>
										<button class="btn btn-default" type="button" onclick="selectByRank()"><b>查詢</b></button>
									</div>
									</th>
									<th style="text-align: center;">
										<div>
											<label style="margin: 0px;font-size: 15px">依姓名查詢會員&thinsp;:&thinsp;</label>
											<input style="height:30px;width:140px;margin: 0px;border: 1px solid #ccc; " type="text"  placeholder="類別名稱" id="similarName">
											<button style="" type="button" class="btn btn-default" onclick="selectBySimilarName()"><b>查詢</b></button>
										</div>
									</th>
									
									<th>
										<div style="text-align: center;">
											<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertmember.controller"><b>新增會員</b></a>
										</div>
									</th>
									
								</tr>
								</thead>
								</table>


		<table class="table">
			<thead style="background-color:#ffffffb0">
				<tr style="text-align: center;">
					<th style="text-align: center;">編號</th>
					<th style="text-align: center;">大頭貼</th>
					<th style="text-align: center;">帳號</th>
<!-- 					<th style="text-align: center;">密碼</th> -->
					<th style="text-align: center;">姓名</th>
					<th style="text-align: center;">生日</th>
					<th style="text-align: center;">電話</th>
					<th style="text-align: center;">住址</th>
					<th style="text-align: center;">電子郵件</th>
					<th style="text-align: center;">加入時間</th>
					<th >總消費金額</th>
					<th >會員等級</th>
					<th style="text-align: center;">修改</th>
					<th style="text-align: center;">刪除</th>
				</tr>
			</thead>
			<tbody style="background-color:#ffffffb0">
				<c:forEach var='member' items='${allMembers}'>
					<tr>
						<td>${member.memberId}</td>
						<td><img src="images/memberimages/${member.img}"></td>
						<td>${member.userId}</td>
<%-- 						<td>${member.password}</td> --%>
						<td>${member.name}</td>
						<td>${member.birthday}</td>
						<td>${member.phone}</td>
						<td><div class="box"><p class="ellipsis">${member.address}</p></div></td>
						<td>${member.email}</td>
						<td>${member.registerDate}</td>
						<td>$${member.spend}</td>
						<td>
						<c:choose>
							<c:when test="${member.rank == 1}">
								銅
							</c:when>
							<c:when test="${member.rank == 2}">
								銀
							</c:when>
							<c:when test="${member.rank == 3}">
								金
							</c:when>
							<c:when test="${member.rank == 4}">
								白金
							</c:when>
							<c:when test="${member.rank == 5}">
							    鑽石
							</c:when>
						</c:choose>
						</td>
						<td><a class="btn btn-default" href="updatemember.controller?memberId=${member.memberId}"><i class="tf-pencil2" aria-hidden="true"></i></a></td>
						<td><a title="deltitle" class="btn btn-default" href="deletemember.controller?memberId=${member.memberId}"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
					</tr>
					<c:set var="i" value="${i+1}" />
					<c:set var="lastId" value="${member.memberId}" />
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- 由 CDN 引用, 網址上提供 CDN 網站複製即可 -->
<script type="text/javascript">

	function selectByRank() {
		$.ajax({
			type:'get',
			url:'findmembersbyrank.controller?rank=' + $("#memberrank").val(),
			dataType:'JSON', /*下載*/
			contentType:'application/json', /*上傳*/
			success: function(members) {
				$("tbody").empty("");
				
				$.each(members, function(i,member) {
					
					if (member.rank == 1) {var rank = "銅"}
					if (member.rank == 2) {var rank = "銀"}
					if (member.rank == 3) {var rank = "金"}
					if (member.rank == 4) {var rank = "白金"}
					if (member.rank == 5) {var rank = "鑽石"}
					
					var tr = 
					"<tr>" +
					"<td>" + member.memberId + "</td>" +
					"<td><img src='images/memberimages/" + member.img + "'></td>" +
					"<td>" + member.userId + "</td>" +
// 					"<td>" + member.password + "</td>" +
					"<td>" + member.name + "</td>" +
					"<td>" + member.birthday + "</td>" +
					"<td>" + member.phone + "</td>" +
					"<td><div class='box'><p class='ellipsis'>" + member.address + "</p></div></td>" +
					"<td>" + member.email + "</td>" +
					"<td>" + member.registerDate + "</td>" +
					"<td>" + member.spend + "</td>" +
					"<td>" + rank + "</td>" +
					"<td><a class='btn btn-default' href='updatemember.controller?memberId=" + member.memberId + "'><i class='tf-pencil2' aria-hidden='true'></i></a></td>" +
					"<td><a class='btn btn-default' href='deletemember.controller?memberId=" + member.memberId + "'><i class='tf-ion-android-delete' aria-hidden='true'></i></a></td>" +
					"</tr>";
					$("tbody").append(tr);
					
				});
			}
		})
	}
	
	function selectBySimilarName() {
		$.ajax({
			type:'get',
			url:'findmembersbysimilarname.controller?similarname=' + $("#similarName").val(),
			dataType:'JSON', /*下載*/
			contentType:'application/json', /*上傳*/
			success: function(members) {
				$("tbody").empty("");
				
				$.each(members, function(i,member) {
					
					if (member.rank == 1) {var rank = "銅"}
					if (member.rank == 2) {var rank = "銀"}
					if (member.rank == 3) {var rank = "金"}
					if (member.rank == 4) {var rank = "白金"}
					if (member.rank == 5) {var rank = "鑽石"}
					
					var tr = 
					"<tr>" +
					"<td>" + member.memberId + "</td>" +
					"<td><img src='images/memberimages/" + member.img + "'></td>" +
					"<td>" + member.userId + "</td>" +
// 					"<td>" + member.password + "</td>" +
					"<td>" + member.name + "</td>" +
					"<td>" + member.birthday + "</td>" +
					"<td>" + member.phone + "</td>" +
					"<td><div class='box'><p class='ellipsis'>" + member.address + "</p></div></td>" +
					"<td>" + member.email + "</td>" +
					"<td>" + member.registerDate + "</td>" +
					"<td>" + member.spend + "</td>" +
					"<td>" + rank + "</td>" +
					"<td><a class='btn btn-default' href='updatemember.controller?memberId=" + member.memberId + "'><i class='tf-pencil2' aria-hidden='true'></i></a></td>" +
					"<td><a class='btn btn-default' href='deletemember.controller?memberId=" + member.memberId + "'><i class='tf-ion-android-delete' aria-hidden='true'></i></a></td>" +
					"</tr>";
					$("tbody").append(tr);
					
				});
			}
		})
	}
	
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
