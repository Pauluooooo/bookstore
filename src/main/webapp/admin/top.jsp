<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/12
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店系统</title>
</head>
<body topmargin="0px">
<%
    String username = (String) session.getAttribute("adminuser");
    String logtime = (String) session.getAttribute("logtime");
%>
<div>
    <div style="position: absolute;right: 1px;top: 58px;z-index: 1000;">
        <span>登录名：</span><span><%=username%></span>
        <span>登录时间：</span><span><%=logtime%></span>
    </div>
</div>
</body>
</html>
