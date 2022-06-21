package com.pauluooooo.servlet;

import com.pauluooooo.db.BookDao;
import com.pauluooooo.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BuyServlet", value = "/BuyServlet")
public class BuyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String isbn = request.getParameter("isbn");
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            List<Book> cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        boolean find = false;
        for (int i = 0; i < cart.size(); i++) {
            Book book = cart.get(i);
            if (book.getIsbn().equals(isbn)) {
                book.setCount(book.getCount() + 1);
                find = true;
                break;
            }
        }

        if (find == false) {
            BookDao dao = new BookDao();
            try {
                dao.getConn(server, dbname, user, pwd);
                Book book = dao.getBookByIsbn(isbn);
                book.setCount(1);
                cart.add(book);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");

    }
}
