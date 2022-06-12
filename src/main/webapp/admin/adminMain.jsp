<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/12
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店后台管理系统</title>
</head>
<frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset cols="165,*" frameborder="no" border="0" framespacing="0">
        <frame src="leftTree.htm" name="frmLeft" scrolling="no" noresize="noresize" id="frmLeft" title="frmLeft" />
        <frame src="../addUser.html" name="frmMain" id="frmMain" title="frmMain" />
    </frameset>
</frameset>
<noframes></noframes>
<body>
</body>
</html>
