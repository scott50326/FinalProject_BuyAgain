<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy again | 論壇文章</title>
<style type="text/css">
#sort {
	border-collapse: separate;
}

 .td1 { 
 	border: gray 1px solid; 
/*  	width: 100px;  */
 	border-radius: 5px;

 } 
#atitle{
	width: 100px;
    height: 48px;
    font-size: 16px;
    text-align: center;
}
.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

 .box { 
 	width: 500px;     
 } 
 td{
 	 	text-align: center;
 	 	font-size: 15px
 	 	
 }

#showarticle {
	width: 1000px;
	background-color: #ffffffb0;
}
#userart{
background-color: inherit;
border: none;
}
#writeart{
background-color:inherit;
border: none;
}
#atitle{
text-align: center;
vertical-align: middle!important;
}
</style>
<link rel="stylesheet" href="/fontawesome/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
					table.append("<tr id='atitle'><th id='atitle'>作者</th><th id='atitle'>預覽圖</th><th id='atitle'>標題</th><th id='atitle'>互動 / 	人氣</th><th id='atitle'>日期</th></tr>")
					
					var articles = data.content;
					var msgsizes = data.msgsizes;
					
					$.each(articles, function(i,n){
						 console.log(${msgsizes});
						if (n.fk_sortId == 1) {var sort = "版規"}
						else if (n.fk_sortId == 2) {var sort = "顯示卡"}
						else if (n.fk_sortId == 3) {var sort = "處理器"}
						else if (n.fk_sortId == 4) {var sort = "記憶體"}
						else if (n.fk_sortId == 5) {var sort = "主機板"}
						else if (n.fk_sortId == 6) {var sort = "硬碟"}
						else if (n.fk_sortId == 7) {var sort = "螢幕"}
						else if (n.fk_sortId == 8) {var sort = "鍵盤"}
						else if (n.fk_sortId == 9) {var sort = "滑鼠"}
						
						 var pageContent =  n.content ;
// 						 console.log(pageContent)
						 var reg = /<[^>]+>|&[^>]+;/g;
						 pageContent = pageContent.replace(reg,'');	
// 						 console.log("123"+ pageContent)
// 						 $('#pageContent').text(pageContent);
					if (n.img1 == null || n.img1 == ""){
						var tr = "<tr style='border-bottom: 1px solid #d3d3d3;' >" +
								 "<td>" + n.name + "</a></td>" +
								 "<td><img style='width:100px;height:100px;' src=images/articleimages/none.jpg></td>" +
								 "<td style='text-align:left;padding-top: 20px;'><a href='articlecontent?articleId=" + n.articleId +"'>" + "<b>" + "【" + sort  + "】" + n.header + "</b>" + "<br>" + "<div id='pageContent' class='box';'><p  class='ellipsis'>" +"&ensp;" + pageContent + "</p></div>" +"</td>" + 
								 "<td>" + msgsizes[i] + " / " + n.touch + "</td>" +
								 "<td style='font-size:14px ;width='100px'>" + n.registerDate + "</td>" + 
								 "</tr>";
						table.append(tr);
					}else{
						var tr =	"<tr style='border-bottom: 1px solid #d3d3d3;' >" +
						 			"<td>" + n.name + "</a></td>" +
						 			"<td><img style='width:100px;height:100px;' src=images/articleimages/" + n.img1 + "></td>" +
						 			"<td style='text-align:left;padding-top: 20px;'><a href='articlecontent?articleId=" + n.articleId +"'>" + "<b>" + "【" + sort  + "】" + n.header + "</b>" + "<br>" + "<div id='pageContent' class='box';'><p  class='ellipsis'>" +"&ensp;" + pageContent + "</p></div>" +"</td>" + 
									"<td>" + msgsizes[i] + " / " + n.touch + "</td>" +
						 			"<td  style='font-size:14px ;width='100px'>" + n.registerDate + "</td>" + 
						 			"</tr>";
						table.append(tr);
					}		 		 
					  
	
							
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
			success:function(data){
				 	
			}
			
		})
		location.reload();
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
</head>
<body id="body" background="/images/background.png"	style="background-attachment: fixed;">

	<!--菜單連結-->
	<jsp:include page="title.jsp" />

	<!-- 		<div style="position: absolute; top: 100; right: 47px; text-align: center"> -->
	<!-- 			<div class="container" style="float: top; background-color: #f7f7f7;"> -->
	<!-- 				<div class="row"> -->
	<!-- 					<div class="col-md-12"> -->
	<!-- 						<ul class="list-inline dashboard-menu text-center"> -->
	<!-- 							<li><a class="active" href="https://localhost:8080/mainarticle">全部主題</a></li> -->
	<!-- 							<li><a href="https://localhost:8080/cpuarticle">處理器</a></li> -->
	<!-- 							<li><a href="https://localhost:8080/ramarticle">記憶體</a></li> -->
	<!-- 							<li><a href="https://localhost:8080/mbarticle">主機板</a></li> -->
	<!-- 							<li><a href="https://localhost:8080/vgaarticle">顯示卡</a></li> -->
	<!-- 							<li><a href="https://localhost:8080/ssdarticle">硬碟</a></li> -->
	<!-- 						</ul> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	
	<form action="/searchqueryByPage" method="GET">
	<div style="margin-left: 45%;" >
		<input style="height:30px;width:140px;margin: 0px;border: 1px solid #ccc; " type="text" name="searchtext" value="${searchtext}">&ensp;<button type="submit" onclick="location.href='/searchqueryByPage'" class="fas fa-search" style="background-color: inherit;border: none;">搜尋</button>
	</div>
	</form>
	<div style="text-align: center;">
<!-- 		<h3>全部主題</h3> -->
	</div>
	<c:choose>
		<c:when test="${memlogin != null}">
			<div style="margin-left: 69%;font-size: 18px;">
				<a href="/querybyuserId"><button type="button" id="userart" class="fas fa-home">個人小屋</button></a>
				<!-- <button type="button" onclick="location.href='https://localhost:8080/insertarticle'">撰寫文章</button> -->
				<a href="/insertarticle2"><button type="button" id="writeart" class='fas fa-pencil-alt'>撰寫文章</button></a>
			</div>
		</c:when>
		<c:when test="${memlogin == null}">
			<div style="margin-left: 69%;font-size: 18px;">
				<a href="memberlogin.controller"><button type="button" id="userart" class="fas fa-home">個人小屋</button></a>
				<!-- <button type="button" onclick="location.href='https://localhost:8080/insertarticle'">撰寫文章</button> -->
				<a href="memberlogin.controller"><button type="button" id="writeart" class='fas fa-pencil-alt'>撰寫文章</button></a>
			</div>
		</c:when>
	</c:choose>
	<div id="articletittle" class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px;padding-top: 0px;">
		<div class="table-responsive" >
	<!-- <table id="sort"> -->
	<!-- 	<tr> -->
	<!-- 		<td class="td1" style="background-color: lightgray" align="center"><a href="https://localhost:8080/mainarticle">全部主題</a></td> -->
	<!-- 		<td class="td1" align="center"><a href="https://localhost:8080/cpuarticle">處理器</a></td> -->
	<!-- 		<td class="td1" align="center"><a href="https://localhost:8080/ramarticle">記憶體</a></td> -->
	<!-- 		<td class="td1" align="center"><a href="https://localhost:8080/mbarticle">主機板</a></td> -->
	<!-- 		<td class="td1" align="center"><a href="https://localhost:8080/vgaarticle">顯示卡</a></td> -->
	<!-- 		<td class="td1" align="center"><a href="https://localhost:8080/ssdarticle">硬碟</a></td> -->
	<!-- 	</tr> -->
	<!-- </table> -->
	<br>
<!-- 	<div> -->
	<div style="text-align: left;padding-bottom: 20px;    margin-left: 240px;">
		<button onclick="location.href='/mainarticle'" class="btn btn-default" style="background-color: #d3d3d3;padding: 7px 27.8px;">全部主題</button>
		<button onclick="location.href='/toucharticle'" class="btn btn-default" style="padding: 7px 27.8px;">熱門文章</button>
		<button onclick="location.href='/vgaarticle'" class="btn btn-default" style="padding: 7px 27.8px;">顯示卡</button>
		<button onclick="location.href='/cpuarticle'" class="btn btn-default" style="padding: 7px 27.8px;">處理器</button>
		<button onclick="location.href='/ramarticle'" class="btn btn-default" style="padding: 7px 27.8px;">記憶體</button>
		<button onclick="location.href='/mbarticle'" class="btn btn-default" style="padding: 7px 27.8px;">主機板</button>
		<button onclick="location.href='/ssdarticle'" class="btn btn-default" style="padding: 7px 27.8px;">硬碟</button>
		<button onclick="location.href='/screenarticle'" class="btn btn-default" style="padding: 7px 27.8px;">螢幕</button>
		<button onclick="location.href='/keyboardarticle'" class="btn btn-default" style="padding: 7px 27.8px;">鍵盤</button>
		<button onclick="location.href='/mousearticle'" class="btn btn-default" style="padding: 7px 27.8px;">滑鼠</button>
<div style="position:absolute;right:1054px;top: 298px; ">		
</div>	
	</div>

		<table id="showarticle" class="table" ></table>
		<table id="showpage" >
			<tr>
				<td align="center">總共:${totalPages}頁，${totalElements}篇文章</td>
			</tr>
			<tr>
				<td colspan="3" align="center">上一頁 <c:forEach var="i" begin="1"
						end="${totalPages}" step="1">
						<button id="mypage" value="${i}" onclick="change(${i})" >${i}</button>
					</c:forEach>下一頁
				</td>
			</tr>
		</table>
	</div>
	</div>
	
</body>
</html>