<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loading</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
<!--菜單連結-->
<jsp:include page="title.jsp" />
<section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-android-happy"></i>
          <h2 class="text-center">撰寫成功，3秒後跳轉頁面...</h2>
        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->
<script>
setTimeout("location.href='/mainarticle'",3000); // 3秒後跳轉頁面
</script>
</body>
</html>