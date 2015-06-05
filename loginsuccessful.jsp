<%@ page contentType="text/html; charset=utf-8" %>
<html>
	<style type="text/css">
		center{
			font-size: 30px;
			color:red;
		}
	</style>
<head>
	<title>登录成功</title>
</head>
<body>
<%
String name=(String)session.getAttribute("username");
%>
<center>亲爱的<%=name%>同学，欢迎您的登陆！*****~~~~~~</center>
</body>
</html>