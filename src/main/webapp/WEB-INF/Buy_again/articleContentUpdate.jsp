<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章內容</title>
<style type="text/css">
#hp {
	display: inline;
}

#rgdate {
	margin-top: auto;
}

#fil {
	margin:auto	;
	width: 70%;
}

fieldset{
position: relative;
background-color: white;
box-shadow: 0px 0px 8px gray;
}

#cont {
	white-space: pre;
}

.msg {
	display: inline;
	font-size: 17px;
}

.memberimg{
width: 13%;
padding-left:50px;
 position:absolute; 
 top:337px; 
 left:0px;
}
#write{
background-color: inherit;
border: none;
}
#submit{
background-color: inherit;
border: none;
}
#concel{
background-color: inherit;
border: none;
}
</style>
<link rel="stylesheet" href="/fontawesome/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var articleId = $('#aid').val();
		load(articleId);
		console.log(articleId)
	});
	
	function load(articleId){
	 $.ajax({
		type:'post',
		url:'/querybyid/' + articleId,
		dataType:'JSON',
		contentType:'application/json',
		success: function(data){
			
			var article = data.articleBean;
			var memberimg = data.memberimg;
			
			$("#memimg").attr("src","images/memberimages/"+memberimg);
			
			
			console.log('success:' + data);
			var json = JSON.stringify(data,null,4);
			console.log('json:' + json)
			
			if(article == null){
				$(div).prepend("<p>暫無資料</p>")
			}else{
				var div = $('#showarticle');
				
				if ( article.fk_sortId == 1) {var sort = "版規"}
				else if ( article.fk_sortId == 2) {var sort = "顯示卡"}
				else if ( article.fk_sortId == 3) {var sort = "處理器"}
				else if ( article.fk_sortId == 4) {var sort = "記憶體"}
				else if ( article.fk_sortId == 5) {var sort = "主機板"}
				else if ( article.fk_sortId == 6) {var sort = "硬碟"}
				else if ( article.fk_sortId == 7) {var sort = "螢幕"}
				else if ( article.fk_sortId == 8) {var sort = "鍵盤"}
				else if ( article.fk_sortId == 9) {var sort = "滑鼠"}
				
				if (article.img1 == null){
					var content = 
					  "<h2>" + "【" + sort + "】" + article.header + "</h2>" + 
					  "<hr>" +
					  "<p id='hp' style='font-size:17px'><b>" + "" + article.name + "</b></p>" + "<p id='hp' style='color:#0080FF;font-size:10px' >" + '&ensp;' + "</p>" + 
					  "<p id='rgdate' style='font-size:13px;color:#8E8E8E;float: right;'>" + article.registerDate + "</p>" +
					  "<p style='font-size:17px;padding: 20px;' id='cont' >" + article.content + "</p>" + 
					  "<hr>"; 
					div.append(content);
				} else {
				
				var content = 
							  "<h2>" + "【" + sort + "】" + article.header + "</h2>" + 
							  "<hr>" +
							  "<p id='hp' style='font-size:17px'><b>" + "" + article.name + "</b></p>" + "<p id='hp' style='color:#0080FF;font-size:10px' >" + '&ensp;' + "</p>" + 
							  "<p id='rgdate' style='font-size:13px;color:#8E8E8E;float: right;'>" + article.registerDate + "</p>" +
							  "<p style='font-size:17px;padding: 20px;' id='cont'>" + article.content + "</p>" + 
							  "<img style='width: 30%;' src=images/articleimages/" + article.img1 + ">" +
							  "<hr>"; 
				    div.append(content);
				}	  
				
				
			}
			
			
			
		}
	})
	
	$.ajax({
		type:'post',
		url:'/querybyarticleId/' + articleId,
		dataType:'JSON',
		contentType:'application/json',
		success:function(data){

			var div = $("#showmessage");
			
			$.each(data, function(i,n){

							 		 
				if ($("#username").text() == n.name) {
					var content = "<input id='msgid' type='hidden' value="+ n.messageId + "></input>" + 
			 		  "<p class='msg' id=" + n.name + " style='color:#0080FF'><b>" + n.name + "</b></p>" + "&ensp;" + 
			 		  "<p id=" + n.messageId + " name=" + n.messageId + " class='msg'>" + n.content + "</p>" + 
			 		  "<button id='write' type='button' onclick='del(" + n.messageId + ")' style='float:right' class='fas fa-trash-alt'>" + "刪除" + "</button>"+
			 		  "<button id='write' type='button' onclick='update("+ n.messageId +"," + n.name + ")' style='float:right' class='fas fa-pencil-alt'>" + "編輯" + "</button>" + 
					  "<br>" +
		              "<font size='2' color='#8E8E8E'  style='float: right;''>" + n.registerDate + "</font>" + "<hr>" 
		              "<br>";
		              
					div.append(content);
				} else {
					var content = "<input id='msgid' type='hidden' value="+ n.messageId + "></input>" + 
			 		  "<p class='msg' id=" + n.name + " style='color:#0080FF'><b>" + n.name + "</b></p>" + "&ensp;" + 
			 		  "<p id=" + n.messageId + " name=" + n.messageId + " class='msg'>" + n.content + "</p>" + 
			 		  "<br>" +
		              "<font size='2' color='#8E8E8E' style='float: right;'>" + n.registerDate + "</font>" + 
		              "<br>";
		              
					div.append(content);  
				}
				
			

				
			})			
		}
	})
}
	function delart(articleId){
		
		if(confirm("確實要刪除嗎?")){
			$.ajax({
				type:"GET",
				url:"/deletearticle/" + articleId,
				success:function(data){
					console.log("123")
					window.location.href = "/querybyuserId";
				}
				
			})
			
		}else{
			
			};
		
	}
	
	function send(articleId) {
		
// 		var params = {}
// 		params["name"] = $("#name").text();
// 		params["content"] = $("#content").val();
	
		var params = {
				"name" : $("#username").text(),
				"content" : $("#content").val()
		}
				
		console.log(params)
		
		$.ajax({
			type:'post',
			url:'/addmessage/' + articleId,
			dataType:'JSON',
			contentType:'application/json',
			data:JSON.stringify(params),
			success:function(data){
			location.reload();
			}
		})
 	}
	
	function update(messageId){
		var articleId = $("#aid").val();
		
	
		
		var updateTemp = 
			"<input type='text' id='msg1' size='110'style='height:28px'>" + "</input>" + 
			"<button type='button' id='submit' class='fas fa-pencil-alt'>" + "送出" + "</button>" + "<button type='button' id='concel' class='fas fa-times'>" + "取消" + "</button>";
		
		$("#" + messageId + "").html(updateTemp);
		
	    
		$("#submit").on("click",function(){
			console.log($("#username").text())
			console.log( $("#msg1").val())
			var params = {
					"name" : $("#username").text(),
					"content" : $("#msg1").val()
			}
	 		
			console.log(params)
			$.ajax({
				type:'post',
				url:'/updatebymessageId/' + articleId + '/' + messageId ,
				dataType:'JSON',
				contentType:'application/json',
				data:JSON.stringify(params),
				success:function(data){
					console.log(data)
					location.reload();
				}
			})
		})
		
		$("#concel").on("click",function(){
			location.reload();
		})
			
	}
	
	function del(messageId){
		if(confirm("確實要刪除嗎?")){
			
		$.ajax({
			type:'GET',
			url:'/deletemessage/' + messageId,
			dataType:'JSON',
			contentType:'application/json',
			success:function(data){
				
			}
		})
		location.reload();
		}else{
			
			}
		
	}
	
</script>
</head>
<body id="body" background="/images/background.png"	style="background-attachment: fixed;">
<!--菜單連結-->
<jsp:include page="title.jsp" />


<div id="memberimg">

		<img id="memimg" style="top: 294px;left:4px;width: 16%;border:5px solid #ffffff;padding: 0px" src='images/memberimages/${memberimg}' class='memberimg'>

</div>
	<div id='fil'>
		<fieldset style="margin: 25px;padding: 35px;">
			<div style="height: 30px;    float: right;    padding-top: 32px;">
				<button id='write' type="button" style="float: right;"
					onclick="location.href='https://localhost:8080/updatearticle2?articleId=' + ${articleId}" class='fas fa-pencil-alt'>修改文章</button>
				<button id='write' type="button" style="float: right;" id="delart" onclick="delart(${articleId})" class='fas fa-trash-alt'>刪除</button>
			</div>
		
			<div id="showarticle"></div>
			<div id="showmessage"></div>
			
				<c:if test="${memlogin != null}">
			<div>
				<p id='username' class="msg" style='color:#0080FF'><b>${memlogin.name}</b></p>&ensp;
				<input id='content' placeholder="留言..." size="108"></input>&emsp;
				<button id="write" class="fas fa-pencil-alt" type="submit" onclick="send(${articleId})">編寫</button>
			</div>
				</c:if>
					<c:if test="${memlogin == null}">
			<div>
				<p id='username' class="msg" style='color:red'><b><i>尚未登入無法留言!&ensp;<a href="memberlogin.controller">登入</a></i></b></p>
			</div>
				</c:if>
				
		</fieldset>
	</div>
	<input id="aid" type="hidden" value="${articleId}">
</body>
</html>