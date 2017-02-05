<%@ page language="java" import="java.util.*,com.project.javabean.*,com.project.util.*,
com.project.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Role user = null;
String user_position="";
if(session.getAttribute("user")!=null){
	user=(Role)session.getAttribute("user");
	switch(user.getUser_type())
	{
		case 1:user_position = "administrator";break;
		case 2:user_position = "Restaurant manager";break;
		case 3:user_position = "Waiter";break;
		case 4:user_position = "chef";break;
		default:user_position= "unknown";break;
	}
}else{
	response.sendRedirect("login.jsp");
	return;
}
%>
	<div style="width:100%; height:100%">
		<div class="head" style="padding-bottom:0px;">
			<div style="width:47%;float:left;margin-left:3%;">
				
				<a href="index.jsp" class="nameLogo">Delhi Paradise</a><br />
				<p style="font-size:20px;"> Restaurant Management System</p>
				
			</div>
			<div style="width:50%;float:left;">
			
			<span style="float:right;">
			<%if(user!=null){ %>
			Welcome <b><%=user.getUser_name()%> </b>, Your position is <%=user_position %>&nbsp;[<a href="RoleServlet?type=exit" id="exit-button"><b>sign out</b></a>]
			<%} %>
			</span>   

			</div>
			<div class="menu">
			<%
			if(user!=null)
				switch(user.getUser_type())
				{ 
				case 1:
			%>
					<a onclick="func(this)" class="x " href="postOrder.jsp">Order</a>
					<a onclick="func(this)" class="x " href="userManage.jsp">Team</a>
					<a onclick="func(this)" class="x " href="menuList.jsp">Recipes</a>
					<a onclick="func(this)" class="x " href="drinkList.jsp">Beverages</a>
					<a onclick="func(this)" class="x " href="financeManage.jsp">Finance</a>	
					<a onclick="func(this)" class="x " href="orderList.jsp">CustOrder status</a>
					<a onclick="func(this)" class="x " href="tableManage.jsp">Tables</a>

			<%	break;
				case 2:
			%>		
					<a onclick="func(this)" class="x " href="drinkList.jsp">Beverage management</a>
					<a onclick="func(this)" class="x " href="menuList.jsp">Recipe management</a>
					<a onclick="func(this)" class="x " href="financeManage.jsp">Financial</a>	
					<a onclick="func(this)" class="x " href="orderList.jsp">CustOrder</a>
					<a onclick="func(this)" class="x " href="tableManage.jsp">Opening</a>
					<a onclick="func(this)" class="x " href="postOrder.jsp">Order</a>
			<%	break;
				case 3:
			%>
					<a onclick="func(this)" class="x " href="tableManage.jsp">Opening management</a>
					<a onclick="func(this)" class="x " href="orderList.jsp">CustOrder management</a>
					<a onclick="func(this)" class="x " href="postOrder.jsp">CustOrder Submission</a>
				
			<%	break;
				case 4:
			%>	
					<a onclick="func(this)" class="x " href="orderList.jsp">CustOrder management</a>
			<%
				break;} 
			%>
			</div>
		</div>
	</div>
</body>
</html>

	
