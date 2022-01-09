<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | 聯絡我們</title>

<script>
function sendContactUs(){

    	var params = {}
    	params["name"] = $("#name").val();
    	params["email"] = $("#email").val();
    	params["title"] = $("#title").val();
    	params["content"] = $("#content").val();
 
    	
    	let sp5=document.getElementById("idsp5");
    	if ($("#name").val().length == 0){
				alert('姓名欄位不得空白');
    	}else if ($("#email").val().length == 0) {
    			alert('信箱欄位不得空白');
		}else if ($("#title").val().length == 0) {
    			alert('主旨欄位不得空白');
		}else if ($("#content").val().length == 0) {
			alert('內容欄位不得空白');
		}else{
			sendContactUssss(params);
		}   	
    }
    
function sendContactUssss(params){
	$.ajax({
    	   type:'post',
    	   url:'contactUsInsert.controller',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(us){
    		   console.log(us);
    		   alert('送出成功');
    		   window.location.href="/contactUs";
    	   }
    	});
}
    	

	</script>
</head>
<body id="body" background="/images/background.png" style=" background-attachment: fixed;">
<jsp:include page="title.jsp" /> 

<section class="page-header" style="margin-top:0px;padding: 4px 0;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Contact Us</h1>
					<ol class="breadcrumb">
						<li><a href="index.html">Buy again</a></li>
						<li class="active">聯絡我們</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="page-wrapper">
	<div class="contact-section"  style="    background-color: #ffffffb0;
    padding: 50px;">
		<div class="container">
			<div class="row">
				<!-- Contact Form -->
				<div class="contact-form col-md-6 " >
					
					<form id="contact-form" method="post" action="" role="form">
					
				
						<div class="form-group">
							<input style="border: 1px solid #979393;" type="text" placeholder="姓名" class="form-control" name="name" id="name">
							<p style="font-size: 10px;color: #000000">※不可空白<span id="idsp1" style="color:red;"></span> </p>
							
						</div>
						
						<div class="form-group">
							<input style="border: 1px solid #979393;" type="email" placeholder="Email" class="form-control" name="email" id="email">
							<p style="font-size: 10px;color: #000000">※不可空白<span id="idsp2" style="color:red;"></span> </p>
						</div>
						
						<div class="form-group">
							<input style="border: 1px solid #979393;" type="text" placeholder="信件主旨" class="form-control" name="title" id="title">
							<p style="font-size: 10px;color: #000000">※不可空白，內容超過兩個字<span id="idsp3" style="color:red;"></span></p>
						</div>
						
						<div class="form-group">
							<textarea style="border: 1px solid #979393;" rows="6" placeholder="想傳遞的訊息" class="form-control" name="content" id="content"></textarea>
							<p style="font-size: 10px;color: #000000">※不可空白，內容超過兩個字<span id="idsp5" style="color:red;"></span> </p>
						</div>

						<div id="cf-submit">
							<input style="font-size: 15px;padding: 7px 0px;" type="button" id="contact-submit" class="btn btn-transparent" value="送出" onclick='sendContactUs()'>
							<input class="btn btn-transparent"  type="button" value="一鍵輸入" onclick='quickInput();'>
<!-- 							<button class="btn btn-transparent" id='ContactUs' type='button' value='ContactUs' onclick='sendContactUs()'>送出</button> -->
						</div>						
						
					</form>
				</div>
				<!-- ./End Contact Form -->
				
				<!-- Contact Details -->
				<div class="contact-details col-md-6 " >
					<div class="google-map">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14460.09967764174!2d121.54675021453228!3d25.033228374634547!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd4825ecdf1%3A0x1376611696cf0cff!2z5Y-w5YyX5biC6L6y5pyD5aSn5qiT!5e0!3m2!1szh-TW!2stw!4v1637484164711!5m2!1szh-TW!2stw" width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
					</div>
					<ul class="contact-short-info" >
						<li>
							<i class="tf-ion-ios-home"></i>
							<span>106台北市大安區信義路三段153號</span>
						</li>
						<li>
							<i class="tf-ion-android-phone-portrait"></i>
							<span>Phone : 02 6631 8168</span>
						</li>
						<li>
							<i class="tf-ion-android-globe"></i>
							<span>Fax : 02 1234 5678</span>
						</li>
						<li>
							<i class="tf-ion-android-mail"></i>
							<span>Email : buyagain134@gmail.com</span>
						</li>
					</ul>
					<!-- Footer Social Links -->
					<div class="social-icon">
						<ul>
							<li><a class="fb-icon" href="https://www.facebook.com/III.org.tw/?ref=page_internal"><i class="tf-ion-social-facebook"></i></a></li>
							<li><a href="https://twitter.com/itdcedu"><i class="tf-ion-social-twitter"></i></a></li>
							<li><a href="https://www.ispan.com.tw/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
							<li><a href="https://www.google.com/search?q=%E8%B3%87%E7%AD%96%E6%9C%83&oq=%E8%B3%87%E7%AD%96%E6%9C%83&aqs=chrome..69i57j46i199i465i512j69i59j35i39j46i175i199i433i512j69i61l3.4163j0j7&sourceid=chrome&ie=UTF-8&tbs=lf:1,lf_ui:2&tbm=lcl&sxsrf=AOaemvLxhfnVHvCspvedovL11YrAYlckYQ:1637484746336&rflfq=1&num=10&rldimm=17131700483050583519&lqi=Cgnos4fnrZbmnINaDSIL6LOHIOetliDmnIOSARhjb21wdXRlcl90cmFpbmluZ19zY2hvb2yaASNDaFpEU1VoTk1HOW5TMFZKUTBGblNVTTRlVW95VVV4bkVBRaoBExABKg8iC-izhyDnrZYg5pyDKEU&ved=2ahUKEwjV-4SFiqn0AhV3sFYBHUmyDzwQvS56BAgOEEA&rlst=f#rlfi=hd:;si:17131700483050583519,l,Cgnos4fnrZbmnINaDSIL6LOHIOetliDmnIOSARhjb21wdXRlcl90cmFpbmluZ19zY2hvb2yaASNDaFpEU1VoTk1HOW5TMFZKUTBGblNVTTRlVW95VVV4bkVBRaoBExABKg8iC-izhyDnrZYg5pyDKEU;mv:[[25.1131402,121.60914159999999],[24.0960386,120.59677429999999]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3!3sIAE,lf:1,lf_ui:2"><i class="tf-ion-social-googleplus-outline"></i></a></li>
						</ul>
					</div>
					<!--/. End Footer Social Links -->
				</div>
				<!-- / End Contact Details -->
					
				
			
			</div> <!-- end row -->
		</div> <!-- end container -->
	</div>
</section>
	
<jsp:include page="footer.jsp" />   

    <!-- Main Js File -->
    <script src="js/script.js"></script>
<script>
	//判斷姓名欄不得為空
    document.getElementById("name").addEventListener("blur",chkname);
    let sp1=document.getElementById("idsp1");
        function chkname() {
            //取得元素值
            let thename = document.getElementById("name").value;
            let re=/^[\u4e00-\u9fa5]{2,3}$/;

            if (re.test(thename))
                sp1.innerHTML="<img src='images/right.png'>正確";
            else
                sp1.innerHTML="<img src='images/error.png'>錯誤";       
        }
      //判斷信箱格式
        document.getElementById("email").addEventListener("blur",chkEmail);
        let sp2=document.getElementById("idsp2");
            function chkEmail() {
                //取得元素值
                 let theEmail = document.getElementById("email").value;
                //建立RegExp物件語法 2
                let re1 =/^.+@.+\..{2,4}$/;
                if (re1.test(theEmail))
                        sp2.innerHTML="<img src='images/right.png'>正確";
                    else
                        sp2.innerHTML="<img src='images/error.png'>格式錯誤";                       
                }  
            
          //判斷主旨欄不得為空
            document.getElementById("title").addEventListener("blur",chktitle);
            let sp3=document.getElementById("idsp3");
                function chktitle() {
                    //取得元素值
                    let thetitle = document.getElementById("title").value;
                    let re2=/^[\u4e00-\u9fa5]{2,}$/;

                    if (re2.test(thetitle))
                        sp3.innerHTML="<img src='images/right.png'>正確";
                    else
                        sp3.innerHTML="<img src='images/error.png'>錯誤";       
                } 
                
              //判斷內容欄不得為空
                document.getElementById("content").addEventListener("blur",chkcontent);
            let sp5=document.getElementById("idsp5");
                function chkcontent() {
                    //取得元素值
                    let thecontent = document.getElementById("content").value;
                    let re3=/^[\u4e00-\u9fa5]{2,}$/;

                    if (re3.test(thecontent))
                        sp5.innerHTML="<img src='images/right.png'>正確";
                    else
                        sp5.innerHTML="<img src='images/error.png'>錯誤";       
                } 
                    
                    //一鍵輸入
                    function quickInput(){
                    	document.getElementById('name').value = '張君雅';
                    	document.getElementById('email').value = 'buyagain134@gmail.com';
                    	document.getElementById('title').value = '主旨';
                    	document.getElementById('content').value = '聯繫我們';                  	
                    }  
                </script>
  </body>
  </html>