﻿<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,java.sql.*"%>
<%--
  request.setCharacterEncoding("gbk");
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName=login","sa","100278");
  Statement stmt=conn.createStatement();
  ResultSet rs=null;//链接sqlserver数据库
--%>
<%
  request.setCharacterEncoding("gbk");
  //Class.forName("oracle.jdbc.odbc.JdbcOdbcDriver");
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","123456");
  Statement stmt=conn.createStatement();
  ResultSet rs=null;//链接oracle数据库
%>
<%
  String op = request.getParameter("op");
  if(op!=null&&op.equals("login")){
    String s_userid=request.getParameter("userid");
    String s_password=request.getParameter("pass");
    if(!(s_userid.equals("")||s_password.equals("")||s_userid==null||s_password==null)){
    rs=stmt.executeQuery("select * from users where userid='"+s_userid+"' and userpass='"+s_password+"'");
    if(rs.next()){
	  String username=rs.getString(3);
      session.setAttribute("username",username);
      response.sendRedirect("loginsuccessful.jsp");
    }
    else
    {
      response.sendRedirect("error.jsp");
    }
	}
	
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<style type="text/css">
	*,body {
		margin:0;
		padding:0;
		font-family:"微软雅黑";
		font-size: 18px;
		background-color: #F7FFFF;
	}
	.main {
		height:300px;
		width:400px;
		margin:100px auto;
		border:2px solid #DED3D3;
		text-align: center;
		border-radius:10px;
	}
	h2 {
		margin-top:30px;
		margin-bottom:20px;
	}
	.main form {
		height:200px;
		line-height:60px;
		width:400px;
		/*background-color:blue;*/
	}
	.main form button {
		height:38px;
		width:70px;
		background-color:#F3610E;
		border-radius:6px;
		padding:5px;
		outline:none;
		color:#fff;
		margin:20px;
	}
	.main form button a {
		text-decoration: none;
		color:#FFF;
		height:30px;
		width:50px;
	}
	.main form input {
		border-radius:5px;
	}
</style>
</head>
<body>
	<div class="main">
		<h2>用户登陆</h2>
		<form id="form1" name="form1" method="post" action="login.jsp?op=login">
			<!--传递一个op的值 来确认是否执行Java查询数据库带代码-->			
				用户名：<input type="text" name="userid"/><br>
				密&nbsp;&nbsp;&nbsp;码：<input type="password" name="pass" id="textfield" class="input_in"/><br>
				<button>登陆</button>
				<button>
					<a href="register.jsp">注册</a>
				</button>
			
		</form>
	</div>
</body>
</html>
