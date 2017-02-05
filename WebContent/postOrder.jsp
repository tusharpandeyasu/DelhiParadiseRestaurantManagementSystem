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
<link type="text/css" href="style-1.css" rel="stylesheet" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".orderPanel_menu .inter_info button").click(function()
		{
			var strID=$(this).prev().html();
			
			var orderNO=$("#inputOrderNO").val();
			var tableNO=$("#inputTableNO").val();
			$("#orderNO").html(orderNO);
			$("#tableNO").html(tableNO);
			
			var strs = new Array();
			strs = $(this).html().split(" ");
			var cur = strs[strs.length-1];
			var price = strs[strs.length - 2];
			var rName = "";
			for (i=0; i< strs.length-2; i++) {
				rName = rName + strs[i] + " ";
			}
			rName = rName.trim();
			
			var string="<div class='orderItem'><div class='idtitle' style='display:none;'>"+strID+"</div><div style='width:165px;float:left;'>"+rName+"</div><div class='price' style='width:60px;float:left;'>"+price+"USD</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>Part</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			
			$("#showOrder").append(string);	
		});
		$(".orderPanel_menu_wine .inter_info button").click(function()
		{
			var strID=$(this).prev().html();
			var strs = new Array();
			strs = $(this).html().split(" ");
			var wcur = strs[strs.length-1];
			var wprice = strs[strs.length - 2];
			var wName = "";
			for (i=0; i< strs.length-2; i++) {
				wName = wName + strs[i] + " ";
			}
			wName = wName.trim();
			
			
			var string="<div class='orderItem'><div class='idtitle' style='display:none;'>"+strID+"</div><div style='width:165px;float:left;'>"+wName+"</div><div class='price' style='width:60px;float:left;'>"+wprice+"USD</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>Part</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			$("#showOrder_wine").append(string);
		});
	
	});
	function postOrderOK()
	{
		totalPrice();
		var ids = new Array();
		var numbers=new Array();
		var totalprice="";
		totalprice=$("#totalprice").html();
		
		var counterID=0;
		var counterNUM=0;
		$(".idtitle").each(function(){
			ids[counterID++]=$(this).html();			
		});
		$(".number").each(function(){
			numbers[counterNUM++]=$(this).html();
		});
		
		var length=ids.length;
		var strReturn="";
		strReturn+=$("#tableNO").html()+";";
		for(var i=0;i<length;i++)
		{
			strReturn+=ids[i]+","+numbers[i]+";";
		}
		//strReturn+=totalprice;
		// alert(strReturn);
		window.location.href="CustOrderServlet?type=add&&orderString="+strReturn;
	}
	function AddNumber(id)
	{
		var pointer=$(id).prev().prev();
		var string=pointer.html();
		string=parseInt(string)+1;
		pointer.html(string);
		
	}
	function MinNumber(id)
	{
		
		var pointer=$(id).prev().prev().prev();
		var string=pointer.html();
		
		if(parseInt(string)>0)
		{	
			string=parseInt(string)-1;
			pointer.html(string);
		}
		if(parseInt(string)==0)
		{
			$(id).parent().remove();
		}
	}
	function totalPrice()
	{
		var totalPrice=0;
		$(".price").each(function()
		{
			var price=parseInt($(this).html());
			price=price*parseInt($(this).next().html());
			totalPrice=totalPrice+price;
		});
		$("#showTotalPrice").html("Total:<span id='totalprice'>"+totalPrice+"</span>USD");
		
	}
</script>
</head>
<body>
<%
	MenuService MenuService=new MenuService();
	List<Menu> food_list = MenuService.listAllFoods(); 
	List<Menu> drink_list = MenuService.listAllDrinks(); 
%>  
		<jsp:include page="header.jsp" flush="true" />

<div class="body">
<div class="body_bg">
	
	<div style="width:467px;float:left;padding:20px;padding-right:10px;">
		<p style="font-size:20px;font-family:'Times New Roman';margin-top:25px;"><b>Order Selection Area</b></p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			
			<div class="orderPanel" style="float:left"><b>Table Number</b></div>
			<div class="orderPanel_right" style="float:right"><input id="inputTableNO" type="text" /></div>
			<div style="clear:both"></div>
			<div class="orderPanel" style="float:left"><b>Order Dishes</b></div>
			<div class="orderPanel_menu" style="float:right">
			<%
			if(food_list!=null){
				for(int i=0;i<food_list.size();i++){
					Menu food= (Menu)food_list.get(i);
			%>
				<div class="inter_info">
					<span style="display:none;"><%=food.getFood_id() %></span>
					<button ><%=food.getFood_name() %> <%=food.getFood_price() %> USD</button>
				</div>
			<%}  }%>							
			</div>
			<div style="clear:both"></div>
			<div class="orderPanel" style="float:left;"><b>Order wine</b></div>
			<div class="orderPanel_menu_wine" style="float:right">
				<%
			if(drink_list!=null){
				for(int i=0;i<drink_list.size();i++){
					Menu food= (Menu)drink_list.get(i);
					double price = food.getFood_price();
			%>
				<div class="inter_info">
					<span style="display:none;"><%=food.getFood_id()%></span>
					<button ><%=food.getFood_name() %> <%=price %> USD</button>
				</div>
			<%}  }%>		
			</div>
			<div style="clear:both"></div>
		</div>
	</div>
	<div style="width:468px;float:left;padding:20px;padding-left:10px;">
		<p style="font-size:20px;font-family:'Times New Roman';margin-top:25px;"> <b></>Order Information</b></p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			
			<div class="orderPanel" style="float:left;"><b></b></div>
			<div class="orderPanel_right" style="float:right;"><div id="tableNO"></div></div>
			<div style="clear:both;"></div>
			<div class="orderPanel" style="float:left;"><b>Order Dishes</b></div>
			<div id="showOrder" style="overflow-y:scroll; float:right;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
			</div>
			<div style="clear:both;"></div>
			<div class="orderPanel" style="float:left"> <b></>Order wine </b></div>
			<div id="showOrder_wine" style="overflow-y:scroll; float:right;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
				
			</div>
			<div style="clear:both;"></div>
			<div id="showTotalPrice" style="width:100%;text-align:center;height:60px;margin-top:27px;font-size:25px;">
			</div>
			<input type="submit" class="postInfo" style="margin-right:33px;width:160px;margin-top:50px;" onclick="totalPrice();" value="Total Price" />
			<input type="submit" class="postInfo" style="margin-right:33px;width:160px;margin-top:50px;" onclick="postOrderOK();" value="Submit Order" />
		</div>
	</div>

	
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
