<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Buy again | 客服相關</title>

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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function getcommonProblem() {
    	var req = new XMLHttpRequest(); //XMLHttpRequest()物件專門用來和伺服器做連線
    	req.open("get","/commonProblem.controller");
    	req.onload= function () { //onload事件 偵測連線的狀態結束
		//連線完成
    		var content = document.getElementById("commonProblem");
    		content.innerHTML = this.responseText;
		}
		req.send();  //送出連線
	}
	
function cclListMem() {
	var params={
		"ccl_type":$("#ccl_type").val(),
		"cl_ml_id":$("#cl_ml_id").val(),
		"ccl_content":$("#ccl_content").val()
	}
	console.log(params);
	$.ajax({
	   type:'POST',
	   url:'/ajax.controller',
	   dataType:'JSON',
	   contentType:'application/json',
	   data:JSON.stringify(params),
	   success: function(data){
		   console.log(data);
// 		   alert('送出成功');
		   window.location.reload();
	   }
	});
}
	

function MemSpstar() {
var good = document.getElementById("spstar").innerText;
var ccl_type = document.getElementById("mag").innerText;

	var params={
			"good":good,
			"ccl_type":ccl_type,
		}
			
	console.log(params);

	$.ajax({
	   type:'POST',
	   url:'MemSpstar.controller',
	   dataType:'JSON',
	   contentType:'application/json',
	   data:JSON.stringify(params),
	   success: function(data){
		   alert('已收到您的評價');
		   $("#score").css("display","none");
		   window.location.reload();
	   }
	});

}


function dialogue() {
	$("#dialogue").css("display","");
	
	var params={
			"ccl_type":$("#ccl_type").val(),
			"cl_ml_id":$("#cl_ml_id").val(),
			"ccl_content":"我要找客服"
		}
		console.log(params);
		$.ajax({
		   type:'POST',
		   url:'/ajax.controller',
		   dataType:'JSON',
		   contentType:'application/json',
		   data:JSON.stringify(params),
		   success: function(data){
			   console.log(data);
//	 		   alert('送出成功');
			   window.location.reload();
		   }
		});


	}

setInterval(function () { $(".refresh1").load(location.href + " .refresh1"); }, 5000);

function Warranty(){
	$("#ccl_content").val("保固有問題");
}
function product(){
	$("#ccl_content").val("產品註冊有問題");
}
function Delivery(){
	$("#ccl_content").val("配送有問題想問客服");
}
function VIP(){
	$("#ccl_content").val("請問消費要多少才會變成銀牌等級");
}

//離開對話
function MemScore(){

	$("#EndDialogue").css("display","none");
	$("#score").css("display","");
		
		var paramsEnd={
			"ccl_type":$("#ccl_type").val(),
			"cl_ml_id":$("#cl_ml_id").val(),
			"ccl_content":'已結束對話'
		}
		console.log(paramsEnd);
		$.ajax({
		   type:'POST',
		   url:'/ajax.controller',
		   dataType:'JSON',
		   contentType:'application/json',
		   data:JSON.stringify(paramsEnd),
		   success: function(data){
			   console.log(data);
//	 		   alert('送出成功');
// 			   window.location.reload();
		   }
		});
	
}




</script>

<style type="text/css">
        .boxx{
            overflow: auto; /*隱藏超出範圍的字*/
        }
        
        #bot{
        	background:#c9c9c9;
        	color:#000000;
        	font-size:14px;
        	padding: 2px;
        }
        .star img {
	        float: left;
	        cursor: pointer;    /* 滑鼠游標 */
	        height: 37px;

    }

</style>
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >
	<!--菜單連結-->
	<jsp:include page="title.jsp" />

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">會員專區</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">首頁</a></li>
							<li class="active">客戶服務</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;">
		
		<div class="widget widget-category"	style="margin-top: 100px; width: 250px;position:absolute;">
			<div style="float: right; bottom: 100px;">
				<h3 class="tf-ion-android-contacts" style="text-align: center;font-size: 28px;margin-bottom: 20px;">&thinsp;客戶服務</h3>
				<ul class="widget-category-list" style="text-align: left;font-size: 15px;margin-left: 20px;">
					<li><a style="font-size: 18px" href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">線上客服</a></li>
					<li><a style="font-size: 18px" href="#!" onclick="getcommonProblem();">常見Q&A</a></li>
				</ul>
			</div>
		</div>


		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul style="margin-left: -279px;" class="list-inline dashboard-menu text-center">
							<li><a href="memberInformation?memberId=${memlogin.memberId}">個人帳戶管理</a></li>
							<li><a href="memberOrder.controller">商品相關</a></li>
							<li><a class="active" href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">客戶服務</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
<!-- <div style="position: absolute; top: 100; text-align: center">		 -->
	<div id="commonProblem" >

		<div style="margin-top: 50px; width: 150PX;" class="refresh">
			<div class="container">
				<div class="row">
					<div style="margin-left:466px " class="col-md-6 col-md-offset-3" >
						<div class="block text-center">
							<h2 class="text-center">${memlogin.name}您好, 歡迎使用線上客戶服務</h2>
						       
 
							<div style="width: 520px;height: 300px;" class="refresh1">
							<div style="border:1px solid #dedede ;width: 520px;height: 300px; " class="boxx" >	
								
								<c:forEach var='luu' items='${lu}'>
									<c:forEach var='test' items='${luu.chat_content_listBean}'>
									
										<c:if test="${test.ccl_type == memlogin.userId}">
											<c:if test="${test.ccl_add_date != null}">										
												<div style="text-align:right;width: 500px;">
													${test.ccl_content}<br/>
													<p style="font-size: 5px">${test.ccl_add_date}</p>
												</div>
											</c:if>
										</c:if>
										
										<c:if test="${test.ccl_type == memlogin.userId}">
											<c:if test="${test.ccl_add_date == null}">										
												<div style="text-align:right;width: 500px;">
													${test.ccl_content}<br/>
													<p style="font-size: 5px">剛剛</p>
												</div>
											</c:if>
										</c:if>
										
										<c:if test="${test.ccl_type != memlogin.userId}">											
											<div style="text-align:left;width: 500px;">
												<p id="mag">${test.ccl_type}</p>${test.ccl_content}<br/>
												<p style="font-size: 5px">${test.ccl_add_date}</p>
											</div>
										</c:if>
									</c:forEach>
								</c:forEach>
									
							</div>
							</div>
							
<!-- 							<div style="display:none" > -->
<!-- 								<div style="padding: 10px" class="text-center"> -->
<!-- 									<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="Warranty();">保固問題</button> -->
<!-- 									<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="product();">產品註冊問題</button> -->
<!-- 									<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="Delivery();">配送問題</button> -->
<!-- 									<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="VIP();">VIP問題</button> -->
<!-- 								</div> -->
								
<!-- 								<div> -->
<!-- 									<div class="text-center" > -->
<%-- 										<input type="hidden"  id="ccl_type" id="ccl_type" value="${memlogin.userId}"/> --%>
<%-- 										<input type="hidden"  id="cl_ml_id" id="cl_ml_id" value="${memlogin.memberId}"/> --%>
<!-- 										<input style="height:35px;width: 410px;float: left;" type="text" multiple="multiple" id="ccl_content"  value=""/> -->
<!-- 									</div> -->
	
<!-- 									<div class="text-center" > -->
<!-- 										<button class="btn btn-main btn-small btn-round" onclick="cclListMem();">送出</button> -->
<!-- 									</div> -->
<!-- 								</div>		 -->
<!-- 							</div>		 -->
									<c:choose>
										<c:when test="${chat_ListBean.cl_type == 0}">
											<div style="padding: 10px" class="text-center">
												<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="Warranty();">保固問題</button>
												<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="product();">產品註冊問題</button>
												<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="Delivery();">配送問題</button>
												<button id="bot" class="btn btn-main btn-small btn-round" type="button" onclick="VIP();">VIP問題</button>
											</div>
											
											<div>
												<div class="text-center" >
													<input type="hidden"  id="ccl_type" id="ccl_type" value="${memlogin.userId}"/>
													<input type="hidden"  id="cl_ml_id" id="cl_ml_id" value="${memlogin.memberId}"/>
													<input style="height:35px;width: 410px;float: left;" type="text" multiple="multiple" id="ccl_content"  value=""/>
												</div>
				
												<div class="text-center" >
													<button class="btn btn-main btn-small btn-round" onclick="cclListMem();">送出</button>
												</div>
											</div>	
										
										
										
											<div id="EndDialogue">
											  	<button style="padding: 8px 192px;margin: 10px;float: left;" class="btn btn-main btn-small btn-round"  onclick="MemScore();">已解決問題離開對話</button>
											</div> 
										</c:when>
										
										<c:when  test="${chat_ListBean.cl_type == 1 || chat_ListBean.cl_type == NULL}">
											<div id="dialogue">
												<input type="hidden"  id="ccl_type" name="ccl_type" value="${memlogin.userId}"/>
												<input type="hidden"  id="cl_ml_id" name="cl_ml_id" value="${memlogin.memberId}"/>
											  	<button style="padding: 8px 219px;margin: 10px;float: left;" class="btn btn-main btn-small btn-round"  onclick="dialogue();">我要找客服</button>
											</div> 
										</c:when>
									</c:choose>
									 
									  
							        <div class="star" style="display:none" id="score" >
							        
							        <div style="float: left;margin: 0px;text-align:center;font-size:26px">
							        	<p style="font-size:20px;margin: 0px;margin-top: 7px;">請對此服務做出評價</p>
							        </div>
							            <img src="images/star.gif"  id="star1" class="1">
							            <img src="images/star.gif"  id="star2" class="1">
							            <img src="images/star.gif"  id="star3" class="1">
							            <img src="images/star.gif"  id="star4" class="1">
							            <img src="images/star.gif"  id="star5" class="1">
							            <p><span id="spstar" style="display:none"></span></p>
							            <button style="float: left;margin-lleft20px " class="btn btn-main btn-small btn-round" onclick="MemSpstar();">評分</button>
							        </div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- </div> -->

	</section>

<!--     <script src="../js/jquery-3.6.0.min.js"></script> -->
    <script>
    var star=$(".star img");   //取得所有的圖片
    var starlength = star.length; //取得長度
    var index = $(this);
    var sp = document.getElementById("spstar")
    var condition = true;
    
        $(".1").hover(function(){
            if (condition == true) { //利用if判斷式當 click後鎖住滑動的功能
                var N = $(this).attr("id").substr(4)
                $(this).attr("src","images/chngstar.gif")
                $(this).prevAll().attr("src","images/chngstar.gif")
//                 sp.innerHTML = "共獲得"+N+"分";
            }
        },function(){
            if (condition == true) {
                $(this).attr("src","images/star.gif")
                $(this).prevAll().attr("src","images/star.gif")
//                 sp.innerHTML = "";
            }
        });

        $("img").click(function(){
            if (condition == true) {
                condition = false
                var N = $(this).attr("id").substr(4)
                $(this).prevAll().attr("src","images/chngstar.gif")
                $(this).attr("src","images/chngstar.gif").mouseout(out)
                
                function out(){
                    $(this).prevAll().attr("src","images/chngstar.gif")
                    $(this).attr("src","images/chngstar.gif")
                    sp.innerHTML =N;
                }
            }
        });

        
        $("img").dblclick(function(){ 
            if (condition == false) {
                condition = true;
                var N = $(this).attr("id").substr(4)               
                $(this).attr("src","images/star.gif").mouseout(out)
                $(this).prevAll(index).attr("src","images/star.gif").mouseout(out)
                sp.innerHTML = "";
                
                function out(){
                    $(this).attr("src","images/star.gif")
                    $(this).prevAll(index).attr("src","images/star.gif")
                    sp.innerHTML = "";
                }
            }
        });
        

    </script>


	<jsp:include page="footer.jsp" />
	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>




</body>
</html>