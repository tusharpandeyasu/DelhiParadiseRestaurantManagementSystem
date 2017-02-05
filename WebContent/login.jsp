<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Delhi Paradise</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="style-1.css" rel="stylesheet" />
</head>
<%
	String result="";
	boolean flag=false;
	if(request.getAttribute("result")!=null){
		result=(String)request.getAttribute("result");
		flag=true;
	}
 %>
<body>
		<div style="width:100%;">
		<div class="head" style="height:125px;padding-bottom:0px;">
			<div style="width:47%;float:left;margin-left:3%;">
				<a href="index.jsp" class="nameLogo">Delhi Paradise</a><br />
				<p style="font-size:20px;"> Restaurant Management System</p>
			</div>
			<div style="width:50%;float:left;">

			</div>
		</div>
	</div>
<div class="body" style="height:500px;">
		<div class="body_bg">
			<div style="width:100%;margin:0px;float:left;border-right:1px solid;border-right-color:#77eeff;height:400px;margin-top:20px;">
				<form name="form1" method="post" action="RoleServlet?type=login" style="padding:30px;margin:auto;text-align:center;">
				<p style="width:100%;font-family:'Times New Roman';font-size:30px;">User Log In</p>
				<div class="logItem">Username：
					<input type="text" name="user_name" class="myInput" style="
						width: 249px;
						background: none;
						border: 1px solid;
						border-color: #22a3ff;
						height: 41px;" 
						value=""
						/>
				</div>
				<div class="logItem">Password&nbsp;：
					<input type="password" name="user_pass" class="myInput" style="
						width: 249px;
						border: 1px solid;
						background: none;
						border-color: #22a3ff;
						height: 41px;" />
				</div>
				<input type="submit" class="postInfo" style="float:none;margin-right:-73px;" value="Sign In" />
				<%
				if(flag){
  	   			%>
      			<span style="color:#EA0000;font-size:18px;float:right;margin-right:80px;margin-left:10px;">*<%=result %>!!!</span>
       			<% } %>
				</form>
			</div>

		</div>
	</div>
	
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
