<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Delhi Paradise</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="style-1.css" rel="stylesheet" />

</head>
<body>
<jsp:include page="header.jsp" flush="true" />
<div class="body">
<div class="body_bg">
	<div class="search" style="font-family:'Times New Roman';font-size:30px;color:black;margin-top:60px;text-align:center;">
		<%  if(request.getAttribute("result")!=null){
       %>	 
      <h2><%=(String)request.getAttribute("result") %></h2>
      <%} %>
	</div>
</div>
</div>


<%@ include file="footer.jsp" %>



</body>
</html>
