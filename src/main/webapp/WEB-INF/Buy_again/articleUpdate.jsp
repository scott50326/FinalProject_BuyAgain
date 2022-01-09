<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改文章</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		
		console.log('success:' + data);
		var json = JSON.stringify(data,null,4);
		console.log('json:' + json)
		
		if(data == null){
			$(div).prepend("<p>暫無資料</p>")
		}else{
			var div = $('#showarticle');
			
			var content = "標題:" + "&ensp;" + "<input name='header' id='header' type='text' value=" + data.header + ">" +
						  "<br>" + 	
						  "作者:"	 + "&ensp;" +"<input name='name' id='name' type='text' readonly='value' value=" + data.name +">" + 
						  "<br>" + 
						  "內容:" + "&ensp;" +"<textarea name='content' id='content' rows='5' cols='50'>" + data.content +"</textarea>" + 
						  "<br>";
						  
						  
			div.append(content);
			
		}
		
	}
})
$("#btn1").on('click',function(){	
	console.log($("#aid").val())
	var params = {
			"articleId" : $("#aid").val(),
			"sortId" : $("#sel").val(),
			"header" : $("#header").val(),
			"name" : $("#name").val(),
			"content" : $("#content").val()
	}	
// 	params["articleId"] = $("#aid").val();
// 	params["sort"] = $("#sel").val();
// 	params["header"] = $("#header").val();
// 	params["name"] = $("#name").val();
// 	params["content"] = $("#content").val();
	
	console.log(params)
	
	$.ajax({
		type : "post",
		url : '/replacearticle',
		dataType : "JSON",
		contentType : "application/json",
		data : JSON.stringify(params),
		success : function(data) {
			console.log(data)
		}
	})
 })
}

</script>
</head>	
<body>
<!--菜單連結-->
<jsp:include page="title.jsp" />
<div id="showarticle">
    專區:&thinsp;
	<select id="sel">
		<option value="2">處理器</option>
		<option value="3">記憶體</option>
		<option value="4">主機板</option>
		<option value="5">顯示卡</option>
		<option value="6">硬碟</option>
		<option value="7">螢幕</option>
		<option value="8">鍵盤</option>
		<option value="9">滑鼠</option>
	</select>
<br>
</div>
<button id="btn1" type="button" onclick="location.href='https://localhost:8080/articlecontent?articleId=' + ${articleId}">送出</button>
&emsp;
<button id="btn2" type="button" onclick="location.href='https://localhost:8080/articlecontent?articleId=' + ${articleId}">回文章</button>
<input id="aid" type="hidden" value="${articleId}">
</body>
</html>