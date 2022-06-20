package com.pauluooooo.servlet;

import com.pauluooooo.db.BookDao;
import com.pauluooooo.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchBookServlet", value = "/SearchBookServlet")
public class SearchBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String bookname = request.getParameter("bookName");
        String pid = request.getParameter("publisher");
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        BookDao dao = new BookDao();
        List<Book> bookList = null;

        try {
            dao.getConn(server, dbname, user, pwd);
            if (bookname != null && bookname.length() > 0 && (pid == null || pid.equals(""))) {
                bookList = dao.getBookByName(bookname);
            } else if (pid != null && pid.length() > 0 && (bookname == null || bookname.equals(""))) {
                bookList = dao.getBookByPublisher(Integer.parseInt(pid));
            } else if (bookname != null && bookname.length() > 0 && pid != null && pid.length() > 0) {
                bookList = dao.getBookByNameAndPublish(bookname, Integer.parseInt(pid));
            } else {
                bookList = dao.getAllBook();
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        if (bookList != null) {
            request.setAttribute("bookList",bookList);
        }
        request.getRequestDispatcher("booklist.jsp").forward(request, response);
    }
}
