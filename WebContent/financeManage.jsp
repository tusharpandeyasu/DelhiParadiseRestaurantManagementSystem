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
<script typpe="text/javascript">
$(document).ready(function(){
	var total=0;
	$(".interleaved_0 .t3").each(function()
	{
		total+=parseInt($(this).html());
	});
	$("#total").html(total);
});
</script>
</head>
<body>
<%
	CustOrderService ordService=new CustOrderService();
	MenuService fdSer=new MenuService();
	
	List<CustOrder> list = ordService.listAllOrders(); 
%>
	<jsp:include page="header.jsp" flush="true" />
	
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:195px;"><b>ID</b></li>
			<li class="t2" style="width:195px;"><b>Time</b></li>
			<li class="t3" style="width:195px;"><b>Amount</b></li>
			<li class="t4" style="width:195px;"><b>Delete Record</b></li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				CustOrder order= (CustOrder)list.get(i);
		%>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:195px;"><%=order.getOrder_id() %></li>
				<li class="t2" style="width:195px;"><%=order.getOrder_date() %></li>
				<li class="t3" style="width:195px;"><%=order.getOrder_price() %> USD</li>
				<li class="t4" style="width:195px;"><a href="CustOrderServlet?type=delete&&order_id=<%=order.getOrder_id()%>&&which=finance">delete</a></li>
		</ul>	
		<%}} %>	
		<div style="text-align:right;font-size:28px;font-family:'Times New Roman';padding-right:80px;">
		Total income：<span id="total"></span>.0USD
		</div>	
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
