<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy again | 論壇文章</title> 	
<style type="text/css">
#sort{
border-collapse: separate;
}
.td1{
border:gray 1px solid;
width:100px;
border-radius: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/articles.css">
<script type="text/javascript">
	var indexpage = 1;
	$(document).ready(function(){
		load(indexpage);
	});
	
	function change(page){
		indexpage = page;
		load(indexpage);
	}
	
	
	function load(indexpage){
		$.ajax({
			type:'post',
			url:'/querybypage/' + indexpage,
			dataType:'JSON',
			contentType:'application.json',
			success: function(data){
				console.log('success:' + data);
				var json = JSON.stringify(data,null,4);
				console.log('json:' + json);
				$('#showarticle').empty("");
				if(data == null){
					$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
				}else{
					var table = $('#showarticle');
					table.append("<tr id='atitle'><th>編號</th><th>專區</th><th>標題</th><th>作者</th><th>編輯日期</th></tr>")
					
					$.each(data, function(i,n){
						
						if (n.fk_sortId == 1) {var sort = "版規"}
						else if (n.fk_sortId == 2) {var sort = "顯示卡"}
						else if (n.fk_sortId == 3) {var sort = "處理器"}
						else if (n.fk_sortId == 4) {var sort = "記憶體"}
						else if (n.fk_sortId == 5) {var sort = "主機板"}
						else if (n.fk_sortId == 6) {var sort = "硬碟"}
						else if (n.fk_sortId == 7) {var sort = "螢幕"}
						else if (n.fk_sortId == 8) {var sort = "鍵盤"}
						else if (n.fk_sortId == 9) {var sort = "滑鼠"}
						
						var tr = "<tr height='80' align='center'>" + "<td>" + n.articleId + "</td>" +
								 "<td>" + sort + "</td>" + "<td><a href='articlecontent?articleId=" + n.articleId +"'>" + n.header + "</a></td>" +
								 "<td>" + n.name + "</td>" + "<td>" + n.registerDate + "</td>" + "<td><button type='button' onclick='del(" + n.articleId + ")'>" + "刪除" + "</button></td>" +
								 "</tr>";
					  table.append(tr);
					  
// 						var table1 = $('#showpage');
						
						
// 						var tr1 = "<tr>" + "<td align='center'>" + "總共:" + ${totalPages} + "頁，" + ${totalElements} + "篇文章" + "</td>" + 
// 								  "</tr>" + 
// 								  "<tr>" + 
// 								  "<td colspan='3' align='center'>" + "上一頁" +	  
// 								  "<c:forEach var='i' begin='1' end='${totalPages}' step='1'>" + 
// 								  "<button id='mypage' value='" + ${i} + "' onclick='change(" + ${i} + ")'>" + ${i} + "</button>" + 
// 								  "</c:forEach>" + "下一頁" + 
// 								  "</td>" + 
// 								  "</tr>" ;
						
// 						table1.append(tr1);
			
					});
					
				}
			      $(document).ready(function(){

			            // Check if the current URL contains '#'
			            if(document.URL.indexOf("#")==-1)
			            {
			                // Set the URL to whatever it was plus "#".
			                url = document.URL+"#";
			                location = "#";

			                //Reload the page
			                 location.reload(true);
			            }
			        });
			}
		})
	}
		function del(articleId){
		$.ajax({
			type:"GET",
			url:"/deletearticle/" + articleId,
			success:function(data,status){
				location.reload(); 	
			}
			
		})
	}
</script>
<!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again</title>
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
</head>
<body>

<!--菜單連結-->
<jsp:include page="title.jsp" />

		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul class="list-inline dashboard-menu text-center">
							<li><a class="active" href="https://localhost:8080/mainarticle">全部主題</a></li>
							<li><a href="https://localhost:8080/cpuarticle">處理器</a></li>
							<li><a href="https://localhost:8080/ramarticle">記憶體</a></li>
							<li><a href="https://localhost:8080/mbarticle">主機板</a></li>
							<li><a href="https://localhost:8080/vgaarticle">顯示卡</a></li>
							<li><a href="https://localhost:8080/ssdarticle">硬碟</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

<div style="text-align:right">
<button type="button"onclick="location.href='https://localhost:8080/insertarticle'">撰寫文章</button>
</div>
<div id="articletittle"></div>
<table id="sort">
	<tr>
		<td class="td1" style="background-color: lightgray" align="center"><a href="https://localhost:8080/mainarticle">全部主題</a></td>
		<td class="td1" align="center"><a href="https://localhost:8080/cpuarticle">處理器</a></td>
		<td class="td1" align="center"><a href="https://localhost:8080/ramarticle">記憶體</a></td>
		<td class="td1" align="center"><a href="https://localhost:8080/mbarticle">主機板</a></td>
		<td class="td1" align="center"><a href="https://localhost:8080/vgaarticle">顯示卡</a></td>
		<td class="td1" align="center"><a href="https://localhost:8080/ssdarticle">硬碟</a></td>
	</tr>
</table>
<br>
<div>
<table id="showarticle" border="1"></table>
<table id="showpage">
	<tr>
		<td align="center">總共:${totalPages}頁，${totalElements}篇文章</td>
	</tr>	
	<tr>
		<td colspan="3" align="center">上一頁 
			<c:forEach var="i" begin="1" end="${totalPages}" step="1">
				<button id="mypage" value="${i}" onclick="change(${i})">${i}</button>
			</c:forEach>下一頁
		</td>
	</tr>
</table>
</div>
</body>
</html>