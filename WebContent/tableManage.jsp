<%@ page language="java"  pageEncoding="utf-8"%>
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
		$(".t5 button").click(function()
		{
			var str=$(this).html();
			if(str=="Occupied") $(this).parent().prev().html("<b>Occupied</b>");
			else if(str=="idle")  $(this).parent().prev().html("<b>idle</b>");
			else $(this).parent().parent().remove();
		});
	});
</script>



</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
		 	
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:130px;">Table No</li>
			<li class="t2" style="width:130px;">Table category</li>
			<li class="t4" style="width:130px;">Table status</li>
			<li class="t5" style="width:130px;">Modify the status</li>
			<li class="t6" style="width:130px;">Delete seat</li>

		</ul>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">1</li>
				<li class="t2" style="width:130px;">2Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">2</li>
				<li class="t2" style="width:130px;">2Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">3</li>
				<li class="t2" style="width:130px;">4Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">4</li>
				<li class="t2" style="width:130px;">4Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">5</li>
				<li class="t2" style="width:130px;">4Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">6</li>
				<li class="t2" style="width:130px;">4Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">7</li>
				<li class="t2" style="width:130px;">8Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">8</li>
				<li class="t2" style="width:130px;">8Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">9</li>
				<li class="t2" style="width:130px;">8Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">10</li>
				<li class="t2" style="width:130px;">8Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">11</li>
				<li class="t2" style="width:130px;">8Person table</li>
				<li class="t4" style="width:130px;">idle</li>
				<li class="t5" style="width:130px;"><button>Occupied</button><button>idle</button></li>
				<li class="t5" style="width:130px;"><button>delete</button></li>
				
		</ul>	
			
			
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
