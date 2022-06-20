<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="ch">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
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
                document.Login.submit();
            }
        }

        function ress() {
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
                    <td colspan="2">网上书店系统-用户登录</td>
                </tr>
                <tr>
                    <td>
                        <form method="post" name="LoginServlet" action="LoginServlet">
<%
    Cookie[] cookies = request.getCookies();
    String userName = "";
    if (cookies != null && cookies.length > 0) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(userName)) {
                userName = cookies[i].getValue();
            }
        }
    }
%>
                            <table>
                                <tr>
                                    <td class="login_td">登录名：</td>
                                    <td class="login_td">
                                        <input type="text" name="username" id="username" value="" style="width: 110px">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td height="20" class="login_td">密 码：</td>
                                    <td class="login_td">
                                        <input type="password" name="password" id="password" value="" style="width: 110px">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td height="20" colspan="2">
                                        <button class="login_button" onclick=ress();>重置</button>
                                        &nbsp;
                                        <button class="login_button" onclick=loginClick();>登录</button>
                                        &nbsp;
                                    </td>
                                    <td class="login_td"><a href="regist.html">新用户注册</a> </td>
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