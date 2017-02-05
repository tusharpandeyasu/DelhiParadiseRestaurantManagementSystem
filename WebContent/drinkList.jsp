<%@ page language="java" import="java.util.*,com.project.javabean.*,com.project.util.*,
com.project.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Delhi Paradise</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="jquery.min.js"></script>
<link type="text/css" href="style-1.css" rel="stylesheet" />
<script type="text/javascript">
	$(document).ready(function()
	{
		var isShow=true;
		$(".t5 a").click(function()
		{
		
			if(isShow)
			{
				$(this).parent().parent().next().show();
				isShow=false;
			}
			else
			{
				$(this).parent().parent().next().hide();
				isShow=true;
			}
		});

	
	});
	
	function addMember()
	{
		var str0="<form action='MenuServlet?type=add&&which=drink' method='post' enctype='multipart/form-data'>";
		var str1="<ul class='table interleaved_0' style='margin:auto; width:786px;'>";
		var str2="<li class='t1' style='width:75px;'><input type='text' style='border:none;text-align:left;' placeholder='Number'/></li>";
		var str3="<li class='t2' style='width:120px;'><input type='text' style='border:none;text-align:left;' name='drink_type' placeholder='Wine name'/></li>";
		var str4="<li class='t3' style='width:95px;'><input type='text' style='border:none;text-align:left;' name='food_name' placeholder='Wine type'/></li>";

		var str5="<li class='t4' style='width:75px;'><input type='text' style='border:none;text-align:left;' name='food_price' placeholder='Price'/></li>";
		var str6="<li class='t5' style='width:170px;'><input type='file' style='border:none;text-align:left;' name='profile' id='profile' /></li>";
		
		var str7="<li class='t6' style='width:75px;'><input type='submit' value='save'/></li>";
		var str8="</ul>";
		var str9="<textarea rows='5' style='margin-left:106px;width:786px;text-align:center;' name='food_description' placeholder='Add a description' />";
		
		var str10="</form>";
		$("#contentArea").append(str0+str1+str2+str3+str4+str5+str6+str7+str8+str9+str10);
	}
</script>
</head>
<body>
<%
	MenuService menuService=new MenuService();
	List<Menu> list = menuService.listAllDrinks(); 
%>
	
	<jsp:include page="header.jsp" flush="true" />
<div class="body">
<div class="body_bg">
	<div style="float:none;margin-left:105px;width:100px;height:40px;margin-top:30px;margin-bottom:5px;">
		<button style="width:100%;height:100%;" onclick="addMember();">+Add drinks</button>
	</div>
	<div id="contentArea">
		<ul class="table title" style="margin:auto; width:786px	;">
			<li class="t1" style="width:75px;"><b>S No.</b></li>
			<li class="t2" style="width:120px;"><b>Name</b></li>
			<li class="t3" style="width:95px;"><b>Type</b></li>
			<li class="t4" style="width:75px;"><b>Price</b></li>
			<li class="t5" style="width:170px;"><b>View Details</b></li>
			<li class="t6" style="width:75px;"><b>Delete Wine</b></li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Menu menu= (Menu)list.get(i);
		%>
		<ul class="table interleaved_0" style="margin:auto;width:786px	;">
				<li class="t1" style="width:75px;"><%=menu.getFood_id()%></li>
				<li class="t2" style="width:120px;"><%=menu.getFood_name()%></li>
				<li class="t3" style="width:95px;"><%=menu.getDrink_type() %></li>
				<li class="t4" style="width:75px;"><%=menu.getFood_price() %></li>
				<li class="t5" style="width:170px;"><a href="#">View</a></li>
				<li class="t6" style="width:75px;"><a href="MenuServlet?type=delete&&food_id=<%=menu.getFood_id()%>&&which=drink">delete</a></li>			
		</ul>	
		<div style="margin:auto; width:786px;border:1px solid #3388FF;height:180px;display:none;">
			<div style="width:180px;float:left;height:180px;">
				<img style="width:180px;height:180px;" src="MenuImages/<%=menu.getFood_image_path() %>" />
			</div>
			<div style="float:left;height:140px;width:546px;padding:30px;">
				<%=menu.getFood_description()%>	
			</div>
		</div>	
		<%}  }%>		
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
