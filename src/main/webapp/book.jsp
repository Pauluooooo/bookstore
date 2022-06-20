<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/21
  Time: 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.pauluooooo.db.BookDao" %>
<%@page import="com.pauluooooo.entity.Book" %>
<html>
<head>
    <title>网上书店系统</title>
    <script>
        function ret() {
            window.parent.frmMain.location = "./booklist.jsp";
        }
    </script>
</head>
<body>
<%
    ServletContext ctx = this.getServletConfig().getServletContext();
    String user = ctx.getInitParameter("user");
    String pwd = ctx.getInitParameter("pwd");
    String dbname = ctx.getInitParameter("dbname");
    String server = ctx.getInitParameter("server");
    BookDao dao = new BookDao();
    try {
        dao.getConn(server, dbname, user, pwd);
        String isbn = request.getParameter("isbn");
        Book book = dao.getBookByIsbn(isbn);
        pageContext.setAttribute("book", book);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    Book book = (Book) pageContext.getAttribute("book");
    if (book != null) {
%>
<table style="height: 100%;width:100%">
    <tr align="center" valign="middle">
        <td>
            <table style="height: 200px;width: 520px" cellspacing="0" cellpadding="0" border="0" align="center">
                <tbody>
                <tr valign="middle">
                    <td height="12" colspan="3">图书信息详情</td>
                </tr>
                <tr>
                    <td width="203">
                        <img height="300" width="202" src="./images/<%=book.getPic()%>">
                    </td>
                    <td height="120" width="497">
                        <table cellspacing="1" cellpadding="1">
                            <tr>
                                <td width="80" height="20" style="border: 0px">&nbsp;&nbsp;书名：</td>
                                <td width="200" rowspan="2" style="border: 0px"><%=book.getBookName()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="80" height="25"></td>
                            </tr>
                            <tr>
                                <td width="80" height="20" style="border: 0px">&nbsp;&nbsp;ISBN：</td>
                                <td width="200" rowspan="2" style="border: 0px"><%=book.getIsbn()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="80" height="25"></td>
                            </tr>
                            <tr>
                                <td width="80" height="20" style="border: 0px">&nbsp;&nbsp;出版社：</td>
                                <td width="200" rowspan="2" style="border: 0px">
                                    <%
                                        if (book.getPublisherID() == 1) {
                                    %>人民教育出版社<%} else if (book.getPublisherID() == 2) {%>
                                    清华大学出版社<%} else if (book.getPublisherID() == 3) {%>电子工业出版社<%}%>
                                </td>
                            </tr>
                            <tr>
                                <td width="80" height="25"></td>
                            </tr>
                            <tr>
                                <td width="80" height="20" style="border: 0px">&nbsp;&nbsp;价格（￥）：</td>
                                <td width="200" rowspan="2" style="border: 0px"><%=book.getPrice()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="80" height="25"></td>
                            </tr>
                            <tr>
                                <td width="80" height="20" style="border: 0px">&nbsp;&nbsp;图书简介：</td>
                                <td width="200" rowspan="2" style="border: 0px"><%=book.getDescription()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button onclick="ret();" style="width: 20%">返回</button>
                        &nbsp;
                        <button onclick="buy();" style="width: 30%">添加到购物车</button>
                        <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<%}%>
</body>
</html>
