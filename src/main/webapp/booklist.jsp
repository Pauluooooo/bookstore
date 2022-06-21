<%@ page import="java.util.List" %>
<%@ page import="com.pauluooooo.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/21
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function select() {
            document.search.submit();
        }
    </script>
</head>
<body>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
    if (bookList == null) {
%>
<jsp:forward page="SearchBookServlet"></jsp:forward>
<%
    }
%>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr style="height: 2%">
        <td>
            <table border="0" width="100%" align="center">
                <tr>
                    <td>图书一览</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height: 96%">
        <td>
            <form method="post" name="search" action="SearchBookServlet">
            <table width="70%">
                <tr>
                    <td width="10%">&nbsp;图书名称：</td>
                    <td style="width: 20%"><input type="text" name="bookName" style="width: 100%" size="30"></td>
                    <td style="width: 1%">&nbsp;</td>
                    <td width="10%">&nbsp;出版社：</td>
                    <td width="15%">
                        <select name="publisher" style="width: 100%">
                            <option value=""></option>
                            <option value="1">人民邮电出版社</option>
                            <option value="2">清华大学出版社</option>
                            <option value="3">电子工业出版社</option>
                        </select>
                    </td>
                    <td style="width: 1%">&nbsp;</td>
                    <td width="29%">
                        <button onclick="select()" id="btnSearch" name="btnSearch" style="width: 15%">查询</button>
                    </td>
                </tr>
            </table>
            </form>
            <table border="0" width="100%" align="center">
                <tr style="height: 1px" class="">
                    <td>图书列表&nbsp;</td>
                </tr>
            </table>
            <div style="position: absolute;left: 0px;bottom: 1px;z-index: 1000;" id="excel">
                <table style="width: 40%">
                    <tr>
                        <td>
                            <button onclick="showShop()" id="btnSave" name="btnSave" style="width: 100px">查看购物车</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="height: 87%">
                <table border="0" align="left" cellspacing="0" id="senfe" style="width: 99%">
                    <thead>
                    <tr>
                        <th width="5%">
                            <span style="font-weight: 400">序号</span>
                        </th>
                        <th width="28%">
                            <span style="font-weight: 400">书名</span>
                        </th>
                        <th width="15%">
                            <span style="font-weight: 400">出版社</span>
                        </th>
                        <th width="16%">
                            <span style="font-weight: 400">ISBN</span>
                        </th>
                        <th width="15%">
                            <span style="font-weight: 400">价格（￥）</span>
                        </th>
                        <th width="">
                            <span style="font-weight: 400">操作</span>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (int i = 0; i < bookList.size(); i++) {
                            Book book = bookList.get(i);
                    %>
                    <tr>
                        <td align="center"><%=i+1%></td>
                        <td><%=book.getBookName()%></td>
                        <td align="center">
                            <%
                                if(book.getPublisherID() == 1){
                            %>人民邮电出版社<%
                            }else if(book.getPublisherID() == 2){
                        %>清华大学出版社<%
                            }else if (book.getPublisherID() == 3){
                        %>电子工业出版社<%
                            }
                        %>
                        </td>
                        <td align="center"><%=book.getIsbn()%></td>
                        <td align="center"><%=book.getPrice()%></td>
                        <td align="center" nowrap="nowrap"><a href="book.jsp?isbn=<%=book.getIsbn()%>">查看详情&nbsp;</a></td>
                        <td align="center" nowrap="nowrap"><a href="BuyServlet?isbn=<%=book.getIsbn()%>">购买&nbsp;</a></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
