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
	
		$(".t3 a").click(function()
		{
		
			$(this).parent().parent().next().show();
			//$(this).parent().parent().next().next().show();
		});
		$(".t4 a").click(function()
		{
			$(this).parent().parent().next().show();
		//	$(this).parent().parent().next().next().show();
		});
		$(".shouqiBtn").click(function()
		{
			$(this).parent().parent().hide();
		});
	
	});
	
</script>
</head>
<body>
<%
	CustOrderService CustOrderService=new CustOrderService();
	MenuService MenuService=new MenuService();
	
	List<CustOrder> list = CustOrderService.listAllOrders(); 
%>
		<jsp:include page="header.jsp" flush="true" />
		 
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:930px	;">
			<li class="t1" style="width:70px;">CustOrder No.</li>
			<li class="t2" style="width:110px;">Seats for orders</li>
			<li class="t3" style="width:110px;">Ordered dishes</li>
			<li class="t5" style="width:110px;">CustOrder price</li>
			<li class="t6" style="width:150px;">CustOrder Status</li>
			<li class="t7" style="width:150px;">Action</li>
			<li class="t8" style="width:110px;">Delete</li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				CustOrder order= (CustOrder)list.get(i);
				List<CustOrderDetail> orderDetails = CustOrderService.listAllOrderDetailsByOrderId(order.getOrder_id());
				
				String order_state;
				switch(order.getOrder_state()){
				case 1:order_state="Not yet prepared";break;
				case 2:order_state="Currently preparing";break;
				case 3:order_state="Preparation complete";break;
				default:order_state="unknown";break;
				}
		%>
		<ul class="table interleaved_0" style="margin:auto;width:930px	;">
				<li class="t1" style="width:70px;"><%=order.getOrder_id() %></li>
				<li class="t2" style="width:110px;">2Number table</li>
				<li class="t3" style="width:110px;"><a href="#">View dishes</a></li>
				<li class="t5" style="width:110px;"><a href=""><%=order.getOrder_price() %></a></li>	
				<li class="t6" style="width:150px;"><%=order_state %></li>				
				<li class="t7" style="width:150px;">
				<%
					if(order_state.equals("Not yet prepared")){
				%>
					<a href="CustOrderServlet?type=begin_cooking&&order_id=<%=order.getOrder_id() %>">Start preparing</a>
					<%}else if(order_state.equals("Currently preparing")) {%>
					<a href="CustOrderServlet?type=finish_cooking&&order_id=<%=order.getOrder_id() %>">Ready to complete</a>
					<%} %>
				</li>
				<li class="t8" style="width:110px;">
					<a href="CustOrderServlet?type=delete&&order_id=<%=order.getOrder_id() %>">delete</a>
				</li>
				
		</ul>	
		<div style="display:none;">
			<div class="orderDetail" style="margin-left:35px;border-right:1px solid #99aaff;margin-bottom:20px;">
				<% 
				for(int j=0;j<orderDetails.size();j++){
					CustOrderDetail od = orderDetails.get(j);
					Menu food = MenuService.getFoodByFoodId(od.getFood_id());
					if(food.getFood_type()==1){
				%>
				<p><div class="dishName"><%=food.getFood_name() %></div><span> <%=od.getOrder_detail_num() %></span><span>Part</span></p>
				<%}} %>
			</div>
			<div class="orderDetail" style="margin-bottom:20px;">
				<% 
				for(int j=0;j<orderDetails.size();j++){
					CustOrderDetail od = orderDetails.get(j);
					Menu food = MenuService.getFoodByFoodId(od.getFood_id());
					if(food.getFood_type()==2){
				%>
				<p><div class="dishName"><%=food.getFood_name() %></div><span> <%=od.getOrder_detail_num() %></span><span>bottle</span></p>
				<%}} %>
			</div>
			<div style="width:38px;height:180px;float:left;">
				<button class="shouqiBtn" style="height:60px;margin:0px;margin-top:120px;">Hide</button>
			</div>
		</div>
			<%}  }%>		
		
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
