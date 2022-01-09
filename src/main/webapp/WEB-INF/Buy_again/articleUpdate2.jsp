<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 修改文章</title>

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
</style>

</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >
<!--菜單連結-->
<jsp:include page="managertitle.jsp" />

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3" style="margin-left: 10%;">
        <div class="block text-center" style="margin: 0px;width:1000px">
          <h2 class="text-center">文章管理</h2>
          <form class="text-left clearfix" action="updatebillboard2.controller" method="post" enctype="multipart/form-data">
            <div class="form-group">
            	<label>文章編號&ensp;:</label>
              	<input type="text" class="form-control" name="articleId" placeholder="文章編號" value="${article.articleId}" readonly="readonly">
            </div>
            <div class="form-group">
            	<label>文章類別&ensp;:</label>
              	<input type="text" class="form-control" name="sortId" placeholder="文章類別" value="${article.articleSortBean.sortName}" readonly="readonly">
            </div>
            <div class="form-group">
            	<label>發文者&ensp;:</label>
              	<input type="text" class="form-control" name="memberId" placeholder="發文者" value="${article.memberBean.name}" readonly="readonly">
            </div>
             <div class="form-group">
            	<label>文章標題&ensp;:</label>
              	<input type="text" class="form-control" name="header" placeholder="標題" value="${article.header}" readonly="readonly">
            </div>
            <div class="form-group">
            	<label>文章內容&ensp;:</label>
              	<textarea cols="" rows="5" class="form-control" name="content" placeholder="文章內容">${article.content}</textarea>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main btn-small btn-round">完成修改</button>
              <a class="btn btn-default" href="deletearticle.controller?articleId=${article.articleId}">刪除文章</a>
            </div>
            
            <div class="text-center">
            	<table class="table">
            	<thead>
            		<tr><th colspan="3"><h3 style="text-align: left;">所有留言&ensp;:</h3></th>
            		</tr>
            		            	<tr>
            		<td style="width: 100px"><b>留言者</b></td>
            		<td style="text-align: left;"><b>留言內容</b></td>
            		<td style="text-align: center;"><b>刪除留言</b></td>
            	</tr>
            		</thead>

            	<tbody>
            	<c:forEach var='message' items='${article.messages}'>
            	<tr>
            		<td>${message.memberBean.name}</td>
            		<td style="text-align: left;"><p>${message.content}</p></td>
            		<td><button style="padding: 3px 7px;" class="btn btn-main btn-small btn-round" type="button" onclick="deletemessage(${message.messageId})">刪除留言</button></td>
            	</tr>
            	</c:forEach>
            	</tbody>
            	</table>
            </div>
           
          </form>
          	<a href="findallarticles.controller"><button class="btn btn-main btn-small btn-round" type="button">回到文章列表</button></a>
        </div>
      </div>
    </div>
  </div>
</section>
	
<!-- 
Essential Scripts
=====================================-->

<!-- Main jQuery -->
<script src="plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.1 -->
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Touchpin -->
<script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
	function deletemessage(id) {
		var result = confirm('您確定要刪除此筆留言');
		if (result) {
			$.ajax({
				type:'get',
				url:'deletemessage.controller?messageId=' + id,
				dataType:'JSON', /*下載*/
				contentType:'application/json', /*上傳*/
				success: function(data) {
					alert('刪除成功');
					window.location.reload();
				}
			})
		} else {
			return;
		}
	}



</script> 


</body>
</html>