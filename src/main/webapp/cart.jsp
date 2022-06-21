<%@ page import="java.util.List" %>
<%@ page import="com.pauluooooo.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/21
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店系统</title>
    <script>
        function goOn() {
            window.parent.frmMain.location = "booklist.jsp";
        }
    </script>
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr style="height: 96%">
        <td>
            <table border="0" width="100%" align="center">
                <tr style="height: 1px">
                    <td>我的购物车</td>
                </tr>
            </table>
            <div style="position: absolute;left: 0px;bottom: 1px;z-index: 1000;" id="excel">
                <table style="width: 250px">
                    <tr>
                        <td>
                            <button onclick="ret()" id="btndest" name="btndest" style="width: 100px">放弃购物</button>
                            &nbsp;
                            <button onclick="goOn()" id="btnSave" name="btnSave" style="width: 100px">继续购物</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <div style="height: 87%">
                    <table border="0" align="center" cellspacing="0" id="senfe" style="width: 99%">
                        <thead>
                        <tr>
                            <th>
                                <span style="font-weight: 400">序号</span>
                            </th>
                            <th width="28%">
                                <span style="font-weight: 400">书名</span>
                            </th>
                            <th width="15%">
                                <span style="font-weight: 400">价格（￥）</span>
                            </th>
                            <th width="16%">
                                <span style="font-weight: 400">数量（本/套）</span>
                            </th>
                            <th width="">
                                <span style="font-weight: 400">操作</span>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            double money = 0;
                            List<Book> cart = (List<Book>) session.getAttribute("cart");
                            if (cart != null) {
                                for (int i = 0; i < cart.size(); i++) {
                                    Book book = cart.get(i);
                                    money += book.getPrice();
                        %>
                        <tr>
                            <td align="center"><%=i%></td>
                            <td align="center"><%=book.getBookName()%></td>
                            <td align="center"><%=book.getPrice()%></td>
                            <td align="center"><%=book.getCount()%></td>
                            <td align="center" nowrap="nowrap">&nbsp;从购物车删除 &nbsp;</td>

                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                    <table border="0" align="left" cellspacing="0" style="width: 33%">
                        <tr>
                            <td width="50%">&nbsp;订单价格汇总（￥）：</td>
                            <td id="hz" align="left"><%=money%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
