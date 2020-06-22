<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html"  charset="utf-8">
<title>AboutUs</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-switch.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script> 
<script src="js/bootstrap-switch.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script> 
<script src="js/index-main.js"></script>
</head>
<body>
<div class="materialContainer-main">
  <div class="box-main box container-fluid backimage"> 
    <div class="row "> 
      <!-- 目录-->
      <div class="col-md-2" style="height: 550px;" >
        <div>
          <div class="title" style="color:black;text-align: center;font-size: 40px;font-family: '楷体';padding:5px"> 词记 </div>
          
        </div>
        <div style="font-family:'楷体';font-size:16px">
        	站在思想的彼岸，放逐岁月，</br>浅笔静开，</br>那些走过的梦与痴，</br>笑与泪，</br>逐一在灵魂的窗口上定格。</br>一些美丽的爱与哀愁，</br>终是随了恬淡，</br>缓缓释放岁月静好的沉香。
        </div>
      </div>
      <div style="float:center;margin-top:20px;font-family:'楷体'">
        	一个轻量级，简单到不能再简单的网络日记本。 非常欢迎你的到来！
        </div></br>
        <div  style="margin-top:10px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">什么是词记？</div>
        <div style="">它是一个轻量级，简单到不能再简单的网络日记本。</div>
        </div>
        <div  style="margin-top:4px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">它能做什么？</div>
        <div style="">TA帮你记录每天的生活；TA也帮你寻找更多的文字</div>
        </div>
        <div  style="margin-top:4px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">它不能做什么？</div>
        <div style="">TA除了帮你记录日记，什么都做不了</div>
        </div>
        <div  style="margin-top:4px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">我为什么要用它？</div>
        <div style="">它更加简单易用，永久免费；如果你想为了自己的过去留下一些痕迹，也许它很适合你。</div>
        </div>
        <div  style="margin-top:4px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">如何联系我们？</div>
        <div style="">如果你有更好的建议和BUG反馈，请点击右上方的红色圆形区域进行反馈，我们一定会在第一时间答复！</div>
        </div>
        <div  style="margin-top:4px;font-family:'楷体';">
        <div style="font-size:18px;font-weight:bold">右上方的红色圆形有什么用？</div>
        <div style="">你点一点就知道了。</div>
        </div>
        <!-- 
        <div style="margin-top:40px;float:left">
        	选择头像：
        	<img style="width:200px;heigh:200px" src="images/1575008210048.jpg" class="img-thumbnail">
        </div>	
         -->
         <form method="post" action="setName.html" accept-charset="UTF-8">
        	<input  class="btn btn-danger" maxlength="8" type="submit" value="开启我的日记" style="float:right;margin-right:200px;margin-top:100px;font-family: '楷体';font-size: 16px">
        	 <input name="user_name" type="text" class=" form-control" style="width:120px;float:right;margin-top:101px;" placeholder="请输入用户名" value="">
        </form>
      <!--分区	  -->
    </div>
    <!--			botton--> 
    
  </div>
  <div class="overbox">
    <div class="material-button alt-2"> <span class="shape"></span> </div>
    <div class="title" style="margin-top: -30px">联系我们</div>
    <form method="post">
      <div class="input" style="margin-top: -20px"> 
        <!--      <label for="regname">主题</label>-->
        <input type="text" name="regname" id="regname3" placeholder="" value="" style="align-content: center">
        <span class="spin"></span> </div>
      <div class="text">
        <textarea placeholder="" style="height: 430px;width: 100%;border: hidden;font-family: '楷体';font-size: 24px;margin-top:10px;background-color: #ED2553;resize:none;overflow-x: hidden">    </textarea>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8"></div>
          <div class="col-md-4">
            <div class="input" style="margin-top:-25px">
             <input class="btn btn-danger" type="submit" value="发送" style="width:100px;font-family: '楷体';font-size: 20px;border-radius: -40px -40px -40px -40px;display: inline-block">
             </div>
          </div>
        </div>
       </div>
      
    </form>
  </div>

</div>
</body>
</html>
