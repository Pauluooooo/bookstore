package com.pauluooooo.servlet;

import com.pauluooooo.db.BookDao;
import com.pauluooooo.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AddBookServlet", value = "/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取输出流
        PrintWriter out = response.getWriter();
        String bookname = request.getParameter("bookName");
        String isbn = request.getParameter("isbn");
        String publisherID = request.getParameter("publisher");
        String price = request.getParameter("price");
        String count = request.getParameter("count");
        String pic = request.getParameter("pic");
        String description = request.getParameter("description");
        Book book = new Book();
        book.setBookName(bookname);
        book.setIsbn(isbn);
        book.setPublisherID(Integer.parseInt(publisherID));
        book.setPrice(Double.parseDouble(price));
        if (count != null && !count.equals("")) {
            book.setCount(Integer.parseInt(count));
        }

        String picName = pic.substring(pic.lastIndexOf("\\") + 1);
        book.setPic(picName);
        book.setDescription(description);
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        BookDao dao = new BookDao();
        try {
            dao.getConn(server, dbname, user, pwd);
            boolean r = dao.addBook(book);
            if (r) {
                out.println("新书上架成功！");
                out.println("<br><a href='addBook.html'>返回</a>");
            } else {
                out.println("失败！请检查填写的数据后重新上架");
                out.println("<br><a href='addBook.html'>返回</a>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
