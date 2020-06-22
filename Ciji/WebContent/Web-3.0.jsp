<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html"  charset="utf-8">
<title>Web-3.0</title>
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
	<c:forEach items="${succ}" var="c" varStatus="st">
    <div class="alert alert-success alert-dismissable" >
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
                    收藏成功！！！
    </div>
	</c:forEach>
<c:forEach items="${error}" var="c" varStatus="st">
    <div class="alert alert-danger alert-dismissable" >
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
                    你已经收藏过此内容！！！
    </div>
</c:forEach>

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
            <h4 class="modal-title">收藏这个主题吗?</h4>
          </div>
          <form method="post" action="addCollectById.html" accept-charset="UTF-8">
          <input type="hidden" id="topic_id" name="topic_id" value=''>
          <div class="modal-body">
          	<p><tr></tr></tr>收藏的目录将会保存在主页"我的收藏"之下，你可以通过这种快捷方式进行这个主题的查看功能！</p>
           
          </div>
          
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <input type="submit" class="btn btn-primary" value="收藏" >
          </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
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
      <!--分区	  -->
      <div class="col-md-12">
		  
        <div class="container-fluid row clearfix" style="border-style: solid;border-radius: 10px;border-color: antiquewhite;border-top-style: hidden;height: 50px;">
          <ul class="nav nav-pills nav-justified col-md-10" style="font-family: '楷体';color: black;width:70%;height: 40px;margin-top: 24px;margin-bottom: 0px;margin-left: 30px">
            <!-- 
            <li role="presentation" ><a href="#" class="btn a-button a-active " style="margin-left:-20px">每日日记</a></li>
            
             -->
            <c:forEach items="${cs2}" var="c" varStatus="st" >
            
            <li  role="presentation">
            		<a href="diaryListBySort.html?topic_id=${c.topic_id}" class="btn a-button  a-active" style="background-color:#ED2553;margin-top:-16px;margin-left:-20px;margin-right:-2px">
            			${c.topic_name}
            			</a>
            </li>
            
            </c:forEach>
            
            
            
            <c:forEach items="${cs}" var="c" varStatus="st" begin="1" end="4">
            <li id="li"  role="presentation">
            		<a href="diaryListBySort.html?topic_id=${c.topic_id}" class="btn a-button" style="background-color: hotpink;">
            			${c.topic_name}
            			</a>
            </li>
            
            </c:forEach>
             
             
             <c:forEach items="${is}" var="c" varStatus="st">
              
            <li role="presentation" class="dropdown">
           
             <a class="btn dropdown-toggle a-button" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"  style="background-color:aquamarine"> ... <span class="caret"></span> </a>
              <ul id="ul" class="dropdown-menu" >
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="5" end="24">
                <li role="presentation" >
                		<div style="background-color: h otpink">
                			<a style="color:black" href="diaryListBySort.html?topic_id=${c.topic_id}">
                			${c.topic_name}
                			</a>
                			
                		</div>
                </li>
                </c:forEach>

              </ul>

              <ul class="dropdown-menu" style="float:right;margin-left:100px;border:hidden;background-color: rgba(255,255,255,0);">
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="25" end="45">
                <li role="presentation" >
                		<div style="background-color: hotpink">
                			<a href="diaryListBySort.html?topic_id=${c.topic_id}">
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
               <ul class="dropdown-menu" style="float:right;margin-left:200px;border:hidden;background-color: rgba(255,255,255,0);">
              	 <c:forEach items="${cs}" var="c" varStatus="st" begin="46" end="66">
                <li role="presentation" >
                		<div style="background-color: hotpink">
                			<a href="diaryListBySort.html?topic_id=${c.topic_id}">
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
              
            </li>
            
            </c:forEach>
            
             <c:forEach items="${zs}" var="c" varStatus="st" >

            	 <li role="presentation" >
            	 		<a href="#"  class="btn a-button" style="background-color:hotpink" data-target="#myModal" data-toggle="modal" onclick="Values(${c.topic_id})">
             		收藏
             		<i class="fa fa-plus-square-o" aria-hidden="true"></i>
              </a>
            	 </li>
            </c:forEach>
            <c:forEach items="${zs}" var="c" varStatus="st" >
            	 <li role="presentation" style="" >
            	 		<a href="commentListBySort.html?topic_id=${c.topic_id}"  class="btn a-button" style=" background-color:hotpink" >
            	 		显示评论信息
             		<i class="fa fa-commenting-o" aria-hidden="true"></i>
              			</a>
            	 </li>
            </c:forEach>
            
            <li role="presentation">
            	<a href="javascript:history.back(-1)"  class="btn a-button" style="background-color:#ED2553;" >
             		<i class="fa fa-undo" aria-hidden="true"></i>
              </a>
              </li>

            
<!--	图片
			  <li>
                <input type="text" class="btn a-button" style="font-size: 10px;height: 30px;margin-left: 50px" placeholder="去查找日记">

				 </li>
-->

          </ul>
           
            <form method="post" action="sousuo.html" accept-charset="UTF-8">
           <ul class="nav nav-pills nav-justified col-md-2" style="float:right;font-family: '楷体';color: black;width:25%;height: 40px;margin-top: 14px;">
           		<li style="">
           		
           			<div class="input-group" >
      <input type="text" class="form-control" name="word" placeholder="输入词语，进行搜索" style="background-color:white;font-size:16px;">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit" style="background-color:#FFFAB9;">搜索</button>
      </span>
    </div>
    </form>
    <!-- /input-group -->
           		</li>
           </ul>
           

        </div>
        <!--主内容-->
        <div class="row" style="border-style: double;border-radius: 30px;border-color:antiquewhite;border-width:5px;height: 500px"> 
          <!--文档写作-->
          <div class="col-md-12" >
            <div style="height: 510px;">
              <div class="tab-content vertical-tab-content col-xs-10">
				
				
              	<div role="tabpanel" class="tab-pane" id="tab0">
                  <form method="post" action="addDiary2.html" accept-charset="UTF-8">
                    
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
              	<!-- 首页展示 -->
              	
              	
              	<c:forEach items="${ds}" var="c" varStatus="st" begin="0" end="0">
              	
                <div role="tabpanel" class="tab-pane active" id="tab${c.diary_id}">
                  <form method="post" action="addTopicLikesById.html">
                  
                  	<input type="hidden" id="topic_id" name="topic_id" value='${c.topic_id}'>
                  
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
                    <!-- 
                      <div class="col-md-6">
                      	<input type="submit" value="" class="btn btn-default" style="width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;display: inline-block;border-color: hotpink;border-style: double;border-width: 5px">
                				
						
                      </div>
                      <div class="col-md-6">
                      	<input type="submit" value="" class="btn btn-default" style="padding: 8px;background-color:#ED2553;font-family: '楷体';font-size: 14px;border-radius: 20px 20px 20px 20px;height: 40px;border-color:antiquewhite;border-style: double;border-width: 4px">
                				
						
                      </div> 
                       -->
                     
                    </div>
                  </form>
                  <div class="title"></div>
                </div>
                
                </c:forEach>
              	
              	
              	
              	<!-- 日记的展示 -->
              	
              	 
              	 
              	<c:forEach items="${ds}" var="c" varStatus="st">
              	
                <div role="tabpanel" class="tab-pane" id="tab${c.diary_id}">
                  <form method="post" action="addTopicLikesById.html">
                  
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
                      <!-- 
                      	<input type="submit" value="点赞" class="btn btn-default" style="width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;display: inline-block;border-color: hotpink;border-style: double;border-width: 5px">
                      	
                      	<a href="deleteDiaryById.html?diary_id=${c.diary_id}&topic_id=${topic_id}" class="btn btn-default" style="width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;display: inline-block;border-color: antiquewhite;border-style: double;border-width: 5px">
                					点赞
                				</a>
                				 -->

                      </div>
                      
                    </div>
                  </form>
                  <div class="title"></div>
                </div>
                
                </c:forEach>
                
                
                
                
                <c:forEach items="${dp}" var="c" varStatus="st" begin="0" end="0">
              	
                <div role="tabpanel" class="tab-pane active" id="tab${c.diary_id}">
                  <form method="post" action="addCommentById.html">
                  
                  	<input type="hidden" id="topic_id" name="topic_id" value='${c.topic_id}'>
                  
                  	<input type="hidden" id="show_id" name="show_id" value='${c.diary_id}'>
                    <div class="input" style="margin-top: 10px">
                      <input type="text" name="diary_title" id="diary_title" style="font-size: 20px" placeholder="未命名...   " value="${c.diary_title}" >
                      <div style="float:right;margin-top:-20px">
                      		${c.diary_updatedate}
                      </div>
                      <span class="spin"></span> </div>
                    <div class="form-group">
                    
                    
                      <textarea name="diary_content" id="diary_content" placeholder="写下你的文字..." style="height: 360px;width: 110%;border: hidden;font-family: '楷体';font-size: 18px;margin-top:10px;resize:none;border-style: none;background: transparent">${c.diary_content}
                      <c:forEach items="${c.comment}" var="i" varStatus="st">
---------------------------------------------------------------${i.date}
    ${i.content}								      										
评论人:${i.user_name}
</c:forEach>
                      </textarea>
                    </div>
                    	<div class="coll apse" id="collapseExample" style="margin-top:-78px;">
  							<textarea id="content" name="content" class="form-control" rows="3" style="padding: 8px;width:108%;"></textarea>
  							</div>
                    <div style="float:right;">
                      <div class="col-md-6">
                      	<input type="" onClick="" value="输入评论信息" class="btn btn-default" style="folat:right;padding: 8px;background-color:#ED2553;font-family: '楷体';font-size: 14px;border-radius: 20px 20px 20px 20px;height: 40px;border-color:antiquewhite;border-style: double;border-width: 4px" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                      </div>
                      <div class="col-md-6"> 
                      	<input type="submit" value="发布" class="btn btn-default" style="margin-left:0px;width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;border-color: hotpink;border-style: double;border-width: 5px">
                      </div>
                      
                         </div>
                  </form>
                  <div class="title"></div>
                </div>
                
                </c:forEach>
                
                <c:forEach items="${dp}" var="c" varStatus="st">
              	
                <div role="tabpanel" class="tab-pane" id="tab${c.diary_id}">
                  <form method="post" action="addCommentById.html">
                  
                  	<input type="hidden" id="topic_id" name="topic_id" value='${c.topic_id}'>
                  
                  	<input type="hidden" id="show_id" name="show_id" value='${c.diary_id}'>
                    <div class="input" style="margin-top: 10px">
                      <input type="text" name="diary_title" id="diary_title" style="font-size: 20px" placeholder="未命名...   " value="${c.diary_title}" >
                      <div style="float:right;margin-top:-20px">
                      		${c.diary_updatedate}
                      </div>
                      <span class="spin"></span> </div>
                    <div class="form-group">
                    
                    
                      <textarea name="diary_content" id="diary_content" placeholder="写下你的文字..." style="height: 360px;width: 110%;border: hidden;font-family: '楷体';font-size: 18px;margin-top:10px;resize:none;border-style: none;background: transparent">${c.diary_content}
                      <c:forEach items="${c.comment}" var="i" varStatus="st">
--------------------------------------------------------------------${i.date}
    ${i.content}
评论人:${i.user_name}
</c:forEach>
                      </textarea>
                    </div>
                    	<div class="coll apse" id="collapseExample" style="margin-top:-75px;">
  							<textarea id="content" name="content" class="form-control" rows="3" style="padding: 8px;width:108%;"></textarea>
  							</div>
                    <div style="float:right;">
                      <div class="col-md-6">
                      	<input type="" onClick="" value="输入评论信息" class="btn btn-default" style="folat:right;padding: 8px;background-color:#ED2553;font-family: '楷体';font-size: 14px;border-radius: 20px 20px 20px 20px;height: 40px;border-color:antiquewhite;border-style: double;border-width: 4px" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                      </div>
                      <div class="col-md-6"> 
                      	<input type="submit" value="发布" class="btn btn-default" style="margin-left:0px;width:54px;padding: 0px;background-color:#FFAEB9;font-family: '楷体';font-size: 17px;border-radius: 40px 40px 40px 40px;height: 40px;border-color: hotpink;border-style: double;border-width: 5px">
                      </div>
                      
                         </div>
                  </form>
                  <div class="title"></div>
                </div>
                
                </c:forEach>
                
                

                
                    
              </div>
              <div class="col-xs-2" >
                <div id="box-gun" style="height: 450px;width: 130%;">
                  <ul id="ul2" class="nav nav-tab vertical-tab list-group " role="tablist" id="vtab" style="width:100%;margin-top: 20px;margin-left: 10px">
 					<c:forEach items="${ds2}" var="c" varStatus="st">
                    <li role="presentation" class="list-group-item border-double" style="padding: 4px;background-color:#ED2553;margin-bottom: 6px;border-radius: 10px 0px 0px 10px;"> <a href="#tab0" aria-controls="home" role="tab"
                   data-toggle="tab" style="font-size:16px;color:white">记录新笔记</a> </li>
					 </c:forEach>
                   
                    <!-- 题目-->
                    <c:forEach items="${ds}" var="c" varStatus="st">
                    	<li  role="presentation" class="list-group-item border-double" style="margin-left:15px;padding: 3px;background-color:pink;margin-bottom: 5px;border-radius: 10px 0px 0px 10px;">
                    	<a href="#tab${c.diary_id}" aria-controls="inbox${c.diary_id}" style="font-size:14px;color:black" role="tab"
                   data-toggle="tab">${c.diary_title}</a> </li>
                    </c:forEach>
                    <c:forEach items="${dp}" var="c" varStatus="st">
                    	<li  role="presentation" class="list-group-item border-double" style="margin-left:15px;padding: 3px;background-color:pink;margin-bottom: 5px;border-radius: 10px 0px 0px 10px;">
                    	<a href="#tab${c.diary_id}" aria-controls="inbox${c.diary_id}" style="font-size:14px;color:black" role="tab"
                   data-toggle="tab">${c.diary_title}</a> </li>
                    </c:forEach>
                  
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
    
   <div style="float:left;background-color:#ED2553;margin-bottom:-100px;margin-top:-30px;margin-left:-50px;border-radius:10px 100px 10px 15px;height:70px;width:70px">
    		
    		<div style="margin-top:30px">
    			<a href="Web-2.0-main.html" style="color:#FDF5E6;" class="btn">
    			<i class="fa fa-times fa-3x" ></i>
    			</a>
    		</div>
    		
    	</div>
    	
    	
  </div>
  
  <div class="overbox">
    <div class="material-button alt-2">
     		<span  class="sha pe"></span>
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
  </div>

</div>

<script type="text/javascript">
$("#myModal").model("hide");
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
    <!--
    
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
    -->
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
