<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>撰寫文章</title>
<style type="text/css">
.content{

}
.art{
margin-left: 34%;
}
</style>
<script src="./ckeditor/ckeditor.js"></script>
</head>
<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
<!--菜單連結-->
<jsp:include page="title.jsp" />


<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;background-color:#ffffffb0;border:0px">
          <h2 class="text-center">撰寫您的文章</h2>
          <form action="/addarticle2" method="post" enctype="multipart/form-data">
          	<input id="articleId" name='articleId' type="hidden" value="${articleId}">
			<!--大頭貼上傳 -->
<!--           	<div style="height:300px; width:300px; position:absolute; top:100; right:550px; text-align:center"> -->
              	<div style="height:300px; width:300px; position:absolute; top:100; right:550px; text-align:center">
              	<div id="dropZone" >
					<img id="img1" style="height:150px; width:150px;"/>
    			</div>
   				
   				<div  style="display: none;">
   					<input type="file" id="file1" name="picture" multiple="multiple" onchange="fileViewer()" /><br/>
    			</div>
    				<div class="xyzFileUpSel">
						<button type="button" style="    border: 1px solid #484848;" class="btn btn-outline-dark">新增圖片</button>
					</div>
            </div>
            <div class="form-group">
            	<label style="float: left;">專區</label> 
				<select name="sort" id="sort" style="width: 495px;height: 45px">
					<option value="2">顯示卡</option>
					<option value="3">處理器</option>
					<option value="4">記憶體</option>
					<option value="5">主機板</option>
					<option value="6">硬碟</option>
					<option value="7">螢幕</option>
					<option value="8">鍵盤</option>
					<option value="9">滑鼠</option>
				</select>
            </div>
            <div class="form-group">
            	<label style="float: left;">作者</label>
				<input type="text" class="form-control" name="name" id="name" readonly="readonly" value="${memlogin.name}">
            </div>
            <div class="form-group">
            	<label style="float: left;">標題</label>
				<input type="text" class="form-control" name="header" id="header" >
				<span style="color: red;">${errors.header}</span>
            </div>
            <div class="form-group">
           	 	<div class='content'>

					<textarea name="content" id="content" cols="10" rows="100"></textarea>
					<script> 
					 CKEDITOR.replace( 'content' );
				 	</script> 
					<span style="color: red;">${errors.content}</span>
				</div>
            </div>
           
            <div class="text-center">
              	<button type="submit" id="btn1" class="btn btn-main text-center">送出</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- <img alt="" src="./images/messageImage_1635082176618.jpg"> -->
<div class='art'>

<fieldset>

<!-- <div> -->
<!--     <label>專區</label>  -->
<!-- 	<select name="sort" id="sort"> -->
<!-- 		<option value="2">顯示卡</option> -->
<!-- 		<option value="3">處理器</option> -->
<!-- 		<option value="4">記憶體</option> -->
<!-- 		<option value="5">主機板</option> -->
<!-- 		<option value="6">硬碟</option> -->
<!-- 		<option value="7">螢幕</option> -->
<!-- 		<option value="8">鍵盤</option> -->
<!-- 		<option value="9">滑鼠</option> -->
<!-- 	</select> -->
<!-- </div> -->
<!-- <div> -->
<!-- 	<label>作者</label> -->
<%-- 	<input type="text" name="name" id="name" readonly="readonly" value="${memlogin.name}"> --%>
<!-- </div> -->
<!-- &ensp; -->
<!-- <div> -->
<!-- 	<label>標題</label> -->
<%-- 	<input type="text" name="header" id="header" value="${artBean.header}"> --%>
<%-- 	<span style="color: red;">${errors.header}</span> --%>
<!-- </div> -->
<!-- &ensp; -->
<!-- <div class='content'> -->
<!-- 	<label>內文</label> -->
<%-- 	<textarea name="content" id="content" cols="10" rows="100">${artBean.content}</textarea> --%>
<!-- 	<script>  -->
<!-- // 	 CKEDITOR.replace( 'content' ); -->
<!--  	</script>  -->
<%-- 	<span style="color: red;">${errors.content}</span> --%>
<!-- </div> -->

<!--           	<div style="height:300px; width:300px; top:100; right:550px; text-align:center"> -->
<!--               	<div id="dropZone" > -->
<%-- 					<img id="img1" src="images/articleimages/${artBean.img1}" style="height:150px; width:150px;"/> --%>
<!--     			</div> -->
   				
<!--    				<div  style="display: none;"> -->
<!--    					<input type="file" id="file1" name="picture" multiple="multiple" onchange="fileViewer()" /><br/> -->
<!--     			</div> -->
<!--     				<div class="xyzFileUpSel"> -->
<!-- 						<button type="button" class="btn btn-outline-dark">更改圖片</button> -->
<!-- 					</div> -->
<!--             </div> -->
<!--  <button id="btn1" type="submit">送出</button> -->
</fieldset> 

</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
console.log()
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