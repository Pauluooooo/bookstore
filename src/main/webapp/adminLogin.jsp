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
    <script>
        function loginClick() {
            var user = document.getElementById("username").value;
            var pass = document.getElementById("password").value;
            if (user == null || user === "") {
                alert("请填写登录名");
                document.getElementById("username").focus();
            } else if (pass == null || pass === "") {
                alert("请填写密码");
                document.getElementById("password").focus();
            } else {
                document.Register.submit();
            }
        }

        function res() {
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
        }

    </script>
</head>
<body>
<table>
    <tr>
        <td>
            <table>
                <tbody>
                <tr>
                    <td colspan="2">网上购物后台管理系统-管理员登录页面</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form method="post" name="AdminLoginServlet" action="AdminLoginServlet">
                            <table>
                                <tr>
                                    <td>登录名：</td>
                                    <td>
                                        <input type="text" id="username" name="username" value="" style="width: 110px">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>密码：</td>
                                    <td>
                                        <input type="password" id="password" name="password" style="width: 110px">
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
