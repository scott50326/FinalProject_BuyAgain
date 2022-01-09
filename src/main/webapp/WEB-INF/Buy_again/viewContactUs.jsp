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
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function sendContactUs(){

    	var params = {}
    	params["contactUsId"] = $("#contactUsId").val();
    	params["name"] = $("#name").val();
    	params["email"] = $("#email").val();
    	params["title"] = $("#title").val();
    	params["content"] = $("#content").val();
    	params["registerDate"] = $("#registerDate").val();
    	params["responder"] = $("#responder").val();
    	params["responseTitle"] = $("#responseTitle").val();
    	params["responseContent"] = $("#responseContent").val();

    	if ($("#responseTitle").val().length == 0){
				alert('主旨欄位不得空白');
    	}else if ($("#responseContent").val().length == 0) {
    			alert('回覆內容欄位不得空白');
		}else{
			sendContactUssss(params);
		}   	
    }
    
function sendContactUssss(params){
	$.ajax({
    	   type:'post',
    	   url:'contactUsInsert2.controller',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(us){
//     		   alert('回覆信件成功');
//     		   window.location.href="/contactUsfindall.controller";
//     		   registerUs();
    		   var Us1={
    					"email":$("#email").val(),
    					"responseTitle":$("#responseTitle").val(),
    					"responseContent":$("#responseContent").val()
    				}
    		   console.log(Us1);
    			$.ajax({
    		    	   type:'post',
    		    	   url:'registerContactUs',
    		    	   dataType:'JSON',
    		    	   contentType:'application/json',
    		    	   data:JSON.stringify(Us1),
    		    	   success: function(Data){
//    		     		   console.log(Data);
    		    		   alert('已回覆信件');
    		    		   window.location.href="/contactUsfindall.controller";
    		    	   }
    		    	});
    		   
    		   
    	   }
    	});
}
function contactUsfindall(){
	window.location.href="/contactUsfindall.controller";
}
//回信

// function registerUs(){
// 	var Us={
// 			"email": $("#email").val(),
// 			"responseTitle":$("#responseTitle").val(),
// 			"responseContent":$("#responseContent").val()
// 		}
// 	console.log('Us='+Us);
// 	$.ajax({
//     	   type:'post',
//     	   url:'registerUs',
//     	   dataType:'JSON',
//     	   contentType:'application/json',
//     	   data:JSON.stringify(Us),
//     	   success: function(Data){
// //     		   console.log(Data);
//     		   alert('回覆信件成功');
//     		   window.location.href="/contactUsfindall.controller";
//     	   }
//     	});
// }
  //一鍵輸入
		function autoinput1() {
    		$("#responseContent").val("已收到您的信件，稍後會再請專員回致電給您");

    	}
	</script>

</head>
<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

	<jsp:include page="managertitle.jsp" />

	<form id="contact-form" >
		<div class="col-md-6">
			<div class="post" style="padding-top: 20px;">
				<h2 class="post-title">客人反應的訊息</h2>
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
<!-- 					<div id="cf-submit"> -->
<!-- 						<button class="btn btn-main text-center" -->
<!-- 							onclick="contactUsfindall();">回前頁</button> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="post" style="padding-top: 20px;">
				<h2 class="post-title">要回覆的訊息</h2>
				<div class="post-meta">
					<div class="form-group">
						<p align="left">發送客服ID</p>
						<input type="text" id="responder" readonly="readonly" class="form-control" value="${mngLogin.name}" />
					</div>
					<div class="form-group">
						<p align="left">回覆主旨</p>
						<input type="text" id="responseTitle" class="form-control" value="感謝您的來信" />
					</div>
					<div class="form-group">
						<p align="left">回覆的內文</p>
						<textarea rows="6" id="responseContent" placeholder="想傳遞的訊息" class="form-control"></textarea>
					</div>
					<div id="cf-submit">
						<!-- 							<input type="submit" class="btn btn-transparent" value="送出" onclick='paContactUs();'> -->
						<button type="button" class="btn btn-main text-center" onclick="sendContactUs()">回覆顧客</button>
						<button type="button" class="btn btn-main text-center" onclick='autoinput1();'>一鍵輸入</button>
						
<!-- 							onclick="location.href='/contactUsfindall.controller'">回覆顧客</button> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>