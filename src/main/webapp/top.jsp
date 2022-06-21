<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/12
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店系统</title>
    <script>
        function userCancel() {
            if (window.confirm("您确认要注销？")) {
                window.parent.location = "./DestroyServlet"
            }
        }

        function showCart() {
            window.parent.frmMain.location = "cart.jsp"
        }
    </script>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    String logtime = (String) session.getAttribute("logtime");
%>
<div>
    <span>登录名：</span><span><%=username%></span>
    <span>登录时间：</span><span><%=logtime%></span>
    <span onclick="showCart()" style="cursor:hand">[查看购物车]</span>
    <span onclick="userCancel()" style="cursor:hand">[注销]</span>
</div>
</body>
</html>
