<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 會員登入</title>

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
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
#u_0_3_uI{
	display: none
}

</style>
   
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--菜單連結-->
<jsp:include page="title.jsp" />
 <script type="text/javascript">
        //應用程式編號，進入 https://developers.facebook.com/apps/ 即可看到
        let FB_appID = "185092297170748";
        // Load the Facebook Javascript SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function () {
            FB.init({
                appId: '185092297170748',//FB appID
                cookie: true,  // enable cookies to allow the server to access the session
                xfbml: true,  // parse social plugins on this page
                version: 'v12.0' // use graph api version
            });
            FB.AppEvents.logPageView();

        };

        //使用自己客製化的按鈕來登入
        function FBLogin() {
            FB.getLoginStatus(function (res) {
                console.log(`status:${res.status}`);//Debug

                if (res.status === "connected") { 
                    let userID = res["authResponse"]["userID"];
                    console.log("用戶已授權您的App，用戶須先revoke撤除App後才能再重新授權你的App");
                    console.log('已授權App登入FB 的 userID:'${userID});
                    GetProfile();
                } else if (res.status === 'not_authorized' || res.status === "unknown") {
                    //App未授權或用戶登出FB網站才讓用戶執行登入動作
                    FB.login(function (response) {

                        //console.log(response); //debug用
                        if (response.status === 'connected') {
                            //user已登入FB
                            //抓userID
                            let userID = response["authResponse"]["userID"];
                            console.log('已授權App登入FB 的 userID:${userID}');
                            GetProfile();

                        } else {
                            // user FB取消授權
                            alert("Facebook帳號無法登入");
                        }
                        //"public_profile"可省略，仍然可以取得name、userID
                    }, { scope: 'email' }); 
                }
            });


        }
    </script>
    <script type="text/javascript">
        //取得用戶姓名、email
        function GetProfile() {
//             document.getElementById('content').innerHTML = "";//先清空顯示結果

            //FB.api()使用說明：https://developers.facebook.com/docs/javascript/reference/FB.api
            //取得用戶個資
            FB.api("/me", "GET", { fields: 'last_name,first_name,name,email' }, function (user) {
                //user物件的欄位：https://developers.facebook.com/docs/graph-api/reference/user
                if (user.error) {
                    console.log(response);
                } else {
                	
//                 	var us = JSON.stringify(user);
//                     document.getElementById('content').innerHTML = JSON.stringify(user);
//                     $("#userId").val(user.email);
                    
                    var user1 = {
                    "name" : user.name,
                    "email" : user.email,
                }
                    
                    console.log(user1);
                    $.ajax({
                 	   type:'post',
                 	   url:'insertmemberFB.controller',
                 	   dataType:'JSON',
                 	   contentType:'application/json',
                 	   data:JSON.stringify(user1),
                 	   success: function(data){
                 		   window.location.href="/homepage.controller";
                 	   }
                 	});
                }
            });
        }
    </script>
    <!--有些網站會做帳號和user FB帳號的綁定/解除綁定，或你想讓使用者刪除你的FB App，讓使用者下次可以切換不同FB帳號登入你的網站-->
    <!--下面程式碼派得上用場-->
    <script type="text/javascript">

        //刪除使用者已授權你的FB App，好讓使用者下次重新授權你的FB App
        //參考：https://stackoverflow.com/questions/6634212/remove-the-application-from-a-user-using-graph-api/7741978#7741978
        //https://stackoverflow.com/questions/9050190/facebook-api-sdk-revoke-access
        function Del_FB_App() {

            FB.getLoginStatus(function (response) {//取得目前user是否登入FB網站
                //debug用
                console.log(response);
                if (response.status === 'connected') {
                    //抓userID
                    //let userID = response["authResponse"]["userID"];


                    FB.api("/me/permissions", "DELETE", function (response) {
                        console.log("刪除結果");
                        console.log(response); //gives true on app delete success
                        //最後一個參數傳遞true避免cache
                        FB.getLoginStatus(function (res) { }, true);//強制刷新cache避免login status下次誤判
                        
                    });
                    $.ajax({
                 	   type:'post',
                 	   url:'memberlogout.controller',
                 	   dataType:'JSON',
                 	   contentType:'application/json',
                 	   success: function(){
                 		   alert('送出成功');
                 		   window.location.href="/contactUs";
                 	   }
                 	});

                } else { 
                    console.log("無法刪除FB App");
                }
            });
        } 
    </script>
   
   
<section class="signin-page account" style="height: 10px;">
  <div class="container">
    <div class="row" >
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;background-color: #c0bdbd82;">
        
<!--            <a class="logo" href="index.html"> -->
<!--             <img src="images/logo-removebg-preview.png" alt=""> -->
<!--           </a>  -->
          <h2 class="text-center">歡迎回來</h2>
          <form class="text-left clearfix" action="memberchecklogin.controller" method="post">
            <div class="form-group">
            	<label>請輸入帳號&ensp;:</label>
              	<input type="text" class="form-control" name="userId" placeholder="帳號" id="userId">
              	<span style="color: red;">${errors.name}</span>
            </div>
            <div class="form-group">
              	<label>請輸入密碼&ensp;:</label>
              	<input type="password" class="form-control" name="userPwd" placeholder="密碼" id="userPwd">
              	<i id="checkEye" style="  position: absolute; top: 45%;font-size: 20px;right: 60px" class="tf-ion-eye-disabled"></i>
              	<span style="color: red;">${errors.pwd}</span>
            </div>
            	<input type="checkbox" name="remember-me">記住我
            <div class="text-center">
              	<button style="font-size: 15px;padding: 7px 35px;" type="submit" class="btn btn-main text-center" >登入</button>
<!--               	<div style="border: 1px solid red;height: 20px" id="status"></div> -->

    <div>
        <a class="btn btn-default"  onclick="FBLogin();" style="font-size: 15px;background: #0b5beb;color: #fdfdfd"><i class="tf-ion-social-facebook">acebook登入</i></a>
<!--         <input type="button" class="btn btn-main text-center" value="Facebook登入" onclick="FBLogin();"> -->
    </div>
<!--     <div> -->
<!--         留意用戶的此頁，你的App會被移除：https://www.facebook.com/settings?tab=applications -->
<!--         <input type="button" value="登出" onclick="Del_FB_App()" /> -->
<!--     </div> -->

              	<br><span style="color: red;">${errors.msg}</span>
            </div>
          </form>
          <p><a href="/retrievePassword.controller">忘記密碼?</a></p>
          <p class="mt-20">沒有帳號?<a href="memberregister.controller">前往註冊</a></p>
          <div style="padding: 10px;" class="text-center">
				<a class="btn btn-default" onclick="autoinput1()"><i class="tf-pencil2" aria-hidden="true">一鍵輸入(1)</i></a></td>
		     	<a class="btn btn-default" onclick="autoinput2()"><i class="tf-pencil2" aria-hidden="true">一鍵輸入(2)</i></a></td>
	      </div>
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
    
    <script type="text/javascript">
    
    	function autoinput1() {
    		$("#userId").val("Luffy123");
    		$("#userPwd").val("Do!ng123");
    	}
    	
    	function autoinput2() {
    		$("#userId").val("Zoro123");
    		$("#userPwd").val("Do!ng123");
    	}
    
    	$("#checkEye").click(function () {
    		  if($(this).hasClass('tf-ion-eye-disabled')){
    		     $("#userPwd").attr('type', 'text');
    		  }else{
    		     $("#userPwd").attr('type', 'password');
    		  }
    		  $(this).toggleClass('tf-ion-eye-disabled').toggleClass('tf-ion-eye');
    		}); 
    </script>



  </body>
  </html>