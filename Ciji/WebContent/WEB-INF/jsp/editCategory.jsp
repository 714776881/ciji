<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 <div style="width:500px;margin:0px auto;text-align:center">
	<div style="text-align:center;margin-top:40px">
		<form method="post" action="../categories/${c.id}">
			<input type="hidden" name="_method" value="PUT">
			分类名称： <input name="name" value="${c.name}" type="text"> <br><br>
			<input type="submit" value="修改分类">
		</form>

	</div>	
 </div>
