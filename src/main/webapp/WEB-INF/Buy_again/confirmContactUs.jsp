<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy again | 修改文章</title>

</head>
<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<jsp:include page="managertitle.jsp" />

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" id="showproduct" style="margin: 0px;">
           				
           				<div  class="form-group">
           					<p align="left" style="font-size: 14px">編號</p>
							<input type="text" readonly="readonly" class="form-control" name="contactUsId" id="name" value="${contactUs.contactUsId}"/>							
						</div>
           				<div  class="form-group">
           					<p align="left">發送者</p>
							<input type="text" readonly="readonly" class="form-control" name="name" id="name" value="${contactUs.name}"/>							
						</div>
						<div class="form-group">
							<p align="left">發送日期</p>
							<input type="text" readonly="readonly" class="form-control" name="registerDate" id="content" value="${contactUs.registerDate}"/>
						</div>
						<div class="form-group">
							<p align="left">發送主旨</p>
							<input type="email" readonly="readonly" class="form-control" name="email" id="email" value="${contactUs.email}"/>
						</div>
						<div class="form-group">
							<p align="left">發送內文</p>
							<textarea rows="6"  readonly="readonly" placeholder="想傳遞的訊息" class="form-control" name="content" id="content">${contactUs.content}</textarea>
						</div>
						<div id="cf-submit">
							<button type="submit" class="btn btn-main text-center"  onclick="location.href='/contactUsfindall.controller'">回前頁</button>
						</div>	
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>