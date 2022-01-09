<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增文章</title>

</head>
<body>
<!--菜單連結-->
<jsp:include page="title.jsp" />

	專區:
	<select name="sel" id="sel">
		<option value="2">顯示卡</option>
		<option value="3">處理器</option>
		<option value="4">記憶體</option>
		<option value="5">主機板</option>
		<option value="6">硬碟</option>
		<option value="7">螢幕</option>
		<option value="8">鍵盤</option>
		<option value="9">滑鼠</option>
	</select>
	<br>
	<a></a>
	<br> 標題:
	<input name="header" id="header" type="text">
	<div style="color:#FF0000; font-size:60%;"><a id="p1"></a></div>
	<br> 作者:
	<input name="name" id="name" type="text" value="${memlogin.name}" readonly="readonly">
	<br>
	<a></a>
	<br> 內容:
	<textarea name="content" id="content" rows="5" cols="50"></textarea>
	<div style="color:#FF0000; font-size:60%;"><a id="p2" style="color:#FF0000; font-size:60%;"></a></div>
	<br>
	<!--大頭貼上傳 -->
          	<div style="height:300px; width:300px; position:absolute; top:100; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img1"	 style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file1" name="picture" multiple="multiple" onchange="fileViewer()" /><br/>
    			</div>
    				<div class="xyzFileUpSel">
						<button type="button" class="btn btn-outline-dark">選擇大頭貼</button>
					</div>
            </div>
<!-- 	<button id="btn1" type="button" onclick="location.href='http://localhost:8080/article/mainarticle'">送出</button> -->
	<button id="btn1" type="submit">送出</button>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btn1").on('click',function(){	
			var params = {
				"sortId" : $("#sel").val(),
				"header" :	$("#header").val(),
				"name" : $("#name").val(),
				"content" : $("#content").val()
			}
			
			$.ajax({
				type : "post",
				url : '/addarticle',
				dataType : "JSON",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					console.log(data);
					
					var errors = data.errors;
					var articleBean = data.articleBean;
					
					if(JSON.stringify(errors) !== '{}'){
						$("#p1").empty("");
						$("#p2").empty("");
						$("#p1").append(errors.header);
						$("#p2").append(errors.content);
					}else{
						window.location.href="/mainarticle";
					}
				}
			})
         })
	})
	
	


document.getElementById("file1").addEventListener("change", fileViewer);

        function fileViewer() {
            //取得使用者在檔案選擇標籤中選取檔案

            //1. 建立FileReader物件
            let reader= new FileReader();
            //3.onload資料讀取成功完成時觸發
            reader.addEventListener("load", function (e) {
                //4. 將檔案內容暫存
                let fileContent = e.target.result;
                //5. 建立img標籤
                let show = document.getElementById("img1");
                //6. 設定img的src屬性
                show.setAttribute("src",fileContent);
                //7. 設定img的class屬性

                //8. 將 img 物件新增到div標籤後

            });
            //2. 使用readAsDataURL方法，讀取檔案內容
            let file =document.getElementById("file1").files[0];
            reader.readAsDataURL(file);

        }
        
        $('.xyzFileUpSel').click(function () {
            document.getElementById("file1").click();
            //$("#xyzFileUp").click();
        });
        
</script>

</body>
</html>