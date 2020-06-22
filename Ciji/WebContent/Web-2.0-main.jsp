<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html"  charset="utf-8">
<title>Web-2.0</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-switch.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script> 
<script src="js/bootstrap-switch.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script> 
<script src="js/index-main.js"></script>
<!-- summer文件的引入 -->
<link href="summernote-0.8.16-dist/summernote.min.css" rel="stylesheet">
<script src="summernote-0.8.16-dist/summernote.min.js"></script>

<!-- summer文件的引入 -->
</head>
<body onload="btn()">
  		<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable" >
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable" >
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>

<!-- summer文件   
                    	

                    	<div id="summernote" >
                    	  <p>Hello Summernote</p>
                    	  </div>
  <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>
                	
--> 
<!--窗口-->

<div class="modal fade" id="myModal"  data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog">
        <div class="modal-content" style="background-color: #ED2553;color: white">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">增加目录</h4>
          </div>
          <form method="post" action="addTopic.html" accept-charset="UTF-8">
          <div class="modal-body">
            <p>目录名称</p>
            <input type="text" maxlength="15" id="topic_name" name="topic_name" placeholder="输入目录名称" class="form-control">
          </div>
          <div style="text-align: center;">
          	目录类型：
          		<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio1" value="1" checked> 笔记
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio2" value="2"> 日记
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio3" value="3"> 分享
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio4" value="4"> 公开(他人可编辑)
</label>
<!-- 
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio5" value="5"> 收藏
</label>
 -->
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <input type="submit" class="btn btn-primary" value="添加" >
          </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>
<!-- 设置目录信息 -->
<div class="modal fade" id="myModal2"  data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog">
        <div class="modal-content" style="background-color: #ED2553;color: white">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">重新设置目录</h4>
          </div>
          <form method="post" action="updateTopic.html" accept-charset="UTF-8">
          <div class="modal-body">
          	<input type="hidden" id="topic_id" name="topic_id" value=''>
            <p>目录名称</p>
            <input type="text" id="" name="topic_name" value="" placeholder="重新设置分区的名称" class="form-control">
          </div>
          
             <div style="text-align: center;">
          	目录类型：
          		<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio1" value="1"> 笔记
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio2" value="2"> 日记
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio3" value="3"> 分享
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio4" value="4"> 公开(他人可编辑)
</label>
<label class="radio-inline">
  <input type="radio" name="topic_sort" id="inlineRadio5" value="5"> 收藏
</label>
          </div>
          
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <input type="submit" class="btn btn-primary" value="更改" >
          </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style="width:500px;margin-left: 35%">
  <div class="modal-dialog modal-sm" role="document" style="margin-top: 200px;border-top: hidden;border-radius: 20px;width: 100%;height: 280px;background-color: #ED2553;">
	  <div class="" style="color:white;text-align: center;font-size: 30px;font-family: '楷体'">
		  主题
	  </div>
	  <div style="margin-left: 50px;margin-top: 30px;width: 80%;align-content: center">
	  <table class="table table-bordered" style="border-style: double">
		  <tbody>
		  <tr>
		  		<td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: white;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: red;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			 <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: black;border-width: 10px"></div>
			  </td>
			  
		  </tr>
		<tr>
		  		<td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: white;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: red;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			 <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: black;border-width: 10px"></div>
			  </td>
			  
		  </tr>
		 </tbody>
	  </table>
		  </div>
                      
                      <div style="margin-left: 400px;margin-top: 20px">
                        <input class="btn btn-default" type="submit" value="修改" style="padding: 8px;background-color:antiquewhite;border-radius: 20px 20px 10px 10px;height: 50px;border-color:white;border-style: double;border-width: 3px">
                      </div>
                    
  </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style="width:500px;margin-left: 35%">
 <div class="modal-dialog modal-sm" role="document" style="margin-top: 200px;border-top: hidden;border-radius: 20px;width: 100%;height: 280px;background-color: #ED2553;">
	  <div class="" style="color:white;text-align: center;font-size: 30px;font-family: '楷体'">
		  切换背景
	  </div>
	  <div style="margin-left: 50px;margin-top: 30px;width: 80%;align-content: center">
	  <table class="table table-bordered" style="border-style: double">
		  <tbody>
		  <tr>
		  		<td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: white;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: red;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  
		  </tr>
		<tr>
		  		<td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: white;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: red;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			  <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: white;border-width: 10px"></div>
			  </td>
			 <td>
					<div style="height: 50px;width: 50px;background-color: antiquewhite;border-style:double;border-color: black;border-width: 10px"></div>
			  </td>
			  
		  </tr>
		 </tbody>
	  </table>
		  </div>
                      
                      <div style="margin-left: 400px;margin-top: 20px">
                        <input class="btn btn-default" type="submit" value="修改" style="padding: 8px;background-color:antiquewhite;border-radius: 20px 20px 10px 10px;height: 50px;border-color:white;border-style: double;border-width: 3px">
                      </div>
	</div>
  </div>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style="width:500px;margin-left: 35%">
 <div class="modal-dialog modal-sm" role="document" style="margin-top: 100px;border-top: hidden;border-radius: 20px;width: 60%;height: 360px;background-color: #ED2553;color: white">
	  <!--注册-->

	  <div class="" style="color:white;text-align: center;font-size: 30px;font-family: '楷体'">
		  密码修改
	  </div>
	   <form method="post" action="user_repasswd_do" class="form-inline" id="repasswd">
	 			<div class="from-group" style="margin-left:50px" >
					 <h4 >旧密码</h4>
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control"
                           class="form-control">
                     <h4 >新密码</h4>
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control"
                           class="form-control">
                    <h4 >新密码</h4>
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码"
                           class="form-control" class="form-control">
                           <br/>
                    <em id="tishi" style="color: white"></em>
                    <br/>
                    <span>
                            <input type="submit" value="提交" class="btn btn-default">
            </span>
                </div>
		</form>


	</div>
  </div>

  
  
<!--	窗口-->
<div class="materialContainer-main">
  <div class="box-main box container-fluid backimage"> 
    <!--			top--> 
    <!--
			<div>
				<div class="title" style="color:black;text-align: center;font-size: 60px;font-family: '楷体';padding-bottom: 10px">
				词记
				</div>
			</div>
-->
    <div class="row "> 
      <!-- 目录-->
      <div class="col-md-2 " style="height: 550px;" >
        <div>
          <div class="title" style="color:black;text-align: center;font-size: 40px;font-family: '楷体';padding:5px"> 词记 </div>
        </div>
        <div style="">
          <ul  class="list-group" style="width: 112%;margin-top: 60px;text-align: center;" >
            <div style="border-style: double;border-radius: 10px;border-color:navajowhite;border-width:4px;border-left: hidden">
              <li class="list-group-item active" style=" background-color: antiquewhite;font-family: '楷体';color:black;font-size: 20px;border-color:blanchedalmond;border-width: 1.2px">用户中心</li>
              <li class="list-group-item btn"><div style="font-family:楷体;">你好！${user.user_name }</div></li>
              <li class="list-group-item"> <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse"> 我的日记 <span class="pull-right glyphicon glyphicon-chevron-toggle"></span> </a>
                <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
                   <c:forEach items="${cs1}" var="c" varStatus="st" begin="0" end="10">
                   
                    <li ><a href="diaryListByid.html?topic_id=${c.topic_id}"><i class="fa fa-folder-open-o" aria-hidden="true"></i>${c.topic_name}</a></li>
                  	</c:forEach>
                </ul>
              </li>
              <li class="list-group-item"> <a href="#systemSetting2" class="nav-header collapsed" data-toggle="collapse"> 我的分享 <span class="pull-right glyphicon glyphicon-chevron-toggle"></span> </a>
                <ul id="systemSetting2" class="nav nav-list collapse secondmenu" style="height: 0px;">
                 <c:forEach items="${cs3}" var="c" varStatus="st" begin="0" end="10">
                   
                    <li ><a href="diaryListByid.html?topic_id=${c.topic_id}"><i class="fa fa-folder-open-o" aria-hidden="true"></i>${c.topic_name}</a></li>
                  	
                  </c:forEach>
                </ul>
              </li>
              <li class="list-group-item"> <a href="#systemSetting3" class="nav-header collapsed" data-toggle="collapse"> 我的收藏 <span class="pull-right glyphicon glyphicon-chevron-toggle"></span> </a>
                <ul id="systemSetting3" class="nav nav-list collapse secondmenu" style="height: 0px;">
                  <c:forEach items="${cs4}" var="c" varStatus="st" begin="0" end="10">
                   
                    <li ><a href="diaryListBySort.html?topic_id=${c.topic_id}"><i class="fa fa-folder-open-o" aria-hidden="true"></i>${c.topic_name}
                    </a>
                    
                    </li>
                    
                  	
                  </c:forEach>
                </ul>
              </li>
              <li class="list-group-item">
                <div class="btn-group">
                  <button type="button" style="border-style: hidden;background-color:antiquewhite" class="btn btn-default dropdown-toggle "  data-toggle="dropdown" > 设置 <span class="caret"></span> </button>
                  <ul class="dropdown-menu" role="menu" style="text-align: center" >
                    
                    <li role="presentation" class="list-group-item">
						 <!-- Small modal -->
						 <a href="sousuo.go" class="list-group-item" style="padding: 0px;text-align: center">搜索</a>
					</li>	 
                    <li class="list-group-item">
                      <!-- Small modal -->
                      <button onclick="btn()" type="button" class="list-group-item" data-toggle="modal" data-target=".bs-example-modal-sm" style="padding: 0px;text-align: center">主题颜色</button>
                    </li>
                 
					<li role="presentation" class="list-group-item">
						 <!-- Small modal -->
						 <a href="AboutUs.html" class="list-group-item" style="padding: 0px;text-align: center">关于我们</a>
					</li>
                    <li role="presentation" class="list-group-item">
						<button type="button" class="list-group-item" data-toggle="modal" data-target="#myModal1" style="padding: 0px;text-align: center">密码修改</button>
					  </li>
					 
                    <li role="presentation" class="list-group-item"> <a href="logout.html">退出</a> </li>
                  </ul>
                </div>
              </li>
            </div>
          </ul>
        </div>
        <div style="margin-left: 20px;margin-top: -10px;font-family: '楷体';font-size:12px">
            
            
            
            
            
        	<h style="font-size:12px">用户名：${user.user_name }</h>
        	</br>
        	记录篇数:${user.count }篇
        	<br>
        	登录天数：${user.user_age } 天
        	</br>
        	注册时间:
        	</br>
        	${user.user_regester_time }
        	</br>
        	上次登录时间：
        	</br>
        	${user.user_logintime }
        	
        	<!-- 
        	<img src="images/weixin.jpg" class="img-thumbnail" style="height: 120px;">
        	--> 
        </div>
      </div>
      <!--分区	  -->
      <div class="col-md-10">
		  
        <div class="container-fluid row clearfix" style="border-style: solid;border-radius: 10px;border-color: antiquewhite;border-top-style: hidden;height: 50px;">
          <ul class="nav nav-pills nav-justified " style="font-family: '楷体';color: black;width:700px;height: 40px;margin-top: 24px;margin-bottom: 0px;margin-left: 30px">
            <!-- 
            <li role="presentation" ><a href="#" class="btn a-button a-active " style="margin-left:-20px">每日日记</a></li>
            
             -->
            <c:forEach items="${cs2}" var="c" varStatus="st" >
            
            <li  role="presentation">
            		<a href="diaryListByid.html?topic_id=${c.topic_id}" class="btn a-button  a-active" style="background-color:#ED2553;margin-top:-16px;margin-left:-20px;margin-right:-2px">
            			${c.topic_name}
            			</a>
            </li>
           	<li  role="presentation">
            		<a href="#" class="btn a-button" data-target="#myModal2" data-toggle="modal"  onclick="Values(${c.topic_id})"  style="background-color: bisque;padding:0">
            			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            			</a>
            </li>
			<li  role="presentation"  data-toggle="tooltip"  title="删除！确认删除吗？">
            		<a href="deleteTopicById.do/${c.topic_id}" class="btn a-button" style="background-color: bisque;padding:0">
            			<i class="fa fa-trash-o" aria-hidden="true"></i>
            			</a>	
            </li>
            
            </c:forEach>
            
            
            
            <c:forEach items="${cs}" var="c" varStatus="st" begin="0" end="3">
            <li id="li"  role="presentation">
            		<a href="diaryListByid.html?topic_id=${c.topic_id}" class="btn a-button" style="background-color: hotpink;">
            			${c.topic_name}
            			</a>
            </li>
           	<li  role="presentation">
            		<a href="#" class="btn a-button" data-target="#myModal2" data-toggle="modal"  onclick="Values(${c.topic_id})"  style="background-color: bisque;padding:0">
            			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            			</a>
            </li>
			<li  role="presentation" data-toggle="tooltip"  title="删除！确认删除吗？">
			
            		<a href="deleteTopicById.do/${c.topic_id}" class="btn a-button"  style="background-color: bisque;padding:0">
            			<i class="fa fa-trash-o" aria-hidden="true"></i>
            			</a>	
            </li>
            
            </c:forEach>
            
            <li role="presentation" class="dropdown"> <a class="btn dropdown-toggle a-button" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"  style="background-color:aquamarine"> ... <span class="caret"></span> </a>


 <ul class="dropdown-menu" style="float:right;margin-left:-280px;border:hidden;background-color: rgba(255,255,255,0);">
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="46" end="66">
                <li role="presentation" >
                		<div style="background-color: hotpink">
                			<a href="diaryListByid.html?topic_id=${c.topic_id}">
                			${c.topic_name}
                			</a>
                			<div style="float:right;margin-right:20px;">  				
                				<a href="#"  data-target="#myModal2" data-toggle="modal" onclick="Values(${c.topic_id})">
                				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                				</a>
                				<a href="deleteTopicById.do/${c.topic_id}" style="background-color: hotpink;" data-toggle="tooltip"  title="删除！确认删除吗？">
                					<i class="fa fa-trash-o" aria-hidden="true"></i>
                				</a>
                			</div>
                		</div>
                </li>
                </c:forEach>
                
              </ul>







<ul class="dropdown-menu" style="float:right;margin-left:-140px;border:hidden;background-color: rgba(255,255,255,0);">
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="25" end="45">
                <li role="presentation" >
                		<div style="background-color: hotpink">
                			<a href="diaryListByid.html?topic_id=${c.topic_id}">
                			${c.topic_name}
                			</a>
                			<div style="float:right;margin-right:20px;">  				
                				<a href="#"  data-target="#myModal2" data-toggle="modal" onclick="Values(${c.topic_id})">
                				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                				</a>
                				<a href="deleteTopicById.do/${c.topic_id}" style="background-color: hotpink;" data-toggle="tooltip"  title="删除！确认删除吗？">
                					<i class="fa fa-trash-o" aria-hidden="true"></i>
                				</a>
                			</div>
                		</div>
                </li>
                </c:forEach>
                
              </ul>




              <ul id="ul" class="dropdown-menu" >
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="4" end="24">
                <li role="presentation" >
                		<div style="background-color: h otpink">
                			<a style="color:black" href="diaryListByid.html?topic_id=${c.topic_id}">
                			${c.topic_name}
                			</a>
                			<div style="float:right;margin-right:20px;">  				
                				<a href="#"  data-target="#myModal2" data-toggle="modal" onclick="Values(${c.topic_id})">
                				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                				</a>
                				<a href="deleteTopicById.do/${c.topic_id}" style="background-color: hotp ink;" data-toggle="tooltip"  title="删除！确认删除吗？">
                					<i class="fa fa-trash-o" aria-hidden="true"></i>
                				</a>
                			</div>
                		</div>
                </li>
                </c:forEach>
              </ul>
              
              
              
              
              
            </li>
            
            
            <li role="presentation">
            	<a href="#" class="btn a-button" style="background-color:#ED2553" data-target="#myModal" data-toggle="modal">
             		<i class="fa fa-plus fa-lg" ></i>
              </a>
              </li>
            
            
<!--	图片
			  <li>
                <input type="text" class="btn a-button" style="font-size: 10px;height: 30px;margin-left: 50px" placeholder="去查找日记">

				 </li>
-->

          </ul>
        </div>
        <!--主内容-->
        <div class="row" style="border-style: double;border-radius: 30px;border-color:antiquewhite;border-width:5px;height: 500px"> 
          <!--文档写作-->
          <div class="col-md-12" >
            <div style="height: 510px;">
              <div class="tab-content vertical-tab-content col-xs-10">
              
              
              	<div role="tabpanel" class="tab-pane active" id="tab0">
                  <form method="post" action="addDiary.html" accept-charset="UTF-8">
                    
                  	<input type="hidden" id="topic_id" name="topic_id" value="${topic_id}">
                    <div class="input" style="margin-top: 10px">
                      <input type="text" name="diary_title" maxlength="20" id="diary_title" style="font-size: 20px" value="" placeholder="题目...">
                      <span class="spin"></span> </div>
                    <div class="form-group">
                    
                      <textarea name="diary_content" id="diary_content" maxlength="5000" placeholder="写下你的文字..." style="height: 360px;width: 110%;border: hidden;font-family: '楷体';font-size: 18px;margin-top:10px;resize:none;border-style: none;background: transparent"></textarea>
                    
                    
                    </div>
                    <div style="float:right;">
                      <div class="col-md-6">
                        <input class="btn btn-default" type="reset" value="清空" style="padding: 8px;background-color:#FFAEB9;font-family: '楷体';font-size: 14px;border-radius: 40px 40px 40px 40px;height: 40px;display: inline-block;border-color: antiquewhite;border-style: double;border-width: 5px">
                      </div>
                      <div class="col-md-6">
                        <input class="btn btn-default" type="submit" value="记下" style="padding: 8px;background-color:antiquewhite;font-family: '楷体';font-size: 14px;border-radius: 20px 20px 20px 20px;height: 40px;border-color:white;border-style: double;border-width: 4px">
                      </div>
                    </div>
                    
                  </form>
                  <div class="title"></div>
                </div>  
              	<!-- 日记的展示 -->
              	<c:forEach items="${ds}" var="c" varStatus="st">
              	
                <div role="tabpanel" class="tab-pane" id="tab${c.diary_id}">
                  <form method="post" action="updateDiary.html">
                  
                  	<input type="hidden" id="topic_id" name="topic_id" value='${topic_id}'>
                  
                  	<input type="hidden" id="diary_id" name="diary_id" value='${c.diary_id}'>
                    <div class="input" style="margin-top: 10px">
                      <input type="text" name="diary_title" id="diary_title" style="font-size: 20px" placeholder="未命名...   " value="${c.diary_title}" >
                      <div style="float:right;margin-top:-20px">
                      		${c.diary_updatedate}
                      </div>
                      <span class="spin"></span> </div>
                    <div class="form-group">
                      <textarea name="diary_content" id="diary_content" placeholder="写下你的文字..." style="height: 360px;width: 110%;border: hidden;font-family: '楷体';font-size: 18px;margin-top:10px;resize:none;border-style: none;background: transparent">${c.diary_content}</textarea>
                    </div>
                    <div style="float:right;">
                      <div class="col-md-6">
                      
                      	<a href="deleteDiaryById.html?diary_id=${c.diary_id}&topic_id=${topic_id}" class="btn btn-default" style="width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;display: inline-block;border-color: antiquewhite;border-style: double;border-width: 5px">
                					删除
                				</a>

                      </div>
                      <div class="col-md-6">
                        <input class="btn btn-default" type="submit" value="修改" style="padding: 8px;background-color:#ED2553;font-family: '楷体';font-size: 14px;border-radius: 20px 20px 20px 20px;height: 40px;border-color:antiquewhite;border-style: double;border-width: 4px">
                      </div>
                    </div>
                  </form>
                  <div class="title"></div>
                </div>
                
                </c:forEach>
                    
                <!--
                <div role="tabpanel" class="tab-pane" id="tab2">
                  <table class="table table-bordered">
                    <tr>
                      <td><img width="140px" src="images/weixin.jpg"/></td>
                      <td><img width="140px" src="images/weixin.jpg"/></td>
                      <td><img width="140px" src="images/weixin.jpg"/></td>
                      <td><img width="140px" src="images/weixin.jpg"/></td>
                    </tr>
                  </table>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab3"> </div>
                <div role="tabpanel" class="tab-pane" id="tab4">这是.视音频..</div>
                <div role="tabpanel" class="tab-pane" id="tab5">这是..图像.</div>
                  -->
              </div>
              <div class="col-xs-2" >
                <div id="box-gun" style="height: 450px;width: 130%;">
                  <ul id="ul2" class="nav nav-tab vertical-tab list-group " role="tablist" id="vtab" style="width:100%;margin-top: 20px;margin-left: 10px">
 					
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:#ED2553;margin-bottom: 6px;border-radius: 10px 0px 0px 10px;"> <a href="#tab0" aria-controls="home" role="tab"
                   data-toggle="tab" style="font-size:16px;color:white">记录新笔记</a> </li>

                   
                    <!-- 题目-->
                    <c:forEach items="${ds}" var="c" varStatus="st">
                    	<li  role="presentation" class="list-group-item border-double" style="margin-left:15px;padding: 3px;background-color:pink;margin-bottom: 5px;border-radius: 10px 0px 0px 10px;">
                    	<a href="#tab${c.diary_id}" aria-controls="inbox${c.diary_id}" style="font-size:14px;color:black" role="tab"
                   data-toggle="tab">${c.diary_title}</a> </li>
                    </c:forEach>
                    <!--  
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:pink;margin-bottom: 6px;margin-left:15px;border-radius: 10px 0px 0px 10px;"> <a href="#tab2" aria-controls="inbox" role="tab"
                   data-toggle="tab">春天的相册</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:sandybrown;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab3" aria-controls="outbox" role="tab"
                   data-toggle="tab">无标题页2</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:aliceblue;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab4" aria-controls="inbox1" role="tab"
                   data-toggle="tab">无标题页3</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:antiquewhite;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab5" aria-controls="outbox1" role="tab"
                   data-toggle="tab">无标题页4</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:sandybrown;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab3" aria-controls="outbox" role="tab"
                   data-toggle="tab">2018/2/10</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:aliceblue;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab4" aria-controls="inbox1" role="tab"
                   data-toggle="tab">2019/5/13</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:antiquewhite;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab5" aria-controls="outbox1" role="tab"
                   data-toggle="tab">2019/6/23</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:sandybrown;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab3" aria-controls="outbox" role="tab"
                   data-toggle="tab">2018/2/10</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:aliceblue;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab4" aria-controls="inbox1" role="tab"
                   data-toggle="tab">2019/5/13</a> </li>
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:antiquewhite;margin-bottom: 6px;margin-left:24px;border-radius: 10px 0px 0px 10px;"> <a href="#tab5" aria-controls="outbox1" role="tab"
                   data-toggle="tab">2019/6/23</a> </li>
                   -->
                  </ul>
                </div>
              </div>
            </div>
          </div>
         
        </div>
        <!-- 按钮显示--> 
        
      </div>
    </div>
    <!--			botton--> 
    
  </div>
  <div class="overbox">
    <div class="material-button alt-2">
     		<span  class="shape"></span>
     		<canvas id="myCanvas" width="500" height="500" style=""></canvas>
      </div>
    <div class="title" style="margin-top: -30px">笔记本</div>
    
    <form method="post" action="addDiary.html" accept-charset="UTF-8">
      <input type="hidden" id="topic_id" name="topic_id" value='${topic_id}'>
      <div class="input" style="margin-top: -20px"> 
        <!--      <label for="regname">主题</label>-->
        <input type="text" name="diary_title" id="diary_title" placeholder="..." value="" style="align-content: center">
        <span class="spin"></span> </div>
      <div class="text">
        <textarea name="diary_content" id="diary_content" placeholder="写下你的文字..." style="height: 430px;width: 100%;border: hidden;font-family: '楷体';font-size: 18px;margin-top:10px;background-color: #ED2553;resize:none;overflow-x: hidden"></textarea>
      </div>
      
      <div class="container">
        <div class="row">
          <div class="col-md-8"></div>
          <div class="col-md-4">
            <div class="input" style="margin-top:-15px">
             <input  class="btn btn-danger" type="submit" value="记下" style="width:100px;font-family: '楷体';font-size: 20px;border-radius: -40px -40px -40px -40px;display: inline-block">
             </div>
          </div>
        </div>
       </div>
      </form>
      <!-- 
      <div class="container">
        <div class="row">
          <div class="col-md-8"></div>
          <div class="col-md-4">
            <div class="button button-main">
              <button type="reset"> <span>清空</span> </button>
            </div>
            <div class="button button-main">
              <button> <span>保存</span> </button>
            </div>
            <div class="switch" onColor="success" offColor="warning" onText = "参与" offText="不参与" 
				labelTest="大宗交易">
              <input type="checkbox" checked />
            </div>
          </div>
        </div>
       </div>
         -->
    
  </div>

</div>

<script type="text/javascript">
$("#myModal2").model("hide");
function Values(ID){
	$("#topic_id").val(ID);
}
	</script>
<script type="text/javascript">
	var myCanvas = document.getElementById('myCanvas');
	var c = myCanvas.getContext('2d');
	function clock(){
		c.clearRect(0,0,400,400);
		var data = new Date();
		var sec =data.getSeconds();
		var min =data.getMinutes();
		var hour=data.getHours();
		
		c.save();
		c.translate(70,60);
		c.rotate(-Math.PI/2);

		
//		//分钟刻度线
//		for(var i=0;i<60;i++){	//画12个刻度线			
//			c.beginPath();
//			c.strokeStyle = "#f00";				
//			c.lineWidth = 5 ;
//			c.moveTo(117,0);
//			c.lineTo(120,0);
//			c.stroke();
//			c.rotate(Math.PI/30); //每个6deg画一个时钟刻度线
//			c.closePath();
//		}
//		
//		
//		//时钟刻度线
//		for(var i=0;i<12;i++){	//画12个刻度线			
//			c.beginPath();
//			c.strokeStyle = "#000";				
//			c.lineWidth = 8 ;
//			c.moveTo(100,0);
//			c.lineTo(120,0);
//			c.stroke();
//			c.rotate(Math.PI/6); //每个30deg画一个时钟刻度线
//			c.closePath();
//		}
		//外表盘
//		c.beginPath();
//		c.strokeStyle = "pink";
//		c.arc(0,0,70,0,Math.PI*2);
//		c.lineWidth = 3 ;
//		c.stroke();
//		c.closePath();
		
		//画时针
		hour = hour>12?hour-12:hour;
//				console.log(hour);
		c.beginPath();
		c.save();
		c.rotate(Math.PI/6*hour+Math.PI/6*min/60+Math.PI/6*sec/3600);
		c.strokeStyle = "white";
		c.lineWidth = 4 ;
		c.moveTo(-3,0);
		c.lineTo(30,0);
		c.stroke();
		c.restore();
		c.closePath();
		
		
		//画分针
//				console.log(min);
		c.beginPath();
		c.save();
		c.rotate(Math.PI/30*min+Math.PI/30*sec/60);
		c.strokeStyle = "white";
		c.lineWidth = 3 ;
		c.moveTo(-6,0);
		c.lineTo(50,0);
		c.stroke();
		c.restore();
		c.closePath();
		
		
		//画秒针
		c.beginPath();
		c.save();
		c.rotate(Math.PI/30*sec);
		c.strokeStyle = "white";
		c.lineWidth = 2.5 ;
		c.moveTo(-10,0);
		c.lineTo(65,0);
		c.stroke();
		c.restore();
		c.closePath();
		
		c.restore();
	}
	clock();
	setInterval(clock,1000);
</script>
<script type="text/javascript">

function btn() {
	 //设置颜色集合
    var colors = ["hotpink","cornsilk","skyblue","#FA8072","#FF1493","#C1FFC1","#FFF0F5"];
	var colors2 = ["hotpink","cornsilk","skyblue","#FA8072","#FF1493"]
    //获取td
    var tds = document.getElementById("ul").getElementsByTagName("li"); 
    //颜色个数
    var size = tds.length;
    for (let i = 0; i < size; i++) {
    	//取出随机颜色
   		var color = colors2[Math.floor(Math.random()*colors2.length)];
        //填充颜色
        tds[i].style.backgroundColor = color;
    }
    //获取td
    var tds2 = document.getElementById("ul2").getElementsByTagName("li");
    //颜色个数
    var size2 = tds2.length;
    for (let i = 1; i < size2; i++) {
    	//取出随机颜色
   		var color = colors[Math.floor(Math.random()*colors.length)];
   		//填充颜色
   		tds2[i].style.backgroundColor = color;
    }
    //获取td
    var tds3 = document.getElementById("li").getElementsByTagName("a"); 
    //颜色个数
    var size3 = tds3.length;
    for (let i = 0; i < size3; i++) {
    	//取出随机颜色
   		var color = colors[Math.floor(Math.random()*colors.length)];
        //填充颜色
        tds3[i].style.backgroundColor = red;
    }
    
    
}


</script>	
	
	
	
</body>
</html>
