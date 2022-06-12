<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/12
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店后台管理系统</title>
    <script src="../js/adminLogin.js"></script>
</head>
<body>
<table>
    <tr>
        <td>
            <table>
                <tbody>
                <tr>
                    <td colspan="2">网上购物后台管理系统-用户登录</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form method="post" name="Register" action="AdminLoginServlet">
                            <table>
                                <tr>
                                    <td>登录名：</td>
                                    <td>
                                        <input type="username" value="" style="width: 110px">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>密码：</td>
                                    <td>
                                        <input type="password" name="password" style="width: 110px">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button onclick="res()">重置</button>&nbsp;
                                        <button onclick="loginClick()">登录</button>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
